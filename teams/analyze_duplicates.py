#!/usr/bin/env python3
"""
Script para analisar o relatório de duplicatas e gerar insights.
Ajuda a decidir quais times manter e quais mesclar/deletar.
"""

import json
from typing import Dict, List, Any
from collections import defaultdict


def load_report(filename: str = 'teams_duplicates_with_data.json') -> Dict:
    """Carrega o relatório de duplicatas."""
    with open(filename, 'r', encoding='utf-8') as f:
        return json.load(f)


def analyze_group(group: Dict) -> Dict[str, Any]:
    """
    Analisa um grupo de duplicatas e retorna insights.
    """
    teams = group['teams']
    
    analysis = {
        'normalized_key': group['normalized_key'],
        'total_teams': len(teams),
        'teams_summary': []
    }
    
    for team in teams:
        stats = team['data']['statistics']
        summary = {
            'id': team['id'],
            'name': team['name'],
            'nc_order': team['nc_order'],
            'created_at': team['created_at'],
            'updated_at': team['updated_at'],
            'total_drivers': stats['totalDrivers'],
            'total_miniatures': stats['totalMiniatures'],
            'total_competitions': stats['totalCompetitions'],
            'total_relations': stats['totalDrivers'] + stats['totalMiniatures'] + stats['totalCompetitions'],
            'has_icon': team['teamIcon'] is not None
        }
        analysis['teams_summary'].append(summary)
    
    # Ordenar por total de relações (decrescente)
    analysis['teams_summary'].sort(key=lambda x: x['total_relations'], reverse=True)
    
    # Sugerir qual time manter
    best_team = analysis['teams_summary'][0]
    analysis['suggested_keep'] = {
        'id': best_team['id'],
        'name': best_team['name'],
        'reason': f"Possui mais dados ({best_team['total_relations']} relações totais)"
    }
    
    # Times a deletar/mesclar
    analysis['suggested_merge_or_delete'] = [
        {
            'id': t['id'],
            'name': t['name'],
            'relations': t['total_relations']
        }
        for t in analysis['teams_summary'][1:]
    ]
    
    return analysis


def generate_summary_report(report: Dict, output_file: str = 'duplicates_analysis_summary.json'):
    """
    Gera um relatório resumido com sugestões de ação.
    """
    print("Analisando grupos de duplicatas...")
    
    analyses = []
    for group in report['duplicate_groups']:
        analysis = analyze_group(group)
        analyses.append(analysis)
    
    summary = {
        'total_duplicate_groups': report['total_duplicate_groups'],
        'analyzed_at': report.get('generated_at', 'N/A'),
        'groups': analyses
    }
    
    # Salvar resumo
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(summary, f, indent=2, ensure_ascii=False)
    
    print(f"\n✅ Análise concluída!")
    print(f"📄 Arquivo: {output_file}")
    
    return summary


def print_statistics(summary: Dict):
    """
    Imprime estatísticas gerais sobre as duplicatas.
    """
    print("\n" + "=" * 80)
    print("ESTATÍSTICAS GERAIS")
    print("=" * 80)
    
    total_groups = summary['total_duplicate_groups']
    total_teams = sum(g['total_teams'] for g in summary['groups'])
    total_to_merge = total_teams - total_groups  # Mantemos 1 por grupo
    
    print(f"\n📊 Total de grupos duplicados: {total_groups}")
    print(f"👥 Total de times duplicados: {total_teams}")
    print(f"🔄 Times que precisam ser mesclados/deletados: {total_to_merge}")
    
    # Estatísticas de relações
    teams_with_data = []
    teams_without_data = []
    
    for group in summary['groups']:
        for team in group['teams_summary']:
            if team['total_relations'] > 0:
                teams_with_data.append(team)
            else:
                teams_without_data.append(team)
    
    print(f"\n📈 Times com dados (drivers/miniatures/competitions): {len(teams_with_data)}")
    print(f"📉 Times sem dados: {len(teams_without_data)}")
    
    # Grupos por quantidade de duplicatas
    group_sizes = defaultdict(int)
    for group in summary['groups']:
        group_sizes[group['total_teams']] += 1
    
    print(f"\n📋 Distribuição de grupos por quantidade de duplicatas:")
    for size in sorted(group_sizes.keys()):
        print(f"   {size} times duplicados: {group_sizes[size]} grupos")


def print_top_groups(summary: Dict, top_n: int = 10):
    """
    Imprime os grupos com mais duplicatas.
    """
    print("\n" + "=" * 80)
    print(f"TOP {top_n} GRUPOS COM MAIS DUPLICATAS")
    print("=" * 80)
    
    sorted_groups = sorted(summary['groups'], key=lambda x: x['total_teams'], reverse=True)
    
    for i, group in enumerate(sorted_groups[:top_n], 1):
        print(f"\n{i}. {group['normalized_key']} ({group['total_teams']} times)")
        print(f"   Sugestão: Manter ID {group['suggested_keep']['id']} - {group['suggested_keep']['name']}")
        print(f"   Razão: {group['suggested_keep']['reason']}")
        print(f"   Times a mesclar/deletar:")
        for team in group['suggested_merge_or_delete']:
            print(f"      - ID {team['id']}: {team['name']} ({team['relations']} relações)")


def print_teams_without_data(summary: Dict):
    """
    Imprime times duplicados que não possuem dados.
    Estes são candidatos a deleção direta.
    """
    print("\n" + "=" * 80)
    print("TIMES DUPLICADOS SEM DADOS (Candidatos a Deleção Direta)")
    print("=" * 80)
    
    teams_to_delete = []
    
    for group in summary['groups']:
        for team in group['suggested_merge_or_delete']:
            if team['relations'] == 0:
                teams_to_delete.append({
                    'id': team['id'],
                    'name': team['name'],
                    'normalized_key': group['normalized_key']
                })
    
    if teams_to_delete:
        print(f"\n📝 Total: {len(teams_to_delete)} times podem ser deletados diretamente")
        print("\nExemplos:")
        for team in teams_to_delete[:20]:
            print(f"   - ID {team['id']}: {team['name']} (grupo: {team['normalized_key']})")
        
        if len(teams_to_delete) > 20:
            print(f"\n   ... e mais {len(teams_to_delete) - 20} times")
    else:
        print("\n✅ Não há times sem dados para deletar diretamente.")


def generate_sql_suggestions(summary: Dict, output_file: str = 'merge_suggestions.sql'):
    """
    Gera sugestões SQL para mesclar/deletar duplicatas.
    """
    print("\nGerando sugestões SQL...")
    
    sql_lines = [
        "-- ============================================================================",
        "-- SUGESTÕES SQL PARA MESCLAR/DELETAR DUPLICATAS",
        "-- ============================================================================",
        "-- ATENÇÃO: Revise cuidadosamente antes de executar!",
        "-- Faça backup do banco de dados antes de executar estas queries.",
        "-- ============================================================================\n",
        "BEGIN;\n"
    ]
    
    # Times sem dados - podem ser deletados diretamente
    sql_lines.append("-- ============================================================================")
    sql_lines.append("-- PARTE 1: DELETAR TIMES SEM DADOS")
    sql_lines.append("-- ============================================================================\n")
    
    teams_to_delete = []
    for group in summary['groups']:
        for team in group['suggested_merge_or_delete']:
            if team['relations'] == 0:
                teams_to_delete.append(team['id'])
    
    if teams_to_delete:
        sql_lines.append(f"-- Total de times a deletar: {len(teams_to_delete)}\n")
        sql_lines.append("DELETE FROM pb7lpfmycz97c19.teams")
        sql_lines.append(f"WHERE id IN ({', '.join(map(str, teams_to_delete))});")
        sql_lines.append(f"-- {len(teams_to_delete)} times deletados\n")
    
    # Times com dados - precisam ser mesclados
    sql_lines.append("\n-- ============================================================================")
    sql_lines.append("-- PARTE 2: MESCLAR TIMES COM DADOS")
    sql_lines.append("-- ============================================================================")
    sql_lines.append("-- ATENÇÃO: Estas queries precisam ser revisadas manualmente!")
    sql_lines.append("-- Você precisa decidir como mesclar os dados de cada grupo.\n")
    
    for group in summary['groups']:
        teams_with_data = [t for t in group['suggested_merge_or_delete'] if t['relations'] > 0]
        
        if teams_with_data:
            keep_id = group['suggested_keep']['id']
            keep_name = group['suggested_keep']['name']
            
            sql_lines.append(f"\n-- Grupo: {group['normalized_key']}")
            sql_lines.append(f"-- Manter: ID {keep_id} - {keep_name}")
            
            for team in teams_with_data:
                sql_lines.append(f"\n-- Mesclar ID {team['id']} ({team['relations']} relações) -> ID {keep_id}")
                sql_lines.append("-- TODO: Revisar e ajustar estas queries conforme necessário")
                
                # Sugestões de merge
                sql_lines.append(f"""
-- Mesclar drivers
UPDATE pb7lpfmycz97c19._nc_m2m_drivers_teams
SET teams_id = {keep_id}
WHERE teams_id = {team['id']}
AND drivers_id NOT IN (
    SELECT drivers_id FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = {keep_id}
);

-- Mesclar miniatures
UPDATE pb7lpfmycz97c19._nc_m2m_miniatures_teams
SET teams_id = {keep_id}
WHERE teams_id = {team['id']}
AND miniatures_id NOT IN (
    SELECT miniatures_id FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = {keep_id}
);

-- Mesclar competitions
UPDATE pb7lpfmycz97c19._nc_m2m_competition_teams
SET teams_id = {keep_id}
WHERE teams_id = {team['id']}
AND competition_id NOT IN (
    SELECT competition_id FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = {keep_id}
);

-- Deletar time duplicado
DELETE FROM pb7lpfmycz97c19.teams WHERE id = {team['id']};
""")
    
    sql_lines.append("\n-- ============================================================================")
    sql_lines.append("-- COMMIT ou ROLLBACK")
    sql_lines.append("-- ============================================================================")
    sql_lines.append("-- Revise tudo acima antes de fazer commit!")
    sql_lines.append("-- COMMIT;")
    sql_lines.append("ROLLBACK; -- Use ROLLBACK para cancelar se algo estiver errado")
    
    # Salvar SQL
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_lines))
    
    print(f"✅ Sugestões SQL salvas em: {output_file}")


def main():
    """
    Função principal.
    """
    print("=" * 80)
    print("ANÁLISE DE DUPLICATAS")
    print("=" * 80)
    
    # Carregar relatório
    print("\nCarregando relatório de duplicatas...")
    report = load_report('teams_duplicates_with_data.json')
    
    # Gerar análise
    summary = generate_summary_report(report)
    
    # Imprimir estatísticas
    print_statistics(summary)
    print_top_groups(summary, top_n=10)
    print_teams_without_data(summary)
    
    # Gerar sugestões SQL
    generate_sql_suggestions(summary)
    
    print("\n" + "=" * 80)
    print("✅ Análise concluída!")
    print("=" * 80)
    print("\nArquivos gerados:")
    print("  1. duplicates_analysis_summary.json - Resumo da análise")
    print("  2. merge_suggestions.sql - Sugestões SQL para mesclar/deletar")
    print("\n⚠️  IMPORTANTE: Revise os arquivos antes de executar qualquer ação!")


if __name__ == '__main__':
    main()
