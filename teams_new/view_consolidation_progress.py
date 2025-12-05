#!/usr/bin/env python3
"""
Script para visualizar o progresso da consolidação de forma amigável
"""

import json
from pathlib import Path
from datetime import datetime

PROGRESS_FILE = 'consolidation_grouped_progress.json'
ERRORS_FILE = 'consolidation_grouped_errors.json'
SUMMARY_FILE = 'consolidation_grouped_summary.json'


def view_progress():
    """Visualiza o progresso atual"""
    print("=" * 80)
    print("PROGRESSO DA CONSOLIDAÇÃO")
    print("=" * 80)
    print()
    
    if not Path(PROGRESS_FILE).exists():
        print("❌ Nenhum progresso encontrado")
        return
    
    with open(PROGRESS_FILE, 'r') as f:
        progress = json.load(f)
    
    total = len(progress)
    completed = sum(1 for p in progress.values() if p.get('status') == 'completed')
    with_errors = sum(1 for p in progress.values() if p.get('status') == 'completed_with_errors')
    in_progress = sum(1 for p in progress.values() if p.get('status') == 'in_progress')
    
    print(f"📊 Total de grupos processados: {total}")
    print(f"✅ Concluídos com sucesso: {completed}")
    print(f"⚠️  Concluídos com erros: {with_errors}")
    print(f"🔄 Em progresso: {in_progress}")
    print()
    
    # Estatísticas gerais
    total_miniatures = 0
    total_drivers = 0
    total_competitions = 0
    total_teams_deleted = 0
    
    for group_name, data in progress.items():
        stats = data.get('stats') or data.get('current_stats', {})
        total_miniatures += stats.get('miniatures_moved', 0)
        total_drivers += stats.get('drivers_moved', 0)
        total_competitions += stats.get('competitions_moved', 0)
        total_teams_deleted += stats.get('teams_deleted', 0)
    
    print("📈 Estatísticas totais:")
    print(f"  - Miniatures movidas: {total_miniatures}")
    print(f"  - Drivers movidos: {total_drivers}")
    print(f"  - Competitions movidas: {total_competitions}")
    print(f"  - Teams deletados: {total_teams_deleted}")
    print()
    
    # Grupos com erros
    if with_errors > 0:
        print("⚠️  Grupos com erros:")
        for group_name, data in progress.items():
            if data.get('status') == 'completed_with_errors':
                stats = data.get('stats', {})
                errors = stats.get('errors', [])
                print(f"\n  📁 {group_name}")
                print(f"     Base ID: {data.get('base_id')}")
                print(f"     REMs processados: {data.get('rems_processed', 0)}")
                print(f"     Erros ({len(errors)}):")
                for error in errors[:3]:  # Mostrar apenas os 3 primeiros
                    print(f"       - {error}")
                if len(errors) > 3:
                    print(f"       ... e mais {len(errors) - 3} erros")
        print()


def view_errors():
    """Visualiza os erros salvos"""
    print("=" * 80)
    print("ERROS DA CONSOLIDAÇÃO")
    print("=" * 80)
    print()
    
    if not Path(ERRORS_FILE).exists():
        print("✅ Nenhum erro encontrado")
        return
    
    with open(ERRORS_FILE, 'r') as f:
        errors = json.load(f)
    
    if not errors:
        print("✅ Nenhum erro encontrado")
        return
    
    print(f"❌ Total de grupos com erros: {len(errors)}")
    print()
    
    for i, error_data in enumerate(errors, 1):
        print(f"{i}. Grupo: {error_data.get('group_name')}")
        print(f"   Timestamp: {error_data.get('timestamp')}")
        print(f"   Base ID: {error_data.get('base_id')}")
        
        if 'errors' in error_data:
            error_list = error_data['errors']
            print(f"   Erros ({len(error_list)}):")
            for err in error_list[:5]:
                print(f"     - {err}")
            if len(error_list) > 5:
                print(f"     ... e mais {len(error_list) - 5} erros")
        elif 'error' in error_data:
            print(f"   Erro: {error_data['error']}")
        
        print()


def view_summary():
    """Visualiza o resumo final"""
    print("=" * 80)
    print("RESUMO FINAL DA CONSOLIDAÇÃO")
    print("=" * 80)
    print()
    
    if not Path(SUMMARY_FILE).exists():
        print("❌ Resumo final não encontrado (consolidação ainda não concluída)")
        return
    
    with open(SUMMARY_FILE, 'r') as f:
        summary = json.load(f)
    
    print(f"📅 Data: {summary.get('timestamp')}")
    print()
    print(f"📊 Total de grupos: {summary.get('total_groups')}")
    print(f"✅ Processados: {summary.get('processed')}")
    print(f"✅ Sucesso: {summary.get('successful')}")
    print(f"❌ Falhas: {summary.get('failed')}")
    print()
    
    stats = summary.get('statistics', {})
    print("📈 Estatísticas:")
    print(f"  - Miniatures movidas: {stats.get('miniatures_moved', 0)}")
    print(f"  - Drivers movidos: {stats.get('drivers_moved', 0)}")
    print(f"  - Competitions movidas: {stats.get('competitions_moved', 0)}")
    print(f"  - Teams deletados: {stats.get('teams_deleted', 0)}")
    print()


def main():
    import sys
    
    if len(sys.argv) > 1:
        command = sys.argv[1]
        if command == 'progress':
            view_progress()
        elif command == 'errors':
            view_errors()
        elif command == 'summary':
            view_summary()
        else:
            print(f"Comando desconhecido: {command}")
            print("Uso: python view_consolidation_progress.py [progress|errors|summary]")
    else:
        # Mostrar tudo
        view_progress()
        print()
        view_errors()
        print()
        view_summary()


if __name__ == '__main__':
    main()
