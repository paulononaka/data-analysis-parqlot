import json
import os

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
FAILURE_LOG_PATH = os.path.join(SCRIPT_DIR, "update_failure_log.json")

def analyze_failures():
    """Analisa os primeiros 20 registros de falha"""
    
    with open(FAILURE_LOG_PATH, 'r', encoding='utf-8') as f:
        failures = json.load(f)
    
    print(f"Total de falhas: {len(failures)}")
    print("\n" + "="*80)
    print("ANÁLISE DOS PRIMEIROS 20 REGISTROS")
    print("="*80 + "\n")
    
    issues = {
        'race_number_null': 0,
        'model_with_parentheses': 0,
        'model_with_special_chars': 0,
        'long_model_names': 0,
        'empty_model': 0
    }
    
    for i, failure in enumerate(failures[:20]):
        record = failure.get('record', {})
        noco_id = record.get('noco_id')
        model = record.get('model_normalized', '')
        race_number = record.get('raceNumber')
        
        print(f"\n[{i+1}] ID: {noco_id}")
        print(f"    Model: {model}")
        print(f"    Race Number: {race_number}")
        print(f"    Payload: {failure.get('payload')}")
        
        # Identifica problemas
        problems = []
        
        if race_number is None:
            issues['race_number_null'] += 1
            problems.append("raceNumber é null")
        
        if '(' in model or ')' in model:
            issues['model_with_parentheses'] += 1
            problems.append("Model contém parênteses")
        
        if any(char in model for char in ['-', '/', '&']):
            issues['model_with_special_chars'] += 1
            problems.append("Model contém caracteres especiais")
        
        if len(model) > 50:
            issues['long_model_names'] += 1
            problems.append(f"Model muito longo ({len(model)} chars)")
        
        if not model or model.strip() == '':
            issues['empty_model'] += 1
            problems.append("Model vazio")
        
        if problems:
            print(f"    ⚠️  Problemas: {', '.join(problems)}")
    
    print("\n" + "="*80)
    print("RESUMO DOS PROBLEMAS (primeiros 20)")
    print("="*80)
    for issue, count in issues.items():
        print(f"  {issue}: {count}")
    
    # Análise completa
    print("\n" + "="*80)
    print("ANÁLISE COMPLETA (todos os registros)")
    print("="*80)
    
    all_issues = {
        'race_number_null': 0,
        'model_with_parentheses': 0,
        'model_with_special_chars': 0,
        'long_model_names': 0,
        'empty_model': 0,
        'noco_id_missing': 0
    }
    
    for failure in failures:
        record = failure.get('record', {})
        model = record.get('model_normalized', '')
        race_number = record.get('raceNumber')
        noco_id = record.get('noco_id')
        
        if not noco_id:
            all_issues['noco_id_missing'] += 1
        
        if race_number is None:
            all_issues['race_number_null'] += 1
        
        if '(' in model or ')' in model:
            all_issues['model_with_parentheses'] += 1
        
        if any(char in model for char in ['-', '/', '&']):
            all_issues['model_with_special_chars'] += 1
        
        if len(model) > 50:
            all_issues['long_model_names'] += 1
        
        if not model or model.strip() == '':
            all_issues['empty_model'] += 1
    
    for issue, count in all_issues.items():
        percentage = (count / len(failures)) * 100
        print(f"  {issue}: {count} ({percentage:.1f}%)")

if __name__ == "__main__":
    analyze_failures()
