# Changelog - Atualização de Tipos via API

## ✅ Mudanças Implementadas

### Antes
- ❌ Tentava fazer POST direto na tabela m2m `_nc_m2m_miniatures_miniature_type`
- ❌ Não mantinha histórico no NocoDB
- ❌ Erro: tabela m2m não encontrada nas APIs públicas

### Agora
- ✅ Usa **PATCH na tabela de miniaturas** (`mv2tjpu2nye7jfv`)
- ✅ **Mantém o histórico** no NocoDB automaticamente
- ✅ NocoDB gerencia a tabela m2m internamente
- ✅ Método oficial e recomendado pelo NocoDB

## 🔧 Como Funciona

### Payload do PATCH
```python
{
    "Id": miniature_id,           # ID da miniatura
    "miniature_type": type_id     # Novo tipo (3=Figures, 4=Accessories)
}
```

### Endpoint
```
PATCH https://nocodb-production-ac4d.up.railway.app/api/v2/tables/mv2tjpu2nye7jfv/records
```

### Processo
1. Script lê `figures_accessories_to_update.json`
2. Para cada miniatura:
   - Faz PATCH atualizando o campo `miniature_type`
   - NocoDB atualiza automaticamente a tabela m2m
   - Histórico é mantido
3. Salva logs de sucesso/falha

## 📊 Dados
- **Figures**: 2,236 registros → `miniature_type = 3`
- **Accessories**: 2,250 registros → `miniature_type = 4`
- **Total**: 4,486 atualizações

## 🚀 Como Executar

```bash
python3 patch_types_figures_accessories.py
```

### Características
- ✅ Processamento paralelo (10 threads)
- ✅ Retomada automática (não reprocessa sucessos)
- ✅ Logs separados (sucesso, falha, progresso)
- ✅ Barra de progresso em tempo real
- ✅ Thread-safe

## 📁 Arquivos Gerados
- `type_update_success_log.json` - Registros atualizados com sucesso
- `type_update_failure_log.json` - Registros que falharam
- `type_update_progress_log.json` - Progresso atual

## ⚠️ Importante
- O campo correto é `miniature_type` (não `type`)
- O NocoDB gerencia a tabela m2m automaticamente
- O histórico é mantido em todas as operações
- Pode ser interrompido e retomado a qualquer momento
