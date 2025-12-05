#!/usr/bin/env python3
"""
Script to update driver names in NocoDB from drivers_unified.json
Simplified version - only updates driver names, no image processing
"""

import requests
from typing import Dict, Optional, Any, List, Tuple
import os
import json
from datetime import datetime
from tqdm import tqdm
from threading import Lock
from concurrent.futures import ThreadPoolExecutor, as_completed

# NocoDB Configuration
NOCO_BASE_URL = "https://nocodb-production-ac4d.up.railway.app/api/v2/tables"
NOCO_TABLE_ID = "my38ymolrk7iz0d"  # Drivers table ID
NOCO_TOKEN = "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"

def safe_request(method: str, url: str, headers: Dict[str, str], json_data: Optional[Dict[str, Any]] = None) -> Optional[Dict[str, Any]]:
    """Make a safe HTTP request with error handling"""
    try:
        method_lower = method.lower()
        if method_lower == "get":
            response = requests.get(url, headers=headers)
        elif method_lower == "post":
            response = requests.post(url, headers=headers, json=json_data)
        elif method_lower == "patch":
            response = requests.patch(url, headers=headers, json=json_data)
        elif method_lower == "delete":
            response = requests.delete(url, headers=headers, json=json_data)
        else:
            print(f"[e] Método HTTP não suportado: {method}")
            return None

        response.raise_for_status()
        try:
            return response.json()
        except ValueError:
            return None
    except requests.exceptions.HTTPError as http_err:
        print(f"[e] Erro HTTP ao acessar {url}: {http_err}")
        if hasattr(http_err.response, 'text'):
            print(f"[e] Response: {http_err.response.text}")
    except requests.exceptions.ConnectionError as conn_err:
        print(f"[e] Erro de conexão ao acessar {url}: {conn_err}")
    except requests.exceptions.Timeout as timeout_err:
        print(f"[e] Timeout ao acessar {url}: {timeout_err}")
    except requests.exceptions.RequestException as req_err:
        print(f"[e] Erro na requisição a {url}: {req_err}")
    except ValueError as json_err:
        print(f"[e] Erro ao decodificar JSON de {url}: {json_err}")
    return None

def update_driver_data(driver: Dict[str, Any]) -> bool:
    """Update driver data (name, seasons, championships, overview) in NocoDB"""
    try:
        driver_id = driver.get("id")
        noco_url = f"{NOCO_BASE_URL}/{NOCO_TABLE_ID}/records"
        headers = {"xc-token": NOCO_TOKEN}
        
        # NocoDB PATCH payload with all fields
        payload = {
            "Id": driver_id,
            "driver": driver.get("driver"),
            "seasonsCompleted": driver.get("seasonsCompleted"),
            "championships": driver.get("championships"),
            "overview": driver.get("overview")
        }
        
        result = safe_request("PATCH", noco_url, headers, json_data=payload)
        return result is not None
    except Exception as e:
        print(f"[e] Erro ao atualizar driver {driver_id}: {e}")
        return False

def process_driver(driver: Dict[str, Any], progress_lock: Lock) -> Tuple[bool, int, str]:
    """Process a single driver and return success status, driver_id, and message"""
    driver_id = driver.get("id")
    driver_name = driver.get("driver", "")
    
    if not driver_id:
        error_msg = f"[e] Driver sem ID: {driver}"
        print(error_msg)
        return False, None, error_msg
    
    if not driver_name:
        error_msg = f"[e] Driver sem nome: ID {driver_id}"
        print(error_msg)
        return False, driver_id, error_msg
    
    try:
        success = update_driver_data(driver)
        
        if success:
            with progress_lock:
                # Update progress
                progress = {}
                if os.path.exists('progress_drivers.json'):
                    with open('progress_drivers.json', 'r') as f:
                        try:
                            progress = json.load(f)
                        except json.JSONDecodeError:
                            progress = {}
                
                progress[str(driver_id)] = {
                    'status': 'completed',
                    'timestamp': datetime.now().isoformat(),
                    'driver_name': driver_name,
                    'seasons': driver.get("seasonsCompleted"),
                    'championships': driver.get("championships"),
                    'overview': driver.get("overview")
                }
                
                with open('progress_drivers.json', 'w') as f:
                    json.dump(progress, f, indent=2)
            
            return True, driver_id, f"[✓] Driver atualizado: {driver_id} - {driver_name}"
        else:
            with progress_lock:
                errors = {}
                if os.path.exists('errors_drivers.json'):
                    with open('errors_drivers.json', 'r') as f:
                        try:
                            errors = json.load(f)
                            if not isinstance(errors, dict):
                                errors = {}
                        except json.JSONDecodeError:
                            errors = {}
                
                errors[str(driver_id)] = {
                    'status': 'failed',
                    'timestamp': datetime.now().isoformat(),
                    'driver_name': driver_name,
                    'seasons': driver.get("seasonsCompleted"),
                    'championships': driver.get("championships"),
                    'overview': driver.get("overview")
                }
                
                with open('errors_drivers.json', 'w') as f:
                    json.dump(errors, f, indent=2)
            
            return False, driver_id, f"[e] Falha ao atualizar driver: {driver_id} - {driver_name}"
            
    except Exception as e:
        error_msg = f"[e] Erro ao processar driver {driver_id}: {str(e)}"
        print(error_msg)
        
        # Save error to errors file
        with progress_lock:
            errors = {}
            if os.path.exists('errors_drivers.json'):
                with open('errors_drivers.json', 'r') as f:
                    try:
                        errors = json.load(f)
                        if not isinstance(errors, dict):
                            errors = {}
                    except json.JSONDecodeError:
                        errors = {}
            
            errors[str(driver_id)] = {
                'status': 'failed',
                'timestamp': datetime.now().isoformat(),
                'driver_name': driver_name,
                'seasons': driver.get("seasonsCompleted"),
                'championships': driver.get("championships"),
                'overview': driver.get("overview")
            }
            
            with open('errors_drivers.json', 'w') as f:
                json.dump(errors, f, indent=2)
        
        return False, driver_id, error_msg

def main():
    # Load drivers from JSON file
    print("[i] Carregando drivers_unified.json...")
    with open("drivers_unified.json", "r", encoding="utf-8") as f:
        data = json.load(f)
        drivers = data.get("drivers", [])
    
    print(f"[i] Total de drivers no arquivo: {len(drivers)}")
    
    # Remove duplicates by ID
    drivers_dict = {driver.get("id"): driver for driver in drivers if driver.get("id")}
    drivers = list(drivers_dict.values())
    print(f"[i] Drivers únicos (após dedup): {len(drivers)}")
    
    # Filter out already processed drivers
    processed_ids = set()
    if os.path.exists('progress_drivers.json'):
        try:
            with open('progress_drivers.json', 'r') as f:
                progress = json.load(f)
                processed_ids = set(int(k) for k in progress.keys())
        except (json.JSONDecodeError, FileNotFoundError, ValueError):
            pass
    
    # Filter pending drivers
    pending_drivers = [d for d in drivers if d.get("id") not in processed_ids]
    
    print(f"[i] Já processados: {len(processed_ids)}")
    print(f"[i] Pendentes: {len(pending_drivers)}")
    
    if not pending_drivers:
        print("[i] Nenhum driver pendente para processamento.")
        return
    
    # Initialize progress file if it doesn't exist
    if not os.path.exists('progress_drivers.json'):
        with open('progress_drivers.json', 'w') as f:
            json.dump({}, f)
    
    # Initialize errors file if it doesn't exist
    if not os.path.exists('errors_drivers.json'):
        with open('errors_drivers.json', 'w') as f:
            json.dump({}, f)
    
    progress_lock = Lock()
    successful = 0
    failed = 0
    total = len(pending_drivers)
    
    # Process drivers with thread pool (3 workers)
    print("\n[i] Iniciando atualização dos drivers com 3 workers...")
    print(f"{'='*80}\n")
    
    completed_count = 0
    
    with ThreadPoolExecutor(max_workers=30) as executor:
        # Submit all tasks
        future_to_driver = {executor.submit(process_driver, driver, progress_lock): driver for driver in pending_drivers}
        
        # Process completed tasks as they finish
        for future in as_completed(future_to_driver):
            driver = future_to_driver[future]
            driver_id = driver.get("id")
            driver_name = driver.get("driver", "Unknown")
            
            completed_count += 1
            percentage = (completed_count / total) * 100
            
            try:
                success, did, message = future.result()
                if success:
                    successful += 1
                    status = "✓"
                    status_text = "SUCCESS"
                else:
                    failed += 1
                    status = "✗"
                    status_text = "FAILED"
                
                # Print detailed log for each driver
                print(f"[{status}] {percentage:5.1f}% | ID: {driver_id:6d} | {status_text:7s} | {driver_name}")
                
            except Exception as exc:
                failed += 1

                print(f'[✗] {percentage:5.1f}% | ID: {driver_id:6d} | ERROR   | {driver_name}')
                print(f'    └─ Exception: {exc}')
    
    print(f"\n{'='*80}")
    print(f"[i] Processamento concluído!")
    print(f"[i] Sucesso: {successful}")
    print(f"[i] Falhas: {failed}")
    print(f"{'='*80}")
    
    if failed > 0:
        print(f"[i] Verifique o arquivo 'errors_drivers.json' para detalhes dos erros.")

if __name__ == "__main__":
    main()
