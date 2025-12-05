#!/usr/bin/env python3
"""
Script para gerar SQL INSERT para a tabela _nc_m2m_miniatures_miniature_type
"""

import json
import os
from datetime import datetime


SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
INPUT_JSON_PATH = os.path.join(SCRIPT_DIR, "figures_accessories_to_update.json")
OUTPUT_SQL_PATH = os.path.join(SCRIPT_DIR, "insert_types_associations.sql")


def load_input_data():
    """Carrega dados do arquivo JSON de entrada"""
    try:
        with open(INPUT_JSON_PATH, 'r', encoding='utf-8') as f:
            return json.load(f)
    except FileNotFoundError:
        print(f"[e] Arquivo não encontrado: {INPUT_JSON_PATH}")
        return {}
    except json.JSONDecodeError as e:
        print(f"[e] Erro ao decodificar JSON: {e}")
        return {}


def generate_sql():
    """Gera SQL para inserir as associações"""
    
    data = load_input_data()
    
    if not data:
        print("[e] Não foi possível carregar os dados")
        return
    
    updates = data.get('updates', {})
    figures = updates.get('figures', [])
    accessories = updates.get('accessories', [])
    
    print("="*70)
    print("GERAÇÃO DE SQL PARA ASSOCIAÇÕES DE TIPOS")
    print("="*70)
    print(f"\nFigures: {len(figures)}")
    print(f"Accessories: {len(accessories)}")
    print(f"Total: {len(figures) + len(accessories)}")
    
    # Gera SQL
    sql_lines = []
    
    # Cabeçalho
    sql_lines.append("-- SQL para inserir associações de tipos em _nc_m2m_miniatures_miniature_type")
    sql_lines.append(f"-- Gerado em: {datetime.now().isoformat()}")
    sql_lines.append(f"-- Total de registros: {len(figures) + len(accessories)}")
    sql_lines.append("")
    sql_lines.append("-- Estrutura da tabela:")
    sql_lines.append("-- miniatures_id: ID da miniatura")
    sql_lines.append("-- miniature_type_id: ID do tipo (3=Figures, 4=Accessories)")
    sql_lines.append("")
    
    # Opção 1: UPDATE individual
    sql_lines.append("-- ============================================================")
    sql_lines.append("-- OPÇÃO 1: UPDATE INDIVIDUAL")
    sql_lines.append("-- Atualiza cada registro individualmente")
    sql_lines.append("-- ============================================================")
    sql_lines.append("")
    sql_lines.append("BEGIN;")
    sql_lines.append("")
    
    # Figures
    if figures:
        sql_lines.append("-- FIGURES (type_id = 3)")
        sql_lines.append(f"-- Total: {len(figures)} registros")
        sql_lines.append("")
        
        for item in figures:
            miniature_id = item.get('id')
            sql_lines.append(f"-- Miniatura ID: {miniature_id}")
            sql_lines.append(
                f"UPDATE _nc_m2m_miniatures_miniature_type "
                f"SET miniature_type_id = 3 "
                f"WHERE miniatures_id = {miniature_id};"
            )
            sql_lines.append("")
    
    # Accessories
    if accessories:
        sql_lines.append("-- ACCESSORIES (type_id = 4)")
        sql_lines.append(f"-- Total: {len(accessories)} registros")
        sql_lines.append("")
        
        for item in accessories:
            miniature_id = item.get('id')
            sql_lines.append(f"-- Miniatura ID: {miniature_id}")
            sql_lines.append(
                f"UPDATE _nc_m2m_miniatures_miniature_type "
                f"SET miniature_type_id = 4 "
                f"WHERE miniatures_id = {miniature_id};"
            )
            sql_lines.append("")
    
    sql_lines.append("COMMIT;")
    sql_lines.append("")
    
    # Opção 2: UPDATE direto (apenas atualiza registros existentes)
    sql_lines.append("")
    sql_lines.append("-- ============================================================")
    sql_lines.append("-- OPÇÃO 2: UPDATE DIRETO (Apenas atualiza existentes)")
    sql_lines.append("-- Atualiza apenas registros que já existem na tabela")
    sql_lines.append("-- ============================================================")
    sql_lines.append("")
    sql_lines.append("BEGIN;")
    sql_lines.append("")
    
    # Coleta todos os IDs
    figures_ids = [item.get('id') for item in figures] if figures else []
    accessories_ids = [item.get('id') for item in accessories] if accessories else []
    
    # UPDATE Figures em lote
    if figures_ids:
        sql_lines.append("-- Atualiza FIGURES em lote")
        sql_lines.append("UPDATE _nc_m2m_miniatures_miniature_type")
        sql_lines.append("SET miniature_type_id = 3")
        sql_lines.append(f"WHERE miniatures_id IN ({', '.join(map(str, figures_ids))});")
        sql_lines.append("")
    
    # UPDATE Accessories em lote
    if accessories_ids:
        sql_lines.append("-- Atualiza ACCESSORIES em lote")
        sql_lines.append("UPDATE _nc_m2m_miniatures_miniature_type")
        sql_lines.append("SET miniature_type_id = 4")
        sql_lines.append(f"WHERE miniatures_id IN ({', '.join(map(str, accessories_ids))});")
        sql_lines.append("")
    
    sql_lines.append("COMMIT;")
    sql_lines.append("")
    
    # Opção 3: Verificação antes de inserir
    sql_lines.append("")
    sql_lines.append("-- ============================================================")
    sql_lines.append("-- OPÇÃO 3: VERIFICAÇÃO E ESTATÍSTICAS")
    sql_lines.append("-- ============================================================")
    sql_lines.append("")
    sql_lines.append("-- Verificar quantos registros já existem")
    sql_lines.append("SELECT COUNT(*) as total_existentes")
    sql_lines.append("FROM _nc_m2m_miniatures_miniature_type")
    sql_lines.append("WHERE miniature_type_id IN (3, 4);")
    sql_lines.append("")
    sql_lines.append("-- Verificar duplicatas antes de inserir")
    sql_lines.append("SELECT miniatures_id, COUNT(*) as count")
    sql_lines.append("FROM _nc_m2m_miniatures_miniature_type")
    sql_lines.append("WHERE miniature_type_id IN (3, 4)")
    sql_lines.append("GROUP BY miniatures_id")
    sql_lines.append("HAVING COUNT(*) > 1;")
    sql_lines.append("")
    sql_lines.append("-- Após executar os INSERTs, verificar o total")
    sql_lines.append("SELECT ")
    sql_lines.append("    miniature_type_id,")
    sql_lines.append("    COUNT(*) as total")
    sql_lines.append("FROM _nc_m2m_miniatures_miniature_type")
    sql_lines.append("WHERE miniature_type_id IN (3, 4)")
    sql_lines.append("GROUP BY miniature_type_id;")
    sql_lines.append("")
    
    # Salva o arquivo SQL
    sql_content = "\n".join(sql_lines)
    
    with open(OUTPUT_SQL_PATH, 'w', encoding='utf-8') as f:
        f.write(sql_content)
    
    print(f"\n✓ SQL gerado com sucesso!")
    print(f"  Arquivo: {OUTPUT_SQL_PATH}")
    print(f"\n📊 Estatísticas:")
    print(f"  - Figures: {len(figures)} INSERTs")
    print(f"  - Accessories: {len(accessories)} INSERTs")
    print(f"  - Total de linhas SQL: {len(sql_lines)}")
    
    # Mostra preview
    print(f"\n📝 Preview (primeiras 20 linhas):")
    print("-" * 70)
    for line in sql_lines[:20]:
        print(line)
    print("...")
    print("-" * 70)
    
    print(f"\n💡 Como usar:")
    print(f"  1. Conecte-se ao banco de dados PostgreSQL do NocoDB")
    print(f"  2. Execute o arquivo SQL: {OUTPUT_SQL_PATH}")
    print(f"  3. Escolha uma das 3 opções disponíveis no arquivo:")
    print(f"     - Opção 1: UPDATE individual (atualiza linha por linha)")
    print(f"     - Opção 2: UPDATE em lote (atualiza tudo de uma vez, RECOMENDADO)")
    print(f"     - Opção 3: Queries de verificação (antes e depois)")
    print(f"\n⚠️  IMPORTANTE:")
    print(f"  - Ambas as opções apenas ATUALIZAM registros existentes")
    print(f"  - Não inserem novos registros, apenas mudam o miniature_type_id")
    print(f"  - Use transações (BEGIN/COMMIT) para garantir atomicidade")
    print(f"  - Recomendado: Execute a Opção 3 antes e depois para verificar")
    print(f"\n✅ RECOMENDAÇÃO: Use a Opção 2 (UPDATE em lote) - é a mais rápida!")


def main():
    generate_sql()


if __name__ == '__main__':
    main()
