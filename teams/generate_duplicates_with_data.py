#!/usr/bin/env python3
"""
Script para gerar relatório de duplicatas com dados completos de cada equipe.
Gera um JSON similar ao teams_duplicates_report.json mas incluindo todos os dados
(drivers, miniatures, competitions, etc) de cada equipe duplicada.
"""

import psycopg2
import json
import re
from typing import Dict, List, Any
import os
from datetime import datetime

# ============================================================================
# CONFIGURAÇÃO DO BANCO DE DADOS
# ============================================================================
# Configure suas credenciais aqui ou use variáveis de ambiente
DB_CONFIG = {
    'host': os.getenv('DB_HOST', 'localhost'),
    'port': os.getenv('DB_PORT', '5432'),
    'database': os.getenv('DB_NAME', 'pb7lpfmycz97c19'),
    'user': os.getenv('DB_USER', 'postgres'),
    'password': os.getenv('DB_PASSWORD', '')
}

SCHEMA = 'pb7lpfmycz97c19'


def normalize_team_name(name: str) -> str:
    """
    Normaliza o nome do time removendo espaços, pontos, hífens e caracteres especiais.
    Converte para minúsculas.
    """
    return re.sub(r'[^a-zA-Z0-9]', '', name).lower()


def get_team_data(cursor, team_id: int) -> Dict[str, Any]:
    """
    Busca todos os dados relacionados a um time específico.
    Retorna drivers, miniatures, competitions e estatísticas.
    """
    data = {
        'drivers': [],
        'miniatures': [],
        'competitions': [],
        'statistics': {
            'totalDrivers': 0,
            'totalMiniatures': 0,
            'totalCompetitions': 0
        }
    }
    
    # Buscar drivers
    cursor.execute(f"""
        SELECT 
            d.id,
            d.driver,
            d."seasonsCompleted",
            d.championships,
            d.overview
        FROM {SCHEMA}._nc_m2m_drivers_teams dt
        JOIN {SCHEMA}.drivers d ON dt.drivers_id = d.id
        WHERE dt.teams_id = %s
        ORDER BY d.driver
    """, (team_id,))
    
    data['drivers'] = [
        {
            'id': row[0],
            'driver': row[1],
            'seasonsCompleted': row[2],
            'championships': row[3],
            'overview': row[4]
        }
        for row in cursor.fetchall()
    ]
    
    # Buscar miniatures
    cursor.execute(f"""
        SELECT 
            m.id,
            m.model,
            m.brand,
            m.sku,
            m.scale,
            m.year,
            m.season,
            m."additionalInfo",
            m.images
        FROM {SCHEMA}._nc_m2m_miniatures_teams mt
        JOIN {SCHEMA}.miniatures m ON mt.miniatures_id = m.id
        WHERE mt.teams_id = %s
        ORDER BY m.model
    """, (team_id,))
    
    data['miniatures'] = [
        {
            'id': row[0],
            'model': row[1],
            'brand': row[2],
            'sku': row[3],
            'scale': row[4],
            'year': row[5],
            'season': row[6],
            'additionalInfo': row[7],
            'images': row[8]
        }
        for row in cursor.fetchall()
    ]
    
    # Buscar competitions
    cursor.execute(f"""
        SELECT 
            c.id,
            c.competition,
            c."competitionFullName",
            c."competitionIcon",
            c."competitionImage"
        FROM {SCHEMA}._nc_m2m_competition_teams ct
        JOIN {SCHEMA}.competitions c ON ct.competition_id = c.id
        WHERE ct.teams_id = %s
        ORDER BY c.competition
    """, (team_id,))
    
    data['competitions'] = [
        {
            'id': row[0],
            'competition': row[1],
            'competitionFullName': row[2],
            'competitionIcon': row[3],
            'competitionImage': row[4]
        }
        for row in cursor.fetchall()
    ]
    
    # Calcular estatísticas
    data['statistics']['totalDrivers'] = len(data['drivers'])
    data['statistics']['totalMiniatures'] = len(data['miniatures'])
    data['statistics']['totalCompetitions'] = len(data['competitions'])
    
    return data


def generate_duplicates_report(output_file: str = 'teams_duplicates_with_data.json'):
    """
    Gera o relatório de duplicatas com dados completos.
    """
    print("Conectando ao banco de dados...")
    conn = psycopg2.connect(**DB_CONFIG)
    cursor = conn.cursor()
    
    try:
        # Buscar todos os times
        print("Buscando todos os times...")
        cursor.execute(f"""
            SELECT 
                id,
                team,
                "teamIcon",
                nc_order,
                created_at,
                updated_at
            FROM {SCHEMA}.teams
            ORDER BY nc_order
        """)
        
        teams = []
        for row in cursor.fetchall():
            teams.append({
                'id': row[0],
                'name': row[1],
                'teamIcon': row[2],
                'nc_order': row[3],
                'created_at': row[4].isoformat() if row[4] else None,
                'updated_at': row[5].isoformat() if row[5] else None,
                'normalized_key': normalize_team_name(row[1])
            })
        
        print(f"Total de times encontrados: {len(teams)}")
        
        # Agrupar por normalized_key
        print("Identificando duplicatas...")
        groups: Dict[str, List[Dict]] = {}
        for team in teams:
            key = team['normalized_key']
            if key not in groups:
                groups[key] = []
            groups[key].append(team)
        
        # Filtrar apenas grupos com duplicatas
        duplicate_groups = {k: v for k, v in groups.items() if len(v) > 1}
        print(f"Total de grupos duplicados: {len(duplicate_groups)}")
        
        # Buscar dados completos para cada time duplicado
        print("Buscando dados completos de cada time duplicado...")
        result_groups = []
        
        for idx, (normalized_key, teams_list) in enumerate(sorted(duplicate_groups.items()), 1):
            print(f"  Processando grupo {idx}/{len(duplicate_groups)}: {normalized_key} ({len(teams_list)} times)")
            
            teams_with_data = []
            for team in teams_list:
                print(f"    - Buscando dados do time ID {team['id']}: {team['name']}")
                team_data = get_team_data(cursor, team['id'])
                
                teams_with_data.append({
                    'id': team['id'],
                    'name': team['name'],
                    'teamIcon': team['teamIcon'],
                    'nc_order': team['nc_order'],
                    'created_at': team['created_at'],
                    'updated_at': team['updated_at'],
                    'data': team_data
                })
            
            result_groups.append({
                'normalized_key': normalized_key,
                'teams': teams_with_data
            })
        
        # Montar resultado final
        result = {
            'total_duplicate_groups': len(duplicate_groups),
            'generated_at': datetime.now().isoformat(),
            'duplicate_groups': result_groups
        }
        
        # Salvar JSON
        print(f"\nSalvando resultado em {output_file}...")
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(result, f, indent=2, ensure_ascii=False)
        
        print(f"\n✅ Relatório gerado com sucesso!")
        print(f"📄 Arquivo: {output_file}")
        print(f"📊 Total de grupos duplicados: {len(duplicate_groups)}")
        
        # Estatísticas resumidas
        total_teams = sum(len(g['teams']) for g in result_groups)
        print(f"👥 Total de times duplicados: {total_teams}")
        
        # Mostrar alguns exemplos
        print("\n📋 Exemplos de grupos duplicados:")
        for group in result_groups[:5]:
            print(f"\n  • {group['normalized_key']}:")
            for team in group['teams']:
                stats = team['data']['statistics']
                print(f"    - ID {team['id']}: {team['name']}")
                print(f"      Drivers: {stats['totalDrivers']}, "
                      f"Miniatures: {stats['totalMiniatures']}, "
                      f"Competitions: {stats['totalCompetitions']}")
        
        if len(result_groups) > 5:
            print(f"\n  ... e mais {len(result_groups) - 5} grupos")
    
    except Exception as e:
        print(f"\n❌ Erro ao gerar relatório: {e}")
        raise
    
    finally:
        cursor.close()
        conn.close()
        print("\n🔌 Conexão com banco de dados fechada.")


def main():
    """
    Função principal.
    """
    print("=" * 80)
    print("GERADOR DE RELATÓRIO DE DUPLICATAS COM DADOS COMPLETOS")
    print("=" * 80)
    print()
    
    # Verificar se as credenciais do banco estão configuradas
    if not DB_CONFIG['password']:
        print("⚠️  ATENÇÃO: Configure as credenciais do banco de dados!")
        print("   Você pode:")
        print("   1. Editar DB_CONFIG no script")
        print("   2. Usar variáveis de ambiente:")
        print("      export DB_HOST=seu_host")
        print("      export DB_PORT=5432")
        print("      export DB_NAME=pb7lpfmycz97c19")
        print("      export DB_USER=seu_usuario")
        print("      export DB_PASSWORD=sua_senha")
        print()
        response = input("Deseja continuar mesmo assim? (s/n): ")
        if response.lower() != 's':
            print("Operação cancelada.")
            return
    
    output_file = 'teams_duplicates_with_data.json'
    generate_duplicates_report(output_file)


if __name__ == '__main__':
    main()
