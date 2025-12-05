#!/usr/bin/env python3
"""
Teste para descobrir como adicionar links no NocoDB
"""

import requests
import json

NOCO_BASE_URL = "https://nocodb-production-ac4d.up.railway.app/api/v2/tables"
NOCO_TOKEN = "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"

# Vamos tentar adicionar o team 6929 à miniatura 217352
# (a miniatura que foi perdida no primeiro teste)

miniature_id = 217352
team_id = 6929
table_id = "mv2tjpu2nye7jfv"  # miniatures

print("Testando diferentes formas de adicionar link...")
print(f"Miniatura: {miniature_id}")
print(f"Team: {team_id}")
print()

# Teste 1: Campo "teams" (minúsculo)
print("=" * 80)
print("TESTE 1: Campo 'teams' (minúsculo)")
print("=" * 80)
url = f"{NOCO_BASE_URL}/{table_id}/records"
headers = {"xc-token": NOCO_TOKEN}
payload = {
    "Id": miniature_id,
    "teams": [team_id]
}

print(f"URL: {url}")
print(f"Payload: {json.dumps(payload, indent=2)}")
print()

try:
    response = requests.patch(url, headers=headers, json=payload, timeout=30)
    print(f"Status: {response.status_code}")
    print(f"Response: {response.text}")
except Exception as e:
    print(f"Erro: {e}")

print()
print("=" * 80)
print()

# Teste 2: Campo "Teams" (maiúsculo)
print("=" * 80)
print("TESTE 2: Campo 'Teams' (maiúsculo)")
print("=" * 80)
payload2 = {
    "Id": miniature_id,
    "Teams": [team_id]
}

print(f"Payload: {json.dumps(payload2, indent=2)}")
print()

try:
    response = requests.patch(url, headers=headers, json=payload2, timeout=30)
    print(f"Status: {response.status_code}")
    print(f"Response: {response.text}")
except Exception as e:
    print(f"Erro: {e}")

print()
print("=" * 80)
