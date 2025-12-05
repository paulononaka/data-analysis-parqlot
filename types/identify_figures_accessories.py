#!/usr/bin/env python3
"""
Script para identificar miniaturas com FIGURES ou ACCESSORIES no rawData
e salvar seus IDs para atualização de tipo.

Figures devem ter type_id = 3
Accessories devem ter type_id = 4
"""

import json
import re
from pathlib import Path
from datetime import datetime


def load_json_data(filepath):
    """Carrega dados do arquivo JSON."""
    with open(filepath, 'r', encoding='utf-8') as f:
        return json.load(f)


def save_json_data(data, filepath):
    """Salva dados em arquivo JSON."""
    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2, ensure_ascii=False)


def identify_figures_and_accessories(miniatures_data):
    """
    Identifica miniaturas que contêm FIGURES ou ACCESSORIES no rawData.
    
    Args:
        miniatures_data: Lista de miniaturas do JSON
        
    Returns:
        dict: Dicionário com listas de IDs para figures e accessories
    """
    figures_ids = []
    accessories_ids = []
    
    # Padrões para busca (case-insensitive)
    # Aceita: "FIGURES -", "Figures -", "figures -"
    figures_pattern = re.compile(r'\bFIGURES\s*-', re.IGNORECASE)
    accessories_pattern = re.compile(r'\bACCESSORIES\s*-', re.IGNORECASE)
    
    for miniature in miniatures_data:
        raw_data = miniature.get('rawData', '')
        miniature_id = miniature.get('id')
        
        if not raw_data or not miniature_id:
            continue
        
        # Verifica se contém FIGURES
        if figures_pattern.search(raw_data):
            figures_ids.append({
                'id': miniature_id,
                'rawData': raw_data,
                'current_type': miniature.get('type'),
                'target_type_id': 3
            })
        
        # Verifica se contém ACCESSORIES
        if accessories_pattern.search(raw_data):
            accessories_ids.append({
                'id': miniature_id,
                'rawData': raw_data,
                'current_type': miniature.get('type'),
                'target_type_id': 4
            })
    
    return {
        'figures': figures_ids,
        'accessories': accessories_ids
    }


def main():
    # Caminhos dos arquivos
    base_dir = Path(__file__).parent.parent
    input_file = base_dir / 'miniatures_202512051123.json'
    output_file = base_dir / 'dados_normalizados' / 'figures_accessories_to_update.json'
    
    print(f"Carregando dados de: {input_file}")
    
    # Carrega os dados
    data = load_json_data(input_file)
    miniatures = data.get('miniatures', [])
    
    print(f"Total de miniaturas: {len(miniatures)}")
    
    # Identifica figures e accessories
    print("\nIdentificando FIGURES e ACCESSORIES...")
    results = identify_figures_and_accessories(miniatures)
    
    # Estatísticas
    figures_count = len(results['figures'])
    accessories_count = len(results['accessories'])
    
    print(f"\n✓ FIGURES encontrados: {figures_count}")
    print(f"✓ ACCESSORIES encontrados: {accessories_count}")
    print(f"✓ Total de registros para atualizar: {figures_count + accessories_count}")
    
    # Prepara dados para salvar
    output_data = {
        'metadata': {
            'generated_at': datetime.now().isoformat(),
            'source_file': str(input_file.name),
            'total_miniatures_analyzed': len(miniatures),
            'figures_found': figures_count,
            'accessories_found': accessories_count,
            'total_to_update': figures_count + accessories_count
        },
        'type_mapping': {
            'figures': {
                'type_id': 3,
                'description': 'Figures type'
            },
            'accessories': {
                'type_id': 4,
                'description': 'Accessories type'
            }
        },
        'updates': {
            'figures': results['figures'],
            'accessories': results['accessories']
        }
    }
    
    # Salva resultado
    print(f"\nSalvando resultados em: {output_file}")
    save_json_data(output_data, output_file)
    
    print("\n" + "="*60)
    print("RESUMO")
    print("="*60)
    print(f"Arquivo de saída: {output_file}")
    print(f"\nFIGURES (type_id=3): {figures_count} registros")
    if figures_count > 0:
        print("Primeiros 5 IDs:", [item['id'] for item in results['figures'][:5]])
    
    print(f"\nACCESSORIES (type_id=4): {accessories_count} registros")
    if accessories_count > 0:
        print("Primeiros 5 IDs:", [item['id'] for item in results['accessories'][:5]])
    
    print("\n✓ Script concluído com sucesso!")


if __name__ == '__main__':
    main()
