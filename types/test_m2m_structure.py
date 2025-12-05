#!/usr/bin/env python3
"""
Script para testar a estrutura da tabela m2m e descobrir como fazer UPDATE
"""

import requests
import json


def test_m2m_table():
    base_url = "https://nocodb-production-ac4d.up.railway.app/api/v2"
    headers = {"xc-token": "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"}
    
    # Testa buscar um registro específico da tabela m2m
    # Vamos usar a tabela de miniaturas para buscar o link
    miniature_id = 320955  # Primeiro ID da lista de figures
    
    print("="*70)
    print("TESTANDO ESTRUTURA DA TABELA M2M")
    print("="*70)
    
    # Busca a miniatura para ver como está o relacionamento
    miniatures_url = f"{base_url}/tables/mv2tjpu2nye7jfv/records"
    
    try:
        # Busca a miniatura específica
        response = requests.get(
            f"{miniatures_url}/{miniature_id}",
            headers=headers,
            timeout=10
        )
        
        if response.status_code == 200:
            data = response.json()
            print(f"\n✓ Miniatura {miniature_id} encontrada:")
            print(json.dumps(data, indent=2))
        else:
            print(f"\n✗ Erro ao buscar miniatura: {response.status_code}")
            print(response.text)
    
    except Exception as e:
        print(f"\n✗ Erro: {e}")


if __name__ == '__main__':
    test_m2m_table()
