#!/usr/bin/env python3
"""
Script para verificar o status da atualização de tipos (FIGURES e ACCESSORIES)
"""

import os
import json
from datetime import datetime
from pathlib import Path


SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
INPUT_JSON_PATH = os.path.join(os.path.dirname(SCRIPT_DIR), "figures_accessories_to_update.json")
SUCCESS_LOG_PATH = os.path.join(SCRIPT_DIR, "type_update_success_log.json")
FAILURE_LOG_PATH = os.path.join(SCRIPT_DIR, "type_update_failure_log.json")
PROGRESS_LOG_PATH = os.path.join(SCRIPT_DIR, "type_update_progress_log.json")


def load_json_file(filepath):
    """Carrega arquivo JSON"""
    if os.path.exists(filepath):
        try:
            with open(filepath, 'r', encoding='utf-8') as f:
                return json.load(f)
        except Exception as e:
            print(f"[e] Erro ao carregar {filepath}: {e}")
    return None


def main():
    print("="*70)
    print("STATUS DA ATUALIZAÇÃO DE TIPOS - FIGURES E ACCESSORIES")
    print("="*70)
    
    # Carrega dados de entrada
    input_data = load_json_file(INPUT_JSON_PATH)
    if not input_data:
        print("[e] Não foi possível carregar o arquivo de entrada")
        return
    
    metadata = input_data.get('metadata', {})
    updates = input_data.get('updates', {})
    
    total_figures = len(updates.get('figures', []))
    total_accessories = len(updates.get('accessories', []))
    total_to_update = total_figures + total_accessories
    
    print(f"\n📊 DADOS DE ENTRADA")
    print(f"  Arquivo: {Path(INPUT_JSON_PATH).name}")
    print(f"  Gerado em: {metadata.get('generated_at', 'N/A')}")
    print(f"  Total de Figures: {total_figures}")
    print(f"  Total de Accessories: {total_accessories}")
    print(f"  Total a atualizar: {total_to_update}")
    
    # Carrega logs
    success_log = load_json_file(SUCCESS_LOG_PATH)
    failure_log = load_json_file(FAILURE_LOG_PATH)
    progress_log = load_json_file(PROGRESS_LOG_PATH)
    
    # Estatísticas de sucesso
    success_count = len(success_log) if success_log else 0
    
    if success_log:
        figures_success = sum(1 for v in success_log.values() if v.get('category') == 'figures')
        accessories_success = sum(1 for v in success_log.values() if v.get('category') == 'accessories')
    else:
        figures_success = 0
        accessories_success = 0
    
    # Estatísticas de falha
    failure_count = len(failure_log) if failure_log else 0
    
    # Calcula pendentes
    pending = total_to_update - success_count - failure_count
    
    print(f"\n✅ SUCESSOS: {success_count}")
    print(f"  Figures atualizados: {figures_success}")
    print(f"  Accessories atualizados: {accessories_success}")
    
    if failure_count > 0:
        print(f"\n❌ FALHAS: {failure_count}")
        print(f"  Arquivo de falhas: {Path(FAILURE_LOG_PATH).name}")
    
    print(f"\n⏳ PENDENTES: {pending}")
    
    # Progresso percentual
    if total_to_update > 0:
        progress_pct = (success_count / total_to_update) * 100
        print(f"\n📈 PROGRESSO: {progress_pct:.2f}%")
        
        # Barra de progresso visual
        bar_length = 50
        filled = int(bar_length * success_count / total_to_update)
        bar = '█' * filled + '░' * (bar_length - filled)
        print(f"  [{bar}] {success_count}/{total_to_update}")
    
    # Informações do último progresso
    if progress_log:
        print(f"\n🕐 ÚLTIMO PROGRESSO")
        print(f"  Timestamp: {progress_log.get('timestamp', 'N/A')}")
        print(f"  Processados: {progress_log.get('processed', 0)}")
        print(f"  Sucessos: {progress_log.get('success', 0)}")
        print(f"  Falhas: {progress_log.get('failures', 0)}")
        print(f"  Restantes: {progress_log.get('remaining', 0)}")
        
        if progress_log.get('completed'):
            print(f"  Status: ✓ COMPLETO")
        else:
            print(f"  Status: ⏳ EM PROGRESSO")
    
    # Detalhes de falhas (se houver)
    if failure_log and len(failure_log) > 0:
        print(f"\n❌ DETALHES DAS FALHAS (últimas 10)")
        for i, failure in enumerate(failure_log[-10:], 1):
            print(f"\n  {i}. ID: {failure.get('id', 'N/A')}")
            print(f"     Erro: {failure.get('error', 'N/A')}")
            print(f"     Timestamp: {failure.get('timestamp', 'N/A')}")
    
    print("\n" + "="*70)
    print(f"\n📁 ARQUIVOS DE LOG")
    print(f"  Sucessos: {SUCCESS_LOG_PATH}")
    print(f"  Falhas: {FAILURE_LOG_PATH}")
    print(f"  Progresso: {PROGRESS_LOG_PATH}")
    print()


if __name__ == '__main__':
    main()
