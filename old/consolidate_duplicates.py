#!/usr/bin/env python3
"""
Script para consolidar teams duplicados.
- O primeiro team de cada grupo é sempre a BASE
- Os demais são REMs que terão seus dados transferidos para a BASE
- Evita duplicatas ao consolidar
"""

import json
from datetime import datetime
from typing import Dict, List, Any


def load_json(filepath: str) -> Dict:
    """Carrega o arquivo JSON."""
    with open(filepath, 'r', encoding='utf-8') as f:
        return json.load(f)


def save_json(data: Dict, filepath: str):
    """Salva o arquivo JSON."""
    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)


def consolidate_drivers(base_drivers: List[Dict], rem_drivers: List[Dict]) -> List[Dict]:
    """
    Consolida drivers evitando duplicatas.
    Considera duplicata se o ID do driver for igual.
    """
    base_driver_ids = {driver['id'] for driver in base_drivers}
    
    for driver in rem_drivers:
        if driver['id'] not in base_driver_ids:
            base_drivers.append(driver)
            base_driver_ids.add(driver['id'])
    
    return base_drivers


def consolidate_miniatures(base_miniatures: List[Dict], rem_miniatures: List[Dict]) -> List[Dict]:
    """
    Consolida miniatures evitando duplicatas.
    Considera duplicata se o ID da miniature for igual.
    """
    base_miniature_ids = {miniature['id'] for miniature in base_miniatures}
    
    for miniature in rem_miniatures:
        if miniature['id'] not in base_miniature_ids:
            base_miniatures.append(miniature)
            base_miniature_ids.add(miniature['id'])
    
    return base_miniatures


def consolidate_competitions(base_competitions: List[Dict], rem_competitions: List[Dict]) -> List[Dict]:
    """
    Consolida competitions evitando duplicatas.
    Considera duplicata se o ID da competition for igual.
    """
    base_competition_ids = {comp['id'] for comp in base_competitions if 'id' in comp}
    
    for comp in rem_competitions:
        if 'id' in comp and comp['id'] not in base_competition_ids:
            base_competitions.append(comp)
            base_competition_ids.add(comp['id'])
        elif 'id' not in comp:
            # Se não tem ID, adiciona mesmo assim
            base_competitions.append(comp)
    
    return base_competitions


def update_statistics(data: Dict) -> Dict:
    """Atualiza as statistics baseado nos dados consolidados."""
    statistics = {
        'totalDrivers': len(data.get('drivers', [])),
        'totalMiniatures': len(data.get('miniatures', [])),
        'totalCompetitions': len(data.get('competitions', []))
    }
    return statistics


def consolidate_duplicate_group(group: Dict) -> Dict:
    """
    Consolida um grupo de duplicatas.
    - O primeiro team é a BASE
    - Os demais são REMs
    """
    teams = group['teams']
    
    if len(teams) <= 1:
        # Não há duplicatas, retorna como está
        return group
    
    # Primeiro team é sempre a BASE
    base_team = teams[0]
    rem_teams = teams[1:]
    
    # Consolida dados de todos os REMs na BASE
    for rem_team in rem_teams:
        rem_data = rem_team.get('data', {})
        
        # Consolida drivers
        base_team['data']['drivers'] = consolidate_drivers(
            base_team['data'].get('drivers', []),
            rem_data.get('drivers', [])
        )
        
        # Consolida miniatures
        base_team['data']['miniatures'] = consolidate_miniatures(
            base_team['data'].get('miniatures', []),
            rem_data.get('miniatures', [])
        )
        
        # Consolida competitions
        base_team['data']['competitions'] = consolidate_competitions(
            base_team['data'].get('competitions', []),
            rem_data.get('competitions', [])
        )
        
        # Esvazia os dados do REM
        rem_team['data'] = {
            'drivers': [],
            'miniatures': [],
            'competitions': [],
            'statistics': {
                'totalDrivers': 0,
                'totalMiniatures': 0,
                'totalCompetitions': 0
            }
        }
    
    # Atualiza statistics da BASE
    base_team['data']['statistics'] = update_statistics(base_team['data'])
    
    return group


def consolidate_all_duplicates(data: Dict) -> Dict:
    """Processa todos os grupos de duplicatas."""
    total_groups = len(data['duplicate_groups'])
    
    print(f"Processando {total_groups} grupos de duplicatas...")
    
    for idx, group in enumerate(data['duplicate_groups'], 1):
        normalized_key = group['normalized_key']
        num_teams = len(group['teams'])
        
        print(f"[{idx}/{total_groups}] Consolidando '{normalized_key}' ({num_teams} teams)...")
        
        consolidate_duplicate_group(group)
    
    return data


def generate_summary(data: Dict) -> Dict:
    """Gera um resumo da consolidação."""
    summary = {
        'total_groups_processed': len(data['duplicate_groups']),
        'total_teams_consolidated': 0,
        'total_base_teams': 0,
        'total_rem_teams': 0,
        'groups_detail': []
    }
    
    for group in data['duplicate_groups']:
        teams = group['teams']
        num_teams = len(teams)
        
        if num_teams > 1:
            base_team = teams[0]
            rem_teams = teams[1:]
            
            summary['total_base_teams'] += 1
            summary['total_rem_teams'] += len(rem_teams)
            summary['total_teams_consolidated'] += num_teams
            
            group_detail = {
                'normalized_key': group['normalized_key'],
                'base_team_id': base_team['id'],
                'base_team_name': base_team['name'],
                'rem_team_ids': [t['id'] for t in rem_teams],
                'total_drivers': base_team['data']['statistics']['totalDrivers'],
                'total_miniatures': base_team['data']['statistics']['totalMiniatures'],
                'total_competitions': base_team['data']['statistics']['totalCompetitions']
            }
            
            summary['groups_detail'].append(group_detail)
    
    return summary


def main():
    """Função principal."""
    input_file = 'teams_duplicates_with_data.json'
    output_file = 'teams_duplicates_consolidated.json'
    summary_file = 'consolidation_summary.json'
    
    print("=" * 60)
    print("CONSOLIDAÇÃO DE TEAMS DUPLICADOS")
    print("=" * 60)
    print()
    
    # Carrega dados
    print(f"Carregando arquivo: {input_file}")
    data = load_json(input_file)
    print(f"✓ {data['total_duplicate_groups']} grupos de duplicatas encontrados")
    print()
    
    # Consolida duplicatas
    consolidated_data = consolidate_all_duplicates(data)
    print()
    print("✓ Consolidação concluída!")
    print()
    
    # Gera resumo
    print("Gerando resumo...")
    summary = generate_summary(consolidated_data)
    print(f"✓ {summary['total_base_teams']} teams BASE")
    print(f"✓ {summary['total_rem_teams']} teams REMs (esvaziados)")
    print()
    
    # Salva arquivos
    print(f"Salvando arquivo consolidado: {output_file}")
    consolidated_data['consolidated_at'] = datetime.now().isoformat()
    save_json(consolidated_data, output_file)
    print("✓ Arquivo consolidado salvo!")
    print()
    
    print(f"Salvando resumo: {summary_file}")
    summary['generated_at'] = datetime.now().isoformat()
    save_json(summary, summary_file)
    print("✓ Resumo salvo!")
    print()
    
    print("=" * 60)
    print("PROCESSO CONCLUÍDO COM SUCESSO!")
    print("=" * 60)
    print()
    print(f"Arquivos gerados:")
    print(f"  - {output_file}")
    print(f"  - {summary_file}")


if __name__ == '__main__':
    main()
