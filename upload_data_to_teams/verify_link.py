#!/usr/bin/env python3
"""
Verifica se o link foi criado com sucesso
"""

import requests
import json

NOCO_BASE_URL = "https://nocodb-production-ac4d.up.railway.app/api/v2/tables"
NOCO_TOKEN = "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"

miniature_id = 217352
table_id = "mv2tjpu2nye7jfv"  # miniatures

print("Verificando se o link foi criado...")
print()

url = f"{NOCO_BASE_URL}/{table_id}/records/{miniature_id}"
headers = {"xc-token": NOCO_TOKEN}

try:
    response = requests.get(url, headers=headers, timeout=30)
    data = response.json()
    
    print(f"Miniatura ID: {miniature_id}")
    print(f"Model: {data.get('model', 'N/A')}")
    print()
    
    teams = data.get('_nc_m2m_miniatures_teams', [])
    print(f"Teams linkados: {len(teams)}")
    for team in teams:
        team_id = team.get('teams_id')
        team_name = team.get('teams', {}).get('team', 'N/A')
        print(f"  - Team ID: {team_id}, Nome: '{team_name}'")
    
    print()
    if any(t.get('teams_id') == 6929 for t in teams):
        print("✅ Link criado com sucesso! Team 6929 está linkado à miniatura 217352")
    else:
        print("❌ Link NÃO foi criado. Team 6929 não está na lista.")
        
except Exception as e:
    print(f"Erro: {e}")
