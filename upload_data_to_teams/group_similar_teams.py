#!/usr/bin/env python3
"""
Script para agrupar teams similares automaticamente
Usa técnicas de similaridade de strings para identificar teams relacionados
"""

import json
import re
from difflib import SequenceMatcher
from collections import defaultdict
from typing import List, Dict, Set, Tuple

def normalize_team_name(name: str) -> str:
    """
    Normaliza o nome do team para comparação
    Remove pontos, espaços extras, converte para minúsculas
    """
    # Converter para minúsculas
    name = name.lower()
    
    # Remover pontos que são abreviações (mantém pontos em números decimais)
    name = re.sub(r'(?<=[a-z])\.(?=[a-z\s])', '', name)
    name = re.sub(r'(?<=[a-z])\.\s', ' ', name)
    
    # Remover caracteres especiais mas manter espaços
    name = re.sub(r'[^\w\s]', ' ', name)
    
    # Remover espaços múltiplos
    name = re.sub(r'\s+', ' ', name)
    
    return name.strip()


def extract_base_name(name: str) -> str:
    """
    Extrai o nome base do team (primeira palavra significativa)
    """
    normalized = normalize_team_name(name)
    
    # Remover palavras comuns no início
    prefixes_to_remove = ['team', 'racing', 'motorsport', 'official', 'scuderia', 'equipe']
    words = normalized.split()
    
    # Filtrar palavras muito curtas ou prefixos comuns
    significant_words = []
    for word in words:
        if len(word) > 2 and word not in prefixes_to_remove:
            significant_words.append(word)
    
    if significant_words:
        return significant_words[0]
    elif words:
        return words[0]
    
    return normalized


def calculate_similarity(name1: str, name2: str) -> float:
    """
    Calcula a similaridade entre dois nomes de teams
    Retorna um valor entre 0 e 1
    """
    norm1 = normalize_team_name(name1)
    norm2 = normalize_team_name(name2)
    
    # Se um nome contém o outro completamente, alta similaridade
    if norm1 in norm2 or norm2 in norm1:
        return 0.9
    
    # Usar SequenceMatcher para calcular similaridade
    return SequenceMatcher(None, norm1, norm2).ratio()


def find_base_team(teams: List[Dict]) -> Dict:
    """
    Encontra o team "base" de um grupo (geralmente o mais curto e simples)
    """
    # Preferir o team com nome mais curto
    return min(teams, key=lambda t: len(t['team']))


def group_teams_by_similarity(teams: List[Dict], threshold: float = 0.6) -> Dict[str, List[Dict]]:
    """
    Agrupa teams similares
    threshold: limiar de similaridade (0-1)
    """
    groups = {}
    processed_ids = set()
    
    # Filtrar teams sem nome e ordenar
    valid_teams = [t for t in teams if t.get('team')]
    sorted_teams = sorted(valid_teams, key=lambda t: t['team'])
    
    for i, team1 in enumerate(sorted_teams):
        if team1['id'] in processed_ids:
            continue
        
        # Criar novo grupo com este team como base
        group = [team1]
        processed_ids.add(team1['id'])
        
        # Procurar teams similares
        for team2 in sorted_teams[i+1:]:
            if team2['id'] in processed_ids:
                continue
            
            similarity = calculate_similarity(team1['team'], team2['team'])
            
            if similarity >= threshold:
                group.append(team2)
                processed_ids.add(team2['id'])
        
        # Se encontrou um grupo, adicionar
        if len(group) > 1:
            base_team = find_base_team(group)
            groups[base_team['team']] = group
    
    return groups


def group_by_base_word(teams: List[Dict]) -> Dict[str, List[Dict]]:
    """
    Agrupa teams que compartilham a mesma palavra base
    """
    base_word_map = defaultdict(list)
    
    for team in teams:
        base = extract_base_name(team['team'])
        base_word_map[base].append(team)
    
    # Filtrar grupos com apenas 1 team
    groups = {}
    for base, team_list in base_word_map.items():
        if len(team_list) > 1:
            # Encontrar o team base (nome mais curto)
            base_team = find_base_team(team_list)
            groups[base_team['team']] = team_list
    
    return groups


def merge_groups(groups1: Dict, groups2: Dict) -> Dict:
    """
    Mescla dois dicionários de grupos, evitando duplicatas
    """
    all_teams_in_groups = set()
    merged = {}
    
    # Adicionar grupos do primeiro dicionário
    for key, teams in groups1.items():
        team_ids = {t['id'] for t in teams}
        if not team_ids.intersection(all_teams_in_groups):
            merged[key] = teams
            all_teams_in_groups.update(team_ids)
    
    # Adicionar grupos do segundo dicionário que não conflitam
    for key, teams in groups2.items():
        team_ids = {t['id'] for t in teams}
        if not team_ids.intersection(all_teams_in_groups):
            merged[key] = teams
            all_teams_in_groups.update(team_ids)
    
    return merged


def main():
    print("=" * 80)
    print("AGRUPAMENTO AUTOMÁTICO DE TEAMS SIMILARES")
    print("=" * 80)
    print()
    
    # Carregar dados
    print("[→] Carregando teams.json...")
    with open("teams.json", "r", encoding="utf-8") as f:
        data = json.load(f)
    
    teams = data['teams']
    print(f"[✓] {len(teams)} teams carregados")
    
    # Filtrar teams inválidos
    valid_teams = [t for t in teams if t.get('team')]
    invalid_count = len(teams) - len(valid_teams)
    
    if invalid_count > 0:
        print(f"[!] {invalid_count} teams sem nome foram ignorados")
    print()
    
    # Método 1: Agrupar por palavra base
    print("[→] Agrupando por palavra base...")
    groups_by_base = group_by_base_word(valid_teams)
    print(f"[✓] {len(groups_by_base)} grupos encontrados por palavra base")
    print()
    
    # Método 2: Agrupar por similaridade
    print("[→] Agrupando por similaridade (threshold=0.6)...")
    groups_by_similarity = group_teams_by_similarity(valid_teams, threshold=0.6)
    print(f"[✓] {len(groups_by_similarity)} grupos encontrados por similaridade")
    print()
    
    # Mesclar os dois métodos
    print("[→] Mesclando grupos...")
    final_groups = merge_groups(groups_by_base, groups_by_similarity)
    print(f"[✓] {len(final_groups)} grupos finais")
    print()
    
    # Estatísticas
    total_teams_in_groups = sum(len(teams) for teams in final_groups.values())
    print("📊 Estatísticas:")
    print(f"  - Total de grupos: {len(final_groups)}")
    print(f"  - Teams agrupados: {total_teams_in_groups}")
    print(f"  - Teams não agrupados: {len(teams) - total_teams_in_groups}")
    print()
    
    # Mostrar alguns exemplos
    print("📋 Exemplos de grupos (primeiros 10):")
    for i, (base_name, team_list) in enumerate(list(final_groups.items())[:10]):
        print(f"\n{i+1}. {base_name} ({len(team_list)} teams):")
        for team in team_list[:5]:
            print(f"   - ID {team['id']}: {team['team']}")
        if len(team_list) > 5:
            print(f"   ... e mais {len(team_list) - 5} teams")
    print()
    
    # Confirmar salvamento
    response = input("Deseja salvar o resultado em 'teams_grouped_auto.json'? (SIM/não): ")
    
    if response.upper() == 'SIM' or response == '':
        output_file = "teams_grouped_auto.json"
        with open(output_file, "w", encoding="utf-8") as f:
            json.dump(final_groups, f, indent=2, ensure_ascii=False)
        
        print(f"\n[✓] Grupos salvos em: {output_file}")
        print()
        
        # Salvar também estatísticas
        stats = {
            "total_groups": len(final_groups),
            "total_teams_grouped": total_teams_in_groups,
            "total_teams_original": len(teams),
            "teams_not_grouped": len(teams) - total_teams_in_groups,
            "groups": {
                base_name: {
                    "count": len(team_list),
                    "teams": [{"id": t['id'], "name": t['team']} for t in team_list]
                }
                for base_name, team_list in final_groups.items()
            }
        }
        
        with open("teams_grouped_auto_stats.json", "w", encoding="utf-8") as f:
            json.dump(stats, f, indent=2, ensure_ascii=False)
        
        print(f"[✓] Estatísticas salvas em: teams_grouped_auto_stats.json")
    else:
        print("\n[!] Salvamento cancelado")
    
    print()


if __name__ == '__main__':
    main()
