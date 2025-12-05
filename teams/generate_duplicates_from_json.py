#!/usr/bin/env python3
"""
Script para gerar relatório de duplicatas a partir do arquivo JSON existente.
Não requer acesso ao banco de dados.
"""

import json
import re
from typing import Dict, List, Any
from datetime import datetime


def normalize_team_name(name: str) -> str:
    """
    Normaliza o nome do time removendo espaços, pontos, hífens e caracteres especiais.
    Converte para minúsculas.
    """
    return re.sub(r'[^a-zA-Z0-9]', '', name).lower()


def parse_team_data(team: Dict) -> Dict:
    """
    Parse o campo 'data' que vem como string JSON.
    """
    try:
        # O campo 'data' é uma string JSON que precisa ser parseada
        if isinstance(team['data'], str):
            data = json.loads(team['data'])
        else:
            data = team['data']
        
        # Garantir que todos os campos existam
        if 'drivers' not in data:
            data['drivers'] = []
        if 'miniatures' not in data:
            data['miniatures'] = []
        if 'competitions' not in data:
            data['competitions'] = []
        if 'statistics' not in data:
            data['statistics'] = {
                'totalDrivers': len(data.get('drivers', [])),
                'totalMiniatures': len(data.get('miniatures', [])),
                'totalCompetitions': len(data.get('competitions', []))
            }
        
        return data
    except Exception as e:
        print(f"  ⚠️  Erro ao parsear dados do time ID {team.get('id')}: {e}")
        return {
            'drivers': [],
            'miniatures': [],
            'competitions': [],
            'statistics': {
                'totalDrivers': 0,
                'totalMiniatures': 0,
                'totalCompetitions': 0
            }
        }


def generate_duplicates_report(
    input_file: str = 'teams_202511201057.json',
    output_file: str = 'teams_duplicates_with_data.json'
):
    """
    Gera o relatório de duplicatas com dados completos a partir do JSON existente.
    """
    print("=" * 80)
    print("GERADOR DE RELATÓRIO DE DUPLICATAS")
    print("=" * 80)
    print(f"\n📂 Lendo arquivo: {input_file}")
    
    # Carregar o JSON
    with open(input_file, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    # O arquivo é um objeto onde a chave é a query SQL e o valor é o array de times
    # Pegar o primeiro (e único) valor do objeto
    if isinstance(data, dict):
        # Pegar o array de times (primeiro valor do dicionário)
        teams_data = list(data.values())[0]
    elif isinstance(data, list):
        teams_data = data
    else:
        print("❌ Erro: Formato de arquivo não reconhecido")
        return
    
    print(f"✅ Total de times carregados: {len(teams_data)}")
    
    # Processar cada time e agrupar por nome normalizado
    print("\n🔍 Identificando duplicatas...")
    groups: Dict[str, List[Dict]] = {}
    
    for team in teams_data:
        # Parsear os dados
        data = parse_team_data(team)
        
        # Criar objeto do time com dados parseados
        team_obj = {
            'id': team['id'],
            'name': team['teamname'],
            'teamIcon': team.get('teamIcon'),
            'nc_order': team.get('nc_order'),  # Pode não existir no JSON
            'created_at': team.get('created_at'),
            'updated_at': team.get('updated_at'),
            'data': data,
            'normalized_key': normalize_team_name(team['teamname'])
        }
        
        # Agrupar por nome normalizado
        key = team_obj['normalized_key']
        if key not in groups:
            groups[key] = []
        groups[key].append(team_obj)
    
    # Filtrar apenas grupos com duplicatas
    duplicate_groups = {k: v for k, v in groups.items() if len(v) > 1}
    print(f"✅ Total de grupos duplicados encontrados: {len(duplicate_groups)}")
    
    # Montar o resultado final
    print("\n📊 Montando relatório...")
    result_groups = []
    
    for idx, (normalized_key, teams_list) in enumerate(sorted(duplicate_groups.items()), 1):
        if idx % 50 == 0:
            print(f"  Processando grupo {idx}/{len(duplicate_groups)}...")
        
        # Ordenar times por nc_order se existir, senão por id
        teams_list.sort(key=lambda x: x.get('nc_order') or x['id'])
        
        teams_with_data = []
        for team in teams_list:
            teams_with_data.append({
                'id': team['id'],
                'name': team['name'],
                'teamIcon': team['teamIcon'],
                'nc_order': team.get('nc_order'),
                'created_at': team['created_at'],
                'updated_at': team['updated_at'],
                'data': team['data']
            })
        
        result_groups.append({
            'normalized_key': normalized_key,
            'teams': teams_with_data
        })
    
    # Criar resultado final
    result = {
        'total_duplicate_groups': len(duplicate_groups),
        'generated_at': datetime.now().isoformat(),
        'source_file': input_file,
        'duplicate_groups': result_groups
    }
    
    # Salvar JSON
    print(f"\n💾 Salvando resultado em: {output_file}")
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(result, f, indent=2, ensure_ascii=False)
    
    print(f"\n✅ Relatório gerado com sucesso!")
    print(f"📄 Arquivo: {output_file}")
    print(f"📊 Total de grupos duplicados: {len(duplicate_groups)}")
    
    # Estatísticas resumidas
    total_teams = sum(len(g['teams']) for g in result_groups)
    print(f"👥 Total de times duplicados: {total_teams}")
    
    # Contar times com e sem dados
    teams_with_data = 0
    teams_without_data = 0
    
    for group in result_groups:
        for team in group['teams']:
            stats = team['data']['statistics']
            total_relations = stats['totalDrivers'] + stats['totalMiniatures'] + stats['totalCompetitions']
            if total_relations > 0:
                teams_with_data += 1
            else:
                teams_without_data += 1
    
    print(f"📈 Times com dados: {teams_with_data}")
    print(f"📉 Times sem dados: {teams_without_data}")
    
    # Mostrar alguns exemplos
    print("\n📋 Exemplos de grupos duplicados:")
    for i, group in enumerate(result_groups[:5], 1):
        print(f"\n  {i}. {group['normalized_key']} ({len(group['teams'])} times):")
        for team in group['teams']:
            stats = team['data']['statistics']
            print(f"     - ID {team['id']}: {team['name']}")
            print(f"       Drivers: {stats['totalDrivers']}, "
                  f"Miniatures: {stats['totalMiniatures']}, "
                  f"Competitions: {stats['totalCompetitions']}")
    
    if len(result_groups) > 5:
        print(f"\n  ... e mais {len(result_groups) - 5} grupos")
    
    print("\n" + "=" * 80)
    print("✅ CONCLUÍDO!")
    print("=" * 80)
    print("\n💡 Próximos passos:")
    print("   1. Revise o arquivo gerado: teams_duplicates_with_data.json")
    print("   2. Execute: python analyze_duplicates.py")
    print("      (para gerar análise e sugestões SQL)")


def main():
    """
    Função principal.
    """
    import sys
    
    # Permitir passar o arquivo como argumento
    input_file = sys.argv[1] if len(sys.argv) > 1 else 'teams_202511201057.json'
    output_file = sys.argv[2] if len(sys.argv) > 2 else 'teams_duplicates_with_data.json'
    
    try:
        generate_duplicates_report(input_file, output_file)
    except FileNotFoundError:
        print(f"\n❌ Erro: Arquivo '{input_file}' não encontrado!")
        print("\nUso:")
        print(f"  python {sys.argv[0]} [arquivo_entrada.json] [arquivo_saida.json]")
        print("\nExemplo:")
        print(f"  python {sys.argv[0]} teams_202511201057.json teams_duplicates_with_data.json")
        sys.exit(1)
    except Exception as e:
        print(f"\n❌ Erro ao processar: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)


if __name__ == '__main__':
    main()
