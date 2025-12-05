#!/usr/bin/env python3
"""
Busca o Swagger JSON da API do NocoDB
"""

import requests
import json

NOCO_BASE_URL = "https://nocodb-production-ac4d.up.railway.app"
NOCO_TOKEN = "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"
BASE_ID = "pb7lpfmycz97c19"

url = f"{NOCO_BASE_URL}/api/v2/meta/bases/{BASE_ID}/swagger.json"
headers = {"xc-token": NOCO_TOKEN}

print("Buscando Swagger JSON...")
print(f"URL: {url}")
print()

try:
    response = requests.get(url, headers=headers, timeout=30)
    print(f"Status: {response.status_code}")
    
    if response.status_code == 200:
        swagger_data = response.json()
        
        # Salva o JSON completo
        with open('swagger.json', 'w') as f:
            json.dump(swagger_data, f, indent=2)
        print("✓ Swagger salvo em: swagger.json")
        print()
        
        # Procura por endpoints de links
        print("=" * 80)
        print("ENDPOINTS DE LINKS:")
        print("=" * 80)
        
        paths = swagger_data.get('paths', {})
        for path, methods in paths.items():
            if 'link' in path.lower():
                print(f"\n{path}")
                for method, details in methods.items():
                    summary = details.get('summary', 'N/A')
                    print(f"  {method.upper()}: {summary}")
        
        print()
        print("=" * 80)
        print("PROCURANDO ENDPOINTS PARA MINIATURES:")
        print("=" * 80)
        
        miniatures_table_id = "mv2tjpu2nye7jfv"
        for path, methods in paths.items():
            if miniatures_table_id in path:
                print(f"\n{path}")
                for method, details in methods.items():
                    summary = details.get('summary', 'N/A')
                    print(f"  {method.upper()}: {summary}")
    else:
        print(f"Erro: {response.text}")
        
except Exception as e:
    print(f"Erro: {e}")
