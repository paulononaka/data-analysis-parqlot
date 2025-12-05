# Estrutura do Banco de Dados - Teams e Relações

## Schema
`pb7lpfmycz97c19`

## Tabelas Principais

### 1. **teams**
Tabela principal de times/equipes.

**Colunas:**
- `id` (integer, PK) - Identificador único do time
- `team` (text) - Nome do time
- `teamIcon` (text) - URL/JSON do ícone do time
- `created_at` (timestamp) - Data de criação
- `updated_at` (timestamp) - Data de atualização
- `created_by` (varchar) - Usuário que criou
- `updated_by` (varchar) - Usuário que atualizou
- `nc_order` (numeric) - Ordem de exibição

---

### 2. **drivers**
Tabela de pilotos.

**Colunas:**
- `id` (integer, PK) - Identificador único do piloto
- `driver` (text) - Nome do piloto
- `seasonsCompleted` (text) - Temporadas completadas
- `championships` (text) - Campeonatos vencidos
- `overview` (text) - Visão geral/biografia
- `created_at` (timestamp) - Data de criação
- `updated_at` (timestamp) - Data de atualização
- `created_by` (varchar) - Usuário que criou
- `updated_by` (varchar) - Usuário que atualizou
- `nc_order` (numeric) - Ordem de exibição

---

### 3. **miniatures**
Tabela de miniaturas/modelos.

**Colunas:**
- `id` (integer, PK) - Identificador único da miniatura
- `rawData` (text) - Dados brutos
- `model` (text) - Modelo da miniatura
- `brand` (text) - Marca
- `sku` (text) - Código SKU
- `scale` (text) - Escala (ex: 1:18, 1:43)
- `year` (text) - Ano
- `season` (text) - Temporada
- `additionalInfo` (text) - Informações adicionais
- `images` (text) - JSON array com URLs das imagens
- `created_at` (timestamp) - Data de criação
- `updated_at` (timestamp) - Data de atualização

---

### 4. **competitions**
Tabela de competições.

**Colunas:**
- `id` (integer, PK) - Identificador único da competição
- `competition` (text) - Nome curto da competição
- `competitionFullName` (text) - Nome completo da competição
- `competitionIcon` (text) - JSON com ícone da competição
- `competitionImage` (text) - JSON com imagem da competição
- `created_at` (timestamp) - Data de criação
- `updated_at` (timestamp) - Data de atualização
- `created_by` (varchar) - Usuário que criou
- `updated_by` (varchar) - Usuário que atualizou
- `nc_order` (numeric) - Ordem de exibição

---

## Tabelas de Relacionamento (Many-to-Many)

### 1. **_nc_m2m_drivers_teams**
Relaciona drivers (pilotos) com teams (times).

**Colunas:**
- `teams_id` (integer, FK → teams.id)
- `drivers_id` (integer, FK → drivers.id)

**Relação:** Um time pode ter múltiplos pilotos, e um piloto pode ter corrido por múltiplos times.

---

### 2. **_nc_m2m_miniatures_teams**
Relaciona miniatures (miniaturas) com teams (times).

**Colunas:**
- `teams_id` (integer, FK → teams.id)
- `miniatures_id` (integer, FK → miniatures.id)

**Relação:** Um time pode ter múltiplas miniaturas, e uma miniatura pode estar relacionada a múltiplos times.

---

### 3. **_nc_m2m_competition_teams**
Relaciona competitions (competições) com teams (times).

**Colunas:**
- `teams_id` (integer, FK → teams.id)
- `competition_id` (integer, FK → competitions.id)

**Relação:** Um time pode participar de múltiplas competições, e uma competição pode ter múltiplos times.

---

## Diagrama de Relacionamentos

```
┌─────────────┐
│   teams     │
│  (id, team) │
└──────┬──────┘
       │
       ├─────────────────────────────────────┐
       │                                     │
       │                                     │
┌──────▼──────────────────┐         ┌───────▼──────────────────┐
│ _nc_m2m_drivers_teams   │         │ _nc_m2m_miniatures_teams │
│  (teams_id, drivers_id) │         │ (teams_id, miniatures_id)│
└──────┬──────────────────┘         └───────┬──────────────────┘
       │                                     │
       │                                     │
┌──────▼──────┐                     ┌───────▼──────────┐
│   drivers   │                     │   miniatures     │
│ (id, driver)│                     │  (id, model)     │
└─────────────┘                     └──────────────────┘

       │
       │
┌──────▼────────────────────┐
│ _nc_m2m_competition_teams │
│ (teams_id, competition_id)│
└──────┬────────────────────┘
       │
       │
┌──────▼────────────┐
│   competitions    │
│ (id, competition) │
└───────────────────┘
```

---

## Exemplo de Uso

### Buscar time "Renault" com todas as relações:

```sql
SELECT 
  t.id,
  t.team as teamName,
  jsonb_build_object(
    'drivers', [...],
    'miniatures', [...],
    'competitions', [...]
  ) as data
FROM pb7lpfmycz97c19.teams t
WHERE t.team = 'Renault';
```

### Resultado:
```json
{
  "id": 1,
  "teamName": "Renault",
  "data": {
    "drivers": [
      {"id": 3112, "driver": "Fernando Alonso", ...},
      {"id": 3725, "driver": "Alain Prost", ...}
    ],
    "miniatures": [
      {"id": 6595, "model": "EXPRESS VAN 1985", ...},
      {"id": 6751, "model": "T480 TRACTOR TRUCK", ...}
    ],
    "competitions": [
      {"id": 1, "competition": "Formula 1", ...}
    ]
  }
}
```

---

## Estatísticas de Exemplo (Time Renault)

- **Total de Drivers:** 32 pilotos
- **Total de Miniatures:** 3,772 miniaturas
- **Total de Competitions:** 1 competição (Formula 1)

---

## Notas Técnicas

1. **NocoDB:** O prefixo `_nc_m2m_` indica que são tabelas de relacionamento gerenciadas pelo NocoDB
2. **JSON Fields:** Campos como `images`, `competitionIcon` são armazenados como strings JSON
3. **Case Sensitivity:** Campos com camelCase precisam estar entre aspas duplas nas queries
4. **COALESCE:** Usado para garantir que arrays vazios retornem `[]` ao invés de `null`
5. **jsonb_agg:** Função PostgreSQL para agregar múltiplos registros em um array JSON
