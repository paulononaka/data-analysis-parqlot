#!/usr/bin/env python3
"""
Teste usando o column_id correto
"""

import requests
import json

NOCO_BASE_URL = "https://nocodb-production-ac4d.up.railway.app/api/v2/tables"
NOCO_TOKEN = "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"

miniature_id = 217352
team_id = 6929
miniatures_table_id = "mv2tjpu2nye7jfv"
teams_column_id = "cwuqf969142dqq1"  # ID da coluna 'teams'

print("=" * 80)
print("TESTE: API de Links usando column_id")
print("=" * 80)
print()

# Formato: POST /api/v2/tables/{tableId}/links/{columnId}/records/{recordId}
url = f"{NOCO_BASE_URL}/{miniatures_table_id}/links/{teams_column_id}/records/{miniature_id}"
headers = {
    "xc-token": NOCO_TOKEN,
    "Content-Type": "application/json"
}
payload = [team_id]

print(f"Miniatura ID: {miniature_id}")
print(f"Team ID: {team_id}")
print(f"Column ID: {teams_column_id}")
print()
print(f"URL: {url}")
print(f"Payload: {json.dumps(payload, indent=2)}")
print()

try:
    response = requests.post(url, headers=headers, json=payload, timeout=30)
    print(f"Status: {response.status_code}")
    print(f"Response: {response.text}")
    print()
    
    if response.status_code == 200:
        print("✅ Link criado com sucesso!")
        print()
        print("Verificando...")
        
        # Verifica se foi criado
        get_url = f"{NOCO_BASE_URL}/{miniatures_table_id}/records/{miniature_id}"
        verify_response = requests.get(get_url, headers={"xc-token": NOCO_TOKEN}, timeout=30)
        verify_data = verify_response.json()
        
        teams = verify_data.get('_nc_m2m_miniatures_teams', [])
        print(f"Teams linkados: {len(teams)}")
        for team in teams:
            team_id_found = team.get('teams_id')
            team_name = team.get('teams', {}).get('team', 'N/A')
            print(f"  - Team ID: {team_id_found}, Nome: '{team_name}'")
        
        if any(t.get('teams_id') == 6929 for t in teams):
            print()
            print("✅✅✅ SUCESSO! Team 6929 está linkado à miniatura 217352")
    else:
        print("❌ Falha ao criar link")
        
except Exception as e:
    print(f"Erro: {e}")
