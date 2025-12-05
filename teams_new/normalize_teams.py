#!/usr/bin/env python3
"""
Script para normalizar nomes de times seguindo as regras:
1. Primeira letra de cada palavra em maiúscula
2. Siglas maiúsculas seguidas de ponto final e espaço
3. Hífens e apóstrofos mantêm capitalização após eles (O'Connor, Aston-Martin)
"""

import json
import re
from collections import defaultdict


def normalize_team_name(name):
    """
    Normaliza o nome do time seguindo as regras:
    1. Primeira letra de cada palavra em maiúscula
    2. Abreviações formatadas como "M. K. H."
    3. Palavras conectadas por hífen têm ambas as primeiras letras maiúsculas
    4. Remove espaços extras (mantém hífens como estão)
    5. Mantém capitalização correta após apóstrofos
    """
    if not name or not isinstance(name, str):
        return name
    
    # Remove espaços extras
    name = ' '.join(name.split())
    
    # Protege Jr., Sr., St., Dr., Inc., Ltd., Co. temporariamente
    name = re.sub(r'\b(Jr|Sr|St|Dr|Inc|Ltd|Co)\.', r'__\1__', name, flags=re.IGNORECASE)
    
    # Função para processar cada parte do nome
    def process_part(part):
        # Se for uma abreviação (1 letra seguida ou não de ponto)
        if re.match(r'^[a-zA-Z]\.?$', part):
            return part.upper()[0] + '.'
        # Se for Jr., Sr., St., Dr., Inc., Ltd., Co. protegido, restaura
        elif re.match(r'^__(Jr|Sr|St|Dr|Inc|Ltd|Co)__$', part, re.IGNORECASE):
            return part.replace('__', '').capitalize() + '.'
        # Se começar com Mc ou Mac, capitaliza corretamente (McDonald, MacArthur)
        elif re.match(r'^Ma?c[a-z]', part, re.IGNORECASE):
            if part.lower().startswith('mac'):
                return 'Mac' + part[3:].capitalize()
            else:  # Mc
                return 'Mc' + part[2:].capitalize()
        # Se for uma palavra normal
        else:
            return part.capitalize()
    
    # Separa abreviações coladas em palavras (R.Kissner -> R. Kissner)
    name = re.sub(r'\b([A-Za-z])\.([A-Za-z][a-z]+)', r'\1. \2', name)
    
    # Separa letras maiúsculas consecutivas sem pontos (MKH -> M K H)
    name = re.sub(r'\b([A-Z])([A-Z])([A-Z])(?=\s|$)', r'\1 \2 \3', name)
    name = re.sub(r'\b([A-Z])([A-Z])(?=\s[A-Z][a-z]|\s[a-z])', r'\1 \2', name)
    
    # Processa abreviações múltiplas juntas (ex: M.K.H -> M. K. H.)
    for _ in range(5):
        name = re.sub(r'\b([A-Za-z])\.?\s*([A-Za-z])\.\s*([A-Za-z])\.?(?=\s|$)', r'\1. \2. \3.', name)
        name = re.sub(r'\b([A-Za-z])\.?\s*([A-Za-z])\.(?=\s+[A-Za-z]{2,}|\s*$)', r'\1. \2.', name)
    
    # Remove espaços duplicados após a transformação
    name = ' '.join(name.split())
    
    # Converte todas as abreviações para maiúsculas
    def uppercase_abbreviation(match):
        return match.group(0).upper()
    
    name = re.sub(r'\b[a-z]\.', uppercase_abbreviation, name)
    
    # Divide o nome em partes, considerando apenas espaços
    parts = name.split()
    
    normalized_parts = []
    for part in parts:
        # Se a parte contém hífen, processa cada sub-parte separadamente
        if '-' in part:
            sub_parts = part.split('-')
            normalized_sub_parts = []
            for sp in sub_parts:
                sp = sp.strip()
                if sp:
                    # Se for uma abreviação (1 letra seguida ou não de ponto)
                    if re.match(r'^[a-zA-Z]\.?$', sp):
                        normalized_sub_parts.append(sp.upper()[0] + '.')
                    else:
                        # Capitaliza a primeira letra
                        normalized_sub_parts.append(sp.capitalize())
            normalized_parts.append('-'.join(normalized_sub_parts))
        # Se a parte contém apóstrofo, processa corretamente
        elif "'" in part:
            apo_parts = part.split("'")
            normalized_apo_parts = []
            for i, apo_part in enumerate(apo_parts):
                if apo_part.strip():
                    if i == 0:
                        # Primeira parte (antes do apóstrofo)
                        apo_part = apo_part.strip()
                        if len(apo_part) > 1:
                            normalized_apo_parts.append(apo_part.capitalize())
                        else:
                            normalized_apo_parts.append(apo_part.upper())
                    else:
                        # Partes após apóstrofo mantêm capitalização
                        normalized_apo_parts.append(apo_part.capitalize())
            normalized_parts.append("'".join(normalized_apo_parts))
        else:
            normalized_parts.append(process_part(part))
    
    result = ' '.join(normalized_parts)
    
    # Restaura Jr., Sr., St., Dr., Inc., Ltd., Co. protegidos
    result = re.sub(r'__([Jj][Rr])__', r'Jr.', result)
    result = re.sub(r'__([Ss][Rr])__', r'Sr.', result)
    result = re.sub(r'__([Ss][Tt])__', r'St.', result)
    result = re.sub(r'__([Dd][Rr])__', r'Dr.', result)
    result = re.sub(r'__([Ii][Nn][Cc])__', r'Inc.', result)
    result = re.sub(r'__([Ll][Tt][Dd])__', r'Ltd.', result)
    result = re.sub(r'__([Cc][Oo])__', r'Co.', result)
    
    # Remove espaços duplicados
    result = ' '.join(result.split())
    
    return result


def create_normalized_key(name):
    """
    Cria uma chave normalizada para comparação de nomes.
    Remove pontos, espaços, hífens e converte para minúsculas.
    """
    if not name or not isinstance(name, str):
        return ""
    
    # Remove pontos, espaços, hífens e converte para minúsculas
    key = re.sub(r'[.\s-]', '', name.lower())
    return key


def find_duplicates(teams):
    """
    Encontra times duplicados baseado em nomes normalizados.
    Retorna um dicionário com a chave normalizada e lista de times.
    """
    duplicates = defaultdict(list)
    
    for team in teams:
        name = team.get('team', '')
        normalized_key = create_normalized_key(name)
        
        if normalized_key:
            duplicates[normalized_key].append(team)
    
    # Filtra apenas os que têm duplicatas
    return {k: v for k, v in duplicates.items() if len(v) > 1}


def normalize_teams(input_file, output_file, duplicates_file):
    """
    Normaliza os nomes dos times e identifica duplicatas.
    """
    print(f"[i] Lendo arquivo: {input_file}")
    
    with open(input_file, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    teams = data.get('teams', [])
    print(f"[i] Total de times encontrados: {len(teams)}")
    
    # Normaliza os nomes
    print("\n[i] Normalizando nomes...")
    normalized_count = 0
    
    for team in teams:
        original_name = team.get('team', '')
        normalized_name = normalize_team_name(original_name)
        
        if original_name != normalized_name:
            normalized_count += 1
            print(f"  '{original_name}' -> '{normalized_name}'")
        
        team['team'] = normalized_name
    
    print(f"\n[i] Total de nomes normalizados: {normalized_count}")
    
    # Encontra duplicatas
    print("\n[i] Buscando duplicatas...")
    duplicates = find_duplicates(teams)
    
    if duplicates:
        print(f"[!] Encontradas {len(duplicates)} grupos de times duplicados:")
        
        duplicate_report = []
        for key, duplicate_teams in duplicates.items():
            print(f"\n  Grupo (chave: {key}):")
            group_info = {
                'normalized_key': key,
                'teams': []
            }
            
            for team in duplicate_teams:
                print(f"    - ID: {team['id']}, Nome: '{team['team']}'")
                group_info['teams'].append({
                    'id': team['id'],
                    'name': team['team'],
                    'nc_order': team.get('nc_order')
                })
            
            duplicate_report.append(group_info)
        
        # Salva relatório de duplicatas
        print(f"\n[i] Salvando relatório de duplicatas em: {duplicates_file}")
        with open(duplicates_file, 'w', encoding='utf-8') as f:
            json.dump({
                'total_duplicate_groups': len(duplicates),
                'duplicate_groups': duplicate_report
            }, f, indent=2, ensure_ascii=False)
    else:
        print("[✓] Nenhuma duplicata encontrada!")
    
    # Salva arquivo normalizado
    print(f"\n[i] Salvando arquivo normalizado em: {output_file}")
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
    
    print("\n[✓] Normalização concluída!")
    print(f"   - Arquivo normalizado: {output_file}")
    print(f"   - Relatório de duplicatas: {duplicates_file}")
    print(f"   - Total de nomes alterados: {normalized_count}")


if __name__ == "__main__":
    input_file = "teams.json"
    output_file = "teams_normalized.json"
    duplicates_file = "teams_duplicates_report.json"
    
    normalize_teams(input_file, output_file, duplicates_file)
