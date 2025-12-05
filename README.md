# data-analysis-parqlot

Projeto de análise e processamento de dados para o sistema Parqlot, uma plataforma de gerenciamento de competições de miniaturas de carros. Este repositório contém scripts Python para normalização de dados, consolidação de duplicatas, upload de dados para equipes e análise de falhas no processamento.

## Descrição

O Parqlot é um sistema de gerenciamento de competições de miniaturas de carros, envolvendo equipes (teams), motoristas (drivers), miniaturas (miniatures) e competições (competitions). Este projeto fornece ferramentas automatizadas para:

- Normalização de dados importados
- Identificação e consolidação de duplicatas
- Upload de dados para o banco NocoDB
- Análise de falhas no processamento
- Geração de SQL para estruturação de dados

## Funcionalidades

- **Normalização de Dados**: Scripts para converter e padronizar dados de diferentes fontes
- **Consolidação de Duplicatas**: Identificação e fusão de registros duplicados de equipes
- **Integração com NocoDB**: Upload e manipulação de dados via API REST
- **Análise de Falhas**: Ferramentas para investigar problemas no processamento de dados
- **Geração de SQL**: Scripts para criar estruturas de banco de dados

## Instalação

### Pré-requisitos

- Python 3.8 ou superior
- Acesso à instância NocoDB (se aplicável)

### Dependências

Instale as dependências necessárias:

```bash
pip install requests tqdm
```

### Configuração

1. Clone o repositório:
```bash
git clone <url-do-repositorio>
cd data-analysis-parqlot
```

2. Configure o ambiente virtual (opcional):
```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
# ou
venv\Scripts\activate     # Windows
```

3. Instale as dependências:
```bash
pip install -r requirements.txt  # se existir
# ou manualmente
pip install requests tqdm
```

## Estrutura do Projeto

```
data-analysis-parqlot/
├── dados_normalizados/          # Scripts de normalização de dados
│   ├── analyze_failures.py     # Análise de falhas no processamento
│   ├── convert_failures_to_normalized.py
│   └── ...
├── drivers/                     # Scripts relacionados a motoristas
├── old/                         # Scripts antigos/descontinuados
├── sql/                         # Scripts de geração de SQL
├── teams/                       # Scripts de processamento de equipes
├── teams_new/                   # Versão atualizada dos scripts de equipes
├── temp/                        # Arquivos temporários
├── types/                       # Scripts de processamento de tipos
├── upload_data_to_teams/        # Scripts de upload para NocoDB
├── venv/                        # Ambiente virtual
├── README.md                    # Este arquivo
└── .git/                        # Controle de versão
```

## Uso

### Exemplo: Análise de Falhas

Para analisar falhas no processamento de dados normalizados:

```bash
cd dados_normalizados
python analyze_failures.py
```

### Exemplo: Consolidação de Equipes Duplicadas

Para consolidar equipes duplicadas via API NocoDB:

```bash
cd upload_data_to_teams
python consolidate_teams_via_api.py
```

**Atenção**: Este script modifica o banco de dados de produção. Certifique-se de ter backups antes de executar.

### Configuração da API NocoDB

Alguns scripts requerem configuração da API NocoDB. Verifique os arquivos de configuração nos scripts relevantes para:

- URL da instância NocoDB
- Token de autenticação
- IDs das tabelas e colunas

## Scripts Principais

- `analyze_failures.py`: Analisa registros com falhas na normalização
- `consolidate_teams_via_api.py`: Consolida equipes duplicadas no NocoDB
- `normalize_teams.py`: Padroniza nomes de equipes
- `patch_on_noco.py`: Aplica correções via API NocoDB
- `generate_sql_for_types.py`: Gera SQL para estrutura de tipos

## Contribuição

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## Licença

Este projeto é distribuído sob a licença MIT. Consulte o arquivo LICENSE para mais detalhes.