#!/usr/bin/env python3
"""
Teste usando a API de Links do NocoDB
Documentação: https://docs.nocodb.com/developer-resources/rest-apis/#link-unlink-records
"""

import requests
import json

NOCO_BASE_URL = "https://nocodb-production-ac4d.up.railway.app/api/v2/tables"
NOCO_TOKEN = "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"

miniature_id = 217352
team_id = 6929
miniatures_table_id = "mv2tjpu2nye7jfv"
teams_table_id = "m79j3ka924fu8bs"

print("=" * 80)
print("TESTE: API de Links do NocoDB")
print("=" * 80)
print()

# Precisamos descobrir o column_id do relacionamento
# Vamos tentar usar o nome da coluna diretamente

# Formato da API de Links:
# POST /api/v2/tables/{tableId}/links/{columnId}/records/{recordId}
# Body: [child_record_id1, child_record_id2, ...]

# Vamos tentar diferentes abordagens

print("Abordagem 1: Usando nome da coluna 'teams'")
print("-" * 80)

# Endpoint: /api/v2/tables/{miniatures_table_id}/links/teams/records/{miniature_id}
url = f"{NOCO_BASE_URL}/{miniatures_table_id}/links/teams/records/{miniature_id}"
headers = {
    "xc-token": NOCO_TOKEN,
    "Content-Type": "application/json"
}
payload = [team_id]

print(f"URL: {url}")
print(f"Payload: {json.dumps(payload, indent=2)}")
print()

try:
    response = requests.post(url, headers=headers, json=payload, timeout=30)
    print(f"Status: {response.status_code}")
    print(f"Response: {response.text}")
    print()
except Exception as e:
    print(f"Erro: {e}")
    print()

print()
print("=" * 80)
print("Abordagem 2: Usando nome da coluna 'Teams' (maiúsculo)")
print("-" * 80)

url2 = f"{NOCO_BASE_URL}/{miniatures_table_id}/links/Teams/records/{miniature_id}"
print(f"URL: {url2}")
print(f"Payload: {json.dumps(payload, indent=2)}")
print()

try:
    response = requests.post(url2, headers=headers, json=payload, timeout=30)
    print(f"Status: {response.status_code}")
    print(f"Response: {response.text}")
    print()
except Exception as e:
    print(f"Erro: {e}")
    print()

print()
print("=" * 80)
print("Abordagem 3: Usando nome do campo M2M '_nc_m2m_miniatures_teams'")
print("-" * 80)

url3 = f"{NOCO_BASE_URL}/{miniatures_table_id}/links/_nc_m2m_miniatures_teams/records/{miniature_id}"
print(f"URL: {url3}")
print(f"Payload: {json.dumps(payload, indent=2)}")
print()

try:
    response = requests.post(url3, headers=headers, json=payload, timeout=30)
    print(f"Status: {response.status_code}")
    print(f"Response: {response.text}")
    print()
except Exception as e:
    print(f"Erro: {e}")
    print()
