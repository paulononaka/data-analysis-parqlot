#!/usr/bin/env python3
"""
Script para analisar e consolidar drivers duplicados
- Identifica se são o mesmo driver (baseado em championships/anos)
- Identifica se são drivers diferentes com mesmo nome
- Identifica duplicatas vazias
- Verifica referências antes de deletar
- Consolida referências quando necessário
"""

import requests
import json
from typing import Dict, List, Optional, Tuple, Set
from datetime import datetime
from collections import defaultdict

# NocoDB Configuration
NOCO_BASE_URL = "https://nocodb-production-ac4d.up.railway.app/api/v2/tables"
NOCO_TOKEN = "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"

# Table IDs
TABLE_IDS = {
    'drivers': 'my38ymolrk7iz0d',
    'miniatures': 'mv2tjpu2nye7jfv',
    'teams': 'm79j3ka924fu8bs',
    'competitions': 'm40hlwz0dsyudob'
}

# Column IDs para os links
DRIVERS_COLUMN_IDS = {
    'miniatures': 'c2mzrwlkfqxpgr1',  # Campo 'drivers' em miniatures
    'teams': 'c6rqk8ilsebxk4q',       # Campo 'drivers' em teams
    'competitions': 'cjqwqe7tnfxbhxr'  # Campo 'drivers' em competitions
}


def safe_request(method: str, url: str, headers: Dict, json_data: Optional[Dict] = None, params: Optional[Dict] = None) -> Optional[Dict]:
    """Faz requisição HTTP com tratamento de erros"""
    try:
        if method.upper() == "GET":
            response = requests.get(url, headers=headers, params=params, timeout=30)
        elif method.upper() == "POST":
            response = requests.post(url, headers=headers, json=json_data, timeout=30)
        elif method.upper() == "DELETE":
            response = requests.delete(url, headers=headers, timeout=30)
        else:
            print(f"[e] Método não suportado: {method}")
            return None
        
        response.raise_for_status()
        try:
            return response.json()
        except ValueError:
            return {"success": True}
    except Exception as e:
        print(f"[e] Erro na requisição: {e}")
        return None


def get_all_drivers() -> List[Dict]:
    """Busca todos os drivers do banco"""
    print("[→] Buscando todos os drivers...")
    table_id = TABLE_IDS['drivers']
    url = f"{NOCO_BASE_URL}/{table_id}/records"
    headers = {"xc-token": NOCO_TOKEN}
    
    all_drivers = []
    offset = 0
    limit = 10000
    
    while True:
        params = {"limit": limit, "offset": offset}
        result = safe_request("GET", url, headers, params=params)
        
        if not result or 'list' not in result:
            break
        
        drivers = result['list']
        if not drivers:
            break
        
        all_drivers.extend(drivers)
        print(f"  [i] Carregados {len(all_drivers)} drivers...")
        
        if len(drivers) < limit:
            break
        
        offset += limit
    
    print(f"[✓] Total de {len(all_drivers)} drivers carregados")
    return all_drivers


def get_driver_references(driver_id: int) -> Dict[str, List[int]]:
    """Busca todas as referências de um driver em outras tabelas"""
    references = {
        'miniatures': [],
        'teams': [],
        'competitions': []
    }
    
    # Buscar o driver completo para ver os relacionamentos
    table_id = TABLE_IDS['drivers']
    url = f"{NOCO_BASE_URL}/{table_id}/records/{driver_id}"
    headers = {"xc-token": NOCO_TOKEN}
    
    result = safe_request("GET", url, headers)
    if not result:
        return references
    
    # Miniatures
    miniatures_links = result.get('_nc_m2m_miniatures_drivers', [])
    if isinstance(miniatures_links, list):
        for link in miniatures_links:
            if isinstance(link, dict):
                mini_id = link.get('miniatures_id')
                if mini_id:
                    references['miniatures'].append(mini_id)
    
    # Teams
    teams_links = result.get('_nc_m2m_teams_drivers', [])
    if isinstance(teams_links, list):
        for link in teams_links:
            if isinstance(link, dict):
                team_id = link.get('teams_id')
                if team_id:
                    references['teams'].append(team_id)
    
    # Competitions
    competitions_links = result.get('_nc_m2m_competitions_drivers', [])
    if isinstance(competitions_links, list):
        for link in competitions_links:
            if isinstance(link, dict):
                comp_id = link.get('competitions_id')
                if comp_id:
                    references['competitions'].append(comp_id)
    
    return references


def extract_years_from_championships(championships_str: Optional[str]) -> Set[int]:
    """Extrai anos de uma string de championships"""
    if not championships_str:
        return set()
    
    years = set()
    # Procurar por padrões de ano (4 dígitos começando com 19 ou 20)
    import re
    year_pattern = r'\b(19\d{2}|20\d{2})\b'
    matches = re.findall(year_pattern, str(championships_str))
    
    for match in matches:
        years.add(int(match))
    
    return years


def analyze_duplicate_group(drivers: List[Dict]) -> Dict:
    """Analisa um grupo de drivers duplicados"""
    name = drivers[0].get('driver', 'UNKNOWN')
    
    analysis = {
        'name': name,
        'total': len(drivers),
        'drivers': [],
        'classification': 'unknown',
        'recommendation': '',
        'base_driver': None,
        'duplicates_to_merge': []
    }
    
    for driver in drivers:
        driver_id = driver.get('Id') or driver.get('id')
        championships = driver.get('championships')
        overview = driver.get('overview')
        created_at = driver.get('created_at')
        
        # Buscar referências
        references = get_driver_references(driver_id)
        total_refs = sum(len(refs) for refs in references.values())
        
        # Extrair anos
        years = extract_years_from_championships(championships)
        
        driver_info = {
            'id': driver_id,
            'championships': championships,
            'overview': overview,
            'created_at': created_at,
            'years': sorted(list(years)),
            'references': references,
            'total_references': total_refs,
            'is_empty': not championships and not overview
        }
        
        analysis['drivers'].append(driver_info)
    
    # Classificar o grupo
    analysis = classify_duplicate_group(analysis)
    
    return analysis


def classify_duplicate_group(analysis: Dict) -> Dict:
    """Classifica um grupo de duplicatas"""
    drivers = analysis['drivers']
    
    # Caso 1: Todas duplicatas vazias
    all_empty = all(d['is_empty'] for d in drivers)
    if all_empty:
        # Manter o mais antigo com referências, deletar os outros
        drivers_with_refs = [d for d in drivers if d['total_references'] > 0]
        
        if drivers_with_refs:
            # Ordenar por número de referências (desc) e data de criação (asc)
            drivers_with_refs.sort(key=lambda x: (-x['total_references'], x['created_at']))
            analysis['base_driver'] = drivers_with_refs[0]['id']
            analysis['duplicates_to_merge'] = [d['id'] for d in drivers if d['id'] != analysis['base_driver']]
        else:
            # Todos vazios sem referências, manter o mais antigo
            drivers.sort(key=lambda x: x['created_at'])
            analysis['base_driver'] = drivers[0]['id']
            analysis['duplicates_to_merge'] = [d['id'] for d in drivers[1:]]
        
        analysis['classification'] = 'empty_duplicates'
        analysis['recommendation'] = f"Manter driver ID {analysis['base_driver']} (mais antigo/com mais refs), deletar os outros"
        return analysis
    
    # Caso 2: Verificar se são o mesmo driver (anos se sobrepõem ou são complementares)
    all_years = set()
    for d in drivers:
        all_years.update(d['years'])
    
    # Se há anos, verificar sobreposição
    if all_years:
        # Verificar se os anos são complementares (sem sobreposição) ou se sobrepõem
        years_by_driver = [set(d['years']) for d in drivers if d['years']]
        
        if len(years_by_driver) >= 2:
            # Verificar sobreposição
            has_overlap = False
            for i in range(len(years_by_driver)):
                for j in range(i + 1, len(years_by_driver)):
                    if years_by_driver[i] & years_by_driver[j]:  # Interseção
                        has_overlap = True
                        break
                if has_overlap:
                    break
            
            if has_overlap:
                # Anos se sobrepõem - provavelmente mesmo driver
                # Escolher o mais completo (mais referências + mais informações)
                drivers.sort(key=lambda x: (
                    -x['total_references'],
                    -len(x.get('championships', '') or ''),
                    -len(x.get('overview', '') or ''),
                    x['created_at']
                ))
                
                analysis['base_driver'] = drivers[0]['id']
                analysis['duplicates_to_merge'] = [d['id'] for d in drivers[1:]]
                analysis['classification'] = 'same_driver'
                analysis['recommendation'] = f"Mesmo driver. Consolidar tudo no ID {analysis['base_driver']} (mais completo)"
            else:
                # Anos diferentes - podem ser drivers diferentes (pai/filho, homônimos)
                analysis['classification'] = 'different_drivers_same_name'
                analysis['recommendation'] = "REVISAR MANUALMENTE - Podem ser drivers diferentes (anos não se sobrepõem)"
        else:
            # Apenas um tem anos, considerar mesmo driver
            drivers.sort(key=lambda x: (
                -len(x['years']),
                -x['total_references'],
                x['created_at']
            ))
            
            analysis['base_driver'] = drivers[0]['id']
            analysis['duplicates_to_merge'] = [d['id'] for d in drivers[1:]]
            analysis['classification'] = 'same_driver'
            analysis['recommendation'] = f"Provavelmente mesmo driver. Consolidar no ID {analysis['base_driver']}"
    else:
        # Sem anos para comparar, usar heurística de referências e completude
        drivers.sort(key=lambda x: (
            -x['total_references'],
            -len(x.get('championships', '') or ''),
            -len(x.get('overview', '') or ''),
            x['created_at']
        ))
        
        analysis['base_driver'] = drivers[0]['id']
        analysis['duplicates_to_merge'] = [d['id'] for d in drivers[1:]]
        analysis['classification'] = 'likely_same_driver'
        analysis['recommendation'] = f"Provavelmente mesmo driver (sem anos para comparar). Consolidar no ID {analysis['base_driver']}"
    
    return analysis


def main():
    print("=" * 80)
    print("ANÁLISE DE DRIVERS DUPLICADOS")
    print("=" * 80)
    print()
    
    # Carregar drivers
    all_drivers = get_all_drivers()
    
    # Agrupar por nome
    print("\n[→] Agrupando drivers por nome...")
    drivers_by_name = defaultdict(list)
    for driver in all_drivers:
        name = driver.get('driver')
        if name:
            drivers_by_name[name].append(driver)
    
    # Filtrar apenas duplicatas
    duplicates = {name: drivers for name, drivers in drivers_by_name.items() if len(drivers) > 1}
    print(f"[✓] Encontrados {len(duplicates)} nomes com duplicatas")
    print()
    
    # Analisar cada grupo
    print("[→] Analisando grupos de duplicatas...")
    print()
    
    analyses = []
    for idx, (name, drivers) in enumerate(duplicates.items(), 1):
        print(f"[{idx}/{len(duplicates)}] Analisando '{name}' ({len(drivers)} registros)...")
        analysis = analyze_duplicate_group(drivers)
        analyses.append(analysis)
    
    print()
    print("=" * 80)
    print("RESUMO DA ANÁLISE")
    print("=" * 80)
    
    # Estatísticas
    by_classification = defaultdict(list)
    for analysis in analyses:
        by_classification[analysis['classification']].append(analysis)
    
    print(f"\nTotal de grupos analisados: {len(analyses)}")
    print(f"\nPor classificação:")
    for classification, items in by_classification.items():
        print(f"  - {classification}: {len(items)} grupos")
    
    # Salvar relatório detalhado
    report_file = 'drivers_analysis_report.json'
    print(f"\n[→] Salvando relatório detalhado em '{report_file}'...")
    
    with open(report_file, 'w', encoding='utf-8') as f:
        json.dump({
            'timestamp': datetime.now().isoformat(),
            'total_groups': len(analyses),
            'statistics': {k: len(v) for k, v in by_classification.items()},
            'analyses': analyses
        }, f, indent=2, ensure_ascii=False)
    
    print(f"[✓] Relatório salvo!")
    
    # Criar relatório de ações recomendadas
    actions_file = 'drivers_consolidation_plan.txt'
    print(f"\n[→] Criando plano de consolidação em '{actions_file}'...")
    
    with open(actions_file, 'w', encoding='utf-8') as f:
        f.write("PLANO DE CONSOLIDAÇÃO DE DRIVERS DUPLICADOS\n")
        f.write("=" * 80 + "\n\n")
        
        # Ações automáticas (seguras)
        f.write("AÇÕES AUTOMÁTICAS (Seguras para consolidar):\n")
        f.write("-" * 80 + "\n\n")
        
        auto_count = 0
        for analysis in analyses:
            if analysis['classification'] in ['empty_duplicates', 'same_driver']:
                auto_count += 1
                f.write(f"{auto_count}. '{analysis['name']}' ({analysis['total']} registros)\n")
                f.write(f"   Classificação: {analysis['classification']}\n")
                f.write(f"   Base: ID {analysis['base_driver']}\n")
                f.write(f"   Mesclar: {analysis['duplicates_to_merge']}\n")
                f.write(f"   Recomendação: {analysis['recommendation']}\n\n")
        
        # Revisão manual
        f.write("\n" + "=" * 80 + "\n")
        f.write("REVISÃO MANUAL NECESSÁRIA:\n")
        f.write("-" * 80 + "\n\n")
        
        manual_count = 0
        for analysis in analyses:
            if analysis['classification'] in ['different_drivers_same_name', 'likely_same_driver', 'unknown']:
                manual_count += 1
                f.write(f"{manual_count}. '{analysis['name']}' ({analysis['total']} registros)\n")
                f.write(f"   Classificação: {analysis['classification']}\n")
                f.write(f"   Recomendação: {analysis['recommendation']}\n")
                
                for driver in analysis['drivers']:
                    f.write(f"\n   Driver ID {driver['id']}:\n")
                    f.write(f"     - Anos: {driver['years']}\n")
                    f.write(f"     - Referências: {driver['total_references']} ")
                    f.write(f"(miniatures: {len(driver['references']['miniatures'])}, ")
                    f.write(f"teams: {len(driver['references']['teams'])}, ")
                    f.write(f"competitions: {len(driver['references']['competitions'])})\n")
                    f.write(f"     - Championships: {driver['championships'][:100] if driver['championships'] else 'N/A'}...\n")
                
                f.write("\n")
        
        f.write(f"\nTotal de ações automáticas: {auto_count}\n")
        f.write(f"Total para revisão manual: {manual_count}\n")
    
    print(f"[✓] Plano de consolidação salvo!")
    
    print("\n" + "=" * 80)
    print("ANÁLISE CONCLUÍDA!")
    print("=" * 80)
    print(f"\nArquivos gerados:")
    print(f"  1. {report_file} - Relatório completo em JSON")
    print(f"  2. {actions_file} - Plano de ações em texto")
    print(f"\nPróximos passos:")
    print(f"  1. Revisar o plano de consolidação")
    print(f"  2. Executar consolidação automática para casos seguros")
    print(f"  3. Revisar manualmente os casos marcados para revisão")


if __name__ == "__main__":
    main()