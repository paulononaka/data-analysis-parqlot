#!/usr/bin/env python3
"""
Verifica o progresso do grupo Cadillac e mostra o que falta processar
"""

import json

PROGRESS_FILE = 'consolidation_grouped_progress.json'
GROUPED_FILE = 'teams_grouped.json'

def check_cadillac():
    """Verifica o progresso do grupo Cadillac"""
    
    # Carregar progresso
    with open(PROGRESS_FILE, 'r') as f:
        progress = json.load(f)
    
    # Carregar dados originais
    with open(GROUPED_FILE, 'r') as f:
        grouped = json.load(f)
    
    cadillac_progress = progress.get('Cadillac', {})
    cadillac_teams = grouped.get('Cadillac', [])
    
    print("=" * 80)
    print("PROGRESSO DO GRUPO CADILLAC")
    print("=" * 80)
    print()
    
    # Status
    status = cadillac_progress.get('status', 'não iniciado')
    print(f"Status: {status}")
    print(f"Base ID: {cadillac_progress.get('base_id')}")
    print(f"Base Name: {cadillac_progress.get('base_name')}")
    print()
    
    # Estatísticas
    stats = cadillac_progress.get('current_stats', {})
    print("📊 Estatísticas:")
    print(f"  - Miniatures movidas: {stats.get('miniatures_moved', 0)}")
    print(f"  - Drivers movidos: {stats.get('drivers_moved', 0)}")
    print(f"  - Competitions movidas: {stats.get('competitions_moved', 0)}")
    print(f"  - Teams deletados: {stats.get('teams_deleted', 0)}")
    print()
    
    # REMs processados
    processed_ids = set(stats.get('rem_ids', []))
    print(f"✅ REMs já processados: {len(processed_ids)}")
    for rem_id in processed_ids:
        # Encontrar o nome
        team_data = next((t for t in cadillac_teams if t['id'] == rem_id), None)
        team_name = team_data['team'] if team_data else 'Desconhecido'
        print(f"  - ID {rem_id}: {team_name}")
    print()
    
    # REMs pendentes
    all_ids = {t['id'] for t in cadillac_teams}
    base_id = cadillac_progress.get('base_id')
    pending_ids = all_ids - processed_ids - {base_id}
    
    print(f"⏳ REMs pendentes: {len(pending_ids)}")
    for rem_id in sorted(pending_ids):
        team_data = next((t for t in cadillac_teams if t['id'] == rem_id), None)
        team_name = team_data['team'] if team_data else 'Desconhecido'
        print(f"  - ID {rem_id}: {team_name}")
    print()
    
    # Erros
    errors = stats.get('errors', [])
    if errors:
        print(f"❌ Erros encontrados: {len(errors)}")
        for error in errors:
            print(f"  - {error}")
        print()
    
    # Total de teams no grupo
    print(f"📋 Total de teams no grupo: {len(cadillac_teams)}")
    print(f"   - Base: 1 (ID {base_id})")
    print(f"   - Processados: {len(processed_ids)}")
    print(f"   - Pendentes: {len(pending_ids)}")
    print()

if __name__ == '__main__':
    check_cadillac()
