#!/usr/bin/env python3
"""
Script avançado para agrupar teams similares com revisão manual
Permite ajustar threshold e revisar grupos antes de salvar
"""

import json
import re
from difflib import SequenceMatcher
from collections import defaultdict
from typing import List, Dict, Set, Tuple

def normalize_team_name(name: str) -> str:
    """Normaliza o nome do team para comparação"""
    name = name.lower()
    name = re.sub(r'(?<=[a-z])\.(?=[a-z\s])', '', name)
    name = re.sub(r'(?<=[a-z])\.\s', ' ', name)
    name = re.sub(r'[^\w\s]', ' ', name)
    name = re.sub(r'\s+', ' ', name)
    return name.strip()


def extract_keywords(name: str) -> Set[str]:
    """Extrai palavras-chave do nome do team"""
    normalized = normalize_team_name(name)
    
    # Palavras a ignorar
    stop_words = {
        'team', 'racing', 'motorsport', 'motorsports', 'official', 'scuderia',
        'equipe', 'sport', 'sports', 'auto', 'club', 'the', 'and', 'with',
        'by', 'de', 'del', 'di', 'da', 'des', 'le', 'la', 'los', 'las'
    }
    
    words = normalized.split()
    keywords = {w for w in words if len(w) > 2 and w not in stop_words}
    
    return keywords


def calculate_keyword_overlap(name1: str, name2: str) -> float:
    """Calcula sobreposição de palavras-chave entre dois nomes"""
    keywords1 = extract_keywords(name1)
    keywords2 = extract_keywords(name2)
    
    if not keywords1 or not keywords2:
        return 0.0
    
    intersection = keywords1.intersection(keywords2)
    union = keywords1.union(keywords2)
    
    return len(intersection) / len(union) if union else 0.0


def calculate_similarity(name1: str, name2: str) -> Tuple[float, str]:
    """
    Calcula a similaridade entre dois nomes de teams
    Retorna (score, método)
    """
    norm1 = normalize_team_name(name1)
    norm2 = normalize_team_name(name2)
    
    # Método 1: Substring exata
    if norm1 in norm2 or norm2 in norm1:
        return (0.95, "substring")
    
    # Método 2: Sobreposição de palavras-chave
    keyword_score = calculate_keyword_overlap(name1, name2)
    if keyword_score >= 0.5:
        return (keyword_score * 0.9, "keywords")
    
    # Método 3: Similaridade de sequência
    seq_score = SequenceMatcher(None, norm1, norm2).ratio()
    return (seq_score, "sequence")


def find_base_team(teams: List[Dict]) -> Dict:
    """
    Encontra o team "base" de um grupo
    Prioriza: nome mais curto, sem sufixos como "Racing", "Team", etc.
    """
    def score_team(team: Dict) -> Tuple[int, int, str]:
        name = team['team']
        normalized = normalize_team_name(name)
        
        # Penalizar nomes com palavras comuns
        penalty = 0
        common_words = ['racing', 'team', 'motorsport', 'official']
        for word in common_words:
            if word in normalized:
                penalty += 10
        
        # Preferir nomes mais curtos
        length = len(name)
        
        return (penalty, length, name.lower())
    
    return min(teams, key=score_team)


def group_teams_smart(teams: List[Dict], threshold: float = 0.65) -> Dict[str, List[Dict]]:
    """
    Agrupa teams de forma inteligente usando múltiplos critérios
    """
    groups = {}
    processed_ids = set()
    
    # Filtrar teams sem nome e ordenar
    valid_teams = [t for t in teams if t.get('team')]
    sorted_teams = sorted(valid_teams, key=lambda t: t['team'])
    
    for i, team1 in enumerate(sorted_teams):
        if team1['id'] in processed_ids:
            continue
        
        group = [team1]
        processed_ids.add(team1['id'])
        similarities = []
        
        # Procurar teams similares
        for team2 in sorted_teams[i+1:]:
            if team2['id'] in processed_ids:
                continue
            
            score, method = calculate_similarity(team1['team'], team2['team'])
            
            if score >= threshold:
                group.append(team2)
                processed_ids.add(team2['id'])
                similarities.append((team2['team'], score, method))
        
        # Se encontrou um grupo, adicionar
        if len(group) > 1:
            base_team = find_base_team(group)
            groups[base_team['team']] = {
                'teams': group,
                'similarities': similarities
            }
    
    return groups


def display_group(base_name: str, group_data: Dict, index: int):
    """Exibe um grupo de forma formatada"""
    teams = group_data['teams']
    print(f"\n{index}. 📁 {base_name}")
    print(f"   Total: {len(teams)} teams")
    print(f"   Teams:")
    for team in teams:
        print(f"     • ID {team['id']:5d}: {team['team']}")


def review_groups(groups: Dict) -> Dict:
    """Permite revisar e ajustar grupos manualmente"""
    print("\n" + "=" * 80)
    print("REVISÃO DE GRUPOS")
    print("=" * 80)
    print()
    print("Comandos disponíveis:")
    print("  - ENTER: próximo grupo")
    print("  - 's': pular este grupo (não incluir no resultado)")
    print("  - 'q': finalizar revisão")
    print()
    
    approved_groups = {}
    skipped = 0
    
    for i, (base_name, group_data) in enumerate(groups.items(), 1):
        display_group(base_name, group_data, i)
        
        response = input(f"\n   Aprovar este grupo? (ENTER=sim, s=pular, q=sair): ").strip().lower()
        
        if response == 'q':
            print("\n[!] Revisão interrompida")
            break
        elif response == 's':
            skipped += 1
            print("   [!] Grupo pulado")
        else:
            approved_groups[base_name] = group_data['teams']
            print("   [✓] Grupo aprovado")
    
    print(f"\n[i] Grupos aprovados: {len(approved_groups)}")
    print(f"[i] Grupos pulados: {skipped}")
    
    return approved_groups


def main():
    print("=" * 80)
    print("AGRUPAMENTO AVANÇADO DE TEAMS SIMILARES")
    print("=" * 80)
    print()
    
    # Carregar dados
    print("[→] Carregando teams.json...")
    with open("teams.json", "r", encoding="utf-8") as f:
        data = json.load(f)
    
    teams = data['teams']
    print(f"[✓] {len(teams)} teams carregados")
    print()
    
    # Configurar threshold
    print("Threshold de similaridade (0.0 - 1.0):")
    print("  - 0.5: muito permissivo (mais grupos, pode ter falsos positivos)")
    print("  - 0.65: balanceado (recomendado)")
    print("  - 0.8: conservador (menos grupos, mais precisos)")
    print()
    
    threshold_input = input("Digite o threshold (ENTER para 0.65): ").strip()
    threshold = float(threshold_input) if threshold_input else 0.65
    
    print(f"\n[i] Usando threshold: {threshold}")
    print()
    
    # Filtrar teams inválidos
    valid_teams = [t for t in teams if t.get('team')]
    invalid_count = len(teams) - len(valid_teams)
    
    if invalid_count > 0:
        print(f"[!] {invalid_count} teams sem nome foram ignorados")
        print()
    
    # Agrupar
    print("[→] Agrupando teams...")
    groups = group_teams_smart(valid_teams, threshold=threshold)
    print(f"[✓] {len(groups)} grupos encontrados")
    print()
    
    # Estatísticas
    total_teams_in_groups = sum(len(g['teams']) for g in groups.values())
    print("📊 Estatísticas:")
    print(f"  - Total de grupos: {len(groups)}")
    print(f"  - Teams agrupados: {total_teams_in_groups}")
    print(f"  - Teams não agrupados: {len(teams) - total_teams_in_groups}")
    print()
    
    # Perguntar se quer revisar
    review = input("Deseja revisar os grupos antes de salvar? (SIM/não): ").strip()
    
    if review.upper() == 'SIM' or review == '':
        final_groups = review_groups(groups)
    else:
        # Converter para formato simples
        final_groups = {k: v['teams'] for k, v in groups.items()}
    
    if not final_groups:
        print("\n[!] Nenhum grupo aprovado. Encerrando.")
        return
    
    # Salvar
    print("\n" + "=" * 80)
    output_file = "teams_grouped_auto.json"
    
    with open(output_file, "w", encoding="utf-8") as f:
        json.dump(final_groups, f, indent=2, ensure_ascii=False)
    
    print(f"[✓] {len(final_groups)} grupos salvos em: {output_file}")
    print()


if __name__ == '__main__':
    main()
