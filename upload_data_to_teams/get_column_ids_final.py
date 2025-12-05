#!/usr/bin/env python3
"""
Busca os column IDs de 'teams' para todas as tabelas
"""

import requests
import json

NOCO_BASE_URL = "https://nocodb-production-ac4d.up.railway.app"
NOCO_TOKEN = "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"

tables = {
    'miniatures': 'mv2tjpu2nye7jfv',
    'drivers': 'my38ymolrk7iz0d',
    'competitions': 'm40hlwz0dsyudob'
}

print("=" * 80)
print("BUSCANDO COLUMN IDs PARA 'teams' EM TODAS AS TABELAS")
print("=" * 80)
print()

results = {}

for table_name, table_id in tables.items():
    print(f"Tabela: {table_name.upper()}")
    print("-" * 80)
    
    url = f"{NOCO_BASE_URL}/api/v2/meta/tables/{table_id}"
    headers = {"xc-token": NOCO_TOKEN}
    
    try:
        response = requests.get(url, headers=headers, timeout=30)
        if response.status_code == 200:
            data = response.json()
            columns = data.get('columns', [])
            
            found = False
            for col in columns:
                col_title = col.get('title', '')
                col_type = col.get('uidt')
                
                # Procura pela coluna 'teams' do tipo 'Links'
                if col_title == 'teams' and col_type == 'Links':
                    col_id = col.get('id')
                    print(f"✓ Column ID encontrado: {col_id}")
                    results[table_name] = col_id
                    found = True
                    break
            
            if not found:
                print("✗ Column 'teams' não encontrado")
                results[table_name] = None
        else:
            print(f"✗ Erro: {response.status_code}")
            results[table_name] = None
    except Exception as e:
        print(f"✗ Erro: {e}")
        results[table_name] = None
    
    print()

print("=" * 80)
print("RESUMO - COPIE E COLE NO SCRIPT:")
print("=" * 80)
print()
print("TEAMS_COLUMN_IDS = {")
for table_name, col_id in results.items():
    if col_id:
        print(f"    '{table_name}': '{col_id}',")
    else:
        print(f"    '{table_name}': None,  # NÃO ENCONTRADO")
print("}")
print()
