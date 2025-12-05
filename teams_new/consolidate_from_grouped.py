#!/usr/bin/env python3
"""
Script para consolidar teams baseado no teams_grouped.json
- Lê o arquivo teams_grouped.json
- Para cada grupo: chave = team BASE (destino), lista = teams REMs (serão removidos)
- Garante que o team BASE existe (cria se necessário)
- Move todos os relacionamentos dos REMs para a BASE
- Deleta os teams REMs após consolidação
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
PROGRESS_FILE = 'consolidation_grouped_progress.json'
ERRORS_FILE = 'consolidation_grouped_errors.json'
SUMMARY_FILE = 'consolidation_grouped_summary.json'


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


def find_team_by_name(team_name: str) -> Optional[int]:
    """
    Busca um team pelo nome exato e retorna seu ID
    """
    try:
        table_id = TABLE_IDS['teams']
        url = f"{NOCO_BASE_URL}/{table_id}/records"
        headers = {"xc-token": NOCO_TOKEN}
        # Filtro WHERE sem aspas (funciona assim na API NocoDB)
        params = {
            "where": f"(team,eq,{team_name})",
            "limit": 10  # Pode haver duplicatas
        }
        
        response = requests.get(url, headers=headers, params=params, timeout=30)
        response.raise_for_status()
        result = response.json()
        
        records = result.get('list', [])
        if records and len(records) > 0:
            # Pegar o primeiro registro (API retorna 'Id' com maiúsculo)
            team_id = records[0].get('Id') or records[0].get('id')
            if team_id:
                print(f"[✓] Team '{team_name}' encontrado com ID={team_id}")
                if len(records) > 1:
                    print(f"[!] Atenção: Existem {len(records)} teams com nome '{team_name}'")
                return team_id
        
        print(f"[i] Team '{team_name}' não encontrado no banco")
        return None
        
    except Exception as e:
        print(f"[e] Erro ao buscar team '{team_name}': {e}")
        return None


def create_team(team_name: str) -> Optional[int]:
    """
    Cria um novo team com o nome especificado e retorna seu ID
    """
    try:
        table_id = TABLE_IDS['teams']
        url = f"{NOCO_BASE_URL}/{table_id}/records"
        headers = {"xc-token": NOCO_TOKEN}
        
        payload = {
            "team": team_name
        }
        
        result = safe_request("POST", url, headers, json_data=payload)
        
        if result:
            # API retorna apenas {"Id": valor} ao criar
            team_id = result.get('Id') or result.get('id')
            if team_id:
                print(f"[✓] Team '{team_name}' criado com ID={team_id}")
                return team_id
            else:
                print(f"[e] Resposta da API não contém ID: {result}")
        else:
            print(f"[e] Resposta vazia da API ao criar team '{team_name}'")
        
        return None
        
    except Exception as e:
        print(f"[e] Erro ao criar team '{team_name}': {e}")
        return None


def get_entity_ids_by_team(team_id: int, entity_type: str) -> List[int]:
    """
    Busca todos os IDs de entidades (miniatures/drivers/competitions) linkadas a um team
    Usa o mesmo método do script funcionando: busca direto no registro do team
    """
    try:
        table_id = TABLE_IDS['teams']
        url = f"{NOCO_BASE_URL}/{table_id}/records/{team_id}"
        headers = {"xc-token": NOCO_TOKEN}
        
        result = safe_request("GET", url, headers)
        if not result:
            print(f"[e] Não foi possível buscar dados do team {team_id}")
            return []
        
        # O campo many-to-many retorna uma lista no formato _nc_m2m_{entity_type}_teams
        m2m_field_name = f'_nc_m2m_{entity_type}_teams'
        links = result.get(m2m_field_name, [])
        
        if isinstance(links, list):
            # Cada link tem o formato: {"teams_id": X, "{entity_type}_id": Y, ...}
            entity_ids = []
            for link in links:
                if isinstance(link, dict):
                    entity_id = link.get(f'{entity_type}_id')
                    if entity_id:
                        entity_ids.append(entity_id)
            return entity_ids
        
        return []
        
    except Exception as e:
        print(f"[e] Erro ao buscar {entity_type} do team {team_id}: {e}")
        return []


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
        
        # Verifica se já está linkado usando o campo many-to-many correto
        m2m_field_name = f'_nc_m2m_{entity_type}_teams'
        current_teams = current_data.get(m2m_field_name, [])
        if isinstance(current_teams, list):
            for team in current_teams:
                if isinstance(team, dict) and team.get('teams_id') == base_team_id:
                    print(f"[i] Team {base_team_id} já está linkado à {entity_type} {entity_id}")
                    return True
        
        # Usa a API de Links do NocoDB
        url = f"{NOCO_BASE_URL}/{table_id}/links/{column_id}/records/{entity_id}"
        payload = [base_team_id]
        
        result = safe_request("POST", url, headers, json_data=payload)
        
        if result is None and retry:
            print(f"[!] Falha ao adicionar, aguardando 2s para retry...")
            time.sleep(2)
            return add_team_to_entity(entity_id, entity_type, base_team_id, retry=False)
        
        return result is not None
        
    except Exception as e:
        print(f"[e] Erro ao adicionar team {base_team_id} à {entity_type} {entity_id}: {e}")
        
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
        
        url = f"{NOCO_BASE_URL}/{table_id}/links/{column_id}/records/{entity_id}"
        headers = {"xc-token": NOCO_TOKEN}
        payload = [rem_team_id]
        
        result = safe_request("DELETE", url, headers, json_data=payload)
        
        if result is None and retry:
            print(f"[!] Falha ao remover, aguardando 2s para retry...")
            time.sleep(2)
            return remove_team_from_entity(entity_id, entity_type, rem_team_id, retry=False)
        
        return result is not None
        
    except Exception as e:
        print(f"[e] Erro ao remover team {rem_team_id} da {entity_type} {entity_id}: {e}")
        
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
        
        if result is None and retry:
            print(f"[!] Falha ao deletar team, aguardando 2s para retry...")
            time.sleep(2)
            return delete_team(team_id, retry=False)
        
        return result is not None
        
    except Exception as e:
        print(f"[e] Erro ao deletar team {team_id}: {e}")
        
        if retry:
            print(f"[!] Exceção capturada, aguardando 2s para retry...")
            time.sleep(2)
            return delete_team(team_id, retry=False)
        
        return False


def consolidate_group(group_name: str, team_list: List[Dict], progress_lock: Lock, previous_progress: Optional[Dict] = None) -> Tuple[bool, str, Dict]:
    """
    Consolida um grupo de teams
    - group_name: nome do team BASE (chave do JSON)
    - team_list: lista de teams que serão mesclados
    - previous_progress: progresso anterior (se estiver retomando)
    """
    print(f"\n[→] Consolidando grupo '{group_name}'")
    print(f"    Teams na lista: {len(team_list)}")
    
    # Se há progresso anterior, carregar estatísticas
    if previous_progress and previous_progress.get('status') == 'in_progress':
        print(f"  [!] Retomando grupo incompleto...")
        stats = previous_progress.get('current_stats', {})
        # Garantir que todos os campos existem
        stats.setdefault('group_name', group_name)
        stats.setdefault('base_id', None)
        stats.setdefault('base_name', group_name)
        stats.setdefault('rem_ids', [])
        stats.setdefault('miniatures_moved', 0)
        stats.setdefault('drivers_moved', 0)
        stats.setdefault('competitions_moved', 0)
        stats.setdefault('teams_deleted', 0)
        stats.setdefault('errors', [])
        
        # IDs já processados
        already_processed_ids = set(stats['rem_ids'])
        print(f"  [i] REMs já processados: {len(already_processed_ids)}")
    else:
        stats = {
            'group_name': group_name,
            'base_id': None,
            'base_name': group_name,
            'rem_ids': [],
            'miniatures_moved': 0,
            'drivers_moved': 0,
            'competitions_moved': 0,
            'teams_deleted': 0,
            'errors': []
        }
        already_processed_ids = set()
    
    # 1. Garantir que o team BASE existe
    if stats['base_id']:
        base_id = stats['base_id']
        print(f"  [✓] Team BASE já identificado: ID={base_id}")
    else:
        print(f"  [→] Verificando se team BASE '{group_name}' existe...")
        base_id = find_team_by_name(group_name)
        
        if base_id:
            print(f"  [✓] Team BASE encontrado: ID={base_id}")
        else:
            print(f"  [!] Team BASE não encontrado, criando...")
            base_id = create_team(group_name)
            if base_id:
                print(f"  [✓] Team BASE criado: ID={base_id}")
            else:
                error_msg = f"Falha ao criar team BASE '{group_name}'"
                print(f"  [e] {error_msg}")
                stats['errors'].append(error_msg)
                return False, f"[e] {error_msg}", stats
        
        stats['base_id'] = base_id
    
    # 2. Processar cada team da lista
    for team_data in team_list:
        rem_id = team_data.get('id')
        rem_name = team_data.get('team', '')
        
        # Se o team da lista for o mesmo que a BASE (mesmo ID), pular
        if rem_id == base_id:
            print(f"  [i] Team ID={rem_id} ('{rem_name}') é o próprio BASE, pulando...")
            continue
        
        # Se já foi processado, pular
        if rem_id in already_processed_ids:
            print(f"  [i] Team ID={rem_id} ('{rem_name}') já foi processado, pulando...")
            continue
        
        stats['rem_ids'].append(rem_id)
        print(f"\n  [→] Processando REM: ID={rem_id}, Nome='{rem_name}'")
        
        all_moved_successfully = True
        
        # 3. Buscar miniatures, drivers e competitions
        print(f"    [→] Buscando entidades do REM {rem_id}...")
        miniature_ids = get_entity_ids_by_team(rem_id, 'miniatures')
        driver_ids = get_entity_ids_by_team(rem_id, 'drivers')
        competition_ids = get_entity_ids_by_team(rem_id, 'competitions')
        
        total_entities = len(miniature_ids) + len(driver_ids) + len(competition_ids)
        print(f"    [i] Total de entidades: {total_entities} (miniatures: {len(miniature_ids)}, drivers: {len(driver_ids)}, competitions: {len(competition_ids)})")
        
        if total_entities == 0:
            print(f"    [i] Nenhuma entidade encontrada para mover")
        else:
            # Processar em paralelo com ThreadPoolExecutor
            def process_entity(entity_data):
                entity_id, entity_type = entity_data
                success = add_team_to_entity(entity_id, entity_type, base_id)
                if success:
                    remove_team_from_entity(entity_id, entity_type, rem_id)
                    return (True, entity_type, entity_id, None)
                else:
                    error_msg = f"Falha ao adicionar {entity_type[:-1]} {entity_id} à BASE {base_id}"
                    return (False, entity_type, entity_id, error_msg)
            
            # Criar lista de tarefas
            tasks = []
            tasks.extend([(mid, 'miniatures') for mid in miniature_ids])
            tasks.extend([(did, 'drivers') for did in driver_ids])
            tasks.extend([(cid, 'competitions') for cid in competition_ids])
            
            # Processar com 10 workers
            print(f"    [→] Processando {len(tasks)} entidades com 10 workers...")
            with ThreadPoolExecutor(max_workers=10) as executor:
                futures = {executor.submit(process_entity, task): task for task in tasks}
                
                completed = 0
                for future in as_completed(futures):
                    completed += 1
                    success, entity_type, entity_id, error_msg = future.result()
                    
                    if success:
                        if entity_type == 'miniatures':
                            stats['miniatures_moved'] += 1
                        elif entity_type == 'drivers':
                            stats['drivers_moved'] += 1
                        elif entity_type == 'competitions':
                            stats['competitions_moved'] += 1
                        
                        if completed % 10 == 0 or completed == len(tasks):
                            print(f"      [i] Progresso: {completed}/{len(tasks)} entidades processadas")
                    else:
                        stats['errors'].append(error_msg)
                        all_moved_successfully = False
                        print(f"      [e] {error_msg}")
            
            print(f"    [✓] Processamento concluído: {stats['miniatures_moved']} miniatures, {stats['drivers_moved']} drivers, {stats['competitions_moved']} competitions movidos")
        
        # 6. Deletar o REM se tudo foi movido com sucesso
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
        
        # Salvar progresso incremental após cada REM processado
        with progress_lock:
            progress = load_progress()
            progress[group_name] = {
                'status': 'in_progress',
                'timestamp': datetime.now().isoformat(),
                'base_id': stats['base_id'],
                'base_name': stats['base_name'],
                'rems_processed': len(stats['rem_ids']),
                'current_stats': stats
            }
            save_progress(progress)
    
    # Salvar progresso com mais detalhes
    with progress_lock:
        progress = load_progress()
        progress[group_name] = {
            'status': 'completed' if len(stats['errors']) == 0 else 'completed_with_errors',
            'timestamp': datetime.now().isoformat(),
            'base_id': stats['base_id'],
            'base_name': stats['base_name'],
            'rems_processed': len(stats['rem_ids']),
            'stats': stats
        }
        save_progress(progress)
        
        # Se houve erros, salvar também no arquivo de erros
        if len(stats['errors']) > 0:
            save_error({
                'group_name': group_name,
                'timestamp': datetime.now().isoformat(),
                'base_id': stats['base_id'],
                'errors': stats['errors'],
                'stats': stats
            })
    
    success = len(stats['errors']) == 0
    message = f"[✓] Grupo '{group_name}' consolidado com sucesso" if success else f"[!] Grupo '{group_name}' consolidado com erros"
    
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
    print("CONSOLIDAÇÃO DE TEAMS BASEADO EM teams_grouped_full.json")
    print("=" * 80)
    print()
    
    # Carregar dados
    print("[i] Carregando teams_grouped_full.json...")
    with open("teams_grouped_full.json", "r", encoding="utf-8") as f:
        grouped_data = json.load(f)
    
    total_groups = len(grouped_data)
    
    print(f"[i] Total de grupos: {total_groups}")
    print()
    
    # Carregar progresso
    progress = load_progress()
    
    # Filtrar grupos: apenas pular os que estão 'completed' ou 'completed_with_errors'
    # Grupos 'in_progress' devem ser reprocessados
    completed_statuses = {'completed', 'completed_with_errors'}
    processed_keys = {k for k, v in progress.items() if v.get('status') in completed_statuses}
    
    # Filtrar grupos pendentes (não processados ou incompletos)
    pending_groups = {k: v for k, v in grouped_data.items() if k not in processed_keys}
    
    # Identificar grupos incompletos
    incomplete_groups = {k for k, v in progress.items() if v.get('status') == 'in_progress'}
    
    print(f"[i] Grupos completamente processados: {len(processed_keys)}")
    print(f"[i] Grupos incompletos (serão reprocessados): {len(incomplete_groups)}")
    if incomplete_groups:
        print(f"    Grupos incompletos: {', '.join(list(incomplete_groups)[:5])}")
        if len(incomplete_groups) > 5:
            print(f"    ... e mais {len(incomplete_groups) - 5}")
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
    print(f"Serão processados {len(pending_groups)} grupos")
    print()
    response = input("Deseja continuar? (digite 'SIM' para confirmar): ")
    
    if response != 'SIM':
        print("[!] Operação cancelada pelo usuário")
        return
    
    print()
    print("[→] Iniciando consolidação...")
    print()
    
    # Processar grupos sequencialmente (para evitar conflitos)
    progress_lock = Lock()
    successful = 0
    failed = 0
    all_stats = []
    
    with tqdm(total=len(pending_groups), desc="Consolidando grupos") as pbar:
        for group_name, team_list in pending_groups.items():
            try:
                # Passar progresso anterior se existir
                previous_progress = progress.get(group_name)
                success, message, stats = consolidate_group(group_name, team_list, progress_lock, previous_progress)
                
                if success:
                    successful += 1
                else:
                    failed += 1
                    save_error({
                        'group_name': group_name,
                        'timestamp': datetime.now().isoformat(),
                        'stats': stats
                    })
                
                all_stats.append(stats)
                print(message)
                
            except Exception as e:
                failed += 1
                error_msg = f"[e] Erro ao processar grupo '{group_name}': {e}"
                print(error_msg)
                save_error({
                    'group_name': group_name,
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
