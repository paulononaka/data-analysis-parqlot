import os
import requests
import json
from typing import Dict, Any, Optional, List
from concurrent.futures import ThreadPoolExecutor, as_completed
from threading import Lock
from tqdm import tqdm
from datetime import datetime

def safe_request(method: str, url: str, headers: Dict[str, str], json_data: Optional[Dict[str, Any]] = None, timeout: int = 30) -> Optional[Dict[str, Any]]:
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
            response = requests.delete(url, headers=headers, json=json_data, timeout=timeout)
        else:
            print(f"[e] Método HTTP não suportado: {method}")
            return None

        response.raise_for_status()
        return response.json()
    except requests.exceptions.HTTPError as http_err:
        # Silencioso - não printa erro HTTP
        return None
    except requests.exceptions.ConnectionError as conn_err:
        # Silencioso - não printa erro de conexão
        return None
    except requests.exceptions.Timeout as timeout_err:
        # Silencioso - não printa timeout
        return None
    except requests.exceptions.RequestException as req_err:
        # Silencioso - não printa erro de requisição
        return None
    except ValueError as json_err:
        # Silencioso - não printa erro JSON
        return None
    return None

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
JSON_PATH = os.path.join(SCRIPT_DIR, "_normalized_failures_202512041810.json")
SUCCESS_LOG_PATH = os.path.join(SCRIPT_DIR, "update_success_log.json")
FAILURE_LOG_PATH = os.path.join(SCRIPT_DIR, "update_failure_log.json")
PROGRESS_LOG_PATH = os.path.join(SCRIPT_DIR, "update_progress_log.json")

def load_json_data() -> List[Dict[str, Any]]:
    """Carrega dados do arquivo JSON normalizado"""
    try:
        with open(JSON_PATH, 'r', encoding='utf-8') as f:
            data = json.load(f)
            return data.get('normalized', [])
    except FileNotFoundError:
        print(f"[e] Arquivo não encontrado: {JSON_PATH}")
        return []
    except json.JSONDecodeError as e:
        print(f"[e] Erro ao decodificar JSON: {e}")
        return []


def get_all_miniatures() -> List[Dict[str, Any]]:
    """Busca todos os registros com model_normalized preenchido do JSON"""
    all_data = load_json_data()
    
    # Filtra apenas registros com model_normalized preenchido
    filtered = [
        record for record in all_data
        if record.get('model_normalized') and record.get('model_normalized').strip()
    ]
    
    return filtered


def load_success_log() -> Dict[int, str]:
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


def save_success_log(success_log: Dict[int, str]):
    """Salva log de sucessos"""
    try:
        # Converte chaves int para string para JSON
        data = {str(k): v for k, v in success_log.items()}
        with open(SUCCESS_LOG_PATH, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=2, ensure_ascii=False)
        # print(f"[debug] Log salvo: {len(data)} registros em {SUCCESS_LOG_PATH}")
    except Exception as e:
        print(f"[e] Erro ao salvar log: {e}")


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


def get_pending_records(all_records: List[Dict[str, Any]], success_log: Dict[int, str]) -> List[Dict[str, Any]]:
    """Filtra registros que ainda não foram atualizados"""
    pending = []
    for record in all_records:
        noco_id = record.get('noco_id')
        if noco_id and noco_id not in success_log:
            pending.append(record)
    return pending


def update_single_record(record: Dict[str, Any], base_url: str, headers: Dict[str, str], 
                        success_log: Dict[int, str], failure_log: List[Dict[str, Any]], 
                        log_lock: Lock) -> bool:
    """Atualiza um único registro"""
    noco_id = record.get('noco_id')
    model_normalized = record.get('model_normalized')
    race_number = record.get('raceNumber')
    
    if not noco_id:
        with log_lock:
            failure_log.append({
                'record': record,
                'error': 'noco_id ausente',
                'timestamp': datetime.now().isoformat()
            })
            save_failure_log(failure_log)
        return False
    
    # Monta o payload
    payload = {"Id": noco_id}
    
    if model_normalized:
        payload["model"] = model_normalized
    
    # Adiciona model_additional_info se não estiver vazio
    model_additional_info = record.get('model_additional_info', '').strip()
    if model_additional_info:
        payload["model_additional_info"] = model_additional_info
    
    if race_number:
        try:
            payload["race_number"] = int(race_number)
        except (ValueError, TypeError):
            payload["race_number"] = race_number
    
    try:
        response = safe_request("PATCH", base_url, headers, payload, timeout=10)
        
        if response:
            # Thread-safe update do log
            with log_lock:
                success_log[noco_id] = model_normalized
                save_success_log(success_log)
            return True
        else:
            with log_lock:
                failure_log.append({
                    'noco_id': noco_id,
                    'record': record,
                    'payload': payload,
                    'error': 'Falha na requisição HTTP',
                    'timestamp': datetime.now().isoformat()
                })
                save_failure_log(failure_log)
            return False
    except Exception as e:
        with log_lock:
            failure_log.append({
                'noco_id': noco_id,
                'record': record,
                'payload': payload,
                'error': f'Exceção inesperada: {str(e)}',
                'timestamp': datetime.now().isoformat()
            })
            save_failure_log(failure_log)
        return False


def update_miniatures():
    base_url = "https://nocodb-production-ac4d.up.railway.app/api/v2/tables/mv2tjpu2nye7jfv/records"
    headers = {"xc-token": "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"}
    
    # Carrega log de sucessos
    success_log = load_success_log()
    print(f"[i] Registros já atualizados: {len(success_log)}")
    
    # Carrega todos os registros
    all_records = get_all_miniatures()
    print(f"[i] Total de registros no JSON: {len(all_records)}")
    
    # Filtra registros pendentes
    pending_records = get_pending_records(all_records, success_log)
    print(f"[i] Registros pendentes: {len(pending_records)}")
    
    if not pending_records:
        print("[✓] Todos os registros já foram atualizados!")
        return
    
    failure_log = load_failure_log()
    
    # Thread-safe lock para o log
    log_lock = Lock()
    success_count = 0
    error_count = 0
    
    # Teste rápido de conectividade
    print(f"[i] Testando conectividade com a API...")
    test_record = pending_records[0]
    test_payload = {"Id": test_record.get('noco_id')}
    test_response = safe_request("PATCH", base_url, headers, test_payload, timeout=5)
    if test_response is None:
        print(f"[w] API não respondeu ao teste inicial. Continuando mesmo assim...")
    else:
        print(f"[✓] API respondendo normalmente")
    
    print(f"[i] Iniciando processamento com 5 workers...\n")
    
    # ThreadPoolExecutor com 5 workers (reduzido para evitar sobrecarga)
    with ThreadPoolExecutor(max_workers=5) as executor:
        # Submete todas as tarefas
        future_to_record = {
            executor.submit(update_single_record, record, base_url, headers, success_log, failure_log, log_lock): record
            for record in pending_records
        }
        
        # Processa resultados conforme completam com barra de progresso
        with tqdm(total=len(pending_records), desc="Atualizando registros", unit="reg") as pbar:
            for future in as_completed(future_to_record):
                record = future_to_record[future]
                try:
                    success = future.result()
                    if success:
                        success_count += 1
                        pbar.set_postfix({"✓": success_count, "✗": error_count})
                    else:
                        error_count += 1
                        pbar.set_postfix({"✓": success_count, "✗": error_count})
                except Exception as exc:
                    error_count += 1
                    noco_id = record.get('noco_id', 'UNKNOWN')
                    pbar.write(f"[e] Exceção ao processar ID {noco_id}: {exc}")
                    pbar.set_postfix({"✓": success_count, "✗": error_count})
                    
                    # Registra exceção no log de falhas
                    with log_lock:
                        failure_log.append({
                            'noco_id': noco_id,
                            'record': record,
                            'error': str(exc),
                            'error_type': type(exc).__name__,
                            'timestamp': datetime.now().isoformat()
                        })
                        save_failure_log(failure_log)
                
                # Salva progresso a cada 10 registros processados
                if (success_count + error_count) % 10 == 0:
                    progress_data = {
                        'timestamp': datetime.now().isoformat(),
                        'total_records': len(all_records),
                        'already_updated': len(success_log) - success_count,
                        'processed_this_run': success_count + error_count,
                        'success_this_run': success_count,
                        'errors_this_run': error_count,
                        'total_success': len(success_log),
                        'total_failures': len(failure_log),
                        'pending': len(pending_records) - (success_count + error_count)
                    }
                    save_progress_log(progress_data)
                
                pbar.update(1)
    
    # Salva logs finais
    save_success_log(success_log)
    save_failure_log(failure_log)
    
    # Salva progresso final
    progress_data = {
        'timestamp': datetime.now().isoformat(),
        'total_records': len(all_records),
        'already_updated': len(success_log) - success_count,
        'processed_this_run': success_count + error_count,
        'success_this_run': success_count,
        'errors_this_run': error_count,
        'total_success': len(success_log),
        'total_failures': len(failure_log),
        'pending': len(all_records) - len(success_log)
    }
    save_progress_log(progress_data)
    
    print(f"\n[✓] Concluído! Sucesso: {success_count}, Erros: {error_count}")
    print(f"[i] Total processado nesta execução: {success_count + error_count}")
    print(f"[i] Log de sucessos: {SUCCESS_LOG_PATH}")
    print(f"[i] Log de falhas: {FAILURE_LOG_PATH}")
    print(f"[i] Log de progresso: {PROGRESS_LOG_PATH}")


if __name__ == "__main__":
    update_miniatures()