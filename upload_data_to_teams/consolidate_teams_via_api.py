#!/usr/bin/env python3
"""
Script para consolidar teams duplicados via API NocoDB
- Identifica BASE (primeiro team) e REMs (demais)
- Move relacionamentos dos REMs para a BASE via PATCH
- Deleta os teams REMs após consolidação
- Salva progresso e erros para retomada
"""

import requests
from typing import Dict, Optional, Any, List, Tuple
import json
from datetime import datetime
from tqdm import tqdm
from threading import Lock
from concurrent.futures import ThreadPoolExecutor, as_completed
import time

# NocoDB Configuration
NOCO_BASE_URL = "https://nocodb-production-ac4d.up.railway.app/api/v2/tables"
NOCO_TOKEN = "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"

# Table IDs
TABLE_IDS = {
    'teams': 'm79j3ka924fu8bs',
    'miniatures': 'mv2tjpu2nye7jfv',
    'drivers': 'my38ymolrk7iz0d',
    'competitions': 'm40hlwz0dsyudob'
}

# Column IDs para os links (campo 'teams' em cada tabela)
TEAMS_COLUMN_IDS = {
    'miniatures': 'cwuqf969142dqq1',
    'drivers': 'c6rqk8ilsebxk4q',
    'competitions': 'ciyz94jodhy7zds'
}

# Progress files
PROGRESS_FILE = 'consolidation_progress.json'
ERRORS_FILE = 'consolidation_errors.json'
SUMMARY_FILE = 'consolidation_final_summary.json'


def safe_request(method: str, url: str, headers: Dict[str, str], json_data: Optional[Dict[str, Any]] = None, retries: int = 3) -> Optional[Dict[str, Any]]:
    """Make a safe HTTP request with error handling and retries"""
    for attempt in range(retries):
        try:
            method_lower = method.lower()
            if method_lower == "get":
                response = requests.get(url, headers=headers, timeout=30)
            elif method_lower == "post":
                response = requests.post(url, headers=headers, json=json_data, timeout=30)
            elif method_lower == "patch":
                response = requests.patch(url, headers=headers, json=json_data, timeout=30)
            elif method_lower == "delete":
                response = requests.delete(url, headers=headers, json=json_data, timeout=30)
            else:
                print(f"[e] Método HTTP não suportado: {method}")
                return None

            response.raise_for_status()
            try:
                return response.json()
            except ValueError:
                return {"success": True}  # Para respostas sem JSON
                
        except requests.exceptions.HTTPError as http_err:
            if attempt < retries - 1:
                time.sleep(2 ** attempt)  # Exponential backoff
                continue
            print(f"[e] Erro HTTP ao acessar {url}: {http_err}")
            if hasattr(http_err.response, 'text'):
                print(f"[e] Response: {http_err.response.text}")
        except requests.exceptions.Timeout as timeout_err:
            if attempt < retries - 1:
                time.sleep(2 ** attempt)
                continue
            print(f"[e] Timeout ao acessar {url}: {timeout_err}")
        except requests.exceptions.RequestException as req_err:
            if attempt < retries - 1:
                time.sleep(2 ** attempt)
                continue
            print(f"[e] Erro na requisição a {url}: {req_err}")
        except Exception as e:
            print(f"[e] Erro inesperado: {e}")
            
    return None


def get_team_links(team_id: int, entity_type: str) -> Optional[List[int]]:
    """
    Busca os IDs das entidades (miniatures/drivers/competitions) linkadas a um team
    """
    try:
        table_id = TABLE_IDS['teams']
        url = f"{NOCO_BASE_URL}/{table_id}/records/{team_id}"
        headers = {"xc-token": NOCO_TOKEN}
        
        result = safe_request("GET", url, headers)
        if not result:
            return None
        
        # O campo de link retorna uma lista de objetos com 'Id'
        links = result.get(entity_type, [])
        if isinstance(links, list):
            return [link.get('Id') for link in links if isinstance(link, dict) and 'Id' in link]
        
        return []
        
    except Exception as e:
        print(f"[e] Erro ao buscar links do team {team_id} ({entity_type}): {e}")
        return None


def add_team_to_entity(entity_id: int, entity_type: str, base_team_id: int, retry: bool = True) -> bool:
    """
    Adiciona um team_id à lista de teams de uma entidade (miniature/driver/competition)
    usando a API de Links do NocoDB
    """
    try:
        table_id = TABLE_IDS[entity_type]
        column_id = TEAMS_COLUMN_IDS.get(entity_type)
        
        if not column_id:
            print(f"[e] Column ID não configurado para {entity_type}")
            return False
        
        # Primeiro, verifica se o link já existe
        get_url = f"{NOCO_BASE_URL}/{table_id}/records/{entity_id}"
        headers = {"xc-token": NOCO_TOKEN}
        current_data = safe_request("GET", get_url, headers)
        
        if not current_data:
            print(f"[e] Não foi possível buscar dados da entidade {entity_type} ID {entity_id}")
            return False
        
        # Verifica se já está linkado
        m2m_field_name = f'_nc_m2m_{entity_type}_teams'
        current_teams = current_data.get(m2m_field_name, [])
        if isinstance(current_teams, list):
            for team in current_teams:
                if isinstance(team, dict) and team.get('teams_id') == base_team_id:
                    print(f"[i] Team {base_team_id} já está linkado à {entity_type} {entity_id}")
                    return True
        
        # Usa a API de Links do NocoDB
        # POST /api/v2/tables/{tableId}/links/{columnId}/records/{recordId}
        url = f"{NOCO_BASE_URL}/{table_id}/links/{column_id}/records/{entity_id}"
        payload = [base_team_id]
        
        result = safe_request("POST", url, headers, json_data=payload)
        
        # Se falhou e ainda pode fazer retry
        if result is None and retry:
            print(f"[!] Falha ao adicionar, aguardando 2s para retry...")
            time.sleep(2)
            return add_team_to_entity(entity_id, entity_type, base_team_id, retry=False)
        
        # Status 201 (Created) ou 200 (OK) são sucesso
        return result is not None
        
    except Exception as e:
        print(f"[e] Erro ao adicionar team {base_team_id} à {entity_type} {entity_id}: {e}")
        
        # Retry em caso de exceção
        if retry:
            print(f"[!] Exceção capturada, aguardando 2s para retry...")
            time.sleep(2)
            return add_team_to_entity(entity_id, entity_type, base_team_id, retry=False)
        
        return False


def remove_team_from_entity(entity_id: int, entity_type: str, rem_team_id: int, retry: bool = True) -> bool:
    """
    Remove um team_id da lista de teams de uma entidade usando a API de Links
    """
    try:
        table_id = TABLE_IDS[entity_type]
        column_id = TEAMS_COLUMN_IDS.get(entity_type)
        
        if not column_id:
            print(f"[e] Column ID não configurado para {entity_type}")
            return False
        
        # Usa a API de Links do NocoDB para UNLINK
        # DELETE /api/v2/tables/{tableId}/links/{columnId}/records/{recordId}
        url = f"{NOCO_BASE_URL}/{table_id}/links/{column_id}/records/{entity_id}"
        headers = {"xc-token": NOCO_TOKEN}
        payload = [rem_team_id]  # Array com o ID do team para deslinkar
        
        result = safe_request("DELETE", url, headers, json_data=payload)
        
        # Se falhou e ainda pode fazer retry
        if result is None and retry:
            print(f"[!] Falha ao remover, aguardando 2s para retry...")
            time.sleep(2)
            return remove_team_from_entity(entity_id, entity_type, rem_team_id, retry=False)
        
        return result is not None
        
    except Exception as e:
        print(f"[e] Erro ao remover team {rem_team_id} da {entity_type} {entity_id}: {e}")
        
        # Retry em caso de exceção
        if retry:
            print(f"[!] Exceção capturada, aguardando 2s para retry...")
            time.sleep(2)
            return remove_team_from_entity(entity_id, entity_type, rem_team_id, retry=False)
        
        return False


def delete_team(team_id: int, retry: bool = True) -> bool:
    """
    Deleta um team do banco
    """
    try:
        table_id = TABLE_IDS['teams']
        url = f"{NOCO_BASE_URL}/{table_id}/records"
        headers = {"xc-token": NOCO_TOKEN}
        
        payload = {"Id": team_id}
        result = safe_request("DELETE", url, headers, json_data=payload)
        
        # Se falhou e ainda pode fazer retry
        if result is None and retry:
            print(f"[!] Falha ao deletar team, aguardando 2s para retry...")
            time.sleep(2)
            return delete_team(team_id, retry=False)
        
        return result is not None
        
    except Exception as e:
        print(f"[e] Erro ao deletar team {team_id}: {e}")
        
        # Retry em caso de exceção
        if retry:
            print(f"[!] Exceção capturada, aguardando 2s para retry...")
            time.sleep(2)
            return delete_team(team_id, retry=False)
        
        return False


def consolidate_group(group: Dict[str, Any], progress_lock: Lock) -> Tuple[bool, str, Dict]:
    """
    Consolida um grupo de teams duplicados
    """
    normalized_key = group['normalized_key']
    teams = group['teams']
    
    if len(teams) <= 1:
        return True, f"[i] Grupo '{normalized_key}' tem apenas 1 team, nada a fazer", {}
    
    # BASE = primeiro team
    base_team = teams[0]
    base_id = base_team['id']
    base_name = base_team['name']
    
    # REMs = demais teams
    rem_teams = teams[1:]
    rem_ids = [t['id'] for t in rem_teams]
    
    print(f"\n[→] Consolidando grupo '{normalized_key}'")
    print(f"    BASE: ID={base_id}, Nome='{base_name}'")
    print(f"    REMs: {rem_ids}")
    
    stats = {
        'normalized_key': normalized_key,
        'base_id': base_id,
        'base_name': base_name,
        'rem_ids': rem_ids,
        'miniatures_moved': 0,
        'drivers_moved': 0,
        'competitions_moved': 0,
        'teams_deleted': 0,
        'errors': []
    }
    
    # Para cada REM, mover relacionamentos para a BASE
    for rem_team in rem_teams:
        rem_id = rem_team['id']
        rem_name = rem_team['name']
        rem_data = rem_team.get('data', {})
        
        print(f"\n  [→] Processando REM: ID={rem_id}, Nome='{rem_name}'")
        
        # Rastrear se TODOS os itens foram movidos com sucesso
        all_moved_successfully = True
        
        # 1. Mover Miniatures
        miniatures = rem_data.get('miniatures', [])
        print(f"    [i] Miniatures a mover: {len(miniatures)}")
        for miniature in miniatures:
            miniature_id = miniature.get('id')
            if miniature_id:
                print(f"      [→] Adicionando miniature {miniature_id} à BASE {base_id}")
                success = add_team_to_entity(miniature_id, 'miniatures', base_id)
                if success:
                    print(f"      [✓] Miniature {miniature_id} adicionada à BASE")
                    stats['miniatures_moved'] += 1
                    # Só remove do REM se foi adicionado com sucesso à BASE
                    print(f"      [→] Removendo miniature {miniature_id} do REM {rem_id}")
                    remove_team_from_entity(miniature_id, 'miniatures', rem_id)
                else:
                    error_msg = f"Falha ao adicionar miniature {miniature_id} à BASE {base_id}"
                    print(f"      [e] {error_msg}")
                    stats['errors'].append(error_msg)
                    all_moved_successfully = False
        
        # 2. Mover Drivers
        drivers = rem_data.get('drivers', [])
        print(f"    [i] Drivers a mover: {len(drivers)}")
        for driver in drivers:
            driver_id = driver.get('id')
            if driver_id:
                print(f"      [→] Adicionando driver {driver_id} à BASE {base_id}")
                success = add_team_to_entity(driver_id, 'drivers', base_id)
                if success:
                    print(f"      [✓] Driver {driver_id} adicionado à BASE")
                    stats['drivers_moved'] += 1
                    # Só remove do REM se foi adicionado com sucesso à BASE
                    print(f"      [→] Removendo driver {driver_id} do REM {rem_id}")
                    remove_team_from_entity(driver_id, 'drivers', rem_id)
                else:
                    error_msg = f"Falha ao adicionar driver {driver_id} à BASE {base_id}"
                    print(f"      [e] {error_msg}")
                    stats['errors'].append(error_msg)
                    all_moved_successfully = False
        
        # 3. Mover Competitions
        competitions = rem_data.get('competitions', [])
        print(f"    [i] Competitions a mover: {len(competitions)}")
        for competition in competitions:
            competition_id = competition.get('id')
            if competition_id:
                print(f"      [→] Adicionando competition {competition_id} à BASE {base_id}")
                success = add_team_to_entity(competition_id, 'competitions', base_id)
                if success:
                    print(f"      [✓] Competition {competition_id} adicionada à BASE")
                    stats['competitions_moved'] += 1
                    # Só remove do REM se foi adicionado com sucesso à BASE
                    print(f"      [→] Removendo competition {competition_id} do REM {rem_id}")
                    remove_team_from_entity(competition_id, 'competitions', rem_id)
                else:
                    error_msg = f"Falha ao adicionar competition {competition_id} à BASE {base_id}"
                    print(f"      [e] {error_msg}")
                    stats['errors'].append(error_msg)
                    all_moved_successfully = False
        
        # 4. Só deletar o REM se TODOS os itens foram movidos com sucesso
        if all_moved_successfully:
            print(f"    [→] Todos os itens movidos com sucesso, deletando REM: ID={rem_id}")
            if delete_team(rem_id):
                stats['teams_deleted'] += 1
                print(f"    [✓] REM {rem_id} deletado com sucesso")
            else:
                stats['errors'].append(f"Falha ao deletar team REM {rem_id}")
                print(f"    [e] Falha ao deletar REM {rem_id}")
        else:
            error_msg = f"REM {rem_id} NÃO foi deletado porque houve falhas ao mover itens"
            print(f"    [!] {error_msg}")
            stats['errors'].append(error_msg)
    
    # Salvar progresso
    with progress_lock:
        progress = load_progress()
        progress[normalized_key] = {
            'status': 'completed',
            'timestamp': datetime.now().isoformat(),
            'stats': stats
        }
        save_progress(progress)
    
    success = len(stats['errors']) == 0
    message = f"[✓] Grupo '{normalized_key}' consolidado com sucesso" if success else f"[!] Grupo '{normalized_key}' consolidado com erros"
    
    return success, message, stats


def load_progress() -> Dict:
    """Carrega o progresso salvo"""
    try:
        with open(PROGRESS_FILE, 'r') as f:
            return json.load(f)
    except (FileNotFoundError, json.JSONDecodeError):
        return {}


def save_progress(progress: Dict):
    """Salva o progresso"""
    with open(PROGRESS_FILE, 'w') as f:
        json.dump(progress, f, indent=2)


def save_error(error_data: Dict):
    """Salva um erro"""
    try:
        errors = []
        try:
            with open(ERRORS_FILE, 'r') as f:
                errors = json.load(f)
        except (FileNotFoundError, json.JSONDecodeError):
            errors = []
        
        errors.append(error_data)
        
        with open(ERRORS_FILE, 'w') as f:
            json.dump(errors, f, indent=2)
    except Exception as e:
        print(f"[e] Erro ao salvar erro: {e}")


def main():
    print("=" * 80)
    print("CONSOLIDAÇÃO DE TEAMS DUPLICADOS VIA API NOCODB")
    print("=" * 80)
    print()
    
    # Carregar dados
    print("[i] Carregando teams_duplicates_with_data.json...")
    with open("teams_duplicates_with_data.json", "r", encoding="utf-8") as f:
        data = json.load(f)
    
    duplicate_groups = data.get('duplicate_groups', [])
    total_groups = len(duplicate_groups)
    
    print(f"[i] Total de grupos de duplicatas: {total_groups}")
    print()
    
    # Carregar progresso
    progress = load_progress()
    processed_keys = set(progress.keys())
    
    # Filtrar grupos pendentes
    pending_groups = [g for g in duplicate_groups if g['normalized_key'] not in processed_keys]
    
    print(f"[i] Grupos já processados: {len(processed_keys)}")
    print(f"[i] Grupos pendentes: {len(pending_groups)}")
    print()
    
    if not pending_groups:
        print("[✓] Todos os grupos já foram processados!")
        return
    
    # Confirmar antes de prosseguir
    print("=" * 80)
    print("ATENÇÃO: Este script vai modificar o banco de dados de PRODUÇÃO!")
    print("=" * 80)
    print()
    print(f"Será processado {len(pending_groups)} grupos de duplicatas")
    print()
    response = input("Deseja continuar? (digite 'SIM' para confirmar): ")
    
    if response != 'SIM':
        print("[!] Operação cancelada pelo usuário")
        return
    
    print()
    print("[→] Iniciando consolidação...")
    print()
    
    # Processar grupos com threading (5 workers)
    progress_lock = Lock()
    successful = 0
    failed = 0
    all_stats = []
    
    # Usar ThreadPoolExecutor com 5 workers
    with ThreadPoolExecutor(max_workers=5) as executor:
        # Submeter todas as tarefas
        future_to_group = {
            executor.submit(consolidate_group, group, progress_lock): group 
            for group in pending_groups
        }
        
        # Processar resultados conforme completam
        with tqdm(total=len(pending_groups), desc="Consolidando grupos") as pbar:
            for future in as_completed(future_to_group):
                group = future_to_group[future]
                try:
                    success, message, stats = future.result()
                    
                    if success:
                        successful += 1
                    else:
                        failed += 1
                        save_error({
                            'normalized_key': group['normalized_key'],
                            'timestamp': datetime.now().isoformat(),
                            'stats': stats
                        })
                    
                    all_stats.append(stats)
                    print(message)
                    
                except Exception as e:
                    failed += 1
                    error_msg = f"[e] Erro ao processar grupo '{group['normalized_key']}': {e}"
                    print(error_msg)
                    save_error({
                        'normalized_key': group['normalized_key'],
                        'timestamp': datetime.now().isoformat(),
                        'error': str(e)
                    })
                finally:
                    pbar.update(1)
    
    # Resumo final
    print()
    print("=" * 80)
    print("CONSOLIDAÇÃO CONCLUÍDA")
    print("=" * 80)
    print()
    print(f"[✓] Grupos processados com sucesso: {successful}")
    print(f"[e] Grupos com erros: {failed}")
    print()
    
    # Estatísticas totais
    total_miniatures = sum(s['miniatures_moved'] for s in all_stats)
    total_drivers = sum(s['drivers_moved'] for s in all_stats)
    total_competitions = sum(s['competitions_moved'] for s in all_stats)
    total_teams_deleted = sum(s['teams_deleted'] for s in all_stats)
    
    print("Estatísticas:")
    print(f"  - Miniatures movidas: {total_miniatures}")
    print(f"  - Drivers movidos: {total_drivers}")
    print(f"  - Competitions movidas: {total_competitions}")
    print(f"  - Teams deletados: {total_teams_deleted}")
    print()
    
    # Salvar resumo final
    summary = {
        'timestamp': datetime.now().isoformat(),
        'total_groups': total_groups,
        'processed': len(processed_keys) + successful,
        'successful': successful,
        'failed': failed,
        'statistics': {
            'miniatures_moved': total_miniatures,
            'drivers_moved': total_drivers,
            'competitions_moved': total_competitions,
            'teams_deleted': total_teams_deleted
        },
        'details': all_stats
    }
    
    with open(SUMMARY_FILE, 'w') as f:
        json.dump(summary, f, indent=2)
    
    print(f"[✓] Resumo salvo em: {SUMMARY_FILE}")
    print(f"[✓] Progresso salvo em: {PROGRESS_FILE}")
    if failed > 0:
        print(f"[!] Erros salvos em: {ERRORS_FILE}")
    print()


if __name__ == '__main__':
    main()
