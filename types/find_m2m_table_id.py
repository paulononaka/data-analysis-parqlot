#!/usr/bin/env python3
"""
Script para encontrar o ID da tabela _nc_m2m_miniatures_miniature_type
"""

import requests
import json


def main():
    base_url = "https://nocodb-production-ac4d.up.railway.app/api/v2"
    headers = {"xc-token": "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"}
    
    print("="*70)
    print("BUSCANDO ID DA TABELA M2M")
    print("="*70)
    
    # 1. Listar bases
    print("\n1. Buscando bases...")
    bases_url = f"{base_url}/meta/bases"
    
    try:
        response = requests.get(bases_url, headers=headers, timeout=10)
        response.raise_for_status()
        bases_data = response.json()
        
        bases = bases_data.get('list', [])
        print(f"   Encontradas {len(bases)} base(s)")
        
        for base in bases:
            base_id = base.get('id')
            base_title = base.get('title')
            print(f"\n   Base: {base_title} (ID: {base_id})")
            
            # 2. Listar tabelas
            print(f"\n2. Buscando tabelas em '{base_title}'...")
            tables_url = f"{base_url}/meta/bases/{base_id}/tables"
            
            tables_response = requests.get(tables_url, headers=headers, timeout=10)
            tables_response.raise_for_status()
            tables_data = tables_response.json()
            
            tables = tables_data.get('list', [])
            print(f"   Encontradas {len(tables)} tabela(s)")
            
            # Procura pela tabela m2m
            for table in tables:
                table_id = table.get('id')
                table_title = table.get('title')
                
                if '_nc_m2m_miniatures_miniature_type' in table_title.lower() or \
                   'miniatures_miniature_type' in table_title.lower():
                    print(f"\n   ✅ ENCONTRADA!")
                    print(f"      Título: {table_title}")
                    print(f"      ID: {table_id}")
                    print(f"\n   URL para usar no script:")
                    print(f"      {base_url}/tables/{table_id}/records")
                    
                    # Busca colunas da tabela
                    print(f"\n   Colunas da tabela:")
                    columns_url = f"{base_url}/meta/tables/{table_id}/columns"
                    columns_response = requests.get(columns_url, headers=headers, timeout=10)
                    
                    if columns_response.status_code == 200:
                        columns_data = columns_response.json()
                        columns = columns_data.get('list', [])
                        
                        for col in columns:
                            col_title = col.get('title')
                            col_type = col.get('uidt', col.get('dt', 'unknown'))
                            print(f"      - {col_title} ({col_type})")
                    
                    return table_id
            
            # Lista todas as tabelas para referência
            print(f"\n   Todas as tabelas encontradas:")
            for table in tables:
                table_id = table.get('id')
                table_title = table.get('title')
                print(f"      - {table_title} (ID: {table_id})")
    
    except Exception as e:
        print(f"\n[e] Erro: {e}")
        return None
    
    print("\n[w] Tabela m2m não encontrada!")
    return None


if __name__ == '__main__':
    main()
