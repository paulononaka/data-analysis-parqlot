#!/usr/bin/env python3
import json

with open('swagger.txt', 'r') as f:
    swagger = json.load(f)

# IDs das tabelas
tables = {
    'mv2tjpu2nye7jfv': 'miniatures',
    'my38ymolrk7iz0d': 'drivers',
    'm40hlwz0dsyudob': 'competitions'
}

print("Procurando column IDs para 'teams'...\n")

for table_id, table_name in tables.items():
    path_key = f"/api/v2/tables/{table_id}/links/{{linkFieldId}}/records/{{recordId}}"
    
    if path_key in swagger['paths']:
        params = swagger['paths'][path_key]['parameters']
        
        for param in params:
            if param.get('name') == 'linkFieldId':
                desc = param.get('description', '')
                
                # Parse description
                for line in desc.split('\n'):
                    if '- teams' in line.lower():
                        col_id = line.split('*')[1].split(' - ')[0].strip()
                        print(f"{table_name}: '{col_id}',")
                        break
