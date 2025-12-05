# Gerador de Relatório de Duplicatas com Dados Completos

Este script Python gera um relatório JSON detalhado de todas as equipes duplicadas no banco de dados, incluindo todos os dados relacionados (drivers, miniatures, competitions, etc).

## 📋 Requisitos

```bash
pip install psycopg2-binary
```

## ⚙️ Configuração

### Opção 1: Variáveis de Ambiente (Recomendado)

```bash
export DB_HOST=seu_host
export DB_PORT=5432
export DB_NAME=pb7lpfmycz97c19
export DB_USER=seu_usuario
export DB_PASSWORD=sua_senha
```

### Opção 2: Arquivo .env

1. Copie o arquivo de exemplo:
   ```bash
   cp .env.example .env
   ```

2. Edite `.env` com suas credenciais

3. Instale python-dotenv:
   ```bash
   pip install python-dotenv
   ```

4. Adicione no início do script:
   ```python
   from dotenv import load_dotenv
   load_dotenv()
   ```

### Opção 3: Editar o Script Diretamente

Edite o dicionário `DB_CONFIG` no arquivo `generate_duplicates_with_data.py`:

```python
DB_CONFIG = {
    'host': 'seu_host',
    'port': '5432',
    'database': 'pb7lpfmycz97c19',
    'user': 'seu_usuario',
    'password': 'sua_senha'
}
```

## 🚀 Uso

```bash
python generate_duplicates_with_data.py
```

O script irá:
1. Conectar ao banco de dados
2. Buscar todos os times
3. Identificar duplicatas (times com nomes normalizados iguais)
4. Para cada time duplicado, buscar:
   - Drivers relacionados
   - Miniatures relacionadas
   - Competitions relacionadas
   - Estatísticas (totais)
5. Gerar o arquivo `teams_duplicates_with_data.json`

## 📄 Estrutura do JSON Gerado

```json
{
  "total_duplicate_groups": 251,
  "generated_at": "2025-11-20T12:37:00.000000",
  "duplicate_groups": [
    {
      "normalized_key": "mercedesbenz",
      "teams": [
        {
          "id": 31,
          "name": "Mercedes-Benz",
          "teamIcon": null,
          "nc_order": 30,
          "created_at": "2025-02-05T16:19:35.000000",
          "updated_at": "2025-06-11T12:42:39.000000",
          "data": {
            "drivers": [
              {
                "id": 3112,
                "driver": "Lewis Hamilton",
                "seasonsCompleted": "2007–present",
                "championships": "(7) 2008, 2014, 2015, 2017, 2018, 2019, 2020",
                "overview": ""
              }
            ],
            "miniatures": [
              {
                "id": 6595,
                "model": "300 SL",
                "brand": "Mercedes-Benz",
                "sku": "MB001",
                "scale": "1:18",
                "year": "1954",
                "season": null,
                "additionalInfo": null,
                "images": "[...]"
              }
            ],
            "competitions": [
              {
                "id": 1,
                "competition": "Formula 1",
                "competitionFullName": "FIA F1 World Championship",
                "competitionIcon": "[...]",
                "competitionImage": "[...]"
              }
            ],
            "statistics": {
              "totalDrivers": 15,
              "totalMiniatures": 250,
              "totalCompetitions": 3
            }
          }
        },
        {
          "id": 7521,
          "name": "Mercedes Benz",
          "teamIcon": null,
          "nc_order": 7519,
          "created_at": "2025-02-05T16:19:35.000000",
          "updated_at": "2025-06-11T12:42:39.000000",
          "data": {
            "drivers": [],
            "miniatures": [
              {
                "id": 8901,
                "model": "C-Class",
                "brand": "Mercedes Benz",
                "sku": "MB002",
                "scale": "1:43",
                "year": "2020",
                "season": null,
                "additionalInfo": null,
                "images": "[...]"
              }
            ],
            "competitions": [],
            "statistics": {
              "totalDrivers": 0,
              "totalMiniatures": 5,
              "totalCompetitions": 0
            }
          }
        }
      ]
    }
  ]
}
```

## 🔍 Como Usar o Relatório

O relatório gerado permite:

1. **Comparar dados entre duplicatas**: Veja lado a lado os dados de cada equipe duplicada
2. **Decidir qual manter**: Baseado em:
   - Quantidade de drivers
   - Quantidade de miniatures
   - Quantidade de competitions
   - Data de criação/atualização
3. **Planejar merge**: Identifique quais dados precisam ser mesclados antes de deletar duplicatas

## 💡 Dicas

- O script pode demorar alguns minutos dependendo do tamanho do banco
- Monitore o progresso no console
- O arquivo JSON pode ser grande (vários MB)
- Use um visualizador JSON para facilitar a análise (ex: jq, VS Code)

## 🛠️ Troubleshooting

### Erro de conexão
```
psycopg2.OperationalError: could not connect to server
```
**Solução**: Verifique as credenciais e se o PostgreSQL está rodando

### Erro de permissão
```
psycopg2.errors.InsufficientPrivilege
```
**Solução**: Verifique se o usuário tem permissão de leitura nas tabelas

### Memória insuficiente
```
MemoryError
```
**Solução**: Processe em lotes ou aumente a memória disponível

## 📊 Exemplo de Saída no Console

```
================================================================================
GERADOR DE RELATÓRIO DE DUPLICATAS COM DADOS COMPLETOS
================================================================================

Conectando ao banco de dados...
Buscando todos os times...
Total de times encontrados: 9500
Identificando duplicatas...
Total de grupos duplicados: 251
Buscando dados completos de cada time duplicado...
  Processando grupo 1/251: mercedesbenz (2 times)
    - Buscando dados do time ID 31: Mercedes-Benz
    - Buscando dados do time ID 7521: Mercedes Benz
  Processando grupo 2/251: 2seasmotorsport (2 times)
    - Buscando dados do time ID 56: 2 Seas Motorsport
    - Buscando dados do time ID 62: 2seas Motorsport
  ...

Salvando resultado em teams_duplicates_with_data.json...

✅ Relatório gerado com sucesso!
📄 Arquivo: teams_duplicates_with_data.json
📊 Total de grupos duplicados: 251
👥 Total de times duplicados: 520

📋 Exemplos de grupos duplicados:

  • mercedesbenz:
    - ID 31: Mercedes-Benz
      Drivers: 15, Miniatures: 250, Competitions: 3
    - ID 7521: Mercedes Benz
      Drivers: 0, Miniatures: 5, Competitions: 0

  ... e mais 246 grupos

🔌 Conexão com banco de dados fechada.
```
