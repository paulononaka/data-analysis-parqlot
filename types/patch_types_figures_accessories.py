#!/usr/bin/env python3
"""
Script para atualizar o type_id de miniaturas identificadas como FIGURES ou ACCESSORIES.
Utiliza a tabela de associação _nc_m2m_miniatures_miniature_type.

Figures: miniature_type_id = 3
Accessories: miniature_type_id = 4
"""

import os
import requests
import json
from typing import Dict, Any, Optional, List
from concurrent.futures import ThreadPoolExecutor, as_completed
from threading import Lock
from tqdm import tqdm
from datetime import datetime


def safe_request(method: str, url: str, headers: Dict[str, str], json_data: Optional[Dict[str, Any]] = None, timeout: int = 30) -> Optional[Any]:
    """Executa requisição HTTP com tratamento de erros"""
    try:
        method_lower = method.lower()
        if method_lower == "get":
            response = requests.get(url, headers=headers, timeout=timeout)
        elif method_lower == "post":
            response = requests.post(url, headers=headers, json=json_data, timeout=timeout)
        elif method_lower == "patch":
            response = requests.patch(url, headers=headers, json=json_data, timeout=timeout)
        elif method_lower == "put":
            response = requests.put(url, headers=headers, json=json_data, timeout=timeout)
        elif method_lower == "delete":
            response = requests.delete(url, headers=headers, timeout=timeout)
        else:
            print(f"[e] Método HTTP não suportado: {method}")
            return None

        response.raise_for_status()
        
        # Retorna o response completo para DELETE, JSON para outros
        if method_lower == "delete":
            return response
        return response.json()
    except requests.exceptions.HTTPError as http_err:
        return None
    except requests.exceptions.ConnectionError as conn_err:
        return None
    except requests.exceptions.Timeout as timeout_err:
        return None
    except requests.exceptions.RequestException as req_err:
        return None
    except ValueError as json_err:
        return None
    return None


# Configuração de caminhos
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
INPUT_JSON_PATH = os.path.join(SCRIPT_DIR, "figures_accessories_to_update.json")
SUCCESS_LOG_PATH = os.path.join(SCRIPT_DIR, "type_update_success_log.json")
FAILURE_LOG_PATH = os.path.join(SCRIPT_DIR, "type_update_failure_log.json")
PROGRESS_LOG_PATH = os.path.join(SCRIPT_DIR, "type_update_progress_log.json")


def load_input_data() -> Dict[str, Any]:
    """Carrega dados do arquivo JSON de entrada"""
    try:
        with open(INPUT_JSON_PATH, 'r', encoding='utf-8') as f:
            return json.load(f)
    except FileNotFoundError:
        print(f"[e] Arquivo não encontrado: {INPUT_JSON_PATH}")
        return {}
    except json.JSONDecodeError as e:
        print(f"[e] Erro ao decodificar JSON: {e}")
        return {}


def load_success_log() -> Dict[int, Dict[str, Any]]:
    """Carrega log de sucessos ou retorna dict vazio"""
    if os.path.exists(SUCCESS_LOG_PATH):
        try:
            with open(SUCCESS_LOG_PATH, 'r', encoding='utf-8') as f:
                data = json.load(f)
                # Converte chaves string para int
                return {int(k): v for k, v in data.items()}
        except (json.JSONDecodeError, ValueError) as e:
            print(f"[w] Erro ao carregar log de sucessos: {e}")
    return {}


def save_success_log(success_log: Dict[int, Dict[str, Any]]):
    """Salva log de sucessos"""
    try:
        # Converte chaves int para string para JSON
        data = {str(k): v for k, v in success_log.items()}
        with open(SUCCESS_LOG_PATH, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=2, ensure_ascii=False)
    except Exception as e:
        print(f"[e] Erro ao salvar log de sucessos: {e}")


def load_failure_log() -> List[Dict[str, Any]]:
    """Carrega log de falhas ou retorna lista vazia"""
    if os.path.exists(FAILURE_LOG_PATH):
        try:
            with open(FAILURE_LOG_PATH, 'r', encoding='utf-8') as f:
                return json.load(f)
        except (json.JSONDecodeError, ValueError) as e:
            print(f"[w] Erro ao carregar log de falhas: {e}")
    return []


def save_failure_log(failure_log: List[Dict[str, Any]]):
    """Salva log de falhas"""
    try:
        with open(FAILURE_LOG_PATH, 'w', encoding='utf-8') as f:
            json.dump(failure_log, f, indent=2, ensure_ascii=False)
    except Exception as e:
        print(f"[e] Erro ao salvar log de falhas: {e}")


def save_progress_log(progress_data: Dict[str, Any]):
    """Salva log de progresso"""
    try:
        with open(PROGRESS_LOG_PATH, 'w', encoding='utf-8') as f:
            json.dump(progress_data, f, indent=2, ensure_ascii=False)
    except Exception as e:
        print(f"[e] Erro ao salvar log de progresso: {e}")


def get_all_updates() -> List[Dict[str, Any]]:
    """Obtém todos os registros a serem atualizados (figures + accessories)"""
    data = load_input_data()
    
    if not data:
        return []
    
    updates = data.get('updates', {})
    figures = updates.get('figures', [])
    accessories = updates.get('accessories', [])
    
    # Combina todas as atualizações em uma lista única
    all_updates = []
    
    for item in figures:
        all_updates.append({
            **item,
            'category': 'figures'
        })
    
    for item in accessories:
        all_updates.append({
            **item,
            'category': 'accessories'
        })
    
    return all_updates


def get_pending_updates(all_updates: List[Dict[str, Any]], success_log: Dict[int, Dict[str, Any]]) -> List[Dict[str, Any]]:
    """Filtra registros que ainda não foram atualizados"""
    pending = []
    for update in all_updates:
        record_id = update.get('id')
        if record_id and record_id not in success_log:
            pending.append(update)
    return pending


def update_single_record(record: Dict[str, Any], miniatures_url: str, headers: Dict[str, str], 
                        success_log: Dict[int, Dict[str, Any]], failure_log: List[Dict[str, Any]], 
                        log_lock: Lock) -> bool:
    """
    Atualiza o tipo da miniatura via PATCH na tabela de miniaturas.
    O NocoDB gerencia automaticamente a tabela m2m quando atualizamos o relacionamento.
    
    Usa PATCH para atualizar o campo 'miniature_type' que é um link para a tabela miniature_type.
    """
    miniature_id = record.get('id')
    target_type_id = record.get('target_type_id')
    category = record.get('category')
    
    if not miniature_id:
        with log_lock:
            failure_log.append({
                'record': record,
                'error': 'ID da miniatura ausente',
                'timestamp': datetime.now().isoformat()
            })
            save_failure_log(failure_log)
        return False
    
    if not target_type_id:
        with log_lock:
            failure_log.append({
                'record': record,
                'error': 'target_type_id ausente',
                'timestamp': datetime.now().isoformat()
            })
            save_failure_log(failure_log)
        return False
    
    # Monta o payload para atualizar o relacionamento
    # O NocoDB espera o ID da miniatura e o novo valor do link
    payload = {
        "Id": miniature_id,
        "miniature_type": target_type_id  # Campo de relacionamento
    }
    
    try:
        # PATCH para atualizar o relacionamento
        # Isso automaticamente atualiza a tabela m2m e mantém o histórico
        response = safe_request("PATCH", miniatures_url, headers, payload, timeout=10)
        
        if response:
            # Thread-safe update do log
            with log_lock:
                success_log[miniature_id] = {
                    'category': category,
                    'miniature_type_id': target_type_id,
                    'rawData': record.get('rawData', ''),
                    'timestamp': datetime.now().isoformat()
                }
                save_success_log(success_log)
            return True
        else:
            with log_lock:
                failure_log.append({
                    'miniature_id': miniature_id,
                    'record': record,
                    'payload': payload,
                    'error': 'Falha na requisição HTTP (PATCH)',
                    'timestamp': datetime.now().isoformat()
                })
                save_failure_log(failure_log)
            return False
    except Exception as e:
        with log_lock:
            failure_log.append({
                'miniature_id': miniature_id,
                'record': record,
                'payload': payload,
                'error': f'Exceção inesperada: {str(e)}',
                'timestamp': datetime.now().isoformat()
            })
            save_failure_log(failure_log)
        return False


def update_types():
    """Função principal para atualizar os tipos via PATCH na tabela de miniaturas"""
    # URL da tabela de miniaturas
    # Atualizamos o relacionamento diretamente na tabela de miniaturas
    # O NocoDB gerencia automaticamente a tabela m2m
    base_api_url = "https://nocodb-production-ac4d.up.railway.app/api/v2"
    miniatures_table_id = "mv2tjpu2nye7jfv"
    miniatures_url = f"{base_api_url}/tables/{miniatures_table_id}/records"
    
    headers = {"xc-token": "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"}
    
    print("[i] Usando PATCH na tabela de miniaturas para atualizar tipos")
    print("[i] O NocoDB gerenciará automaticamente a tabela m2m e manterá o histórico")
    
    # Carrega log de sucessos
    success_log = load_success_log()
    print(f"[i] Registros já atualizados: {len(success_log)}")
    
    # Carrega todos os registros a atualizar
    all_updates = get_all_updates()
    if not all_updates:
        print("[e] Nenhum registro encontrado para atualizar")
        return
    
    print(f"[i] Total de registros no arquivo: {len(all_updates)}")
    
    # Filtra registros pendentes
    pending_updates = get_pending_updates(all_updates, success_log)
    print(f"[i] Registros pendentes: {len(pending_updates)}")
    
    if not pending_updates:
        print("[i] Todos os registros já foram atualizados!")
        return
    
    # Estatísticas por categoria
    figures_pending = sum(1 for r in pending_updates if r.get('category') == 'figures')
    accessories_pending = sum(1 for r in pending_updates if r.get('category') == 'accessories')
    print(f"[i] Pendentes - Figures: {figures_pending}, Accessories: {accessories_pending}")
    
    # Carrega log de falhas
    failure_log = load_failure_log()
    
    # Lock para thread-safety
    log_lock = Lock()
    
    # Contadores
    success_count = 0
    failure_count = 0
    
    # Configuração de threads
    max_workers = 1
    
    print(f"\n[i] Iniciando atualização com {max_workers} threads...")
    
    # Progress bar
    with tqdm(total=len(pending_updates), desc="Atualizando tipos", unit="registro") as pbar:
        with ThreadPoolExecutor(max_workers=max_workers) as executor:
            # Submete todas as tarefas
            futures = {
                executor.submit(
                    update_single_record, 
                    record, 
                    miniatures_url, 
                    headers, 
                    success_log, 
                    failure_log, 
                    log_lock
                ): record for record in pending_updates
            }
            
            # Processa resultados conforme completam
            for future in as_completed(futures):
                record = futures[future]
                try:
                    success = future.result()
                    if success:
                        success_count += 1
                    else:
                        failure_count += 1
                except Exception as e:
                    failure_count += 1
                    print(f"\n[e] Erro ao processar registro {record.get('id')}: {e}")
                
                # Atualiza progress bar
                pbar.update(1)
                pbar.set_postfix({
                    'Sucesso': success_count,
                    'Falha': failure_count
                })
                
                # Salva progresso a cada 50 registros
                if (success_count + failure_count) % 50 == 0:
                    progress_data = {
                        'timestamp': datetime.now().isoformat(),
                        'total_to_update': len(pending_updates),
                        'processed': success_count + failure_count,
                        'success': success_count,
                        'failures': failure_count,
                        'remaining': len(pending_updates) - (success_count + failure_count)
                    }
                    save_progress_log(progress_data)
    
    # Salva progresso final
    final_progress = {
        'timestamp': datetime.now().isoformat(),
        'total_to_update': len(pending_updates),
        'processed': success_count + failure_count,
        'success': success_count,
        'failures': failure_count,
        'remaining': 0,
        'completed': True
    }
    save_progress_log(final_progress)
    
    # Estatísticas finais
    print("\n" + "="*60)
    print("RESUMO DA ATUALIZAÇÃO")
    print("="*60)
    print(f"Total processado: {success_count + failure_count}")
    print(f"✓ Sucessos: {success_count}")
    print(f"✗ Falhas: {failure_count}")
    print(f"Total já atualizados (incluindo anteriores): {len(success_log)}")
    
    if failure_count > 0:
        print(f"\n[w] {failure_count} registros falharam. Verifique: {FAILURE_LOG_PATH}")
    
    print(f"\n[i] Logs salvos:")
    print(f"  - Sucessos: {SUCCESS_LOG_PATH}")
    print(f"  - Falhas: {FAILURE_LOG_PATH}")
    print(f"  - Progresso: {PROGRESS_LOG_PATH}")


def main():
    """Função principal"""
    print("="*60)
    print("ATUALIZAÇÃO DE TIPOS - FIGURES E ACCESSORIES")
    print("="*60)
    print(f"Arquivo de entrada: {INPUT_JSON_PATH}")
    print()
    
    update_types()
    
    print("\n✓ Script concluído!")


if __name__ == '__main__':
    main()
