#!/usr/bin/env python3
"""
Parse swagger.txt para encontrar os linkFieldIds para teams
"""

import json

# Carrega o swagger
with open('swagger.txt', 'r') as f:
    swagger = json.load(f)

print("=" * 80)
print("BUSCANDO linkFieldIds PARA 'teams' NAS TABELAS")
print("=" * 80)
print()

# Tabelas que nos interessam
tables_of_interest = {
    'mv2tjpu2nye7jfv': 'miniatures',
    'my38ymolrk7iz0d': 'drivers',
    'm40hlwz0dsyudob': 'competitions'
}

results = {}

# Procura nos paths
paths = swagger.get('paths', {})
for path, methods in paths.items():
    # Procura por endpoints de links
    if '/links/{linkFieldId}/records/{recordId}' in path:
        # Extrai o table_id do path
        # Formato: /api/v2/tables/{tableId}/links/{linkFieldId}/records/{recordId}
        parts = path.split('/')
        if len(parts) >= 5:
            table_id = parts[4]
            
            if table_id in tables_of_interest:
                table_name = tables_of_interest[table_id]
                
                # Pega os parâmetros do GET
                get_method = methods.get('get', {})
                parameters = get_method.get('parameters', [])
                
                # Procura pelo parâmetro linkFieldId
                for param in parameters:
                    if param.get('name') == 'linkFieldId':
                        # Pega a descrição que contém os link columns
                        description = param.get('description', '')
                        schema = param.get('schema', {})
                        enum_values = schema.get('enum', [])
                        
                        print(f"Tabela: {table_name.upper()} ({table_id})")
                        print("-" * 80)
                        print(f"Link Columns disponíveis:")
                        
                        # Parse a descrição para encontrar o mapeamento
                        lines = description.split('\n')
                        teams_column_id = None
                        
                        for line in lines:
                            if line.strip().startswith('*'):
                                # Formato: * column_id - column_name
                                parts = line.strip()[1:].strip().split(' - ')
                                if len(parts) == 2:
                                    col_id = parts[0].strip()
                                    col_name = parts[1].strip()
                                    print(f"  • {col_id} - {col_name}")
                                    
                                    if col_name.lower() == 'teams':
                                        teams_column_id = col_id
                        
                        if teams_column_id:
                            print()
                            print(f"✓ Column ID para 'teams': {teams_column_id}")
                            results[table_name] = teams_column_id
                        else:
                            print()
                            print("✗ Column 'teams' não encontrado")
                            results[table_name] = None
                        
                        print()

print("=" * 80)
print("RESUMO - COPIE E COLE NO SCRIPT:")
print("=" * 80)
print()
print("TEAMS_COLUMN_IDS = {")
for table_name in ['miniatures', 'drivers', 'competitions']:
    col_id = results.get(table_name)
    if col_id:
        print(f"    '{table_name}': '{col_id}',")
    else:
        print(f"    '{table_name}': None,  # NÃO ENCONTRADO")
print("}")
print()
