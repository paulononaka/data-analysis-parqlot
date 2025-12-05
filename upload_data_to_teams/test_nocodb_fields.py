#!/usr/bin/env python3
"""
Script para testar e descobrir os nomes corretos dos campos no NocoDB
"""

import requests
import json

# NocoDB Configuration
NOCO_BASE_URL = "https://nocodb-production-ac4d.up.railway.app/api/v2/tables"
NOCO_TOKEN = "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"

TABLE_IDS = {
    'teams': 'm79j3ka924fu8bs',
    'miniatures': 'mv2tjpu2nye7jfv',
    'drivers': 'my38ymolrk7iz0d',
    'competitions': 'm40hlwz0dsyudob'
}

def test_get_record(table_name: str, record_id: int):
    """Busca um registro e mostra todos os campos"""
    print(f"\n{'='*80}")
    print(f"Testando tabela: {table_name.upper()} (ID: {record_id})")
    print(f"{'='*80}")
    
    table_id = TABLE_IDS[table_name]
    url = f"{NOCO_BASE_URL}/{table_id}/records/{record_id}"
    headers = {"xc-token": NOCO_TOKEN}
    
    try:
        response = requests.get(url, headers=headers, timeout=30)
        response.raise_for_status()
        data = response.json()
        
        print(f"\n✓ Registro encontrado!")
        print(f"\nCampos disponíveis:")
        print(json.dumps(data, indent=2, ensure_ascii=False))
        
        # Procura por campos que podem ser relacionamentos
        print(f"\n{'='*80}")
        print("Campos que podem ser relacionamentos (listas ou objetos):")
        print(f"{'='*80}")
        for key, value in data.items():
            if isinstance(value, (list, dict)):
                print(f"\n  • {key}: {type(value).__name__}")
                if isinstance(value, list) and len(value) > 0:
                    print(f"    Exemplo: {value[0]}")
                elif isinstance(value, dict):
                    print(f"    Keys: {list(value.keys())}")
        
        return data
        
    except requests.exceptions.HTTPError as e:
        print(f"\n✗ Erro HTTP: {e}")
        if hasattr(e.response, 'text'):
            print(f"Response: {e.response.text}")
    except Exception as e:
        print(f"\n✗ Erro: {e}")
    
    return None


def main():
    print("="*80)
    print("TESTE DE CAMPOS DO NOCODB")
    print("="*80)
    
    # Testa uma miniatura que sabemos que tem teams
    # ID 7493 da miniatura Porsche do exemplo
    print("\n1. Testando MINIATURE (ID 7493)")
    miniature_data = test_get_record('miniatures', 7493)
    
    # Testa um team
    print("\n\n2. Testando TEAM (ID 6929)")
    team_data = test_get_record('teams', 6929)
    
    # Testa um driver (se houver)
    print("\n\n3. Testando DRIVER (ID 1 - exemplo)")
    driver_data = test_get_record('drivers', 1)
    
    print("\n" + "="*80)
    print("ANÁLISE COMPLETA")
    print("="*80)
    
    if miniature_data:
        print("\n📋 Campos de relacionamento encontrados na MINIATURE:")
        for key in miniature_data.keys():
            value = miniature_data[key]
            if isinstance(value, list) and len(value) > 0:
                if isinstance(value[0], dict):
                    print(f"  • {key}: lista de objetos")
                    print(f"    Keys do primeiro item: {list(value[0].keys())}")


if __name__ == '__main__':
    main()
