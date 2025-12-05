#!/usr/bin/env python3
"""
Converte o log de falhas para o formato normalizado.
Isso permite reprocessar as falhas usando o script principal.
"""

import json
from pathlib import Path
from datetime import datetime

# Caminhos dos arquivos
SCRIPT_DIR = Path(__file__).parent
FAILURE_LOG = SCRIPT_DIR / "update_failure_log.json"
OUTPUT_FILE = SCRIPT_DIR / f"_normalized_failures_{datetime.now().strftime('%Y%m%d%H%M')}.json"

def convert_failures_to_normalized():
    """Converte o log de falhas para o formato normalizado."""
    
    print(f"[i] Carregando log de falhas...")
    with open(FAILURE_LOG, 'r', encoding='utf-8') as f:
        failures = json.load(f)
    
    print(f"[i] Total de falhas: {len(failures)}")
    
    # Extrai apenas os registros (record) de cada falha
    normalized_records = []
    
    for failure in failures:
        record = failure.get('record')
        if record and record.get('noco_id'):
            normalized_records.append(record)
    
    print(f"[i] Registros extraídos: {len(normalized_records)}")
    
    # Cria estrutura no formato normalizado
    output_data = {
        "normalized": normalized_records
    }
    
    # Salva arquivo
    print(f"[i] Salvando em {OUTPUT_FILE.name}...")
    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        json.dump(output_data, f, indent=2, ensure_ascii=False)
    
    print(f"\n[✓] Conversão concluída!")
    print(f"[i] Arquivo gerado: {OUTPUT_FILE}")
    print(f"[i] Total de registros: {len(normalized_records)}")
    print(f"\n[i] Para processar as falhas, edite o patch_on_noco.py e altere:")
    print(f"    JSON_PATH = os.path.join(SCRIPT_DIR, '{OUTPUT_FILE.name}')")

if __name__ == "__main__":
    convert_failures_to_normalized()
