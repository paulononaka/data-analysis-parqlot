#!/usr/bin/env python3
"""
Busca os metadados da tabela para descobrir o nome correto da coluna de link
"""

import requests
import json

NOCO_BASE_URL = "https://nocodb-production-ac4d.up.railway.app"
NOCO_TOKEN = "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"

miniatures_table_id = "mv2tjpu2nye7jfv"

print("=" * 80)
print("BUSCANDO METADADOS DA TABELA MINIATURES")
print("=" * 80)
print()

# API de metadados: /api/v2/meta/tables/{tableId}
url = f"{NOCO_BASE_URL}/api/v2/meta/tables/{miniatures_table_id}"
headers = {"xc-token": NOCO_TOKEN}

try:
    response = requests.get(url, headers=headers, timeout=30)
    print(f"Status: {response.status_code}")
    print()
    
    if response.status_code == 200:
        data = response.json()
        
        print("Colunas da tabela:")
        print("-" * 80)
        
        columns = data.get('columns', [])
        for col in columns:
            col_id = col.get('id')
            col_title = col.get('title')
            col_type = col.get('uidt')  # UI Data Type
            
            print(f"ID: {col_id}")
            print(f"  Title: {col_title}")
            print(f"  Type: {col_type}")
            
            # Se for uma coluna de link, mostra mais detalhes
            if col_type in ['LinkToAnotherRecord', 'Links']:
                print(f"  ✓ COLUNA DE LINK!")
                col_options = col.get('colOptions', {})
                print(f"  Foreign Table: {col_options.get('fk_related_model_id')}")
                print(f"  Type: {col_options.get('type')}")
            
            print()
        
        # Procura especificamente por colunas de link para 'teams'
        print("=" * 80)
        print("COLUNAS DE LINK PARA TEAMS:")
        print("=" * 80)
        
        for col in columns:
            col_type = col.get('uidt')
            if col_type in ['LinkToAnotherRecord', 'Links']:
                col_title = col.get('title', '').lower()
                if 'team' in col_title:
                    print(f"✓ Encontrado!")
                    print(f"  ID: {col.get('id')}")
                    print(f"  Title: {col.get('title')}")
                    print(f"  Column Name: {col.get('column_name')}")
                    print(f"  Type: {col.get('uidt')}")
                    print()
    else:
        print(f"Erro: {response.text}")
        
except Exception as e:
    print(f"Erro: {e}")
