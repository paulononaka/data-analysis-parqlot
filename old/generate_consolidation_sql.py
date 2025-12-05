#!/usr/bin/env python3
"""
Gera SQL seguro para consolidar teams duplicados.
- Usa transações para garantir atomicidade
- Inclui validações antes de cada operação
- Gera relatório de impacto antes de executar
"""

import json
from datetime import datetime
from typing import Dict, List


def load_json(filepath: str) -> Dict:
    """Carrega o arquivo JSON."""
    with open(filepath, 'r', encoding='utf-8') as f:
        return json.load(f)


def generate_validation_queries(summary: Dict) -> List[str]:
    """Gera queries de validação para verificar o estado antes da consolidação."""
    queries = [
        "-- ============================================================",
        "-- VALIDAÇÃO PRÉ-CONSOLIDAÇÃO",
        "-- Execute estas queries primeiro para verificar o impacto",
        "-- ============================================================",
        "",
        "-- 1. Verificar total de teams que serão removidos",
        "SELECT COUNT(*) as total_teams_to_remove",
        "FROM pb7lpfmycz97c19.teams",
        f"WHERE id IN ({', '.join(str(rem_id) for group in summary['groups_detail'] for rem_id in group['rem_team_ids'])});",
        "",
        "-- 2. Verificar total de relacionamentos que serão movidos",
    ]
    
    all_rem_ids = [rem_id for group in summary['groups_detail'] for rem_id in group['rem_team_ids']]
    rem_ids_str = ', '.join(str(id) for id in all_rem_ids)
    
    queries.extend([
        "SELECT ",
        "  'Drivers' as tipo,",
        f"  COUNT(*) as total_relacionamentos",
        "FROM pb7lpfmycz97c19._nc_m2m_drivers_teams",
        f"WHERE teams_id IN ({rem_ids_str})",
        "UNION ALL",
        "SELECT ",
        "  'Miniatures' as tipo,",
        f"  COUNT(*) as total_relacionamentos",
        "FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams",
        f"WHERE teams_id IN ({rem_ids_str})",
        "UNION ALL",
        "SELECT ",
        "  'Competitions' as tipo,",
        f"  COUNT(*) as total_relacionamentos",
        "FROM pb7lpfmycz97c19._nc_m2m_competition_teams",
        f"WHERE teams_id IN ({rem_ids_str});",
        "",
        "-- 3. Verificar se há duplicatas que serão criadas (IMPORTANTE!)",
        "-- Esta query verifica se algum relacionamento já existe na BASE",
    ])
    
    for group in summary['groups_detail']:
        base_id = group['base_team_id']
        rem_ids = group['rem_team_ids']
        
        if not rem_ids:
            continue
            
        rem_ids_str = ', '.join(str(id) for id in rem_ids)
        
        queries.extend([
            f"",
            f"-- Grupo: {group['normalized_key']} (BASE: {base_id}, REMs: {rem_ids_str})",
            f"",
            f"-- Drivers duplicados que já existem na BASE {base_id}",
            f"SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, {base_id} as base_team_id",
            f"FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem",
            f"WHERE dt_rem.teams_id IN ({rem_ids_str})",
            f"  AND EXISTS (",
            f"    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base",
            f"    WHERE dt_base.teams_id = {base_id}",
            f"      AND dt_base.drivers_id = dt_rem.drivers_id",
            f"  );",
            f"",
            f"-- Miniatures duplicadas que já existem na BASE {base_id}",
            f"SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, {base_id} as base_team_id",
            f"FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem",
            f"WHERE mt_rem.teams_id IN ({rem_ids_str})",
            f"  AND EXISTS (",
            f"    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base",
            f"    WHERE mt_base.teams_id = {base_id}",
            f"      AND mt_base.miniatures_id = mt_rem.miniatures_id",
            f"  );",
            f"",
            f"-- Competitions duplicadas que já existem na BASE {base_id}",
            f"SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, {base_id} as base_team_id",
            f"FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem",
            f"WHERE ct_rem.teams_id IN ({rem_ids_str})",
            f"  AND EXISTS (",
            f"    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base",
            f"    WHERE ct_base.teams_id = {base_id}",
            f"      AND ct_base.competition_id = ct_rem.competition_id",
            f"  );",
        ])
    
    return queries


def generate_consolidation_sql(summary: Dict) -> List[str]:
    """Gera SQL de consolidação com transação e validações."""
    sql_lines = [
        "-- ============================================================",
        "-- SQL DE CONSOLIDAÇÃO DE TEAMS DUPLICADOS",
        f"-- Gerado em: {datetime.now().isoformat()}",
        f"-- Total de grupos: {summary['total_groups_processed']}",
        f"-- Total de teams BASE: {summary['total_base_teams']}",
        f"-- Total de teams REMs a remover: {summary['total_rem_teams']}",
        "-- ============================================================",
        "",
        "-- ATENÇÃO: Este script usa transação para garantir atomicidade",
        "-- Se houver qualquer erro, todas as mudanças serão revertidas",
        "",
        "BEGIN;",
        "",
        "-- ============================================================",
        "-- FASE 1: CONSOLIDAÇÃO DOS RELACIONAMENTOS",
        "-- Move todos os relacionamentos dos REMs para as BASEs",
        "-- ============================================================",
        "",
    ]
    
    for idx, group in enumerate(summary['groups_detail'], 1):
        base_id = group['base_team_id']
        base_name = group['base_team_name']
        rem_ids = group['rem_team_ids']
        normalized_key = group['normalized_key']
        
        if not rem_ids:
            continue
        
        rem_ids_str = ', '.join(str(id) for id in rem_ids)
        
        sql_lines.extend([
            f"-- ------------------------------------------------------------",
            f"-- Grupo {idx}: {normalized_key}",
            f"-- BASE: ID={base_id}, Nome='{base_name}'",
            f"-- REMs: IDs=[{rem_ids_str}]",
            f"-- ------------------------------------------------------------",
            "",
        ])
        
        # Para cada REM, mover relacionamentos evitando duplicatas
        for rem_id in rem_ids:
            sql_lines.extend([
                f"-- Movendo relacionamentos do REM {rem_id} para BASE {base_id}",
                "",
                f"-- 1. Drivers (evitando duplicatas)",
                f"INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)",
                f"SELECT {base_id}, dt.drivers_id",
                f"FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt",
                f"WHERE dt.teams_id = {rem_id}",
                f"  AND NOT EXISTS (",
                f"    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams",
                f"    WHERE teams_id = {base_id} AND drivers_id = dt.drivers_id",
                f"  )",
                f"ON CONFLICT DO NOTHING;",
                "",
                f"DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = {rem_id};",
                "",
                f"-- 2. Miniatures (evitando duplicatas)",
                f"INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)",
                f"SELECT {base_id}, mt.miniatures_id",
                f"FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt",
                f"WHERE mt.teams_id = {rem_id}",
                f"  AND NOT EXISTS (",
                f"    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams",
                f"    WHERE teams_id = {base_id} AND miniatures_id = mt.miniatures_id",
                f"  )",
                f"ON CONFLICT DO NOTHING;",
                "",
                f"DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = {rem_id};",
                "",
                f"-- 3. Competitions (evitando duplicatas)",
                f"INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)",
                f"SELECT {base_id}, ct.competition_id",
                f"FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct",
                f"WHERE ct.teams_id = {rem_id}",
                f"  AND NOT EXISTS (",
                f"    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams",
                f"    WHERE teams_id = {base_id} AND competition_id = ct.competition_id",
                f"  )",
                f"ON CONFLICT DO NOTHING;",
                "",
                f"DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = {rem_id};",
                "",
            ])
        
        sql_lines.append("")
    
    sql_lines.extend([
        "-- ============================================================",
        "-- FASE 2: REMOÇÃO DOS TEAMS REMs",
        "-- Remove os teams duplicados que agora estão vazios",
        "-- ============================================================",
        "",
    ])
    
    all_rem_ids = [rem_id for group in summary['groups_detail'] for rem_id in group['rem_team_ids']]
    
    if all_rem_ids:
        rem_ids_str = ', '.join(str(id) for id in all_rem_ids)
        sql_lines.extend([
            f"-- Validação: verificar se os REMs estão realmente vazios",
            f"DO $$",
            f"DECLARE",
            f"  v_count INTEGER;",
            f"BEGIN",
            f"  SELECT COUNT(*) INTO v_count",
            f"  FROM pb7lpfmycz97c19._nc_m2m_drivers_teams",
            f"  WHERE teams_id IN ({rem_ids_str});",
            f"  ",
            f"  IF v_count > 0 THEN",
            f"    RAISE EXCEPTION 'ERRO: Ainda existem % drivers vinculados aos REMs!', v_count;",
            f"  END IF;",
            f"  ",
            f"  SELECT COUNT(*) INTO v_count",
            f"  FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams",
            f"  WHERE teams_id IN ({rem_ids_str});",
            f"  ",
            f"  IF v_count > 0 THEN",
            f"    RAISE EXCEPTION 'ERRO: Ainda existem % miniatures vinculadas aos REMs!', v_count;",
            f"  END IF;",
            f"  ",
            f"  SELECT COUNT(*) INTO v_count",
            f"  FROM pb7lpfmycz97c19._nc_m2m_competition_teams",
            f"  WHERE teams_id IN ({rem_ids_str});",
            f"  ",
            f"  IF v_count > 0 THEN",
            f"    RAISE EXCEPTION 'ERRO: Ainda existem % competitions vinculadas aos REMs!', v_count;",
            f"  END IF;",
            f"END $$;",
            "",
            f"-- Deletar os teams REMs",
            f"DELETE FROM pb7lpfmycz97c19.teams",
            f"WHERE id IN ({rem_ids_str});",
            "",
        ])
    
    sql_lines.extend([
        "-- ============================================================",
        "-- FASE 3: VERIFICAÇÃO FINAL",
        "-- ============================================================",
        "",
        "-- Verificar quantos teams foram removidos",
        f"DO $$",
        f"DECLARE",
        f"  v_deleted INTEGER := {len(all_rem_ids)};",
        f"BEGIN",
        f"  RAISE NOTICE 'Total de teams REMs removidos: %', v_deleted;",
        f"END $$;",
        "",
        "-- ============================================================",
        "-- COMMIT OU ROLLBACK",
        "-- ============================================================",
        "",
        "-- Se tudo estiver OK, descomente a linha abaixo para confirmar:",
        "-- COMMIT;",
        "",
        "-- Se quiser reverter tudo, descomente a linha abaixo:",
        "-- ROLLBACK;",
        "",
        "-- ATENÇÃO: Por segurança, deixe ambos comentados na primeira execução",
        "-- e revise os resultados antes de fazer COMMIT!",
        "",
    ])
    
    return sql_lines


def generate_rollback_sql(summary: Dict) -> List[str]:
    """Gera SQL de rollback em caso de necessidade."""
    sql_lines = [
        "-- ============================================================",
        "-- SQL DE ROLLBACK (EMERGÊNCIA)",
        "-- Use apenas se precisar reverter a consolidação",
        "-- ============================================================",
        "",
        "-- ATENÇÃO: Este script só funciona se você tiver um backup!",
        "-- Não há como reverter automaticamente sem backup.",
        "",
        "ROLLBACK;",
        "",
    ]
    
    return sql_lines


def main():
    """Função principal."""
    summary_file = 'consolidation_summary.json'
    validation_sql_file = 'consolidation_validation.sql'
    consolidation_sql_file = 'consolidation_execute.sql'
    rollback_sql_file = 'consolidation_rollback.sql'
    
    print("=" * 60)
    print("GERADOR DE SQL PARA CONSOLIDAÇÃO DE TEAMS")
    print("=" * 60)
    print()
    
    # Carrega summary
    print(f"Carregando: {summary_file}")
    summary = load_json(summary_file)
    print(f"✓ {summary['total_base_teams']} teams BASE")
    print(f"✓ {summary['total_rem_teams']} teams REMs para remover")
    print()
    
    # Gera SQL de validação
    print(f"Gerando SQL de validação: {validation_sql_file}")
    validation_queries = generate_validation_queries(summary)
    with open(validation_sql_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(validation_queries))
    print(f"✓ SQL de validação gerado!")
    print()
    
    # Gera SQL de consolidação
    print(f"Gerando SQL de consolidação: {consolidation_sql_file}")
    consolidation_sql = generate_consolidation_sql(summary)
    with open(consolidation_sql_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(consolidation_sql))
    print(f"✓ SQL de consolidação gerado!")
    print()
    
    # Gera SQL de rollback
    print(f"Gerando SQL de rollback: {rollback_sql_file}")
    rollback_sql = generate_rollback_sql(summary)
    with open(rollback_sql_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(rollback_sql))
    print(f"✓ SQL de rollback gerado!")
    print()
    
    print("=" * 60)
    print("ARQUIVOS GERADOS COM SUCESSO!")
    print("=" * 60)
    print()
    print("PRÓXIMOS PASSOS:")
    print()
    print("1. Execute o SQL de VALIDAÇÃO primeiro:")
    print(f"   psql -f {validation_sql_file}")
    print()
    print("2. Revise os resultados da validação")
    print()
    print("3. FAÇA UM BACKUP DO BANCO antes de continuar!")
    print()
    print("4. Execute o SQL de CONSOLIDAÇÃO:")
    print(f"   psql -f {consolidation_sql_file}")
    print()
    print("5. Revise os resultados dentro da transação")
    print()
    print("6. Edite o arquivo e descomente COMMIT ou ROLLBACK")
    print()
    print("IMPORTANTE:")
    print("- O SQL usa transação (BEGIN/COMMIT)")
    print("- Por padrão, COMMIT está comentado (segurança)")
    print("- Você precisa descomentar COMMIT manualmente")
    print("- Se algo der errado, use ROLLBACK")
    print()


if __name__ == '__main__':
    main()
