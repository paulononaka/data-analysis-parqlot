#!/usr/bin/env python3
"""
Script para explorar as tabelas do NocoDB e encontrar a tabela de associação
entre miniaturas e tipos.
"""

import requests
import json
from typing import Dict, Any, Optional


def safe_request(method: str, url: str, headers: Dict[str, str], timeout: int = 30) -> Optional[Dict[str, Any]]:
    """Executa requisição HTTP com tratamento de erros"""
    try:
        if method.lower() == "get":
            response = requests.get(url, headers=headers, timeout=timeout)
        else:
            return None
        
        response.raise_for_status()
        return response.json()
    except Exception as e:
        print(f"[e] Erro na requisição: {e}")
        return None


def explore_nocodb():
    """Explora as tabelas do NocoDB"""
    
    # Credenciais
    base_url = "https://nocodb-production-ac4d.up.railway.app/api/v2"
    headers = {"xc-token": "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"}
    
    print("="*70)
    print("EXPLORANDO ESTRUTURA DO NOCODB")
    print("="*70)
    
    # 1. Listar bases/projetos
    print("\n1️⃣ Buscando bases/projetos...")
    bases_url = f"{base_url}/meta/bases"
    bases_response = safe_request("GET", bases_url, headers)
    
    if bases_response:
        bases = bases_response.get('list', [])
        print(f"   Encontradas {len(bases)} base(s)")
        
        for base in bases:
            base_id = base.get('id')
            base_title = base.get('title')
            print(f"\n   📦 Base: {base_title} (ID: {base_id})")
            
            # 2. Listar tabelas da base
            print(f"\n2️⃣ Buscando tabelas da base {base_title}...")
            tables_url = f"{base_url}/meta/bases/{base_id}/tables"
            tables_response = safe_request("GET", tables_url, headers)
            
            if tables_response:
                tables = tables_response.get('list', [])
                print(f"   Encontradas {len(tables)} tabela(s)\n")
                
                for table in tables:
                    table_id = table.get('id')
                    table_title = table.get('title')
                    table_type = table.get('type', 'table')
                    
                    print(f"   📋 {table_title}")
                    print(f"      ID: {table_id}")
                    print(f"      Tipo: {table_type}")
                    
                    # Verifica se é uma tabela de junção/associação
                    if 'junction' in table_title.lower() or 'link' in table_title.lower() or '_' in table_title:
                        print(f"      ⚠️  Possível tabela de associação!")
                    
                    # 3. Buscar colunas da tabela
                    columns_url = f"{base_url}/meta/tables/{table_id}/columns"
                    columns_response = safe_request("GET", columns_url, headers)
                    
                    if columns_response:
                        columns = columns_response.get('list', [])
                        print(f"      Colunas ({len(columns)}):")
                        
                        for col in columns:
                            col_title = col.get('title')
                            col_type = col.get('uidt', col.get('dt', 'unknown'))
                            
                            # Destaca colunas de relacionamento
                            if col_type in ['LinkToAnotherRecord', 'Links']:
                                print(f"         🔗 {col_title} ({col_type}) - RELACIONAMENTO")
                            else:
                                print(f"         • {col_title} ({col_type})")
                    
                    print()
    
    # 4. Tentar buscar informações específicas da tabela de miniaturas
    print("\n4️⃣ Buscando detalhes da tabela de miniaturas...")
    miniatures_table_id = "mv2tjpu2nye7jfv"  # ID da tabela de miniaturas
    
    columns_url = f"{base_url}/meta/tables/{miniatures_table_id}/columns"
    columns_response = safe_request("GET", columns_url, headers)
    
    if columns_response:
        columns = columns_response.get('list', [])
        print(f"\n   Tabela de Miniaturas - Colunas ({len(columns)}):\n")
        
        for col in columns:
            col_title = col.get('title')
            col_type = col.get('uidt', col.get('dt', 'unknown'))
            col_id = col.get('id')
            
            # Procura por colunas relacionadas a 'type'
            if 'type' in col_title.lower():
                print(f"   🎯 {col_title}")
                print(f"      ID: {col_id}")
                print(f"      Tipo: {col_type}")
                
                # Se for um relacionamento, mostra detalhes
                if col_type in ['LinkToAnotherRecord', 'Links']:
                    colOptions = col.get('colOptions', {})
                    print(f"      Opções de Coluna:")
                    print(f"         {json.dumps(colOptions, indent=10)}")
                
                print()
    
    print("\n" + "="*70)
    print("EXPLORAÇÃO CONCLUÍDA")
    print("="*70)


if __name__ == '__main__':
    explore_nocodb()
