# Atualização de Tipos - Figures e Accessories

Este conjunto de scripts identifica e atualiza miniaturas que devem ter seus tipos alterados de "vehicle" para "figures" ou "accessories".

## 📋 Visão Geral

### Tipos Corretos
- **Figures**: `type_id = 3`
- **Accessories**: `type_id = 4`

### Critérios de Identificação
Miniaturas que contêm no campo `rawData`:
- `FIGURES -` (ou variações: `Figures -`, `figures -`)
- `ACCESSORIES -` (ou variações: `Accessories -`, `accessories -`)

## 🔧 Scripts Disponíveis

### 1. `identify_figures_accessories.py`
**Propósito**: Identifica registros que precisam ter o tipo atualizado.

**Entrada**: `miniatures_202512051123.json`

**Saída**: `figures_accessories_to_update.json`

**Uso**:
```bash
python3 dados_normalizados/identify_figures_accessories.py
```

**Resultado**:
- Identifica todos os registros com FIGURES ou ACCESSORIES
- Gera arquivo JSON com IDs e informações para atualização
- Mostra estatísticas de quantos registros foram encontrados

---

### 2. `patch_types_figures_accessories.py`
**Propósito**: Atualiza os tipos no NocoDB via API usando PATCH.

**Entrada**: `figures_accessories_to_update.json`

**Saída**: 
- `type_update_success_log.json` - Registros atualizados com sucesso
- `type_update_failure_log.json` - Registros que falharam
- `type_update_progress_log.json` - Progresso da atualização

**Uso**:
```bash
python3 patch_types_figures_accessories.py
```

**Características**:
- ✅ Usa PATCH na tabela de miniaturas (mantém histórico no NocoDB)
- ✅ NocoDB gerencia automaticamente a tabela m2m
- ✅ Processamento paralelo com 10 threads
- ✅ Retomada automática (não reprocessa sucessos)
- ✅ Logs separados para sucessos e falhas
- ✅ Barra de progresso em tempo real
- ✅ Salvamento incremental do progresso

**Método**:
- Faz PATCH no campo `miniature_type` da tabela de miniaturas
- O NocoDB atualiza automaticamente a tabela `_nc_m2m_miniatures_miniature_type`
- O histórico é preservado em todas as operações

---

### 3. `check_type_update_status.py`
**Propósito**: Verifica o status da atualização.

**Uso**:
```bash
python3 dados_normalizados/check_type_update_status.py
```

**Mostra**:
- 📊 Total de registros a atualizar
- ✅ Quantos foram atualizados com sucesso
- ❌ Quantos falharam
- ⏳ Quantos estão pendentes
- 📈 Percentual de progresso
- 🕐 Informações do último progresso
- 📁 Localização dos arquivos de log

## 📊 Estatísticas

Com base no arquivo `figures_accessories_to_update.json`:

- **Total de registros analisados**: 182,011
- **Figures encontrados**: 2,236
- **Accessories encontrados**: 2,250
- **Total a atualizar**: 4,486

## 🔄 Fluxo de Trabalho

1. **Identificação** (já executado):
   ```bash
   python3 dados_normalizados/identify_figures_accessories.py
   ```
   ✅ Gerou: `figures_accessories_to_update.json`

2. **Atualização**:
   ```bash
   python3 dados_normalizados/patch_types_figures_accessories.py
   ```
   - Atualiza os tipos via API
   - Pode ser interrompido e retomado
   - Salva logs de sucesso e falha

3. **Verificação**:
   ```bash
   python3 dados_normalizados/check_type_update_status.py
   ```
   - Mostra progresso atual
   - Lista falhas (se houver)

## 📁 Estrutura de Arquivos

```
teams_normalize/
├── miniatures_202512051123.json              # Dados originais
├── figures_accessories_to_update.json        # IDs para atualizar
└── dados_normalizados/
    ├── identify_figures_accessories.py       # Script 1: Identificação
    ├── patch_types_figures_accessories.py    # Script 2: Atualização
    ├── check_type_update_status.py           # Script 3: Status
    ├── type_update_success_log.json          # Log de sucessos
    ├── type_update_failure_log.json          # Log de falhas
    └── type_update_progress_log.json         # Progresso atual
```

## 🛡️ Segurança e Confiabilidade

- **Thread-safe**: Usa locks para evitar race conditions
- **Retomável**: Não reprocessa registros já atualizados
- **Logs detalhados**: Mantém histórico completo
- **Tratamento de erros**: Captura e registra todas as falhas
- **Progresso incremental**: Salva a cada 50 registros

## ⚠️ Notas Importantes

1. O script usa a mesma API e credenciais do `patch_on_noco.py`
2. Processa 10 registros em paralelo por padrão
3. Timeout de 10 segundos por requisição
4. Logs são salvos automaticamente durante a execução
5. É seguro interromper e retomar a execução

## 🔍 Exemplo de Registro

```json
{
  "id": 320955,
  "rawData": "FIGURES - F1 PIT-STOP SAUBER 2002 CAMBIO GOMME POSTERIORE - FIGURES",
  "current_type": null,
  "target_type_id": 3,
  "category": "figures"
}
```

## 📞 Troubleshooting

### Se houver falhas:
1. Execute `check_type_update_status.py` para ver detalhes
2. Verifique `type_update_failure_log.json`
3. Execute novamente `patch_types_figures_accessories.py` (ele retoma automaticamente)

### Para reiniciar do zero:
```bash
rm dados_normalizados/type_update_success_log.json
rm dados_normalizados/type_update_failure_log.json
rm dados_normalizados/type_update_progress_log.json
```
