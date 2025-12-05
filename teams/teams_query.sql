-- ============================================================================
-- QUERY PARA OBTER TODAS AS REFERÊNCIAS RELACIONADAS A UM TIME
-- ============================================================================
-- Esta query retorna todos os dados de um time incluindo:
-- - Informações básicas do time (id, nome, ícone)
-- - Todos os pilotos (drivers) relacionados
-- - Todas as miniaturas (miniatures) relacionadas
-- - Todas as competições (competitions) relacionadas
-- - Estatísticas (total de drivers, miniatures e competitions)
--
-- ESTRUTURA DO BANCO DE DADOS:
-- Schema: pb7lpfmycz97c19
-- 
-- Tabelas principais:
-- - teams: Tabela de times
-- - drivers: Tabela de pilotos
-- - miniatures: Tabela de miniaturas
-- - competitions: Tabela de competições
--
-- Tabelas de relacionamento (many-to-many):
-- - _nc_m2m_drivers_teams: Relaciona drivers com teams
-- - _nc_m2m_miniatures_teams: Relaciona miniatures com teams
-- - _nc_m2m_competition_teams: Relaciona competitions com teams
-- ============================================================================

-- OPÇÃO 1: Buscar um time específico por ID
SELECT 
  t.id,
  t.team as teamName,
  t."teamIcon",
  t.created_at,
  t.updated_at,
  jsonb_build_object(
    'drivers', COALESCE(
      (SELECT jsonb_agg(
        jsonb_build_object(
          'id', d.id,
          'driver', d.driver,
          'seasonsCompleted', d."seasonsCompleted",
          'championships', d.championships,
          'overview', d.overview
        )
      )
      FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
      JOIN pb7lpfmycz97c19.drivers d ON dt.drivers_id = d.id
      WHERE dt.teams_id = t.id
      ), '[]'::jsonb
    ),
    'miniatures', COALESCE(
      (SELECT jsonb_agg(
        jsonb_build_object(
          'id', m.id,
          'model', m.model,
          'brand', m.brand,
          'sku', m.sku,
          'scale', m.scale,
          'year', m.year,
          'season', m.season,
          'additionalInfo', m."additionalInfo",
          'images', m.images
        )
      )
      FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
      JOIN pb7lpfmycz97c19.miniatures m ON mt.miniatures_id = m.id
      WHERE mt.teams_id = t.id
      ), '[]'::jsonb
    ),
    'competitions', COALESCE(
      (SELECT jsonb_agg(
        jsonb_build_object(
          'id', c.id,
          'competition', c.competition,
          'competitionFullName', c."competitionFullName",
          'competitionIcon', c."competitionIcon",
          'competitionImage', c."competitionImage"
        )
      )
      FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
      JOIN pb7lpfmycz97c19.competitions c ON ct.competition_id = c.id
      WHERE ct.teams_id = t.id
      ), '[]'::jsonb
    ),
    'statistics', jsonb_build_object(
      'totalDrivers', (SELECT COUNT(*) FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = t.id),
      'totalMiniatures', (SELECT COUNT(*) FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = t.id),
      'totalCompetitions', (SELECT COUNT(*) FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = t.id)
    )
  ) as data
FROM pb7lpfmycz97c19.teams t
WHERE t.id = 1;  -- Substituir pelo ID desejado

-- ============================================================================

-- OPÇÃO 2: Buscar um time específico por NOME
SELECT 
  t.id,
  t.team as teamName,
  t."teamIcon",
  t.created_at,
  t.updated_at,
  jsonb_build_object(
    'drivers', COALESCE(
      (SELECT jsonb_agg(
        jsonb_build_object(
          'id', d.id,
          'driver', d.driver,
          'seasonsCompleted', d."seasonsCompleted",
          'championships', d.championships,
          'overview', d.overview
        )
      )
      FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
      JOIN pb7lpfmycz97c19.drivers d ON dt.drivers_id = d.id
      WHERE dt.teams_id = t.id
      ), '[]'::jsonb
    ),
    'miniatures', COALESCE(
      (SELECT jsonb_agg(
        jsonb_build_object(
          'id', m.id,
          'model', m.model,
          'brand', m.brand,
          'sku', m.sku,
          'scale', m.scale,
          'year', m.year,
          'season', m.season,
          'additionalInfo', m."additionalInfo",
          'images', m.images
        )
      )
      FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
      JOIN pb7lpfmycz97c19.miniatures m ON mt.miniatures_id = m.id
      WHERE mt.teams_id = t.id
      ), '[]'::jsonb
    ),
    'competitions', COALESCE(
      (SELECT jsonb_agg(
        jsonb_build_object(
          'id', c.id,
          'competition', c.competition,
          'competitionFullName', c."competitionFullName",
          'competitionIcon', c."competitionIcon",
          'competitionImage', c."competitionImage"
        )
      )
      FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
      JOIN pb7lpfmycz97c19.competitions c ON ct.competition_id = c.id
      WHERE ct.teams_id = t.id
      ), '[]'::jsonb
    ),
    'statistics', jsonb_build_object(
      'totalDrivers', (SELECT COUNT(*) FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = t.id),
      'totalMiniatures', (SELECT COUNT(*) FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = t.id),
      'totalCompetitions', (SELECT COUNT(*) FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = t.id)
    )
  ) as data
FROM pb7lpfmycz97c19.teams t
WHERE t.team ILIKE '%Renault%';  -- Substituir pelo nome desejado (case-insensitive)

-- ============================================================================

-- OPÇÃO 3: Buscar TODOS os times com suas relações
SELECT 
  t.id,
  t.team as teamName,
  t."teamIcon",
  t.created_at,
  t.updated_at,
  jsonb_build_object(
    'drivers', COALESCE(
      (SELECT jsonb_agg(
        jsonb_build_object(
          'id', d.id,
          'driver', d.driver,
          'seasonsCompleted', d."seasonsCompleted",
          'championships', d.championships,
          'overview', d.overview
        )
      )
      FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
      JOIN pb7lpfmycz97c19.drivers d ON dt.drivers_id = d.id
      WHERE dt.teams_id = t.id
      ), '[]'::jsonb
    ),
    'miniatures', COALESCE(
      (SELECT jsonb_agg(
        jsonb_build_object(
          'id', m.id,
          'model', m.model,
          'brand', m.brand,
          'sku', m.sku,
          'scale', m.scale,
          'year', m.year,
          'season', m.season,
          'additionalInfo', m."additionalInfo",
          'images', m.images
        )
      )
      FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
      JOIN pb7lpfmycz97c19.miniatures m ON mt.miniatures_id = m.id
      WHERE mt.teams_id = t.id
      ), '[]'::jsonb
    ),
    'competitions', COALESCE(
      (SELECT jsonb_agg(
        jsonb_build_object(
          'id', c.id,
          'competition', c.competition,
          'competitionFullName', c."competitionFullName",
          'competitionIcon', c."competitionIcon",
          'competitionImage', c."competitionImage"
        )
      )
      FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
      JOIN pb7lpfmycz97c19.competitions c ON ct.competition_id = c.id
      WHERE ct.teams_id = t.id
      ), '[]'::jsonb
    ),
    'statistics', jsonb_build_object(
      'totalDrivers', (SELECT COUNT(*) FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = t.id),
      'totalMiniatures', (SELECT COUNT(*) FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = t.id),
      'totalCompetitions', (SELECT COUNT(*) FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = t.id)
    )
  ) as data
FROM pb7lpfmycz97c19.teams t
ORDER BY t.id;

-- ============================================================================
-- EXEMPLO DE RESULTADO JSON:
-- ============================================================================
-- {
--   "id": 1,
--   "teamName": "Renault",
--   "teamIcon": null,
--   "created_at": "2025-02-05T16:19:35.000Z",
--   "updated_at": "2025-06-11T12:42:39.000Z",
--   "data": {
--     "drivers": [
--       {
--         "id": 3112,
--         "driver": "Fernando Alonso",
--         "seasonsCompleted": "2001, 2003–2018, 2021–present",
--         "championships": "(2) 2005, 2006",
--         "overview": ""
--       },
--       ...
--     ],
--     "miniatures": [
--       {
--         "id": 6595,
--         "model": "EXPRESS VAN 1985",
--         "brand": "Renault",
--         "sku": "OT466",
--         "scale": "1:18",
--         "year": "1985",
--         "season": null,
--         "additionalInfo": null,
--         "images": "[...]"
--       },
--       ...
--     ],
--     "competitions": [
--       {
--         "id": 1,
--         "competition": "Formula 1",
--         "competitionFullName": "FIA F1 World Championship",
--         "competitionIcon": "[...]",
--         "competitionImage": "[...]"
--       },
--       ...
--     ],
--     "statistics": {
--       "totalDrivers": 32,
--       "totalMiniatures": 3772,
--       "totalCompetitions": 1
--     }
--   }
-- }
-- ============================================================================

-- NOTAS IMPORTANTES:
-- 1. O campo "images" nas miniatures é um JSON string que contém array de objetos
-- 2. Os campos com camelCase precisam estar entre aspas duplas (ex: "teamIcon")
-- 3. COALESCE garante que arrays vazios retornem [] ao invés de null
-- 4. jsonb_agg agrupa múltiplos registros em um array JSON
-- 5. jsonb_build_object cria objetos JSON estruturados
