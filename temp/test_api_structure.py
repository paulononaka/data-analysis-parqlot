#!/usr/bin/env python3
"""
Script de teste para entender a estrutura da API NocoDB
"""

import requests
import json

# NocoDB Configuration
NOCO_BASE_URL = "https://nocodb-production-ac4d.up.railway.app/api/v2/tables"
NOCO_TOKEN = "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"
TABLE_ID = 'm79j3ka924fu8bs'  # teams table

def test_get_team_by_id():
    """Testa buscar um team por ID (sabemos que Cadillac = 18)"""
    print("\n" + "="*80)
    print("TESTE 1: Buscar team por ID (18 = Cadillac)")
    print("="*80)
    
    url = f"{NOCO_BASE_URL}/{TABLE_ID}/records/18"
    headers = {"xc-token": NOCO_TOKEN}
    
    try:
        response = requests.get(url, headers=headers, timeout=30)
        response.raise_for_status()
        result = response.json()
        
        print("\n✓ Resposta da API:")
        print(json.dumps(result, indent=2, ensure_ascii=False))
        
        print("\n✓ Campos disponíveis:")
        for key in result.keys():
            print(f"  - {key}: {type(result[key]).__name__}")
        
    except Exception as e:
        print(f"\n✗ Erro: {e}")


def test_search_team_by_name_v1():
    """Testa buscar team por nome - Versão 1: sem aspas"""
    print("\n" + "="*80)
    print("TESTE 2: Buscar team por nome - WHERE sem aspas")
    print("="*80)
    
    url = f"{NOCO_BASE_URL}/{TABLE_ID}/records"
    headers = {"xc-token": NOCO_TOKEN}
    params = {
        "where": "(team,eq,Cadillac)",
        "limit": 5
    }
    
    print(f"\nURL: {url}")
    print(f"Params: {params}")
    
    try:
        response = requests.get(url, headers=headers, params=params, timeout=30)
        response.raise_for_status()
        result = response.json()
        
        print("\n✓ Resposta da API:")
        print(json.dumps(result, indent=2, ensure_ascii=False))
        
        records = result.get('list', [])
        print(f"\n✓ Total de registros encontrados: {len(records)}")
        
    except Exception as e:
        print(f"\n✗ Erro: {e}")
        if hasattr(e, 'response') and e.response:
            print(f"Response text: {e.response.text}")


def test_search_team_by_name_v2():
    """Testa buscar team por nome - Versão 2: com aspas simples"""
    print("\n" + "="*80)
    print("TESTE 3: Buscar team por nome - WHERE com aspas simples")
    print("="*80)
    
    url = f"{NOCO_BASE_URL}/{TABLE_ID}/records"
    headers = {"xc-token": NOCO_TOKEN}
    params = {
        "where": "(team,eq,'Cadillac')",
        "limit": 5
    }
    
    print(f"\nURL: {url}")
    print(f"Params: {params}")
    
    try:
        response = requests.get(url, headers=headers, params=params, timeout=30)
        response.raise_for_status()
        result = response.json()
        
        print("\n✓ Resposta da API:")
        print(json.dumps(result, indent=2, ensure_ascii=False))
        
        records = result.get('list', [])
        print(f"\n✓ Total de registros encontrados: {len(records)}")
        
    except Exception as e:
        print(f"\n✗ Erro: {e}")
        if hasattr(e, 'response') and e.response:
            print(f"Response text: {e.response.text}")


def test_list_teams():
    """Lista os primeiros teams para ver a estrutura"""
    print("\n" + "="*80)
    print("TESTE 4: Listar primeiros 5 teams")
    print("="*80)
    
    url = f"{NOCO_BASE_URL}/{TABLE_ID}/records"
    headers = {"xc-token": NOCO_TOKEN}
    params = {
        "limit": 5,
        "fields": "id,team"
    }
    
    try:
        response = requests.get(url, headers=headers, params=params, timeout=30)
        response.raise_for_status()
        result = response.json()
        
        print("\n✓ Resposta da API:")
        print(json.dumps(result, indent=2, ensure_ascii=False))
        
        records = result.get('list', [])
        print(f"\n✓ Estrutura dos registros:")
        if records:
            for record in records:
                print(f"  - ID: {record.get('id')} | Team: {record.get('team')}")
        
    except Exception as e:
        print(f"\n✗ Erro: {e}")


def test_create_team():
    """Testa criar um team de teste"""
    print("\n" + "="*80)
    print("TESTE 5: Criar team de teste")
    print("="*80)
    
    url = f"{NOCO_BASE_URL}/{TABLE_ID}/records"
    headers = {"xc-token": NOCO_TOKEN}
    payload = {
        "team": "TEST_TEAM_DELETE_ME"
    }
    
    print(f"\nURL: {url}")
    print(f"Payload: {json.dumps(payload, indent=2)}")
    
    try:
        response = requests.post(url, headers=headers, json=payload, timeout=30)
        response.raise_for_status()
        result = response.json()
        
        print("\n✓ Resposta da API:")
        print(json.dumps(result, indent=2, ensure_ascii=False))
        
        print("\n✓ Campos retornados:")
        for key in result.keys():
            print(f"  - {key}: {result[key]}")
        
        # Tentar deletar o team criado
        if 'id' in result or 'Id' in result:
            team_id = result.get('id') or result.get('Id')
            print(f"\n→ Deletando team de teste (ID: {team_id})...")
            delete_url = f"{NOCO_BASE_URL}/{TABLE_ID}/records"
            delete_payload = {"Id": team_id}
            delete_response = requests.delete(delete_url, headers=headers, json=delete_payload, timeout=30)
            if delete_response.status_code in [200, 204]:
                print("✓ Team de teste deletado com sucesso")
            else:
                print(f"! Não foi possível deletar: {delete_response.text}")
        
    except Exception as e:
        print(f"\n✗ Erro: {e}")
        if hasattr(e, 'response') and e.response:
            print(f"Response text: {e.response.text}")


def main():
    print("\n" + "="*80)
    print("ANÁLISE DA ESTRUTURA DA API NOCODB - TABELA TEAMS")
    print("="*80)
    
    # Executar todos os testes
    test_get_team_by_id()
    test_search_team_by_name_v1()
    test_search_team_by_name_v2()
    test_list_teams()
    test_create_team()
    
    print("\n" + "="*80)
    print("TESTES CONCLUÍDOS")
    print("="*80)


if __name__ == '__main__':
    main()
