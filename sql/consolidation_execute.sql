-- ============================================================
-- SQL DE CONSOLIDAÇÃO DE TEAMS DUPLICADOS
-- Gerado em: 2025-11-20T14:59:47.636807
-- Total de grupos: 276
-- Total de teams BASE: 276
-- Total de teams REMs a remover: 286
-- ============================================================

-- ATENÇÃO: Este script usa transação para garantir atomicidade
-- Se houver qualquer erro, todas as mudanças serão revertidas

BEGIN;

-- ============================================================
-- FASE 1: CONSOLIDAÇÃO DOS RELACIONAMENTOS
-- Move todos os relacionamentos dos REMs para as BASEs
-- ============================================================

-- ------------------------------------------------------------
-- Grupo 1: 1
-- BASE: ID=6929, Nome='1'
-- REMs: IDs=[6932]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 6932 para BASE 6929

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6929, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 6932
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6929 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 6932;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6929, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 6932
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6929 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 6932;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6929, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 6932
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6929 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 6932;


-- ------------------------------------------------------------
-- Grupo 2: 250tr
-- BASE: ID=6946, Nome='250 TR'
-- REMs: IDs=[6947]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 6947 para BASE 6946

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6946, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 6947
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6946 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 6947;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6946, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 6947
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6946 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 6947;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6946, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 6947
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6946 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 6947;


-- ------------------------------------------------------------
-- Grupo 3: 2seasmotorsport
-- BASE: ID=56, Nome='2 Seas Motorsport'
-- REMs: IDs=[62]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 62 para BASE 56

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 56, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 62
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 56 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 62;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 56, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 62
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 56 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 62;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 56, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 62
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 56 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 62;


-- ------------------------------------------------------------
-- Grupo 4: 333
-- BASE: ID=6952, Nome='33/3'
-- REMs: IDs=[13019]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13019 para BASE 6952

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6952, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13019
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6952 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13019;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6952, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13019
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6952 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13019;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6952, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13019
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6952 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13019;


-- ------------------------------------------------------------
-- Grupo 5: 8starmotorsports
-- BASE: ID=84, Nome='8 Star Motorsports'
-- REMs: IDs=[87]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 87 para BASE 84

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 84, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 87
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 84 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 87;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 84, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 87
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 84 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 87;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 84, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 87
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 84 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 87;


-- ------------------------------------------------------------
-- Grupo 6: 911scoupe
-- BASE: ID=6972, Nome='911 S Coupe'
-- REMs: IDs=[6975]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 6975 para BASE 6972

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6972, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 6975
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6972 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 6975;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6972, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 6975
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6972 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 6975;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6972, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 6975
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6972 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 6975;


-- ------------------------------------------------------------
-- Grupo 7: a6gcs
-- BASE: ID=11458, Nome='A6 gcs'
-- REMs: IDs=[12929]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12929 para BASE 11458

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 11458, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12929
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 11458 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12929;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 11458, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12929
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 11458 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12929;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 11458, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12929
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 11458 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12929;


-- ------------------------------------------------------------
-- Grupo 8: accarsltd
-- BASE: ID=98, Nome='A.C. Cars Ltd.'
-- REMs: IDs=[10431]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10431 para BASE 98

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 98, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10431
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 98 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10431;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 98, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10431
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 98 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10431;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 98, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10431
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 98 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10431;


-- ------------------------------------------------------------
-- Grupo 9: acura
-- BASE: ID=2, Nome='Acura'
-- REMs: IDs=[41]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 41 para BASE 2

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 41
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 41;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 41
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 41;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 41
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 41;


-- ------------------------------------------------------------
-- Grupo 10: adaengineering
-- BASE: ID=102, Nome='A.D.A. Engineering'
-- REMs: IDs=[11620]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11620 para BASE 102

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 102, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11620
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 102 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11620;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 102, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11620
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 102 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11620;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 102, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11620
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 102 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11620;


-- ------------------------------------------------------------
-- Grupo 11: afm
-- BASE: ID=9150, Nome='Afm'
-- REMs: IDs=[9244]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9244 para BASE 9150

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9150, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9244
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9150 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9244;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9150, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9244
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9150 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9244;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9150, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9244
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9150 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9244;


-- ------------------------------------------------------------
-- Grupo 12: agaci
-- BASE: ID=103, Nome='A.G.A.C.I.'
-- REMs: IDs=[10164]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10164 para BASE 103

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 103, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10164
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 103 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10164;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 103, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10164
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 103 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10164;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 103, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10164
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 103 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10164;


-- ------------------------------------------------------------
-- Grupo 13: airfrance
-- BASE: ID=8269, Nome='Air France'
-- REMs: IDs=[14233]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 14233 para BASE 8269

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8269, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 14233
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8269 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 14233;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8269, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 14233
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8269 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 14233;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8269, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 14233
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8269 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 14233;


-- ------------------------------------------------------------
-- Grupo 14: alanmannracingltd
-- BASE: ID=342, Nome='Alan Mann Racing Ltd.'
-- REMs: IDs=[10737]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10737 para BASE 342

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 342, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10737
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 342 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10737;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 342, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10737
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 342 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10737;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 342, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10737
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 342 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10737;


-- ------------------------------------------------------------
-- Grupo 15: alphatauri
-- BASE: ID=26, Nome='Alpha Tauri'
-- REMs: IDs=[9151, 9245]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9151 para BASE 26

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 26, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9151
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 26 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9151;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 26, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9151
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 26 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9151;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 26, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9151
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 26 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9151;

-- Movendo relacionamentos do REM 9245 para BASE 26

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 26, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9245
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 26 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9245;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 26, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9245
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 26 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9245;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 26, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9245
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 26 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9245;


-- ------------------------------------------------------------
-- Grupo 16: amgmercedes
-- BASE: ID=212, Nome='AMG Mercedes'
-- REMs: IDs=[213]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 213 para BASE 212

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 212, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 213
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 212 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 213;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 212, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 213
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 212 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 213;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 212, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 213
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 212 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 213;


-- ------------------------------------------------------------
-- Grupo 17: aoracing
-- BASE: ID=107, Nome='A.O. Racing'
-- REMs: IDs=[218]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 218 para BASE 107

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 107, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 218
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 107 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 218;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 107, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 218
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 107 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 218;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 107, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 218
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 107 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 218;


-- ------------------------------------------------------------
-- Grupo 18: armsupmotorsports
-- BASE: ID=500, Nome='Arms Up Motorsports'
-- REMs: IDs=[502]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 502 para BASE 500

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 500, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 502
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 500 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 502;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 500, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 502
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 500 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 502;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 500, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 502
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 500 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 502;


-- ------------------------------------------------------------
-- Grupo 19: artcar
-- BASE: ID=10971, Nome='Art car'
-- REMs: IDs=[12356]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12356 para BASE 10971

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10971, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12356
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10971 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12356;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10971, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12356
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10971 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12356;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10971, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12356
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10971 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12356;


-- ------------------------------------------------------------
-- Grupo 20: artengineering
-- BASE: ID=109, Nome='A.R.T. Engineering'
-- REMs: IDs=[236]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 236 para BASE 109

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 109, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 236
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 109 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 236;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 109, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 236
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 109 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 236;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 109, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 236
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 109 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 236;


-- ------------------------------------------------------------
-- Grupo 21: artsports
-- BASE: ID=11161, Nome='Art sports'
-- REMs: IDs=[13027]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13027 para BASE 11161

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 11161, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13027
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 11161 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13027;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 11161, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13027
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 11161 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13027;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 11161, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13027
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 11161 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13027;


-- ------------------------------------------------------------
-- Grupo 22: asacachia
-- BASE: ID=112, Nome='A.S.A. Cachia'
-- REMs: IDs=[7000]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 7000 para BASE 112

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 112, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 7000
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 112 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 7000;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 112, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 7000
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 112 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 7000;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 112, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 7000
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 112 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 7000;


-- ------------------------------------------------------------
-- Grupo 23: assistenzacorse
-- BASE: ID=12336, Nome='Assistenza corse'
-- REMs: IDs=[13261]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13261 para BASE 12336

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12336, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13261
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12336 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13261;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12336, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13261
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12336 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13261;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12336, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13261
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12336 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13261;


-- ------------------------------------------------------------
-- Grupo 24: austrodaimler
-- BASE: ID=10200, Nome='Austro daimler'
-- REMs: IDs=[11229]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11229 para BASE 10200

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10200, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11229
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10200 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11229;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10200, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11229
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10200 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11229;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10200, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11229
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10200 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11229;


-- ------------------------------------------------------------
-- Grupo 25: autodeltaspa
-- BASE: ID=7927, Nome='Autodelta Spa'
-- REMs: IDs=[12678]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12678 para BASE 7927

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7927, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12678
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7927 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12678;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7927, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12678
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7927 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12678;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7927, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12678
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7927 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12678;


-- ------------------------------------------------------------
-- Grupo 26: automobiliosca
-- BASE: ID=625, Nome='Automobili OSCA'
-- REMs: IDs=[11665]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11665 para BASE 625

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 625, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11665
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 625 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11665;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 625, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11665
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 625 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11665;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 625, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11665
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 625 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11665;


-- ------------------------------------------------------------
-- Grupo 27: autoracingclubbratislava
-- BASE: ID=629, Nome='Autoracing Club Bratislava'
-- REMs: IDs=[11599]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11599 para BASE 629

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 629, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11599
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 629 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11599;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 629, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11599
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 629 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11599;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 629, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11599
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 629 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11599;


-- ------------------------------------------------------------
-- Grupo 28: bar
-- BASE: ID=7910, Nome='Bar'
-- REMs: IDs=[9246]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9246 para BASE 7910

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7910, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9246
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7910 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9246;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7910, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9246
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7910 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9246;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7910, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9246
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7910 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9246;


-- ------------------------------------------------------------
-- Grupo 29: baraziepsilon
-- BASE: ID=815, Nome='Barazi-Epsilon'
-- REMs: IDs=[13433]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13433 para BASE 815

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 815, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13433
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 815 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13433;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 815, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13433
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 815 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13433;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 815, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13433
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 815 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13433;


-- ------------------------------------------------------------
-- Grupo 30: bbacompetition
-- BASE: ID=667, Nome='B.B.A. Competition'
-- REMs: IDs=[681]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 681 para BASE 667

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 667, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 681
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 667 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 681;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 667, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 681
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 667 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 681;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 667, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 681
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 667 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 681;


-- ------------------------------------------------------------
-- Grupo 31: bentleymotorsltd
-- BASE: ID=868, Nome='Bentley Motors Ltd.'
-- REMs: IDs=[9714]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9714 para BASE 868

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 868, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9714
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 868 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9714;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 868, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9714
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 868 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9714;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 868, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9714
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 868 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9714;


-- ------------------------------------------------------------
-- Grupo 32: bfgoodrich
-- BASE: ID=668, Nome='B.F. Goodrich'
-- REMs: IDs=[7046]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 7046 para BASE 668

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 668, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 7046
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 668 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 7046;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 668, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 7046
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 668 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 7046;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 668, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 7046
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 668 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 7046;


-- ------------------------------------------------------------
-- Grupo 33: bmaxracing
-- BASE: ID=938, Nome='Bmax Racing'
-- REMs: IDs=[7044]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 7044 para BASE 938

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 938, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 7044
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 938 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 7044;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 938, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 7044
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 938 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 7044;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 938, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 7044
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 938 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 7044;


-- ------------------------------------------------------------
-- Grupo 34: boac
-- BASE: ID=13654, Nome='Boac'
-- REMs: IDs=[14220]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 14220 para BASE 13654

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 13654, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 14220
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 13654 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 14220;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 13654, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 14220
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 13654 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 14220;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 13654, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 14220
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 13654 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 14220;


-- ------------------------------------------------------------
-- Grupo 35: boutsenginion
-- BASE: ID=9885, Nome='Boutsen ginion'
-- REMs: IDs=[10056]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10056 para BASE 9885

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9885, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10056
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9885 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10056;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9885, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10056
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9885 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10056;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9885, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10056
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9885 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10056;


-- ------------------------------------------------------------
-- Grupo 36: boutsenginionracing
-- BASE: ID=984, Nome='Boutsen Ginion Racing'
-- REMs: IDs=[9600]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9600 para BASE 984

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 984, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9600
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 984 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9600;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 984, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9600
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 984 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9600;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 984, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9600
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 984 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9600;


-- ------------------------------------------------------------
-- Grupo 37: brm
-- BASE: ID=669, Nome='B.R.M.'
-- REMs: IDs=[766]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 766 para BASE 669

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 669, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 766
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 669 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 766;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 669, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 766
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 669 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 766;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 669, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 766
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 669 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 766;


-- ------------------------------------------------------------
-- Grupo 38: brp
-- BASE: ID=9161, Nome='Brp'
-- REMs: IDs=[9247]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9247 para BASE 9161

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9161, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9247
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9161 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9247;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9161, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9247
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9161 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9247;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9161, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9247
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9161 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9247;


-- ------------------------------------------------------------
-- Grupo 39: bscunningham
-- BASE: ID=670, Nome='B.S. Cunningham'
-- REMs: IDs=[9741]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9741 para BASE 670

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 670, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9741
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 670 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9741;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 670, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9741
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 670 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9741;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 670, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9741
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 670 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9741;


-- ------------------------------------------------------------
-- Grupo 40: c6r
-- BASE: ID=12177, Nome='C6r'
-- REMs: IDs=[12939]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12939 para BASE 12177

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12177, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12939
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12177 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12939;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12177, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12939
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12177 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12939;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12177, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12939
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12177 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12939;


-- ------------------------------------------------------------
-- Grupo 41: canam
-- BASE: ID=7106, Nome='Can-Am'
-- REMs: IDs=[13336]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13336 para BASE 7106

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7106, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13336
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7106 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13336;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7106, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13336
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7106 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13336;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7106, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13336
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7106 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13336;


-- ------------------------------------------------------------
-- Grupo 42: carguyracing
-- BASE: ID=1195, Nome='CarGuy Racing'
-- REMs: IDs=[10281]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10281 para BASE 1195

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1195, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10281
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1195 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10281;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1195, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10281
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1195 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10281;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1195, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10281
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1195 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10281;


-- ------------------------------------------------------------
-- Grupo 43: carreracup
-- BASE: ID=7943, Nome='Carreracup'
-- REMs: IDs=[10088]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10088 para BASE 7943

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7943, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10088
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7943 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10088;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7943, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10088
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7943 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10088;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7943, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10088
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7943 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10088;


-- ------------------------------------------------------------
-- Grupo 44: caseih
-- BASE: ID=9070, Nome='Case IH'
-- REMs: IDs=[9443]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9443 para BASE 9070

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9070, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9443
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9070 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9443;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9070, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9443
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9070 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9443;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9070, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9443
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9070 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9443;


-- ------------------------------------------------------------
-- Grupo 45: cipgreenpower
-- BASE: ID=1127, Nome='CIP - Green Power'
-- REMs: IDs=[1128]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 1128 para BASE 1127

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1127, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 1128
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1127 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 1128;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1127, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 1128
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1127 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 1128;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1127, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 1128
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1127 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 1128;


-- ------------------------------------------------------------
-- Grupo 46: civictyper
-- BASE: ID=10388, Nome='Civic type r'
-- REMs: IDs=[10564]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10564 para BASE 10388

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10388, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10564
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10388 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10564;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10388, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10564
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10388 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10564;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10388, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10564
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10388 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10564;


-- ------------------------------------------------------------
-- Grupo 47: clearwaterracing
-- BASE: ID=1324, Nome='Clearwater Racing'
-- REMs: IDs=[11924]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11924 para BASE 1324

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1324, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11924
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1324 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11924;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1324, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11924
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1324 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11924;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1324, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11924
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1324 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11924;


-- ------------------------------------------------------------
-- Grupo 48: clxpurerxcing
-- BASE: ID=1139, Nome='CLX - Pure Rxcing'
-- REMs: IDs=[1141]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 1141 para BASE 1139

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1139, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 1141
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1139 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 1141;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1139, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 1141
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1139 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 1141;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1139, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 1141
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1139 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 1141;


-- ------------------------------------------------------------
-- Grupo 49: continentalgt3r
-- BASE: ID=10460, Nome='Continental gt3-r'
-- REMs: IDs=[13793]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13793 para BASE 10460

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10460, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13793
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10460 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13793;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10460, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13793
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10460 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13793;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10460, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13793
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10460 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13793;


-- ------------------------------------------------------------
-- Grupo 50: craftbambooracing
-- BASE: ID=1411, Nome='Craft-Bamboo Racing'
-- REMs: IDs=[10373]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10373 para BASE 1411

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1411, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10373
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1411 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10373;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1411, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10373
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1411 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10373;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1411, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10373
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1411 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10373;


-- ------------------------------------------------------------
-- Grupo 51: cri
-- BASE: ID=7093, Nome='C.R.I.'
-- REMs: IDs=[12827]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12827 para BASE 7093

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7093, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12827
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7093 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12827;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7093, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12827
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7093 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12827;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7093, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12827
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7093 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12827;


-- ------------------------------------------------------------
-- Grupo 52: daimlerbenzag
-- BASE: ID=11930, Nome='Daimler benz ag'
-- REMs: IDs=[12473]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12473 para BASE 11930

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 11930, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12473
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 11930 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12473;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 11930, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12473
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 11930 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12473;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 11930, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12473
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 11930 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12473;


-- ------------------------------------------------------------
-- Grupo 53: dalecoyneracingwithvassersullivan
-- BASE: ID=1534, Nome='Dale Coyne Racing with Vasser Sullivan'
-- REMs: IDs=[1535]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 1535 para BASE 1534

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1534, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 1535
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1534 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 1535;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1534, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 1535
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1534 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 1535;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1534, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 1535
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1534 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 1535;


-- ------------------------------------------------------------
-- Grupo 54: dantinmotogp
-- BASE: ID=1455, Nome='D''Antin MotoGP'
-- REMs: IDs=[1478]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 1478 para BASE 1455

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1455, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 1478
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1455 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 1478;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1455, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 1478
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1455 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 1478;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1455, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 1478
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1455 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 1478;


-- ------------------------------------------------------------
-- Grupo 55: db
-- BASE: ID=1462, Nome='D.B.'
-- REMs: IDs=[12437]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12437 para BASE 1462

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1462, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12437
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1462 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12437;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1462, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12437
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1462 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12437;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1462, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12437
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1462 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12437;


-- ------------------------------------------------------------
-- Grupo 56: dbmotorsport
-- BASE: ID=1463, Nome='D.B. Motorsport'
-- REMs: IDs=[1479]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 1479 para BASE 1463

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1463, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 1479
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1463 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 1479;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1463, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 1479
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1463 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 1479;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1463, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 1479
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1463 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 1479;


-- ------------------------------------------------------------
-- Grupo 57: dbr9
-- BASE: ID=12134, Nome='Dbr9'
-- REMs: IDs=[13398]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13398 para BASE 12134

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12134, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13398
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12134 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13398;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12134, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13398
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12134 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13398;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12134, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13398
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12134 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13398;


-- ------------------------------------------------------------
-- Grupo 58: delorean
-- BASE: ID=7211, Nome='De Lorean'
-- REMs: IDs=[10427]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10427 para BASE 7211

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7211, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10427
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7211 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10427;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7211, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10427
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7211 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10427;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7211, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10427
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7211 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10427;


-- ------------------------------------------------------------
-- Grupo 59: deltaadr
-- BASE: ID=1582, Nome='Delta-ADR'
-- REMs: IDs=[13542]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13542 para BASE 1582

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1582, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13542
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1582 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13542;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1582, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13542
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1582 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13542;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1582, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13542
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1582 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13542;


-- ------------------------------------------------------------
-- Grupo 60: dempseyprotonracing
-- BASE: ID=1588, Nome='Dempsey-Proton Racing'
-- REMs: IDs=[9483]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9483 para BASE 1588

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1588, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9483
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1588 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9483;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1588, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9483
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1588 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9483;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1588, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9483
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1588 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9483;


-- ------------------------------------------------------------
-- Grupo 61: dempseyracingproton
-- BASE: ID=1587, Nome='Dempsey Racing - Proton'
-- REMs: IDs=[11470]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11470 para BASE 1587

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1587, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11470
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1587 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11470;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1587, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11470
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1587 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11470;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1587, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11470
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1587 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11470;


-- ------------------------------------------------------------
-- Grupo 62: dentressangletransports
-- BASE: ID=8703, Nome='DENTRESSANGLE TRANSPORTS'
-- REMs: IDs=[8920]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 8920 para BASE 8703

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8703, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 8920
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8703 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 8920;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8703, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 8920
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8703 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 8920;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8703, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 8920
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8703 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 8920;


-- ------------------------------------------------------------
-- Grupo 63: dfracing
-- BASE: ID=1464, Nome='D.F. Racing'
-- REMs: IDs=[1490]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 1490 para BASE 1464

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1464, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 1490
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1464 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 1490;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1464, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 1490
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1464 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 1490;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1464, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 1490
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1464 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 1490;


-- ------------------------------------------------------------
-- Grupo 64: dhondthumphreymotorsports
-- BASE: ID=1456, Nome='D''Hondt Humphrey Motorsports'
-- REMs: IDs=[1457]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 1457 para BASE 1456

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1456, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 1457
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1456 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 1457;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1456, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 1457
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1456 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 1457;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1456, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 1457
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1456 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 1457;


-- ------------------------------------------------------------
-- Grupo 65: dhracing
-- BASE: ID=1454, Nome='D & H Racing'
-- REMs: IDs=[1501]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 1501 para BASE 1454

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1454, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 1501
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1454 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 1501;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1454, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 1501
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1454 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 1501;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1454, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 1501
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1454 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 1501;


-- ------------------------------------------------------------
-- Grupo 66: doylerisiracing
-- BASE: ID=1654, Nome='Doyle-Risi Racing'
-- REMs: IDs=[9750]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9750 para BASE 1654

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1654, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9750
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1654 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9750;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1654, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9750
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1654 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9750;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1654, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9750
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1654 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9750;


-- ------------------------------------------------------------
-- Grupo 67: dragonspeed
-- BASE: ID=1662, Nome='DragonSpeed'
-- REMs: IDs=[10400]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10400 para BASE 1662

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1662, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10400
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1662 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10400;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1662, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10400
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1662 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10400;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1662, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10400
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1662 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10400;


-- ------------------------------------------------------------
-- Grupo 68: dstecheetah
-- BASE: ID=1517, Nome='DS TECHEETAH'
-- REMs: IDs=[1518]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 1518 para BASE 1517

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1517, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 1518
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1517 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 1518;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1517, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 1518
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1517 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 1518;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1517, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 1518
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1517 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 1518;


-- ------------------------------------------------------------
-- Grupo 69: dtype
-- BASE: ID=11539, Nome='D-type'
-- REMs: IDs=[12472]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12472 para BASE 11539

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 11539, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12472
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 11539 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12472;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 11539, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12472
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 11539 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12472;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 11539, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12472
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 11539 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12472;


-- ------------------------------------------------------------
-- Grupo 70: duckhamsoil
-- BASE: ID=8340, Nome='Duckham's Oil'
-- REMs: IDs=[14480]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 14480 para BASE 8340

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8340, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 14480
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8340 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 14480;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8340, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 14480
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8340 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 14480;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8340, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 14480
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8340 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 14480;


-- ------------------------------------------------------------
-- Grupo 71: eastbelgianracingteam
-- BASE: ID=1770, Nome='East Belgian Racing Team'
-- REMs: IDs=[1771]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 1771 para BASE 1770

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1770, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 1771
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1770 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 1771;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1770, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 1771
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1770 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 1771;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1770, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 1771
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1770 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 1771;


-- ------------------------------------------------------------
-- Grupo 72: ecuriefiatabarth
-- BASE: ID=10040, Nome='Ecurie fiat-abarth'
-- REMs: IDs=[14423]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 14423 para BASE 10040

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10040, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 14423
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10040 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 14423;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10040, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 14423
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10040 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 14423;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10040, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 14423
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10040 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 14423;


-- ------------------------------------------------------------
-- Grupo 73: ecuriesavincalberson
-- BASE: ID=1812, Nome='Ecurie Savin Calberson'
-- REMs: IDs=[9807]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9807 para BASE 1812

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1812, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9807
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1812 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9807;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1812, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9807
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1812 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9807;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1812, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9807
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1812 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9807;


-- ------------------------------------------------------------
-- Grupo 74: edams
-- BASE: ID=10878, Nome='E-dams'
-- REMs: IDs=[11094]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11094 para BASE 10878

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10878, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11094
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10878 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11094;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10878, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11094
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10878 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11094;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10878, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11094
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10878 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11094;


-- ------------------------------------------------------------
-- Grupo 75: eg00marcvds
-- BASE: ID=1748, Nome='EG 0,0 Marc VDS'
-- REMs: IDs=[11052]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11052 para BASE 1748

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1748, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11052
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1748 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11052;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1748, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11052
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1748 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11052;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1748, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11052
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1748 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11052;


-- ------------------------------------------------------------
-- Grupo 76: elspecial
-- BASE: ID=9169, Nome='El Special'
-- REMs: IDs=[9249]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9249 para BASE 9169

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9169, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9249
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9169 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9249;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9169, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9249
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9169 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9249;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9169, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9249
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9169 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9249;


-- ------------------------------------------------------------
-- Grupo 77: emw
-- BASE: ID=9173, Nome='Emw'
-- REMs: IDs=[9250]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9250 para BASE 9173

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9173, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9250
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9173 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9250;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9173, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9250
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9173 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9250;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9173, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9250
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9173 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9250;


-- ------------------------------------------------------------
-- Grupo 78: equipematrasimca
-- BASE: ID=7245, Nome='Equipe Matra-Simca'
-- REMs: IDs=[12446]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12446 para BASE 7245

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7245, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12446
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7245 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12446;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7245, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12446
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7245 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12446;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7245, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12446
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7245 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12446;


-- ------------------------------------------------------------
-- Grupo 79: era
-- BASE: ID=9175, Nome='Era'
-- REMs: IDs=[9251]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9251 para BASE 9175

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9175, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9251
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9175 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9251;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9175, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9251
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9175 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9251;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9175, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9251
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9175 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9251;


-- ------------------------------------------------------------
-- Grupo 80: essexmotorsport
-- BASE: ID=7254, Nome='Essex Motorsport'
-- REMs: IDs=[13249]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13249 para BASE 7254

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7254, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13249
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7254 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13249;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7254, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13249
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7254 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13249;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7254, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13249
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7254 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13249;


-- ------------------------------------------------------------
-- Grupo 81: eurobrun
-- BASE: ID=9177, Nome='Eurobrun'
-- REMs: IDs=[9252]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9252 para BASE 9177

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9177, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9252
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9177 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9252;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9177, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9252
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9177 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9252;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9177, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9252
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9177 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9252;


-- ------------------------------------------------------------
-- Grupo 82: euroracing
-- BASE: ID=1979, Nome='Euroracing'
-- REMs: IDs=[7257]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 7257 para BASE 1979

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 1979, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 7257
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 1979 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 7257;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 1979, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 7257
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 1979 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 7257;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 1979, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 7257
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 1979 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 7257;


-- ------------------------------------------------------------
-- Grupo 83: fcctsr
-- BASE: ID=2005, Nome='F.C.C. TSR'
-- REMs: IDs=[2018]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 2018 para BASE 2005

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2005, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 2018
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2005 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 2018;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2005, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 2018
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2005 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 2018;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2005, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 2018
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2005 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 2018;


-- ------------------------------------------------------------
-- Grupo 84: felbermayrproton
-- BASE: ID=11531, Nome='Felbermayr proton'
-- REMs: IDs=[13526]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13526 para BASE 11531

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 11531, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13526
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 11531 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13526;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 11531, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13526
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 11531 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13526;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 11531, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13526
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 11531 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13526;


-- ------------------------------------------------------------
-- Grupo 85: ferrariafcorse
-- BASE: ID=2077, Nome='Ferrari - AF Corse'
-- REMs: IDs=[2078]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 2078 para BASE 2077

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2077, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 2078
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2077 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 2078;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2077, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 2078
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2077 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 2078;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2077, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 2078
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2077 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 2078;


-- ------------------------------------------------------------
-- Grupo 86: fiagt
-- BASE: ID=12367, Nome='Fia-gt'
-- REMs: IDs=[13483]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13483 para BASE 12367

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12367, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13483
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12367 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13483;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12367, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13483
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12367 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13483;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12367, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13483
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12367 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13483;


-- ------------------------------------------------------------
-- Grupo 87: fistteamaai
-- BASE: ID=2028, Nome='FIST-Team AAI'
-- REMs: IDs=[14503]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 14503 para BASE 2028

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2028, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 14503
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2028 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 14503;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2028, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 14503
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2028 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 14503;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2028, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 14503
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2028 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 14503;


-- ------------------------------------------------------------
-- Grupo 88: fockewulf
-- BASE: ID=10351, Nome='Focke-wulf'
-- REMs: IDs=[12062]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12062 para BASE 10351

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10351, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12062
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10351 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12062;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10351, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12062
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10351 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12062;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10351, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12062
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10351 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12062;


-- ------------------------------------------------------------
-- Grupo 89: fuldmobil
-- BASE: ID=11848, Nome='Fuld mobil'
-- REMs: IDs=[11850]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11850 para BASE 11848

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 11848, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11850
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 11848 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11850;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 11848, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11850
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 11848 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11850;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 11848, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11850
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 11848 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11850;


-- ------------------------------------------------------------
-- Grupo 90: g
-- BASE: ID=9517, Nome='G'
-- REMs: IDs=[12537]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12537 para BASE 9517

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9517, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12537
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9517 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12537;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9517, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12537
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9517 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12537;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9517, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12537
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9517 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12537;


-- ------------------------------------------------------------
-- Grupo 91: ganderson
-- BASE: ID=7297, Nome='G. Anderson'
-- REMs: IDs=[9362]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9362 para BASE 7297

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7297, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9362
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7297 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9362;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7297, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9362
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7297 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9362;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7297, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9362
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7297 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9362;


-- ------------------------------------------------------------
-- Grupo 92: garage59
-- BASE: ID=2324, Nome='Garage 59'
-- REMs: IDs=[7311]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 7311 para BASE 2324

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2324, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 7311
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2324 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 7311;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2324, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 7311
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2324 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 7311;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2324, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 7311
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2324 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 7311;


-- ------------------------------------------------------------
-- Grupo 93: gilbertkorthoffmotorsports
-- BASE: ID=2371, Nome='Gilbert Korthoff Motorsports'
-- REMs: IDs=[2372]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 2372 para BASE 2371

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2371, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 2372
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2371 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 2372;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2371, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 2372
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2371 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 2372;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2371, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 2372
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2371 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 2372;


-- ------------------------------------------------------------
-- Grupo 94: gmmotorsport
-- BASE: ID=2187, Nome='G+M Motorsport'
-- REMs: IDs=[2237]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 2237 para BASE 2187

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2187, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 2237
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2187 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 2237;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2187, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 2237
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2187 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 2237;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2187, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 2237
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2187 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 2237;


-- ------------------------------------------------------------
-- Grupo 95: goodsmileracing
-- BASE: ID=2405, Nome='Goodsmile Racing'
-- REMs: IDs=[13614]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13614 para BASE 2405

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2405, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13614
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2405 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13614;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2405, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13614
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2405 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13614;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2405, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13614
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2405 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13614;


-- ------------------------------------------------------------
-- Grupo 96: gpc
-- BASE: ID=12986, Nome='G.p.c'
-- REMs: IDs=[13957]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13957 para BASE 12986

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12986, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13957
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12986 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13957;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12986, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13957
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12986 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13957;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12986, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13957
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12986 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13957;


-- ------------------------------------------------------------
-- Grupo 97: gpcgiessesquadracorse
-- BASE: ID=2196, Nome='G.P.C. Giesse Squadra Corse'
-- REMs: IDs=[2258]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 2258 para BASE 2196

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2196, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 2258
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2196 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 2258;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2196, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 2258
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2196 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 2258;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2196, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 2258
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2196 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 2258;


-- ------------------------------------------------------------
-- Grupo 98: gpcsport
-- BASE: ID=2259, Nome='GPC Sport'
-- REMs: IDs=[13301]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13301 para BASE 2259

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2259, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13301
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2259 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13301;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2259, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13301
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2259 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13301;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2259, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13301
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2259 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13301;


-- ------------------------------------------------------------
-- Grupo 99: granturismo
-- BASE: ID=10890, Nome='Gran turismo'
-- REMs: IDs=[11461]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11461 para BASE 10890

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10890, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11461
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10890 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11461;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10890, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11461
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10890 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11461;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10890, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11461
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10890 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11461;


-- ------------------------------------------------------------
-- Grupo 100: grmotorsport
-- BASE: ID=2184, Nome='G&R Motorsport'
-- REMs: IDs=[2270]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 2270 para BASE 2184

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2184, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 2270
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2184 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 2270;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2184, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 2270
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2184 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 2270;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2184, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 2270
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2184 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 2270;


-- ------------------------------------------------------------
-- Grupo 101: gruppem
-- BASE: ID=8034, Nome='GrupPEm'
-- REMs: IDs=[11008]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11008 para BASE 8034

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8034, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11008
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8034 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11008;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8034, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11008
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8034 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11008;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8034, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11008
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8034 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11008;


-- ------------------------------------------------------------
-- Grupo 102: gstuning
-- BASE: ID=11670, Nome='Gs tuning'
-- REMs: IDs=[12277]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12277 para BASE 11670

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 11670, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12277
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 11670 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12277;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 11670, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12277
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 11670 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12277;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 11670, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12277
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 11670 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12277;


-- ------------------------------------------------------------
-- Grupo 103: gtr
-- BASE: ID=7307, Nome='GT-R'
-- REMs: IDs=[12912]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12912 para BASE 7307

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7307, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12912
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7307 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12912;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7307, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12912
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7307 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12912;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7307, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12912
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7307 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12912;


-- ------------------------------------------------------------
-- Grupo 104: gtrnismo
-- BASE: ID=7308, Nome='GT-R Nismo'
-- REMs: IDs=[11270]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11270 para BASE 7308

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7308, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11270
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7308 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11270;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7308, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11270
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7308 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11270;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7308, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11270
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7308 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11270;


-- ------------------------------------------------------------
-- Grupo 105: hannusrallyteam
-- BASE: ID=2560, Nome='Hannu's Rally Team'
-- REMs: IDs=[2561]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 2561 para BASE 2560

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2560, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 2561
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2560 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 2561;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2560, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 2561
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2560 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 2561;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2560, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 2561
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2560 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 2561;


-- ------------------------------------------------------------
-- Grupo 106: hbsuzukigpteam
-- BASE: ID=2484, Nome='H.B. Suzuki GP Team'
-- REMs: IDs=[2493]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 2493 para BASE 2484

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2484, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 2493
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2484 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 2493;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2484, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 2493
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2484 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 2493;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2484, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 2493
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2484 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 2493;


-- ------------------------------------------------------------
-- Grupo 107: hellapagidracingone
-- BASE: ID=2595, Nome='Hella Pagid - racing one'
-- REMs: IDs=[9873]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9873 para BASE 2595

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2595, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9873
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2595 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9873;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2595, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9873
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2595 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9873;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2595, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9873
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2595 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9873;


-- ------------------------------------------------------------
-- Grupo 108: hennstbirdswapshop
-- BASE: ID=2606, Nome='Henn's T-Bird Swap Shop'
-- REMs: IDs=[11948]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11948 para BASE 2606

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2606, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11948
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2606 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11948;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2606, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11948
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2606 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11948;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2606, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11948
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2606 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11948;


-- ------------------------------------------------------------
-- Grupo 109: hitechgp
-- BASE: ID=2636, Nome='Hitech GP'
-- REMs: IDs=[2641]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 2641 para BASE 2636

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2636, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 2641
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2636 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 2641;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2636, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 2641
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2636 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 2641;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2636, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 2641
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2636 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 2641;


-- ------------------------------------------------------------
-- Grupo 110: hoforracing
-- BASE: ID=2645, Nome='Hofor Racing'
-- REMs: IDs=[2647]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 2647 para BASE 2645

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2645, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 2647
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2645 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 2647;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2645, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 2647
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2645 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 2647;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2645, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 2647
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2645 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 2647;


-- ------------------------------------------------------------
-- Grupo 111: holmanmoody
-- BASE: ID=2652, Nome='Holman & Moody'
-- REMs: IDs=[7358]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 7358 para BASE 2652

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2652, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 7358
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2652 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 7358;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2652, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 7358
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2652 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 7358;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2652, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 7358
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2652 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 7358;


-- ------------------------------------------------------------
-- Grupo 112: hpiracing
-- BASE: ID=12901, Nome='Hpi-racing'
-- REMs: IDs=[13746]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13746 para BASE 12901

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12901, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13746
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12901 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13746;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12901, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13746
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12901 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13746;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12901, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13746
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12901 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13746;


-- ------------------------------------------------------------
-- Grupo 113: hsf
-- BASE: ID=11663, Nome='H.s.f.'
-- REMs: IDs=[12107]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12107 para BASE 11663

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 11663, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12107
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 11663 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12107;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 11663, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12107
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 11663 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12107;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 11663, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12107
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 11663 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12107;


-- ------------------------------------------------------------
-- Grupo 114: hubauto
-- BASE: ID=8754, Nome='Hub Auto'
-- REMs: IDs=[8915]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 8915 para BASE 8754

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8754, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 8915
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8754 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 8915;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8754, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 8915
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8754 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 8915;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8754, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 8915
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8754 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 8915;


-- ------------------------------------------------------------
-- Grupo 115: hubautoracing
-- BASE: ID=2696, Nome='Hub Auto Racing'
-- REMs: IDs=[2698]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 2698 para BASE 2696

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2696, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 2698
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2696 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 2698;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2696, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 2698
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2696 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 2698;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2696, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 2698
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2696 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 2698;


-- ------------------------------------------------------------
-- Grupo 116: hwm
-- BASE: ID=9183, Nome='Hwm'
-- REMs: IDs=[9253]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9253 para BASE 9183

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9183, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9253
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9183 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9253;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9183, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9253
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9183 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9253;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9183, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9253
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9183 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9253;


-- ------------------------------------------------------------
-- Grupo 117: iava
-- BASE: ID=8829, Nome='IAVA'
-- REMs: IDs=[8974]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 8974 para BASE 8829

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8829, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 8974
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8829 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 8974;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8829, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 8974
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8829 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 8974;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8829, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 8974
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8829 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 8974;


-- ------------------------------------------------------------
-- Grupo 118: imsacamel
-- BASE: ID=2737, Nome='IMSA-Camel'
-- REMs: IDs=[12070]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12070 para BASE 2737

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2737, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12070
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2737 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12070;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2737, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12070
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2737 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12070;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2737, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12070
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2737 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12070;


-- ------------------------------------------------------------
-- Grupo 119: imsaperformancematmut
-- BASE: ID=2736, Nome='IMSA Performance - Matmut'
-- REMs: IDs=[11537, 13468]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11537 para BASE 2736

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2736, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11537
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2736 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11537;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2736, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11537
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2736 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11537;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2736, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11537
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2736 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11537;

-- Movendo relacionamentos do REM 13468 para BASE 2736

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2736, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13468
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2736 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13468;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2736, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13468
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2736 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13468;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2736, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13468
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2736 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13468;


-- ------------------------------------------------------------
-- Grupo 120: isomarlboro
-- BASE: ID=9184, Nome='Iso Marlboro'
-- REMs: IDs=[10866]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10866 para BASE 9184

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9184, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10866
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9184 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10866;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9184, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10866
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9184 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10866;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9184, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10866
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9184 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10866;


-- ------------------------------------------------------------
-- Grupo 121: jaguarcarsltd
-- BASE: ID=2913, Nome='Jaguar Cars Ltd.'
-- REMs: IDs=[9465]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9465 para BASE 2913

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2913, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9465
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2913 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9465;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2913, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9465
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2913 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9465;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2913, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9465
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2913 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9465;


-- ------------------------------------------------------------
-- Grupo 122: japlisson
-- BASE: ID=10376, Nome='J.a.plisson'
-- REMs: IDs=[13976]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13976 para BASE 10376

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10376, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13976
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10376 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13976;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10376, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13976
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10376 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13976;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10376, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13976
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10376 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13976;


-- ------------------------------------------------------------
-- Grupo 123: jbw
-- BASE: ID=9185, Nome='Jbw'
-- REMs: IDs=[9254]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9254 para BASE 9185

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9185, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9254
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9185 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9254;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9185, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9254
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9185 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9254;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9185, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9254
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9185 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9254;


-- ------------------------------------------------------------
-- Grupo 124: jdcmillermotorsports
-- BASE: ID=2849, Nome='JDC-Miller Motorsports'
-- REMs: IDs=[9594]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9594 para BASE 2849

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2849, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9594
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2849 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9594;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2849, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9594
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2849 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9594;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2849, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9594
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2849 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9594;


-- ------------------------------------------------------------
-- Grupo 125: jeanclaudegiroix
-- BASE: ID=10996, Nome='Jean-claude giroix'
-- REMs: IDs=[13492]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13492 para BASE 10996

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10996, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13492
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10996 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13492;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10996, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13492
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10996 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13492;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10996, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13492
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10996 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13492;


-- ------------------------------------------------------------
-- Grupo 126: jedreteaud
-- BASE: ID=7392, Nome='J. Edreteaud'
-- REMs: IDs=[9417]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9417 para BASE 7392

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7392, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9417
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7392 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9417;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7392, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9417
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7392 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9417;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7392, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9417
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7392 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9417;


-- ------------------------------------------------------------
-- Grupo 127: jgsears
-- BASE: ID=2834, Nome='J.G. Sears'
-- REMs: IDs=[13842]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13842 para BASE 2834

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2834, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13842
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2834 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13842;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2834, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13842
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2834 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13842;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2834, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13842
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2834 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13842;


-- ------------------------------------------------------------
-- Grupo 128: jlpracing
-- BASE: ID=2836, Nome='J.L.P. Racing'
-- REMs: IDs=[2864]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 2864 para BASE 2836

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2836, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 2864
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2836 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 2864;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2836, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 2864
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2836 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 2864;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2836, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 2864
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2836 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 2864;


-- ------------------------------------------------------------
-- Grupo 129: jmb
-- BASE: ID=12265, Nome='Jmb'
-- REMs: IDs=[12987]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12987 para BASE 12265

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12265, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12987
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12265 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12987;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12265, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12987
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12265 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12987;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12265, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12987
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12265 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12987;


-- ------------------------------------------------------------
-- Grupo 130: johnwyerautomotiveengineeringltd
-- BASE: ID=9006, Nome='John Wyer Automotive Engineering Ltd.'
-- REMs: IDs=[9329]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9329 para BASE 9006

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9006, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9329
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9006 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9329;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9006, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9329
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9006 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9329;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9006, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9329
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9006 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9329;


-- ------------------------------------------------------------
-- Grupo 131: jpgaban
-- BASE: ID=7394, Nome='J.P. Gaban'
-- REMs: IDs=[9418, 9843]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9418 para BASE 7394

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7394, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9418
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7394 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9418;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7394, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9418
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7394 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9418;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7394, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9418
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7394 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9418;

-- Movendo relacionamentos do REM 9843 para BASE 7394

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7394, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9843
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7394 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9843;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7394, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9843
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7394 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9843;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7394, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9843
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7394 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9843;


-- ------------------------------------------------------------
-- Grupo 132: jps
-- BASE: ID=7926, Nome='JPS'
-- REMs: IDs=[13709]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13709 para BASE 7926

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7926, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13709
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7926 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13709;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7926, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13709
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7926 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13709;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7926, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13709
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7926 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13709;


-- ------------------------------------------------------------
-- Grupo 133: jsracing
-- BASE: ID=2829, Nome='J&S Racing'
-- REMs: IDs=[11397]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11397 para BASE 2829

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2829, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11397
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2829 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11397;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2829, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11397
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2829 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11397;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2829, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11397
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2829 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11397;


-- ------------------------------------------------------------
-- Grupo 134: jwaavila
-- BASE: ID=2902, Nome='JWA-Avila'
-- REMs: IDs=[11532]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11532 para BASE 2902

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 2902, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11532
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 2902 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11532;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 2902, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11532
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 2902 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11532;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 2902, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11532
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 2902 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11532;


-- ------------------------------------------------------------
-- Grupo 135: jwagulf
-- BASE: ID=10433, Nome='Jwa gulf'
-- REMs: IDs=[10856]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10856 para BASE 10433

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10433, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10856
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10433 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10856;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10433, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10856
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10433 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10856;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10433, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10856
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10433 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10856;


-- ------------------------------------------------------------
-- Grupo 136: jwautomotiveengineering
-- BASE: ID=7402, Nome='JW Automotive Engineering'
-- REMs: IDs=[9330]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9330 para BASE 7402

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7402, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9330
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7402 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9330;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7402, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9330
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7402 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9330;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7402, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9330
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7402 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9330;


-- ------------------------------------------------------------
-- Grupo 137: jwautomotiveengineeringgulf
-- BASE: ID=7887, Nome='JW Automotive Engineering Gulf'
-- REMs: IDs=[10760, 11577]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10760 para BASE 7887

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7887, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10760
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7887 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10760;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7887, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10760
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7887 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10760;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7887, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10760
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7887 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10760;

-- Movendo relacionamentos do REM 11577 para BASE 7887

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7887, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11577
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7887 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11577;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7887, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11577
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7887 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11577;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7887, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11577
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7887 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11577;


-- ------------------------------------------------------------
-- Grupo 138: kaidoworks
-- BASE: ID=9386, Nome='Kaidoworks'
-- REMs: IDs=[10569]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10569 para BASE 9386

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9386, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10569
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9386 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10569;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9386, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10569
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9386 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10569;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9386, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10569
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9386 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10569;


-- ------------------------------------------------------------
-- Grupo 139: kicmotorsport
-- BASE: ID=3046, Nome='KIC Motorsport'
-- REMs: IDs=[3129]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 3129 para BASE 3046

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3046, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 3129
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3046 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 3129;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3046, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 3129
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3046 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 3129;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3046, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 3129
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3046 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 3129;


-- ------------------------------------------------------------
-- Grupo 140: kpaxracing
-- BASE: ID=3027, Nome='K-Pax Racing'
-- REMs: IDs=[9423]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9423 para BASE 3027

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3027, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9423
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3027 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9423;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3027, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9423
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3027 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9423;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3027, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9423
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3027 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9423;


-- ------------------------------------------------------------
-- Grupo 141: ksworldrallyteam
-- BASE: ID=3023, Nome='K's World Rally Team'
-- REMs: IDs=[3196]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 3196 para BASE 3023

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3023, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 3196
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3023 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 3196;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3023, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 3196
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3023 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 3196;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3023, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 3196
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3023 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 3196;


-- ------------------------------------------------------------
-- Grupo 142: kuhnenagel
-- BASE: ID=13348, Nome='Kuhne & nagel'
-- REMs: IDs=[13982]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13982 para BASE 13348

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 13348, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13982
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 13348 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13982;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 13348, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13982
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 13348 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13982;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 13348, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13982
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 13348 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13982;


-- ------------------------------------------------------------
-- Grupo 143: lagondaltd
-- BASE: ID=3241, Nome='Lagonda Ltd.'
-- REMs: IDs=[12978]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12978 para BASE 3241

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3241, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12978
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3241 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12978;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3241, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12978
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3241 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12978;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3241, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12978
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3241 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12978;


-- ------------------------------------------------------------
-- Grupo 144: lambrettasafd
-- BASE: ID=3246, Nome='Lambretta S.A.F.D.'
-- REMs: IDs=[12448]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12448 para BASE 3246

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3246, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12448
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3246 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12448;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3246, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12448
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3246 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12448;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3246, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12448
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3246 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12448;


-- ------------------------------------------------------------
-- Grupo 145: landmotorsport
-- BASE: ID=3250, Nome='Land Motorsport'
-- REMs: IDs=[10090]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10090 para BASE 3250

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3250, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10090
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3250 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10090;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3250, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10090
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3250 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10090;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3250, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10090
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3250 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10090;


-- ------------------------------------------------------------
-- Grupo 146: lbworks
-- BASE: ID=37, Nome='LB Works'
-- REMs: IDs=[9388, 9572, 14505]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9388 para BASE 37

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 37, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9388
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 37 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9388;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 37, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9388
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 37 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9388;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 37, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9388
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 37 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9388;

-- Movendo relacionamentos do REM 9572 para BASE 37

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 37, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9572
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 37 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9572;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 37, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9572
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 37 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9572;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 37, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9572
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 37 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9572;

-- Movendo relacionamentos do REM 14505 para BASE 37

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 37, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 14505
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 37 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 14505;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 37, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 14505
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 37 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 14505;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 37, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 14505
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 37 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 14505;


-- ------------------------------------------------------------
-- Grupo 147: lds
-- BASE: ID=9194, Nome='Lds'
-- REMs: IDs=[9255]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9255 para BASE 9194

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9194, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9255
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9194 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9255;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9194, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9255
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9194 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9255;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9194, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9255
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9194 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9255;


-- ------------------------------------------------------------
-- Grupo 148: lecrefrigerationracing
-- BASE: ID=9195, Nome='Lec Refrigeration Racing'
-- REMs: IDs=[9256]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9256 para BASE 9195

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9195, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9256
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9195 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9256;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9195, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9256
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9195 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9256;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9195, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9256
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9195 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9256;


-- ------------------------------------------------------------
-- Grupo 149: lemans
-- BASE: ID=7463, Nome='Lemans'
-- REMs: IDs=[12838]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12838 para BASE 7463

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7463, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12838
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7463 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12838;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7463, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12838
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7463 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12838;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7463, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12838
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7463 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12838;


-- ------------------------------------------------------------
-- Grupo 150: letorchtransports
-- BASE: ID=8712, Nome='Le Torc'H Transports'
-- REMs: IDs=[8794]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 8794 para BASE 8712

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8712, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 8794
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8712 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 8794;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8712, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 8794
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8712 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 8794;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8712, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 8794
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8712 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 8794;


-- ------------------------------------------------------------
-- Grupo 151: liquimolyrichardlloydracing
-- BASE: ID=9834, Nome='Liqui moly, richard lloyd racing'
-- REMs: IDs=[13497]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13497 para BASE 9834

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9834, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13497
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9834 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13497;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9834, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13497
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9834 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13497;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9834, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13497
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9834 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13497;


-- ------------------------------------------------------------
-- Grupo 152: map
-- BASE: ID=3407, Nome='M.A.P.'
-- REMs: IDs=[12252]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12252 para BASE 3407

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3407, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12252
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3407 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12252;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3407, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12252
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3407 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12252;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3407, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12252
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3407 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12252;


-- ------------------------------------------------------------
-- Grupo 153: martiniracing
-- BASE: ID=3619, Nome='Martini Racing'
-- REMs: IDs=[14277]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 14277 para BASE 3619

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3619, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 14277
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3619 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 14277;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3619, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 14277
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3619 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 14277;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3619, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 14277
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3619 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 14277;


-- ------------------------------------------------------------
-- Grupo 154: matraelf
-- BASE: ID=7515, Nome='Matra Elf'
-- REMs: IDs=[13391]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13391 para BASE 7515

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7515, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13391
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7515 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13391;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7515, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13391
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7515 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13391;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7515, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13391
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7515 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13391;


-- ------------------------------------------------------------
-- Grupo 155: matrasimca
-- BASE: ID=7517, Nome='Matra-Simca'
-- REMs: IDs=[9432]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9432 para BASE 7517

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7517, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9432
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7517 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9432;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7517, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9432
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7517 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9432;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7517, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9432
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7517 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9432;


-- ------------------------------------------------------------
-- Grupo 156: mazdaspeed
-- BASE: ID=3660, Nome='Mazdaspeed'
-- REMs: IDs=[9730]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9730 para BASE 3660

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3660, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9730
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3660 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9730;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3660, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9730
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3660 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9730;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3660, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9730
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3660 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9730;


-- ------------------------------------------------------------
-- Grupo 157: mbm
-- BASE: ID=9203, Nome='Mbm'
-- REMs: IDs=[9257]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9257 para BASE 9203

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9203, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9257
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9203 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9257;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9203, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9257
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9203 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9257;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9203, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9257
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9203 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9257;


-- ------------------------------------------------------------
-- Grupo 158: mccormick
-- BASE: ID=11091, Nome='Mccormick'
-- REMs: IDs=[13354]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13354 para BASE 11091

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 11091, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13354
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 11091 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13354;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 11091, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13354
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 11091 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13354;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 11091, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13354
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 11091 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13354;


-- ------------------------------------------------------------
-- Grupo 159: mcguire
-- BASE: ID=9204, Nome='Mcguire'
-- REMs: IDs=[9259]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9259 para BASE 9204

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9204, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9259
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9204 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9259;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9204, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9259
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9204 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9259;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9204, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9259
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9204 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9259;


-- ------------------------------------------------------------
-- Grupo 160: mercedesamg
-- BASE: ID=8002, Nome='Mercedes-AMG'
-- REMs: IDs=[11033]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11033 para BASE 8002

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8002, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11033
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8002 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11033;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8002, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11033
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8002 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11033;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8002, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11033
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8002 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11033;


-- ------------------------------------------------------------
-- Grupo 161: mercedesamgteamblackfalcon
-- BASE: ID=10984, Nome='Mercedes amg team black falcon'
-- REMs: IDs=[11030]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11030 para BASE 10984

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10984, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11030
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10984 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11030;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10984, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11030
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10984 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11030;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10984, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11030
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10984 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11030;


-- ------------------------------------------------------------
-- Grupo 162: mercedesbenz
-- BASE: ID=31, Nome='Mercedes-Benz'
-- REMs: IDs=[7521]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 7521 para BASE 31

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 31, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 7521
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 31 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 7521;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 31, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 7521
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 31 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 7521;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 31, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 7521
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 31 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 7521;


-- ------------------------------------------------------------
-- Grupo 163: mf1
-- BASE: ID=9207, Nome='Mf1'
-- REMs: IDs=[9258]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9258 para BASE 9207

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9207, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9258
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9207 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9258;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9207, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9258
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9207 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9258;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9207, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9258
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9207 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9258;


-- ------------------------------------------------------------
-- Grupo 164: mg
-- BASE: ID=3409, Nome='M.G.'
-- REMs: IDs=[7490]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 7490 para BASE 3409

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3409, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 7490
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3409 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 7490;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3409, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 7490
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3409 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 7490;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3409, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 7490
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3409 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 7490;


-- ------------------------------------------------------------
-- Grupo 165: mgcarsltd
-- BASE: ID=3446, Nome='MG Cars Ltd.'
-- REMs: IDs=[11459]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11459 para BASE 3446

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3446, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11459
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3446 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11459;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3446, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11459
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3446 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11459;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3446, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11459
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3446 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11459;


-- ------------------------------------------------------------
-- Grupo 166: mjmotorsports
-- BASE: ID=3395, Nome='M&J Motorsports'
-- REMs: IDs=[3459]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 3459 para BASE 3395

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3395, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 3459
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3395 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 3459;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3395, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 3459
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3395 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 3459;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3395, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 3459
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3395 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 3459;


-- ------------------------------------------------------------
-- Grupo 167: mkmotorsport
-- BASE: ID=3461, Nome='MK Motorsport'
-- REMs: IDs=[9813]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9813 para BASE 3461

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3461, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9813
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3461 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9813;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3461, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9813
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3461 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9813;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3461, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9813
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3461 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9813;


-- ------------------------------------------------------------
-- Grupo 168: mmotorsport
-- BASE: ID=8668, Nome='M-Motorsport'
-- REMs: IDs=[9858]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9858 para BASE 8668

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8668, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9858
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8668 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9858;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8668, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9858
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8668 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9858;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8668, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9858
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8668 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9858;


-- ------------------------------------------------------------
-- Grupo 169: mobil1
-- BASE: ID=11061, Nome='Mobil1'
-- REMs: IDs=[11669]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11669 para BASE 11061

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 11061, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11669
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 11061 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11669;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 11061, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11669
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 11061 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11669;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 11061, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11669
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 11061 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11669;


-- ------------------------------------------------------------
-- Grupo 170: mogilmotorsltd
-- BASE: ID=3805, Nome='Mogil Motors Ltd.'
-- REMs: IDs=[9841]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9841 para BASE 3805

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3805, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9841
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3805 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9841;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3805, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9841
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3805 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9841;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3805, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9841
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3805 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9841;


-- ------------------------------------------------------------
-- Grupo 171: monsteryamahatech3
-- BASE: ID=3824, Nome='Monster Yamaha Tech 3'
-- REMs: IDs=[11026]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11026 para BASE 3824

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3824, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11026
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3824 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11026;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3824, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11026
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3824 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11026;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3824, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11026
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3824 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11026;


-- ------------------------------------------------------------
-- Grupo 172: montaplastbylandmotorsport
-- BASE: ID=3826, Nome='Montaplast by Land-Motorsport'
-- REMs: IDs=[11220]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11220 para BASE 3826

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3826, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11220
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3826 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11220;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3826, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11220
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3826 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11220;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3826, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11220
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3826 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11220;


-- ------------------------------------------------------------
-- Grupo 173: motorsport
-- BASE: ID=7542, Nome='Motorsport'
-- REMs: IDs=[13132]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13132 para BASE 7542

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7542, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13132
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7542 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13132;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7542, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13132
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7542 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13132;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7542, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13132
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7542 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13132;


-- ------------------------------------------------------------
-- Grupo 174: mperformance
-- BASE: ID=7483, Nome='M-Performance'
-- REMs: IDs=[11961]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11961 para BASE 7483

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7483, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11961
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7483 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11961;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7483, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11961
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7483 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11961;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7483, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11961
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7483 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11961;


-- ------------------------------------------------------------
-- Grupo 175: mracingymr
-- BASE: ID=3392, Nome='M Racing - YMR'
-- REMs: IDs=[3410]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 3410 para BASE 3392

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3392, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 3410
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3392 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 3410;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3392, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 3410
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3392 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 3410;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3392, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 3410
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3392 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 3410;


-- ------------------------------------------------------------
-- Grupo 176: mrracing
-- BASE: ID=3476, Nome='MR Racing'
-- REMs: IDs=[3477]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 3477 para BASE 3476

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3476, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 3477
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3476 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 3477;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3476, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 3477
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3476 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 3477;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3476, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 3477
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3476 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 3477;


-- ------------------------------------------------------------
-- Grupo 177: mrs
-- BASE: ID=12576, Nome='Mr-s'
-- REMs: IDs=[13397]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13397 para BASE 12576

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12576, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13397
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12576 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13397;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12576, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13397
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12576 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13397;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12576, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13397
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12576 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13397;


-- ------------------------------------------------------------
-- Grupo 178: mrsgtracing
-- BASE: ID=3483, Nome='MRS GT Racing'
-- REMs: IDs=[3484]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 3484 para BASE 3483

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3483, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 3484
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3483 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 3484;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3483, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 3484
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3483 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 3484;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3483, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 3484
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3483 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 3484;


-- ------------------------------------------------------------
-- Grupo 179: nart
-- BASE: ID=3953, Nome='N.A.R.T.'
-- REMs: IDs=[7566, 9680]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 7566 para BASE 3953

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3953, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 7566
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3953 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 7566;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3953, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 7566
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3953 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 7566;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3953, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 7566
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3953 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 7566;

-- Movendo relacionamentos do REM 9680 para BASE 3953

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3953, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9680
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3953 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9680;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3953, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9680
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3953 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9680;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3953, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9680
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3953 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9680;


-- ------------------------------------------------------------
-- Grupo 180: newmanjoestracing
-- BASE: ID=8012, Nome='New-Man Joest Racing'
-- REMs: IDs=[9493]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9493 para BASE 8012

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8012, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9493
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8012 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9493;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8012, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9493
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8012 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9493;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8012, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9493
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8012 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9493;


-- ------------------------------------------------------------
-- Grupo 181: nowmotorsports
-- BASE: ID=4072, Nome='Now Motor Sports'
-- REMs: IDs=[4073]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 4073 para BASE 4072

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4072, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 4073
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4072 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 4073;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4072, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 4073
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4072 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 4073;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4072, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 4073
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4072 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 4073;


-- ------------------------------------------------------------
-- Grupo 182: nsu
-- BASE: ID=8503, Nome='NsU'
-- REMs: IDs=[8559]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 8559 para BASE 8503

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8503, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 8559
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8503 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 8559;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8503, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 8559
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8503 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 8559;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8503, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 8559
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8503 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 8559;


-- ------------------------------------------------------------
-- Grupo 183: ntstproproject
-- BASE: ID=3991, Nome='NTS T Pro Project'
-- REMs: IDs=[3992]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 3992 para BASE 3991

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 3991, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 3992
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 3991 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 3992;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 3991, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 3992
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 3991 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 3992;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 3991, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 3992
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 3991 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 3992;


-- ------------------------------------------------------------
-- Grupo 184: oakracing
-- BASE: ID=4103, Nome='Oak Racing'
-- REMs: IDs=[13523]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13523 para BASE 4103

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4103, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13523
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4103 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13523;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4103, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13523
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4103 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13523;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4103, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13523
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4103 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13523;


-- ------------------------------------------------------------
-- Grupo 185: octane126
-- BASE: ID=4110, Nome='Octane 126'
-- REMs: IDs=[7582]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 7582 para BASE 4110

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4110, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 7582
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4110 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 7582;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4110, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 7582
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4110 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 7582;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4110, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 7582
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4110 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 7582;


-- ------------------------------------------------------------
-- Grupo 186: orecamatmut
-- BASE: ID=12941, Nome='Oreca matmut'
-- REMs: IDs=[12952]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12952 para BASE 12941

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12941, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12952
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12941 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12952;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12941, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12952
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12941 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12952;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12941, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12952
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12941 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12952;


-- ------------------------------------------------------------
-- Grupo 187: osca
-- BASE: ID=7591, Nome='Osca'
-- REMs: IDs=[9260]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9260 para BASE 7591

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7591, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9260
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7591 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9260;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7591, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9260
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7591 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9260;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7591, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9260
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7591 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9260;


-- ------------------------------------------------------------
-- Grupo 188: panozmotorsports
-- BASE: ID=4295, Nome='Panoz Motor Sports'
-- REMs: IDs=[9716]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9716 para BASE 4295

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4295, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9716
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4295 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9716;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4295, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9716
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4295 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9716;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4295, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9716
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4295 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9716;


-- ------------------------------------------------------------
-- Grupo 189: petermitchellthomson
-- BASE: ID=8489, Nome='Peter Mitchell-Thomson'
-- REMs: IDs=[13863]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13863 para BASE 8489

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8489, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13863
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8489 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13863;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8489, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13863
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8489 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13863;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8489, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13863
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8489 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13863;


-- ------------------------------------------------------------
-- Grupo 190: peugeottalbotsport
-- BASE: ID=4403, Nome='Peugeot Talbot Sport'
-- REMs: IDs=[4409]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 4409 para BASE 4403

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4403, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 4409
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4403 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 4409;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4403, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 4409
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4403 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 4409;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4403, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 4409
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4403 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 4409;


-- ------------------------------------------------------------
-- Grupo 191: pgfkinfaunamr
-- BASE: ID=4214, Nome='PGF - Kinfaun AMR'
-- REMs: IDs=[11976]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11976 para BASE 4214

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4214, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11976
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4214 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11976;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4214, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11976
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4214 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11976;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4214, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11976
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4214 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11976;


-- ------------------------------------------------------------
-- Grupo 192: phsport
-- BASE: ID=4216, Nome='PH Sport'
-- REMs: IDs=[4217]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 4217 para BASE 4216

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4216, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 4217
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4216 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 4217;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4216, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 4217
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4216 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 4217;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4216, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 4217
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4216 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 4217;


-- ------------------------------------------------------------
-- Grupo 193: porschekg
-- BASE: ID=4468, Nome='Porsche KG'
-- REMs: IDs=[9571]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9571 para BASE 4468

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4468, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9571
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4468 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9571;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4468, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9571
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4468 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9571;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4468, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9571
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4468 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9571;


-- ------------------------------------------------------------
-- Grupo 194: pricebscher
-- BASE: ID=4516, Nome='Price & Bscher'
-- REMs: IDs=[14294]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 14294 para BASE 4516

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4516, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 14294
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4516 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 14294;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4516, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 14294
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4516 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 14294;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4516, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 14294
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4516 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 14294;


-- ------------------------------------------------------------
-- Grupo 195: progt
-- BASE: ID=12019, Nome='Pro gt'
-- REMs: IDs=[13554]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13554 para BASE 12019

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12019, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13554
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12019 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13554;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12019, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13554
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12019 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13554;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12019, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13554
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12019 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13554;


-- ------------------------------------------------------------
-- Grupo 196: project1
-- BASE: ID=4549, Nome='Project 1'
-- REMs: IDs=[9589]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9589 para BASE 4549

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4549, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9589
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4549 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9589;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4549, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9589
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4549 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9589;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4549, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9589
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4549 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9589;


-- ------------------------------------------------------------
-- Grupo 197: project1ao
-- BASE: ID=4550, Nome='Project 1 - AO'
-- REMs: IDs=[7656]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 7656 para BASE 4550

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4550, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 7656
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4550 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 7656;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4550, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 7656
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4550 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 7656;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4550, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 7656
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4550 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 7656;


-- ------------------------------------------------------------
-- Grupo 198: promotorsport
-- BASE: ID=4533, Nome='Pro Motor Sport'
-- REMs: IDs=[4563, 4564]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 4563 para BASE 4533

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4533, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 4563
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4533 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 4563;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4533, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 4563
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4533 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 4563;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4533, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 4563
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4533 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 4563;

-- Movendo relacionamentos do REM 4564 para BASE 4533

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4533, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 4564
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4533 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 4564;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4533, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 4564
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4533 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 4564;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4533, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 4564
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4533 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 4564;


-- ------------------------------------------------------------
-- Grupo 199: prosport
-- BASE: ID=7653, Nome='Pro-Sport'
-- REMs: IDs=[9435]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9435 para BASE 7653

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7653, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9435
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7653 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9435;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7653, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9435
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7653 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9435;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7653, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9435
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7653 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9435;


-- ------------------------------------------------------------
-- Grupo 200: prosportracing
-- BASE: ID=4246, Nome='PROsport Racing'
-- REMs: IDs=[9433]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9433 para BASE 4246

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4246, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9433
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4246 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9433;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4246, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9433
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4246 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9433;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4246, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9433
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4246 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9433;


-- ------------------------------------------------------------
-- Grupo 201: psg1corse
-- BASE: ID=4251, Nome='PSG - 1 Corse'
-- REMs: IDs=[14264]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 14264 para BASE 4251

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4251, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 14264
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4251 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 14264;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4251, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 14264
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4251 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 14264;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4251, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 14264
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4251 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 14264;


-- ------------------------------------------------------------
-- Grupo 202: quifelasm
-- BASE: ID=11653, Nome='Quifel asm'
-- REMs: IDs=[13438]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13438 para BASE 11653

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 11653, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13438
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 11653 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13438;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 11653, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13438
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 11653 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13438;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 11653, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13438
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 11653 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13438;


-- ------------------------------------------------------------
-- Grupo 203: rallytechnology
-- BASE: ID=4848, Nome='Rally Technology'
-- REMs: IDs=[4851]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 4851 para BASE 4848

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4848, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 4851
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4848 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 4851;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4848, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 4851
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4848 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 4851;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4848, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 4851
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4848 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 4851;


-- ------------------------------------------------------------
-- Grupo 204: ram
-- BASE: ID=7684, Nome='Ram'
-- REMs: IDs=[9261]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9261 para BASE 7684

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7684, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9261
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7684 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9261;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7684, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9261
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7684 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9261;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7684, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9261
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7684 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9261;


-- ------------------------------------------------------------
-- Grupo 205: ramchargers
-- BASE: ID=9101, Nome='Ramchargers'
-- REMs: IDs=[10558]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10558 para BASE 9101

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9101, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10558
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9101 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10558;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9101, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10558
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9101 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10558;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9101, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10558
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9101 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10558;


-- ------------------------------------------------------------
-- Grupo 206: rauhwelt
-- BASE: ID=8174, Nome='Rauh Welt'
-- REMs: IDs=[10299]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10299 para BASE 8174

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8174, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10299
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8174 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10299;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8174, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10299
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8174 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10299;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8174, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10299
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8174 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10299;


-- ------------------------------------------------------------
-- Grupo 207: raysracing
-- BASE: ID=4872, Nome='Ray's Racing'
-- REMs: IDs=[9844]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9844 para BASE 4872

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4872, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9844
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4872 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9844;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4872, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9844
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4872 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9844;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4872, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9844
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4872 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9844;


-- ------------------------------------------------------------
-- Grupo 208: rcmotorsport
-- BASE: ID=4648, Nome='R.C. Motorsport'
-- REMs: IDs=[4675]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 4675 para BASE 4648

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4648, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 4675
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4648 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 4675;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4648, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 4675
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4648 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 4675;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4648, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 4675
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4648 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 4675;


-- ------------------------------------------------------------
-- Grupo 209: redbullktmtech3
-- BASE: ID=4896, Nome='Red Bull KTM Tech 3'
-- REMs: IDs=[4897]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 4897 para BASE 4896

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4896, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 4897
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4896 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 4897;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4896, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 4897
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4896 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 4897;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4896, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 4897
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4896 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 4897;


-- ------------------------------------------------------------
-- Grupo 210: redmanbright
-- BASE: ID=4920, Nome='Redman Bright'
-- REMs: IDs=[4921]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 4921 para BASE 4920

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4920, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 4921
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4920 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 4921;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4920, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 4921
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4920 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 4921;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4920, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 4921
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4920 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 4921;


-- ------------------------------------------------------------
-- Grupo 211: renaultedams
-- BASE: ID=4955, Nome='Renault e.Dams'
-- REMs: IDs=[11007]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11007 para BASE 4955

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4955, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11007
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4955 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11007;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4955, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11007
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4955 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11007;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4955, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11007
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4955 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11007;


-- ------------------------------------------------------------
-- Grupo 212: riverside
-- BASE: ID=5014, Nome='Riverside'
-- REMs: IDs=[7694]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 7694 para BASE 5014

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5014, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 7694
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5014 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 7694;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5014, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 7694
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5014 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 7694;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5014, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 7694
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5014 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 7694;


-- ------------------------------------------------------------
-- Grupo 213: rjracing
-- BASE: ID=4635, Nome='R&J Racing'
-- REMs: IDs=[4694]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 4694 para BASE 4635

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4635, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 4694
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4635 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 4694;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4635, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 4694
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4635 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 4694;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4635, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 4694
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4635 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 4694;


-- ------------------------------------------------------------
-- Grupo 214: rlrmsport
-- BASE: ID=4699, Nome='RLR MSport'
-- REMs: IDs=[10360]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10360 para BASE 4699

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4699, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10360
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4699 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10360;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4699, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10360
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4699 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10360;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4699, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10360
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4699 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10360;


-- ------------------------------------------------------------
-- Grupo 215: rmerracingswitzerland
-- BASE: ID=5109, Nome='RÃ¶mer Racing Switzerland'
-- REMs: IDs=[5111]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 5111 para BASE 5109

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5109, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 5111
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5109 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 5111;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5109, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 5111
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5109 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 5111;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5109, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 5111
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5109 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 5111;


-- ------------------------------------------------------------
-- Grupo 216: rmotorsport
-- BASE: ID=4639, Nome='R-Motorsport'
-- REMs: IDs=[10317]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10317 para BASE 4639

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4639, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10317
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4639 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10317;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4639, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10317
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4639 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10317;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4639, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10317
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4639 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10317;


-- ------------------------------------------------------------
-- Grupo 217: rollsroyce
-- BASE: ID=7696, Nome='Rolls royce'
-- REMs: IDs=[12038]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12038 para BASE 7696

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7696, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12038
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7696 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12038;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7696, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12038
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7696 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12038;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7696, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12038
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7696 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12038;


-- ------------------------------------------------------------
-- Grupo 218: rossocorsa
-- BASE: ID=5059, Nome='Rosso Corsa'
-- REMs: IDs=[12406]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12406 para BASE 5059

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5059, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12406
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5059 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12406;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5059, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12406
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5059 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12406;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5059, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12406
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5059 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12406;


-- ------------------------------------------------------------
-- Grupo 219: rsrallyesport
-- BASE: ID=4729, Nome='RS Rallye Sport'
-- REMs: IDs=[4732]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 4732 para BASE 4729

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 4729, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 4732
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 4729 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 4732;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 4729, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 4732
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 4729 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 4732;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 4729, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 4732
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 4729 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 4732;


-- ------------------------------------------------------------
-- Grupo 220: s7r
-- BASE: ID=8404, Nome='S7R'
-- REMs: IDs=[12948]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12948 para BASE 8404

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8404, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12948
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8404 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12948;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8404, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12948
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8404 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12948;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8404, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12948
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8404 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12948;


-- ------------------------------------------------------------
-- Grupo 221: santambroeus
-- BASE: ID=9927, Nome='Sant ambroeus'
-- REMs: IDs=[12263]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12263 para BASE 9927

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9927, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12263
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9927 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12263;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9927, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12263
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9927 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12263;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9927, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12263
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9927 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12263;


-- ------------------------------------------------------------
-- Grupo 222: sapeurspompiersdugard
-- BASE: ID=9045, Nome='Sapeurs Pompiers Du Gard'
-- REMs: IDs=[12809]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12809 para BASE 9045

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9045, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12809
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9045 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12809;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9045, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12809
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9045 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12809;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9045, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12809
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9045 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12809;


-- ------------------------------------------------------------
-- Grupo 223: sapeurspompiersmoselle
-- BASE: ID=8669, Nome='Sapeurs Pompiers Moselle'
-- REMs: IDs=[11892]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11892 para BASE 8669

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8669, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11892
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8669 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11892;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8669, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11892
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8669 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11892;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8669, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11892
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8669 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11892;


-- ------------------------------------------------------------
-- Grupo 224: scheidpartlmotorsport
-- BASE: ID=11671, Nome='Scheid-partl motorsport'
-- REMs: IDs=[12161]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12161 para BASE 11671

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 11671, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12161
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 11671 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12161;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 11671, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12161
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 11671 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12161;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 11671, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12161
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 11671 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12161;


-- ------------------------------------------------------------
-- Grupo 225: schenkerco
-- BASE: ID=13311, Nome='Schenker & co.'
-- REMs: IDs=[13359]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13359 para BASE 13311

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 13311, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13359
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 13311 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13359;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 13311, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13359
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 13311 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13359;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 13311, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13359
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 13311 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13359;


-- ------------------------------------------------------------
-- Grupo 226: scuderiajwagulf
-- BASE: ID=10305, Nome='Scuderia jwa gulf'
-- REMs: IDs=[10858]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10858 para BASE 10305

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10305, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10858
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10305 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10858;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10305, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10858
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10305 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10858;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10305, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10858
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10305 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10858;


-- ------------------------------------------------------------
-- Grupo 227: scuderianart
-- BASE: ID=12121, Nome='Scuderia nart'
-- REMs: IDs=[12390]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12390 para BASE 12121

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12121, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12390
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12121 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12390;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12121, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12390
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12121 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12390;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12121, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12390
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12121 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12390;


-- ------------------------------------------------------------
-- Grupo 228: scuderiasantambroeus
-- BASE: ID=5331, Nome='Scuderia Sant Ambroeus'
-- REMs: IDs=[12480]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12480 para BASE 5331

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5331, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12480
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5331 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12480;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5331, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12480
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5331 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12480;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5331, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12480
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5331 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12480;


-- ------------------------------------------------------------
-- Grupo 229: sdkfz
-- BASE: ID=13377, Nome='Sdkfz'
-- REMs: IDs=[13879]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13879 para BASE 13377

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 13377, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13879
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 13377 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13879;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 13377, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13879
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 13377 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13879;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 13377, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13879
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 13377 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13879;


-- ------------------------------------------------------------
-- Grupo 230: secautomobilescd
-- BASE: ID=5144, Nome='SEC Automobiles CD'
-- REMs: IDs=[7704]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 7704 para BASE 5144

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5144, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 7704
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5144 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 7704;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5144, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 7704
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5144 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 7704;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5144, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 7704
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5144 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 7704;


-- ------------------------------------------------------------
-- Grupo 231: sefacferrari
-- BASE: ID=5118, Nome='S.E.F.A.C. Ferrari'
-- REMs: IDs=[9440]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9440 para BASE 5118

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5118, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9440
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5118 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9440;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5118, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9440
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5118 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9440;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5118, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9440
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5118 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9440;


-- ------------------------------------------------------------
-- Grupo 232: sgdriversproject
-- BASE: ID=5147, Nome='SG Driver's Project'
-- REMs: IDs=[5148]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 5148 para BASE 5147

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5147, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 5148
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5147 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 5148;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5147, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 5148
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5147 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 5148;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5147, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 5148
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5147 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 5148;


-- ------------------------------------------------------------
-- Grupo 233: shelbyamericaninc
-- BASE: ID=5374, Nome='Shelby American Inc.'
-- REMs: IDs=[11842]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11842 para BASE 5374

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5374, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11842
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5374 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11842;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5374, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11842
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5374 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11842;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5374, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11842
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5374 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11842;


-- ------------------------------------------------------------
-- Grupo 234: signatechalpinematmut
-- BASE: ID=5395, Nome='Signatech Alpine Matmut'
-- REMs: IDs=[9619]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9619 para BASE 5395

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5395, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9619
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5395 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9619;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5395, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9619
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5395 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9619;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5395, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9619
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5395 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9619;


-- ------------------------------------------------------------
-- Grupo 235: signatureplus
-- BASE: ID=5399, Nome='Signature-Plus'
-- REMs: IDs=[12064]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12064 para BASE 5399

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5399, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12064
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5399 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12064;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5399, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12064
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5399 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12064;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5399, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12064
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5399 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12064;


-- ------------------------------------------------------------
-- Grupo 236: skytempestaracing
-- BASE: ID=5429, Nome='Sky Tempesta Racing'
-- REMs: IDs=[9697]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9697 para BASE 5429

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5429, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9697
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5429 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9697;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5429, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9697
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5429 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9697;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5429, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9697
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5429 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9697;


-- ------------------------------------------------------------
-- Grupo 237: sofrevasp
-- BASE: ID=5459, Nome='Sofrev - Asp'
-- REMs: IDs=[14437]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 14437 para BASE 5459

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5459, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 14437
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5459 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 14437;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5459, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 14437
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5459 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 14437;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5459, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 14437
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5459 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 14437;


-- ------------------------------------------------------------
-- Grupo 238: southdownfleetsupport
-- BASE: ID=12280, Nome='Southdown fleet support'
-- REMs: IDs=[12287]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12287 para BASE 12280

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12280, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12287
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12280 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12287;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12280, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12287
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12280 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12287;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12280, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12287
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12280 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12287;


-- ------------------------------------------------------------
-- Grupo 239: speedlover
-- BASE: ID=5492, Nome='Speed Lover'
-- REMs: IDs=[5498]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 5498 para BASE 5492

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5492, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 5498
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5492 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 5498;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5492, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 5498
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5492 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 5498;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5492, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 5498
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5492 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 5498;


-- ------------------------------------------------------------
-- Grupo 240: sportquattro
-- BASE: ID=7766, Nome='Sport Quattro'
-- REMs: IDs=[14013]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 14013 para BASE 7766

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7766, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 14013
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7766 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 14013;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7766, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 14013
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7766 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 14013;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7766, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 14013
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7766 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 14013;


-- ------------------------------------------------------------
-- Grupo 241: spsautomotiveperformance
-- BASE: ID=5185, Nome='SPS Automotive Performance'
-- REMs: IDs=[5186]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 5186 para BASE 5185

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5185, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 5186
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5185 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 5186;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5185, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 5186
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5185 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 5186;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5185, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 5186
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5185 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 5186;


-- ------------------------------------------------------------
-- Grupo 242: stingray
-- BASE: ID=10559, Nome='Stingray'
-- REMs: IDs=[12072]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12072 para BASE 10559

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10559, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12072
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10559 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12072;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10559, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12072
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10559 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12072;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10559, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12072
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10559 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12072;


-- ------------------------------------------------------------
-- Grupo 243: subaru
-- BASE: ID=33, Nome='SUBARU'
-- REMs: IDs=[39]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 39 para BASE 33

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 33, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 39
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 33 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 39;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 33, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 39
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 33 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 39;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 33, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 39
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 33 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 39;


-- ------------------------------------------------------------
-- Grupo 244: talbotlago
-- BASE: ID=8834, Nome='Talbot Lago'
-- REMs: IDs=[9234]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9234 para BASE 8834

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8834, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9234
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8834 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9234;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8834, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9234
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8834 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9234;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8834, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9234
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8834 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9234;


-- ------------------------------------------------------------
-- Grupo 245: team75
-- BASE: ID=8511, Nome='Team75'
-- REMs: IDs=[13571]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 13571 para BASE 8511

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8511, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13571
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8511 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13571;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8511, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13571
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8511 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13571;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8511, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13571
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8511 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13571;


-- ------------------------------------------------------------
-- Grupo 246: teamfelbermayrproton
-- BASE: ID=5941, Nome='Team Felbermayr Proton'
-- REMs: IDs=[5942]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 5942 para BASE 5941

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5941, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 5942
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5941 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 5942;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5941, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 5942
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5941 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 5942;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5941, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 5942
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5941 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 5942;


-- ------------------------------------------------------------
-- Grupo 247: teamhanshinridingschool
-- BASE: ID=5975, Nome='Team Hanshin Riding School'
-- REMs: IDs=[5976]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 5976 para BASE 5975

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5975, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 5976
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5975 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 5976;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5975, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 5976
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5975 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 5976;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5975, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 5976
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5975 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 5976;


-- ------------------------------------------------------------
-- Grupo 248: teamlemans
-- BASE: ID=6034, Nome='Team Le Mans'
-- REMs: IDs=[6035]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 6035 para BASE 6034

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6034, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 6035
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6034 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 6035;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6034, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 6035
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6034 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 6035;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6034, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 6035
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6034 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 6035;


-- ------------------------------------------------------------
-- Grupo 249: teamtvtvasahidragon
-- BASE: ID=8602, Nome='Team TV TVAsahi Dragon'
-- REMs: IDs=[9717]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9717 para BASE 8602

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8602, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9717
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8602 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9717;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8602, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9717
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8602 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9717;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8602, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9717
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8602 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9717;


-- ------------------------------------------------------------
-- Grupo 250: teamworkmotorsport
-- BASE: ID=6242, Nome='Team Work Motorsport'
-- REMs: IDs=[6253]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 6253 para BASE 6242

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6242, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 6253
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6242 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 6253;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6242, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 6253
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6242 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 6253;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6242, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 6253
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6242 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 6253;


-- ------------------------------------------------------------
-- Grupo 251: tech1racing
-- BASE: ID=6254, Nome='Tech 1 Racing'
-- REMs: IDs=[9929]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9929 para BASE 6254

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6254, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9929
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6254 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9929;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6254, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9929
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6254 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9929;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6254, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9929
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6254 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9929;


-- ------------------------------------------------------------
-- Grupo 252: tech3
-- BASE: ID=6255, Nome='Tech 3'
-- REMs: IDs=[9779, 13097]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9779 para BASE 6255

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6255, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9779
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6255 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9779;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6255, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9779
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6255 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9779;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6255, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9779
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6255 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9779;

-- Movendo relacionamentos do REM 13097 para BASE 6255

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6255, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13097
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6255 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13097;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6255, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13097
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6255 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13097;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6255, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13097
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6255 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13097;


-- ------------------------------------------------------------
-- Grupo 253: tech3eracing
-- BASE: ID=6256, Nome='Tech 3 E-Racing'
-- REMs: IDs=[6260]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 6260 para BASE 6256

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6256, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 6260
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6256 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 6260;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6256, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 6260
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6256 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 6260;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6256, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 6260
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6256 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 6260;


-- ------------------------------------------------------------
-- Grupo 254: techspeedmotorsport
-- BASE: ID=6258, Nome='Tech-Speed Motorsport'
-- REMs: IDs=[6269]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 6269 para BASE 6258

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6258, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 6269
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6258 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 6269;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6258, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 6269
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6258 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 6269;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6258, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 6269
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6258 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 6269;


-- ------------------------------------------------------------
-- Grupo 255: temperogiuffreracing
-- BASE: ID=6290, Nome='Tempero-Giuffre Racing'
-- REMs: IDs=[6291]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 6291 para BASE 6290

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6290, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 6291
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6290 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 6291;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6290, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 6291
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6290 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 6291;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6290, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 6291
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6290 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 6291;


-- ------------------------------------------------------------
-- Grupo 256: theracersgroup
-- BASE: ID=6311, Nome='The Racer''s Group'
-- REMs: IDs=[6312]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 6312 para BASE 6311

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6311, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 6312
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6311 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 6312;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6311, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 6312
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6311 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 6312;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6311, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 6312
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6311 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 6312;


-- ------------------------------------------------------------
-- Grupo 257: threebondracing
-- BASE: ID=6323, Nome='Three Bond Racing'
-- REMs: IDs=[6325]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 6325 para BASE 6323

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6323, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 6325
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6323 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 6325;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6323, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 6325
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6323 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 6325;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6323, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 6325
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6323 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 6325;


-- ------------------------------------------------------------
-- Grupo 258: tictac
-- BASE: ID=11192, Nome='Tic-tac'
-- REMs: IDs=[11858]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11858 para BASE 11192

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 11192, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11858
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 11192 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11858;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 11192, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11858
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 11192 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11858;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 11192, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11858
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 11192 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11858;


-- ------------------------------------------------------------
-- Grupo 259: tolimitmotorsport
-- BASE: ID=11859, Nome='To limit motorsport'
-- REMs: IDs=[11860]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11860 para BASE 11859

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 11859, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11860
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 11859 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11860;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 11859, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11860
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 11859 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11860;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 11859, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11860
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 11859 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11860;


-- ------------------------------------------------------------
-- Grupo 260: toms
-- BASE: ID=5760, Nome='TOM''S'
-- REMs: IDs=[5764]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 5764 para BASE 5760

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 5760, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 5764
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 5760 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 5764;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 5760, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 5764
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 5760 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 5764;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 5760, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 5764
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 5760 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 5764;


-- ------------------------------------------------------------
-- Grupo 261: totalenergies
-- BASE: ID=7803, Nome='TotalEnergies'
-- REMs: IDs=[10238]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10238 para BASE 7803

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 7803, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10238
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 7803 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10238;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 7803, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10238
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 7803 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10238;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 7803, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10238
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 7803 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10238;


-- ------------------------------------------------------------
-- Grupo 262: toyotateamtoms
-- BASE: ID=6404, Nome='Toyota Team TOM''S'
-- REMs: IDs=[6405]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 6405 para BASE 6404

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6404, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 6405
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6404 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 6405;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6404, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 6405
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6404 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 6405;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6404, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 6405
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6404 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 6405;


-- ------------------------------------------------------------
-- Grupo 263: transam
-- BASE: ID=10457, Nome='Trans am'
-- REMs: IDs=[11508]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11508 para BASE 10457

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10457, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11508
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10457 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11508;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10457, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11508
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10457 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11508;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10457, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11508
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10457 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11508;


-- ------------------------------------------------------------
-- Grupo 264: triplea
-- BASE: ID=12572, Nome='Triple-a'
-- REMs: IDs=[12605]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12605 para BASE 12572

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12572, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12605
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12572 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12605;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12572, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12605
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12572 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12605;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12572, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12605
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12572 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12605;


-- ------------------------------------------------------------
-- Grupo 265: twrjaguarracing
-- BASE: ID=11111, Nome='T.w.r. jaguar racing'
-- REMs: IDs=[11112]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11112 para BASE 11111

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 11111, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11112
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 11111 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11112;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 11111, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11112
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 11111 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11112;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 11111, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11112
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 11111 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11112;


-- ------------------------------------------------------------
-- Grupo 266: udtlaystallracing
-- BASE: ID=10425, Nome='Udt laystall racing'
-- REMs: IDs=[12488, 13300]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12488 para BASE 10425

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10425, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12488
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10425 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12488;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10425, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12488
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10425 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12488;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10425, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12488
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10425 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12488;

-- Movendo relacionamentos do REM 13300 para BASE 10425

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 10425, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 13300
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 10425 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 13300;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 10425, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 13300
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 10425 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 13300;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 10425, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 13300
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 10425 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 13300;


-- ------------------------------------------------------------
-- Grupo 267: usracing
-- BASE: ID=6486, Nome='U.S. Racing'
-- REMs: IDs=[6497]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 6497 para BASE 6486

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6486, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 6497
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6486 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 6497;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6486, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 6497
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6486 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 6497;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6486, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 6497
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6486 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 6497;


-- ------------------------------------------------------------
-- Grupo 268: vipergtsr
-- BASE: ID=12266, Nome='Viper gt-s r'
-- REMs: IDs=[12357]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12357 para BASE 12266

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12266, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12357
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12266 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12357;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12266, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12357
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12266 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12357;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12266, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12357
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12266 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12357;


-- ------------------------------------------------------------
-- Grupo 269: wcm
-- BASE: ID=6664, Nome='W.C.M.'
-- REMs: IDs=[6666]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 6666 para BASE 6664

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6664, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 6666
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6664 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 6666;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6664, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 6666
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6664 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 6666;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6664, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 6666
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6664 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 6666;


-- ------------------------------------------------------------
-- Grupo 270: weathertechracing
-- BASE: ID=6702, Nome='WeatherTech Racing'
-- REMs: IDs=[9595]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9595 para BASE 6702

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6702, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9595
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6702 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9595;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6702, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9595
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6702 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9595;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6702, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9595
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6702 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9595;


-- ------------------------------------------------------------
-- Grupo 271: wedssport
-- BASE: ID=12568, Nome='Weds sport'
-- REMs: IDs=[12588]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12588 para BASE 12568

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12568, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12588
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12568 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12588;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12568, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12588
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12568 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12588;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12568, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12588
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12568 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12588;


-- ------------------------------------------------------------
-- Grupo 272: wmotors
-- BASE: ID=9624, Nome='W-motors'
-- REMs: IDs=[11170]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 11170 para BASE 9624

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 9624, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 11170
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 9624 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 11170;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 9624, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 11170
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 9624 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 11170;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 9624, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 11170
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 9624 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 11170;


-- ------------------------------------------------------------
-- Grupo 273: xjr9
-- BASE: ID=12905, Nome='Xjr-9'
-- REMs: IDs=[12944]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 12944 para BASE 12905

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12905, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 12944
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12905 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 12944;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12905, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 12944
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12905 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 12944;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12905, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 12944
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12905 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 12944;


-- ------------------------------------------------------------
-- Grupo 274: xk120
-- BASE: ID=12471, Nome='Xk120'
-- REMs: IDs=[14053]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 14053 para BASE 12471

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 12471, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 14053
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 12471 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 14053;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 12471, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 14053
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 12471 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 14053;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 12471, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 14053
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 12471 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 14053;


-- ------------------------------------------------------------
-- Grupo 275: zolauto
-- BASE: ID=8497, Nome='Zol-Auto'
-- REMs: IDs=[10119]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 10119 para BASE 8497

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 8497, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 10119
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 8497 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 10119;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 8497, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 10119
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 8497 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 10119;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 8497, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 10119
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 8497 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 10119;


-- ------------------------------------------------------------
-- Grupo 276: zwenterprisesinc
-- BASE: ID=6854, Nome='Z. & W. Enterprises Inc.'
-- REMs: IDs=[9821]
-- ------------------------------------------------------------

-- Movendo relacionamentos do REM 9821 para BASE 6854

-- 1. Drivers (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_drivers_teams (teams_id, drivers_id)
SELECT 6854, dt.drivers_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt
WHERE dt.teams_id = 9821
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
    WHERE teams_id = 6854 AND drivers_id = dt.drivers_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_drivers_teams WHERE teams_id = 9821;

-- 2. Miniatures (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_miniatures_teams (teams_id, miniatures_id)
SELECT 6854, mt.miniatures_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt
WHERE mt.teams_id = 9821
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
    WHERE teams_id = 6854 AND miniatures_id = mt.miniatures_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams WHERE teams_id = 9821;

-- 3. Competitions (evitando duplicatas)
INSERT INTO pb7lpfmycz97c19._nc_m2m_competition_teams (teams_id, competition_id)
SELECT 6854, ct.competition_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct
WHERE ct.teams_id = 9821
  AND NOT EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams
    WHERE teams_id = 6854 AND competition_id = ct.competition_id
  )
ON CONFLICT DO NOTHING;

DELETE FROM pb7lpfmycz97c19._nc_m2m_competition_teams WHERE teams_id = 9821;


-- ============================================================
-- FASE 2: REMOÇÃO DOS TEAMS REMs
-- Remove os teams duplicados que agora estão vazios
-- ============================================================

-- Validação: verificar se os REMs estão realmente vazios
DO $$
DECLARE
  v_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
  WHERE teams_id IN (6932, 6947, 62, 13019, 87, 6975, 12929, 10431, 41, 11620, 9244, 10164, 14233, 10737, 9151, 9245, 213, 218, 502, 12356, 236, 13027, 7000, 13261, 11229, 12678, 11665, 11599, 9246, 13433, 681, 9714, 7046, 7044, 14220, 10056, 9600, 766, 9247, 9741, 12939, 13336, 10281, 10088, 9443, 1128, 10564, 11924, 1141, 13793, 10373, 12827, 12473, 1535, 1478, 12437, 1479, 13398, 10427, 13542, 9483, 11470, 8920, 1490, 1457, 1501, 9750, 10400, 1518, 12472, 14480, 1771, 14423, 9807, 11094, 11052, 9249, 9250, 12446, 9251, 13249, 9252, 7257, 2018, 13526, 2078, 13483, 14503, 12062, 11850, 12537, 9362, 7311, 2372, 2237, 13614, 13957, 2258, 13301, 11461, 2270, 11008, 12277, 12912, 11270, 2561, 2493, 9873, 11948, 2641, 2647, 7358, 13746, 12107, 8915, 2698, 9253, 8974, 12070, 11537, 13468, 10866, 9465, 13976, 9254, 9594, 13492, 9417, 13842, 2864, 12987, 9329, 9418, 9843, 13709, 11397, 11532, 10856, 9330, 10760, 11577, 10569, 3129, 9423, 3196, 13982, 12978, 12448, 10090, 9388, 9572, 14505, 9255, 9256, 12838, 8794, 13497, 12252, 14277, 13391, 9432, 9730, 9257, 13354, 9259, 11033, 11030, 7521, 9258, 7490, 11459, 3459, 9813, 9858, 11669, 9841, 11026, 11220, 13132, 11961, 3410, 3477, 13397, 3484, 7566, 9680, 9493, 4073, 8559, 3992, 13523, 7582, 12952, 9260, 9716, 13863, 4409, 11976, 4217, 9571, 14294, 13554, 9589, 7656, 4563, 4564, 9435, 9433, 14264, 13438, 4851, 9261, 10558, 10299, 9844, 4675, 4897, 4921, 11007, 7694, 4694, 10360, 5111, 10317, 12038, 12406, 4732, 12948, 12263, 12809, 11892, 12161, 13359, 10858, 12390, 12480, 13879, 7704, 9440, 5148, 11842, 9619, 12064, 9697, 14437, 12287, 5498, 14013, 5186, 12072, 39, 9234, 13571, 5942, 5976, 6035, 9717, 6253, 9929, 9779, 13097, 6260, 6269, 6291, 6312, 6325, 11858, 11860, 5764, 10238, 6405, 11508, 12605, 11112, 12488, 13300, 6497, 12357, 6666, 9595, 12588, 11170, 12944, 14053, 10119, 9821);
  
  IF v_count > 0 THEN
    RAISE EXCEPTION 'ERRO: Ainda existem % drivers vinculados aos REMs!', v_count;
  END IF;
  
  SELECT COUNT(*) INTO v_count
  FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
  WHERE teams_id IN (6932, 6947, 62, 13019, 87, 6975, 12929, 10431, 41, 11620, 9244, 10164, 14233, 10737, 9151, 9245, 213, 218, 502, 12356, 236, 13027, 7000, 13261, 11229, 12678, 11665, 11599, 9246, 13433, 681, 9714, 7046, 7044, 14220, 10056, 9600, 766, 9247, 9741, 12939, 13336, 10281, 10088, 9443, 1128, 10564, 11924, 1141, 13793, 10373, 12827, 12473, 1535, 1478, 12437, 1479, 13398, 10427, 13542, 9483, 11470, 8920, 1490, 1457, 1501, 9750, 10400, 1518, 12472, 14480, 1771, 14423, 9807, 11094, 11052, 9249, 9250, 12446, 9251, 13249, 9252, 7257, 2018, 13526, 2078, 13483, 14503, 12062, 11850, 12537, 9362, 7311, 2372, 2237, 13614, 13957, 2258, 13301, 11461, 2270, 11008, 12277, 12912, 11270, 2561, 2493, 9873, 11948, 2641, 2647, 7358, 13746, 12107, 8915, 2698, 9253, 8974, 12070, 11537, 13468, 10866, 9465, 13976, 9254, 9594, 13492, 9417, 13842, 2864, 12987, 9329, 9418, 9843, 13709, 11397, 11532, 10856, 9330, 10760, 11577, 10569, 3129, 9423, 3196, 13982, 12978, 12448, 10090, 9388, 9572, 14505, 9255, 9256, 12838, 8794, 13497, 12252, 14277, 13391, 9432, 9730, 9257, 13354, 9259, 11033, 11030, 7521, 9258, 7490, 11459, 3459, 9813, 9858, 11669, 9841, 11026, 11220, 13132, 11961, 3410, 3477, 13397, 3484, 7566, 9680, 9493, 4073, 8559, 3992, 13523, 7582, 12952, 9260, 9716, 13863, 4409, 11976, 4217, 9571, 14294, 13554, 9589, 7656, 4563, 4564, 9435, 9433, 14264, 13438, 4851, 9261, 10558, 10299, 9844, 4675, 4897, 4921, 11007, 7694, 4694, 10360, 5111, 10317, 12038, 12406, 4732, 12948, 12263, 12809, 11892, 12161, 13359, 10858, 12390, 12480, 13879, 7704, 9440, 5148, 11842, 9619, 12064, 9697, 14437, 12287, 5498, 14013, 5186, 12072, 39, 9234, 13571, 5942, 5976, 6035, 9717, 6253, 9929, 9779, 13097, 6260, 6269, 6291, 6312, 6325, 11858, 11860, 5764, 10238, 6405, 11508, 12605, 11112, 12488, 13300, 6497, 12357, 6666, 9595, 12588, 11170, 12944, 14053, 10119, 9821);
  
  IF v_count > 0 THEN
    RAISE EXCEPTION 'ERRO: Ainda existem % miniatures vinculadas aos REMs!', v_count;
  END IF;
  
  SELECT COUNT(*) INTO v_count
  FROM pb7lpfmycz97c19._nc_m2m_competition_teams
  WHERE teams_id IN (6932, 6947, 62, 13019, 87, 6975, 12929, 10431, 41, 11620, 9244, 10164, 14233, 10737, 9151, 9245, 213, 218, 502, 12356, 236, 13027, 7000, 13261, 11229, 12678, 11665, 11599, 9246, 13433, 681, 9714, 7046, 7044, 14220, 10056, 9600, 766, 9247, 9741, 12939, 13336, 10281, 10088, 9443, 1128, 10564, 11924, 1141, 13793, 10373, 12827, 12473, 1535, 1478, 12437, 1479, 13398, 10427, 13542, 9483, 11470, 8920, 1490, 1457, 1501, 9750, 10400, 1518, 12472, 14480, 1771, 14423, 9807, 11094, 11052, 9249, 9250, 12446, 9251, 13249, 9252, 7257, 2018, 13526, 2078, 13483, 14503, 12062, 11850, 12537, 9362, 7311, 2372, 2237, 13614, 13957, 2258, 13301, 11461, 2270, 11008, 12277, 12912, 11270, 2561, 2493, 9873, 11948, 2641, 2647, 7358, 13746, 12107, 8915, 2698, 9253, 8974, 12070, 11537, 13468, 10866, 9465, 13976, 9254, 9594, 13492, 9417, 13842, 2864, 12987, 9329, 9418, 9843, 13709, 11397, 11532, 10856, 9330, 10760, 11577, 10569, 3129, 9423, 3196, 13982, 12978, 12448, 10090, 9388, 9572, 14505, 9255, 9256, 12838, 8794, 13497, 12252, 14277, 13391, 9432, 9730, 9257, 13354, 9259, 11033, 11030, 7521, 9258, 7490, 11459, 3459, 9813, 9858, 11669, 9841, 11026, 11220, 13132, 11961, 3410, 3477, 13397, 3484, 7566, 9680, 9493, 4073, 8559, 3992, 13523, 7582, 12952, 9260, 9716, 13863, 4409, 11976, 4217, 9571, 14294, 13554, 9589, 7656, 4563, 4564, 9435, 9433, 14264, 13438, 4851, 9261, 10558, 10299, 9844, 4675, 4897, 4921, 11007, 7694, 4694, 10360, 5111, 10317, 12038, 12406, 4732, 12948, 12263, 12809, 11892, 12161, 13359, 10858, 12390, 12480, 13879, 7704, 9440, 5148, 11842, 9619, 12064, 9697, 14437, 12287, 5498, 14013, 5186, 12072, 39, 9234, 13571, 5942, 5976, 6035, 9717, 6253, 9929, 9779, 13097, 6260, 6269, 6291, 6312, 6325, 11858, 11860, 5764, 10238, 6405, 11508, 12605, 11112, 12488, 13300, 6497, 12357, 6666, 9595, 12588, 11170, 12944, 14053, 10119, 9821);
  
  IF v_count > 0 THEN
    RAISE EXCEPTION 'ERRO: Ainda existem % competitions vinculadas aos REMs!', v_count;
  END IF;
END $$;

-- Deletar os teams REMs
DELETE FROM pb7lpfmycz97c19.teams
WHERE id IN (6932, 6947, 62, 13019, 87, 6975, 12929, 10431, 41, 11620, 9244, 10164, 14233, 10737, 9151, 9245, 213, 218, 502, 12356, 236, 13027, 7000, 13261, 11229, 12678, 11665, 11599, 9246, 13433, 681, 9714, 7046, 7044, 14220, 10056, 9600, 766, 9247, 9741, 12939, 13336, 10281, 10088, 9443, 1128, 10564, 11924, 1141, 13793, 10373, 12827, 12473, 1535, 1478, 12437, 1479, 13398, 10427, 13542, 9483, 11470, 8920, 1490, 1457, 1501, 9750, 10400, 1518, 12472, 14480, 1771, 14423, 9807, 11094, 11052, 9249, 9250, 12446, 9251, 13249, 9252, 7257, 2018, 13526, 2078, 13483, 14503, 12062, 11850, 12537, 9362, 7311, 2372, 2237, 13614, 13957, 2258, 13301, 11461, 2270, 11008, 12277, 12912, 11270, 2561, 2493, 9873, 11948, 2641, 2647, 7358, 13746, 12107, 8915, 2698, 9253, 8974, 12070, 11537, 13468, 10866, 9465, 13976, 9254, 9594, 13492, 9417, 13842, 2864, 12987, 9329, 9418, 9843, 13709, 11397, 11532, 10856, 9330, 10760, 11577, 10569, 3129, 9423, 3196, 13982, 12978, 12448, 10090, 9388, 9572, 14505, 9255, 9256, 12838, 8794, 13497, 12252, 14277, 13391, 9432, 9730, 9257, 13354, 9259, 11033, 11030, 7521, 9258, 7490, 11459, 3459, 9813, 9858, 11669, 9841, 11026, 11220, 13132, 11961, 3410, 3477, 13397, 3484, 7566, 9680, 9493, 4073, 8559, 3992, 13523, 7582, 12952, 9260, 9716, 13863, 4409, 11976, 4217, 9571, 14294, 13554, 9589, 7656, 4563, 4564, 9435, 9433, 14264, 13438, 4851, 9261, 10558, 10299, 9844, 4675, 4897, 4921, 11007, 7694, 4694, 10360, 5111, 10317, 12038, 12406, 4732, 12948, 12263, 12809, 11892, 12161, 13359, 10858, 12390, 12480, 13879, 7704, 9440, 5148, 11842, 9619, 12064, 9697, 14437, 12287, 5498, 14013, 5186, 12072, 39, 9234, 13571, 5942, 5976, 6035, 9717, 6253, 9929, 9779, 13097, 6260, 6269, 6291, 6312, 6325, 11858, 11860, 5764, 10238, 6405, 11508, 12605, 11112, 12488, 13300, 6497, 12357, 6666, 9595, 12588, 11170, 12944, 14053, 10119, 9821);

-- ============================================================
-- FASE 3: VERIFICAÇÃO FINAL
-- ============================================================

-- Verificar quantos teams foram removidos
DO $$
DECLARE
  v_deleted INTEGER := 286;
BEGIN
  RAISE NOTICE 'Total de teams REMs removidos: %', v_deleted;
END $$;

-- ============================================================
-- COMMIT OU ROLLBACK
-- ============================================================

-- Se tudo estiver OK, descomente a linha abaixo para confirmar:
-- COMMIT;

-- Se quiser reverter tudo, descomente a linha abaixo:
-- ROLLBACK;

-- ATENÇÃO: Por segurança, deixe ambos comentados na primeira execução
-- e revise os resultados antes de fazer COMMIT!
