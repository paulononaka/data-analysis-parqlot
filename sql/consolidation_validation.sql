-- ============================================================
-- VALIDAÇÃO PRÉ-CONSOLIDAÇÃO
-- Execute estas queries primeiro para verificar o impacto
-- ============================================================

-- 1. Verificar total de teams que serão removidos
SELECT COUNT(*) as total_teams_to_remove
FROM pb7lpfmycz97c19.teams
WHERE id IN (6932, 6947, 62, 13019, 87, 6975, 12929, 10431, 41, 11620, 9244, 10164, 14233, 10737, 9151, 9245, 213, 218, 502, 12356, 236, 13027, 7000, 13261, 11229, 12678, 11665, 11599, 9246, 13433, 681, 9714, 7046, 7044, 14220, 10056, 9600, 766, 9247, 9741, 12939, 13336, 10281, 10088, 9443, 1128, 10564, 11924, 1141, 13793, 10373, 12827, 12473, 1535, 1478, 12437, 1479, 13398, 10427, 13542, 9483, 11470, 8920, 1490, 1457, 1501, 9750, 10400, 1518, 12472, 14480, 1771, 14423, 9807, 11094, 11052, 9249, 9250, 12446, 9251, 13249, 9252, 7257, 2018, 13526, 2078, 13483, 14503, 12062, 11850, 12537, 9362, 7311, 2372, 2237, 13614, 13957, 2258, 13301, 11461, 2270, 11008, 12277, 12912, 11270, 2561, 2493, 9873, 11948, 2641, 2647, 7358, 13746, 12107, 8915, 2698, 9253, 8974, 12070, 11537, 13468, 10866, 9465, 13976, 9254, 9594, 13492, 9417, 13842, 2864, 12987, 9329, 9418, 9843, 13709, 11397, 11532, 10856, 9330, 10760, 11577, 10569, 3129, 9423, 3196, 13982, 12978, 12448, 10090, 9388, 9572, 14505, 9255, 9256, 12838, 8794, 13497, 12252, 14277, 13391, 9432, 9730, 9257, 13354, 9259, 11033, 11030, 7521, 9258, 7490, 11459, 3459, 9813, 9858, 11669, 9841, 11026, 11220, 13132, 11961, 3410, 3477, 13397, 3484, 7566, 9680, 9493, 4073, 8559, 3992, 13523, 7582, 12952, 9260, 9716, 13863, 4409, 11976, 4217, 9571, 14294, 13554, 9589, 7656, 4563, 4564, 9435, 9433, 14264, 13438, 4851, 9261, 10558, 10299, 9844, 4675, 4897, 4921, 11007, 7694, 4694, 10360, 5111, 10317, 12038, 12406, 4732, 12948, 12263, 12809, 11892, 12161, 13359, 10858, 12390, 12480, 13879, 7704, 9440, 5148, 11842, 9619, 12064, 9697, 14437, 12287, 5498, 14013, 5186, 12072, 39, 9234, 13571, 5942, 5976, 6035, 9717, 6253, 9929, 9779, 13097, 6260, 6269, 6291, 6312, 6325, 11858, 11860, 5764, 10238, 6405, 11508, 12605, 11112, 12488, 13300, 6497, 12357, 6666, 9595, 12588, 11170, 12944, 14053, 10119, 9821);

-- 2. Verificar total de relacionamentos que serão movidos
SELECT 
  'Drivers' as tipo,
  COUNT(*) as total_relacionamentos
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams
WHERE teams_id IN (6932, 6947, 62, 13019, 87, 6975, 12929, 10431, 41, 11620, 9244, 10164, 14233, 10737, 9151, 9245, 213, 218, 502, 12356, 236, 13027, 7000, 13261, 11229, 12678, 11665, 11599, 9246, 13433, 681, 9714, 7046, 7044, 14220, 10056, 9600, 766, 9247, 9741, 12939, 13336, 10281, 10088, 9443, 1128, 10564, 11924, 1141, 13793, 10373, 12827, 12473, 1535, 1478, 12437, 1479, 13398, 10427, 13542, 9483, 11470, 8920, 1490, 1457, 1501, 9750, 10400, 1518, 12472, 14480, 1771, 14423, 9807, 11094, 11052, 9249, 9250, 12446, 9251, 13249, 9252, 7257, 2018, 13526, 2078, 13483, 14503, 12062, 11850, 12537, 9362, 7311, 2372, 2237, 13614, 13957, 2258, 13301, 11461, 2270, 11008, 12277, 12912, 11270, 2561, 2493, 9873, 11948, 2641, 2647, 7358, 13746, 12107, 8915, 2698, 9253, 8974, 12070, 11537, 13468, 10866, 9465, 13976, 9254, 9594, 13492, 9417, 13842, 2864, 12987, 9329, 9418, 9843, 13709, 11397, 11532, 10856, 9330, 10760, 11577, 10569, 3129, 9423, 3196, 13982, 12978, 12448, 10090, 9388, 9572, 14505, 9255, 9256, 12838, 8794, 13497, 12252, 14277, 13391, 9432, 9730, 9257, 13354, 9259, 11033, 11030, 7521, 9258, 7490, 11459, 3459, 9813, 9858, 11669, 9841, 11026, 11220, 13132, 11961, 3410, 3477, 13397, 3484, 7566, 9680, 9493, 4073, 8559, 3992, 13523, 7582, 12952, 9260, 9716, 13863, 4409, 11976, 4217, 9571, 14294, 13554, 9589, 7656, 4563, 4564, 9435, 9433, 14264, 13438, 4851, 9261, 10558, 10299, 9844, 4675, 4897, 4921, 11007, 7694, 4694, 10360, 5111, 10317, 12038, 12406, 4732, 12948, 12263, 12809, 11892, 12161, 13359, 10858, 12390, 12480, 13879, 7704, 9440, 5148, 11842, 9619, 12064, 9697, 14437, 12287, 5498, 14013, 5186, 12072, 39, 9234, 13571, 5942, 5976, 6035, 9717, 6253, 9929, 9779, 13097, 6260, 6269, 6291, 6312, 6325, 11858, 11860, 5764, 10238, 6405, 11508, 12605, 11112, 12488, 13300, 6497, 12357, 6666, 9595, 12588, 11170, 12944, 14053, 10119, 9821)
UNION ALL
SELECT 
  'Miniatures' as tipo,
  COUNT(*) as total_relacionamentos
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams
WHERE teams_id IN (6932, 6947, 62, 13019, 87, 6975, 12929, 10431, 41, 11620, 9244, 10164, 14233, 10737, 9151, 9245, 213, 218, 502, 12356, 236, 13027, 7000, 13261, 11229, 12678, 11665, 11599, 9246, 13433, 681, 9714, 7046, 7044, 14220, 10056, 9600, 766, 9247, 9741, 12939, 13336, 10281, 10088, 9443, 1128, 10564, 11924, 1141, 13793, 10373, 12827, 12473, 1535, 1478, 12437, 1479, 13398, 10427, 13542, 9483, 11470, 8920, 1490, 1457, 1501, 9750, 10400, 1518, 12472, 14480, 1771, 14423, 9807, 11094, 11052, 9249, 9250, 12446, 9251, 13249, 9252, 7257, 2018, 13526, 2078, 13483, 14503, 12062, 11850, 12537, 9362, 7311, 2372, 2237, 13614, 13957, 2258, 13301, 11461, 2270, 11008, 12277, 12912, 11270, 2561, 2493, 9873, 11948, 2641, 2647, 7358, 13746, 12107, 8915, 2698, 9253, 8974, 12070, 11537, 13468, 10866, 9465, 13976, 9254, 9594, 13492, 9417, 13842, 2864, 12987, 9329, 9418, 9843, 13709, 11397, 11532, 10856, 9330, 10760, 11577, 10569, 3129, 9423, 3196, 13982, 12978, 12448, 10090, 9388, 9572, 14505, 9255, 9256, 12838, 8794, 13497, 12252, 14277, 13391, 9432, 9730, 9257, 13354, 9259, 11033, 11030, 7521, 9258, 7490, 11459, 3459, 9813, 9858, 11669, 9841, 11026, 11220, 13132, 11961, 3410, 3477, 13397, 3484, 7566, 9680, 9493, 4073, 8559, 3992, 13523, 7582, 12952, 9260, 9716, 13863, 4409, 11976, 4217, 9571, 14294, 13554, 9589, 7656, 4563, 4564, 9435, 9433, 14264, 13438, 4851, 9261, 10558, 10299, 9844, 4675, 4897, 4921, 11007, 7694, 4694, 10360, 5111, 10317, 12038, 12406, 4732, 12948, 12263, 12809, 11892, 12161, 13359, 10858, 12390, 12480, 13879, 7704, 9440, 5148, 11842, 9619, 12064, 9697, 14437, 12287, 5498, 14013, 5186, 12072, 39, 9234, 13571, 5942, 5976, 6035, 9717, 6253, 9929, 9779, 13097, 6260, 6269, 6291, 6312, 6325, 11858, 11860, 5764, 10238, 6405, 11508, 12605, 11112, 12488, 13300, 6497, 12357, 6666, 9595, 12588, 11170, 12944, 14053, 10119, 9821)
UNION ALL
SELECT 
  'Competitions' as tipo,
  COUNT(*) as total_relacionamentos
FROM pb7lpfmycz97c19._nc_m2m_competition_teams
WHERE teams_id IN (6932, 6947, 62, 13019, 87, 6975, 12929, 10431, 41, 11620, 9244, 10164, 14233, 10737, 9151, 9245, 213, 218, 502, 12356, 236, 13027, 7000, 13261, 11229, 12678, 11665, 11599, 9246, 13433, 681, 9714, 7046, 7044, 14220, 10056, 9600, 766, 9247, 9741, 12939, 13336, 10281, 10088, 9443, 1128, 10564, 11924, 1141, 13793, 10373, 12827, 12473, 1535, 1478, 12437, 1479, 13398, 10427, 13542, 9483, 11470, 8920, 1490, 1457, 1501, 9750, 10400, 1518, 12472, 14480, 1771, 14423, 9807, 11094, 11052, 9249, 9250, 12446, 9251, 13249, 9252, 7257, 2018, 13526, 2078, 13483, 14503, 12062, 11850, 12537, 9362, 7311, 2372, 2237, 13614, 13957, 2258, 13301, 11461, 2270, 11008, 12277, 12912, 11270, 2561, 2493, 9873, 11948, 2641, 2647, 7358, 13746, 12107, 8915, 2698, 9253, 8974, 12070, 11537, 13468, 10866, 9465, 13976, 9254, 9594, 13492, 9417, 13842, 2864, 12987, 9329, 9418, 9843, 13709, 11397, 11532, 10856, 9330, 10760, 11577, 10569, 3129, 9423, 3196, 13982, 12978, 12448, 10090, 9388, 9572, 14505, 9255, 9256, 12838, 8794, 13497, 12252, 14277, 13391, 9432, 9730, 9257, 13354, 9259, 11033, 11030, 7521, 9258, 7490, 11459, 3459, 9813, 9858, 11669, 9841, 11026, 11220, 13132, 11961, 3410, 3477, 13397, 3484, 7566, 9680, 9493, 4073, 8559, 3992, 13523, 7582, 12952, 9260, 9716, 13863, 4409, 11976, 4217, 9571, 14294, 13554, 9589, 7656, 4563, 4564, 9435, 9433, 14264, 13438, 4851, 9261, 10558, 10299, 9844, 4675, 4897, 4921, 11007, 7694, 4694, 10360, 5111, 10317, 12038, 12406, 4732, 12948, 12263, 12809, 11892, 12161, 13359, 10858, 12390, 12480, 13879, 7704, 9440, 5148, 11842, 9619, 12064, 9697, 14437, 12287, 5498, 14013, 5186, 12072, 39, 9234, 13571, 5942, 5976, 6035, 9717, 6253, 9929, 9779, 13097, 6260, 6269, 6291, 6312, 6325, 11858, 11860, 5764, 10238, 6405, 11508, 12605, 11112, 12488, 13300, 6497, 12357, 6666, 9595, 12588, 11170, 12944, 14053, 10119, 9821);

-- 3. Verificar se há duplicatas que serão criadas (IMPORTANTE!)
-- Esta query verifica se algum relacionamento já existe na BASE

-- Grupo: 1 (BASE: 6929, REMs: 6932)

-- Drivers duplicados que já existem na BASE 6929
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6929 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (6932)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6929
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6929
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6929 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (6932)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6929
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6929
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6929 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (6932)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6929
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: 250tr (BASE: 6946, REMs: 6947)

-- Drivers duplicados que já existem na BASE 6946
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6946 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (6947)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6946
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6946
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6946 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (6947)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6946
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6946
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6946 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (6947)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6946
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: 2seasmotorsport (BASE: 56, REMs: 62)

-- Drivers duplicados que já existem na BASE 56
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 56 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (62)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 56
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 56
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 56 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (62)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 56
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 56
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 56 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (62)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 56
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: 333 (BASE: 6952, REMs: 13019)

-- Drivers duplicados que já existem na BASE 6952
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6952 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13019)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6952
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6952
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6952 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13019)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6952
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6952
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6952 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13019)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6952
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: 8starmotorsports (BASE: 84, REMs: 87)

-- Drivers duplicados que já existem na BASE 84
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 84 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (87)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 84
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 84
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 84 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (87)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 84
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 84
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 84 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (87)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 84
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: 911scoupe (BASE: 6972, REMs: 6975)

-- Drivers duplicados que já existem na BASE 6972
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6972 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (6975)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6972
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6972
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6972 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (6975)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6972
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6972
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6972 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (6975)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6972
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: a6gcs (BASE: 11458, REMs: 12929)

-- Drivers duplicados que já existem na BASE 11458
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 11458 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12929)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 11458
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 11458
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 11458 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12929)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 11458
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 11458
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 11458 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12929)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 11458
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: accarsltd (BASE: 98, REMs: 10431)

-- Drivers duplicados que já existem na BASE 98
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 98 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10431)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 98
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 98
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 98 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10431)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 98
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 98
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 98 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10431)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 98
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: acura (BASE: 2, REMs: 41)

-- Drivers duplicados que já existem na BASE 2
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (41)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (41)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (41)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: adaengineering (BASE: 102, REMs: 11620)

-- Drivers duplicados que já existem na BASE 102
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 102 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11620)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 102
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 102
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 102 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11620)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 102
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 102
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 102 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11620)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 102
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: afm (BASE: 9150, REMs: 9244)

-- Drivers duplicados que já existem na BASE 9150
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9150 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9244)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9150
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9150
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9150 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9244)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9150
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9150
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9150 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9244)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9150
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: agaci (BASE: 103, REMs: 10164)

-- Drivers duplicados que já existem na BASE 103
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 103 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10164)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 103
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 103
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 103 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10164)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 103
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 103
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 103 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10164)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 103
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: airfrance (BASE: 8269, REMs: 14233)

-- Drivers duplicados que já existem na BASE 8269
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8269 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (14233)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8269
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8269
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8269 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (14233)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8269
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8269
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8269 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (14233)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8269
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: alanmannracingltd (BASE: 342, REMs: 10737)

-- Drivers duplicados que já existem na BASE 342
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 342 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10737)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 342
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 342
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 342 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10737)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 342
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 342
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 342 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10737)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 342
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: alphatauri (BASE: 26, REMs: 9151, 9245)

-- Drivers duplicados que já existem na BASE 26
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 26 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9151, 9245)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 26
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 26
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 26 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9151, 9245)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 26
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 26
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 26 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9151, 9245)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 26
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: amgmercedes (BASE: 212, REMs: 213)

-- Drivers duplicados que já existem na BASE 212
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 212 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (213)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 212
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 212
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 212 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (213)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 212
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 212
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 212 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (213)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 212
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: aoracing (BASE: 107, REMs: 218)

-- Drivers duplicados que já existem na BASE 107
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 107 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (218)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 107
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 107
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 107 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (218)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 107
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 107
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 107 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (218)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 107
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: armsupmotorsports (BASE: 500, REMs: 502)

-- Drivers duplicados que já existem na BASE 500
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 500 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (502)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 500
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 500
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 500 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (502)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 500
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 500
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 500 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (502)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 500
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: artcar (BASE: 10971, REMs: 12356)

-- Drivers duplicados que já existem na BASE 10971
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10971 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12356)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10971
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10971
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10971 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12356)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10971
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10971
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10971 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12356)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10971
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: artengineering (BASE: 109, REMs: 236)

-- Drivers duplicados que já existem na BASE 109
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 109 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (236)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 109
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 109
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 109 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (236)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 109
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 109
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 109 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (236)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 109
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: artsports (BASE: 11161, REMs: 13027)

-- Drivers duplicados que já existem na BASE 11161
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 11161 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13027)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 11161
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 11161
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 11161 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13027)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 11161
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 11161
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 11161 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13027)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 11161
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: asacachia (BASE: 112, REMs: 7000)

-- Drivers duplicados que já existem na BASE 112
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 112 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (7000)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 112
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 112
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 112 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (7000)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 112
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 112
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 112 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (7000)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 112
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: assistenzacorse (BASE: 12336, REMs: 13261)

-- Drivers duplicados que já existem na BASE 12336
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12336 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13261)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12336
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12336
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12336 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13261)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12336
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12336
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12336 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13261)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12336
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: austrodaimler (BASE: 10200, REMs: 11229)

-- Drivers duplicados que já existem na BASE 10200
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10200 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11229)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10200
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10200
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10200 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11229)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10200
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10200
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10200 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11229)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10200
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: autodeltaspa (BASE: 7927, REMs: 12678)

-- Drivers duplicados que já existem na BASE 7927
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7927 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12678)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7927
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7927
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7927 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12678)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7927
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7927
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7927 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12678)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7927
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: automobiliosca (BASE: 625, REMs: 11665)

-- Drivers duplicados que já existem na BASE 625
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 625 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11665)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 625
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 625
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 625 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11665)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 625
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 625
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 625 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11665)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 625
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: autoracingclubbratislava (BASE: 629, REMs: 11599)

-- Drivers duplicados que já existem na BASE 629
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 629 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11599)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 629
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 629
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 629 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11599)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 629
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 629
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 629 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11599)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 629
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: bar (BASE: 7910, REMs: 9246)

-- Drivers duplicados que já existem na BASE 7910
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7910 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9246)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7910
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7910
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7910 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9246)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7910
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7910
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7910 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9246)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7910
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: baraziepsilon (BASE: 815, REMs: 13433)

-- Drivers duplicados que já existem na BASE 815
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 815 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13433)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 815
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 815
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 815 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13433)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 815
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 815
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 815 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13433)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 815
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: bbacompetition (BASE: 667, REMs: 681)

-- Drivers duplicados que já existem na BASE 667
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 667 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (681)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 667
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 667
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 667 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (681)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 667
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 667
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 667 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (681)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 667
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: bentleymotorsltd (BASE: 868, REMs: 9714)

-- Drivers duplicados que já existem na BASE 868
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 868 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9714)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 868
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 868
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 868 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9714)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 868
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 868
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 868 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9714)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 868
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: bfgoodrich (BASE: 668, REMs: 7046)

-- Drivers duplicados que já existem na BASE 668
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 668 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (7046)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 668
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 668
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 668 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (7046)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 668
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 668
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 668 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (7046)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 668
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: bmaxracing (BASE: 938, REMs: 7044)

-- Drivers duplicados que já existem na BASE 938
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 938 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (7044)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 938
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 938
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 938 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (7044)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 938
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 938
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 938 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (7044)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 938
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: boac (BASE: 13654, REMs: 14220)

-- Drivers duplicados que já existem na BASE 13654
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 13654 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (14220)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 13654
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 13654
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 13654 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (14220)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 13654
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 13654
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 13654 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (14220)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 13654
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: boutsenginion (BASE: 9885, REMs: 10056)

-- Drivers duplicados que já existem na BASE 9885
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9885 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10056)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9885
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9885
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9885 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10056)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9885
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9885
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9885 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10056)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9885
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: boutsenginionracing (BASE: 984, REMs: 9600)

-- Drivers duplicados que já existem na BASE 984
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 984 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9600)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 984
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 984
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 984 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9600)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 984
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 984
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 984 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9600)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 984
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: brm (BASE: 669, REMs: 766)

-- Drivers duplicados que já existem na BASE 669
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 669 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (766)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 669
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 669
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 669 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (766)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 669
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 669
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 669 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (766)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 669
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: brp (BASE: 9161, REMs: 9247)

-- Drivers duplicados que já existem na BASE 9161
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9161 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9247)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9161
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9161
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9161 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9247)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9161
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9161
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9161 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9247)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9161
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: bscunningham (BASE: 670, REMs: 9741)

-- Drivers duplicados que já existem na BASE 670
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 670 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9741)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 670
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 670
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 670 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9741)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 670
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 670
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 670 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9741)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 670
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: c6r (BASE: 12177, REMs: 12939)

-- Drivers duplicados que já existem na BASE 12177
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12177 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12939)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12177
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12177
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12177 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12939)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12177
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12177
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12177 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12939)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12177
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: canam (BASE: 7106, REMs: 13336)

-- Drivers duplicados que já existem na BASE 7106
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7106 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13336)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7106
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7106
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7106 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13336)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7106
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7106
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7106 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13336)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7106
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: carguyracing (BASE: 1195, REMs: 10281)

-- Drivers duplicados que já existem na BASE 1195
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1195 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10281)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1195
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1195
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1195 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10281)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1195
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1195
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1195 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10281)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1195
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: carreracup (BASE: 7943, REMs: 10088)

-- Drivers duplicados que já existem na BASE 7943
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7943 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10088)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7943
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7943
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7943 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10088)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7943
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7943
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7943 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10088)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7943
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: caseih (BASE: 9070, REMs: 9443)

-- Drivers duplicados que já existem na BASE 9070
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9070 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9443)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9070
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9070
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9070 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9443)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9070
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9070
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9070 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9443)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9070
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: cipgreenpower (BASE: 1127, REMs: 1128)

-- Drivers duplicados que já existem na BASE 1127
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1127 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (1128)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1127
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1127
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1127 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (1128)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1127
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1127
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1127 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (1128)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1127
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: civictyper (BASE: 10388, REMs: 10564)

-- Drivers duplicados que já existem na BASE 10388
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10388 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10564)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10388
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10388
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10388 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10564)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10388
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10388
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10388 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10564)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10388
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: clearwaterracing (BASE: 1324, REMs: 11924)

-- Drivers duplicados que já existem na BASE 1324
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1324 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11924)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1324
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1324
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1324 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11924)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1324
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1324
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1324 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11924)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1324
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: clxpurerxcing (BASE: 1139, REMs: 1141)

-- Drivers duplicados que já existem na BASE 1139
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1139 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (1141)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1139
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1139
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1139 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (1141)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1139
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1139
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1139 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (1141)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1139
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: continentalgt3r (BASE: 10460, REMs: 13793)

-- Drivers duplicados que já existem na BASE 10460
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10460 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13793)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10460
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10460
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10460 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13793)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10460
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10460
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10460 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13793)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10460
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: craftbambooracing (BASE: 1411, REMs: 10373)

-- Drivers duplicados que já existem na BASE 1411
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1411 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10373)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1411
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1411
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1411 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10373)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1411
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1411
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1411 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10373)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1411
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: cri (BASE: 7093, REMs: 12827)

-- Drivers duplicados que já existem na BASE 7093
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7093 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12827)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7093
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7093
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7093 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12827)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7093
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7093
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7093 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12827)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7093
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: daimlerbenzag (BASE: 11930, REMs: 12473)

-- Drivers duplicados que já existem na BASE 11930
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 11930 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12473)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 11930
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 11930
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 11930 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12473)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 11930
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 11930
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 11930 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12473)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 11930
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: dalecoyneracingwithvassersullivan (BASE: 1534, REMs: 1535)

-- Drivers duplicados que já existem na BASE 1534
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1534 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (1535)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1534
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1534
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1534 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (1535)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1534
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1534
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1534 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (1535)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1534
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: dantinmotogp (BASE: 1455, REMs: 1478)

-- Drivers duplicados que já existem na BASE 1455
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1455 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (1478)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1455
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1455
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1455 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (1478)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1455
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1455
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1455 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (1478)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1455
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: db (BASE: 1462, REMs: 12437)

-- Drivers duplicados que já existem na BASE 1462
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1462 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12437)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1462
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1462
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1462 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12437)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1462
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1462
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1462 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12437)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1462
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: dbmotorsport (BASE: 1463, REMs: 1479)

-- Drivers duplicados que já existem na BASE 1463
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1463 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (1479)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1463
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1463
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1463 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (1479)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1463
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1463
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1463 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (1479)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1463
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: dbr9 (BASE: 12134, REMs: 13398)

-- Drivers duplicados que já existem na BASE 12134
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12134 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13398)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12134
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12134
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12134 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13398)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12134
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12134
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12134 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13398)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12134
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: delorean (BASE: 7211, REMs: 10427)

-- Drivers duplicados que já existem na BASE 7211
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7211 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10427)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7211
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7211
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7211 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10427)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7211
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7211
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7211 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10427)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7211
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: deltaadr (BASE: 1582, REMs: 13542)

-- Drivers duplicados que já existem na BASE 1582
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1582 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13542)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1582
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1582
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1582 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13542)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1582
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1582
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1582 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13542)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1582
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: dempseyprotonracing (BASE: 1588, REMs: 9483)

-- Drivers duplicados que já existem na BASE 1588
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1588 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9483)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1588
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1588
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1588 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9483)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1588
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1588
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1588 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9483)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1588
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: dempseyracingproton (BASE: 1587, REMs: 11470)

-- Drivers duplicados que já existem na BASE 1587
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1587 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11470)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1587
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1587
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1587 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11470)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1587
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1587
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1587 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11470)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1587
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: dentressangletransports (BASE: 8703, REMs: 8920)

-- Drivers duplicados que já existem na BASE 8703
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8703 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (8920)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8703
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8703
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8703 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (8920)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8703
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8703
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8703 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (8920)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8703
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: dfracing (BASE: 1464, REMs: 1490)

-- Drivers duplicados que já existem na BASE 1464
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1464 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (1490)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1464
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1464
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1464 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (1490)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1464
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1464
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1464 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (1490)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1464
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: dhondthumphreymotorsports (BASE: 1456, REMs: 1457)

-- Drivers duplicados que já existem na BASE 1456
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1456 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (1457)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1456
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1456
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1456 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (1457)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1456
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1456
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1456 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (1457)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1456
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: dhracing (BASE: 1454, REMs: 1501)

-- Drivers duplicados que já existem na BASE 1454
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1454 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (1501)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1454
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1454
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1454 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (1501)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1454
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1454
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1454 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (1501)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1454
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: doylerisiracing (BASE: 1654, REMs: 9750)

-- Drivers duplicados que já existem na BASE 1654
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1654 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9750)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1654
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1654
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1654 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9750)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1654
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1654
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1654 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9750)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1654
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: dragonspeed (BASE: 1662, REMs: 10400)

-- Drivers duplicados que já existem na BASE 1662
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1662 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10400)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1662
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1662
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1662 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10400)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1662
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1662
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1662 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10400)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1662
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: dstecheetah (BASE: 1517, REMs: 1518)

-- Drivers duplicados que já existem na BASE 1517
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1517 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (1518)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1517
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1517
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1517 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (1518)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1517
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1517
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1517 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (1518)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1517
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: dtype (BASE: 11539, REMs: 12472)

-- Drivers duplicados que já existem na BASE 11539
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 11539 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12472)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 11539
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 11539
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 11539 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12472)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 11539
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 11539
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 11539 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12472)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 11539
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: duckhamsoil (BASE: 8340, REMs: 14480)

-- Drivers duplicados que já existem na BASE 8340
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8340 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (14480)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8340
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8340
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8340 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (14480)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8340
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8340
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8340 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (14480)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8340
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: eastbelgianracingteam (BASE: 1770, REMs: 1771)

-- Drivers duplicados que já existem na BASE 1770
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1770 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (1771)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1770
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1770
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1770 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (1771)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1770
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1770
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1770 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (1771)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1770
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: ecuriefiatabarth (BASE: 10040, REMs: 14423)

-- Drivers duplicados que já existem na BASE 10040
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10040 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (14423)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10040
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10040
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10040 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (14423)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10040
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10040
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10040 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (14423)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10040
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: ecuriesavincalberson (BASE: 1812, REMs: 9807)

-- Drivers duplicados que já existem na BASE 1812
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1812 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9807)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1812
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1812
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1812 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9807)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1812
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1812
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1812 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9807)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1812
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: edams (BASE: 10878, REMs: 11094)

-- Drivers duplicados que já existem na BASE 10878
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10878 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11094)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10878
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10878
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10878 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11094)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10878
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10878
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10878 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11094)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10878
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: eg00marcvds (BASE: 1748, REMs: 11052)

-- Drivers duplicados que já existem na BASE 1748
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1748 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11052)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1748
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1748
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1748 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11052)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1748
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1748
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1748 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11052)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1748
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: elspecial (BASE: 9169, REMs: 9249)

-- Drivers duplicados que já existem na BASE 9169
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9169 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9249)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9169
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9169
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9169 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9249)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9169
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9169
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9169 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9249)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9169
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: emw (BASE: 9173, REMs: 9250)

-- Drivers duplicados que já existem na BASE 9173
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9173 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9250)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9173
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9173
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9173 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9250)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9173
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9173
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9173 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9250)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9173
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: equipematrasimca (BASE: 7245, REMs: 12446)

-- Drivers duplicados que já existem na BASE 7245
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7245 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12446)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7245
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7245
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7245 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12446)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7245
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7245
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7245 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12446)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7245
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: era (BASE: 9175, REMs: 9251)

-- Drivers duplicados que já existem na BASE 9175
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9175 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9251)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9175
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9175
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9175 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9251)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9175
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9175
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9175 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9251)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9175
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: essexmotorsport (BASE: 7254, REMs: 13249)

-- Drivers duplicados que já existem na BASE 7254
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7254 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13249)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7254
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7254
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7254 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13249)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7254
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7254
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7254 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13249)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7254
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: eurobrun (BASE: 9177, REMs: 9252)

-- Drivers duplicados que já existem na BASE 9177
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9177 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9252)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9177
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9177
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9177 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9252)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9177
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9177
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9177 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9252)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9177
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: euroracing (BASE: 1979, REMs: 7257)

-- Drivers duplicados que já existem na BASE 1979
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 1979 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (7257)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 1979
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 1979
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 1979 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (7257)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 1979
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 1979
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 1979 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (7257)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 1979
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: fcctsr (BASE: 2005, REMs: 2018)

-- Drivers duplicados que já existem na BASE 2005
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2005 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (2018)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2005
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2005
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2005 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (2018)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2005
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2005
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2005 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (2018)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2005
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: felbermayrproton (BASE: 11531, REMs: 13526)

-- Drivers duplicados que já existem na BASE 11531
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 11531 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13526)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 11531
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 11531
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 11531 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13526)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 11531
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 11531
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 11531 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13526)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 11531
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: ferrariafcorse (BASE: 2077, REMs: 2078)

-- Drivers duplicados que já existem na BASE 2077
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2077 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (2078)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2077
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2077
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2077 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (2078)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2077
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2077
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2077 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (2078)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2077
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: fiagt (BASE: 12367, REMs: 13483)

-- Drivers duplicados que já existem na BASE 12367
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12367 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13483)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12367
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12367
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12367 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13483)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12367
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12367
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12367 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13483)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12367
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: fistteamaai (BASE: 2028, REMs: 14503)

-- Drivers duplicados que já existem na BASE 2028
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2028 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (14503)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2028
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2028
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2028 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (14503)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2028
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2028
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2028 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (14503)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2028
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: fockewulf (BASE: 10351, REMs: 12062)

-- Drivers duplicados que já existem na BASE 10351
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10351 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12062)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10351
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10351
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10351 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12062)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10351
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10351
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10351 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12062)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10351
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: fuldmobil (BASE: 11848, REMs: 11850)

-- Drivers duplicados que já existem na BASE 11848
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 11848 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11850)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 11848
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 11848
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 11848 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11850)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 11848
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 11848
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 11848 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11850)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 11848
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: g (BASE: 9517, REMs: 12537)

-- Drivers duplicados que já existem na BASE 9517
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9517 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12537)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9517
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9517
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9517 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12537)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9517
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9517
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9517 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12537)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9517
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: ganderson (BASE: 7297, REMs: 9362)

-- Drivers duplicados que já existem na BASE 7297
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7297 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9362)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7297
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7297
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7297 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9362)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7297
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7297
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7297 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9362)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7297
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: garage59 (BASE: 2324, REMs: 7311)

-- Drivers duplicados que já existem na BASE 2324
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2324 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (7311)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2324
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2324
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2324 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (7311)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2324
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2324
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2324 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (7311)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2324
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: gilbertkorthoffmotorsports (BASE: 2371, REMs: 2372)

-- Drivers duplicados que já existem na BASE 2371
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2371 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (2372)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2371
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2371
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2371 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (2372)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2371
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2371
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2371 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (2372)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2371
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: gmmotorsport (BASE: 2187, REMs: 2237)

-- Drivers duplicados que já existem na BASE 2187
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2187 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (2237)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2187
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2187
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2187 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (2237)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2187
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2187
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2187 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (2237)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2187
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: goodsmileracing (BASE: 2405, REMs: 13614)

-- Drivers duplicados que já existem na BASE 2405
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2405 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13614)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2405
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2405
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2405 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13614)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2405
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2405
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2405 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13614)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2405
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: gpc (BASE: 12986, REMs: 13957)

-- Drivers duplicados que já existem na BASE 12986
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12986 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13957)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12986
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12986
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12986 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13957)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12986
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12986
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12986 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13957)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12986
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: gpcgiessesquadracorse (BASE: 2196, REMs: 2258)

-- Drivers duplicados que já existem na BASE 2196
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2196 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (2258)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2196
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2196
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2196 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (2258)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2196
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2196
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2196 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (2258)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2196
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: gpcsport (BASE: 2259, REMs: 13301)

-- Drivers duplicados que já existem na BASE 2259
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2259 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13301)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2259
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2259
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2259 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13301)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2259
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2259
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2259 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13301)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2259
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: granturismo (BASE: 10890, REMs: 11461)

-- Drivers duplicados que já existem na BASE 10890
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10890 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11461)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10890
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10890
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10890 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11461)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10890
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10890
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10890 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11461)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10890
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: grmotorsport (BASE: 2184, REMs: 2270)

-- Drivers duplicados que já existem na BASE 2184
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2184 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (2270)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2184
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2184
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2184 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (2270)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2184
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2184
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2184 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (2270)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2184
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: gruppem (BASE: 8034, REMs: 11008)

-- Drivers duplicados que já existem na BASE 8034
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8034 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11008)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8034
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8034
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8034 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11008)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8034
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8034
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8034 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11008)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8034
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: gstuning (BASE: 11670, REMs: 12277)

-- Drivers duplicados que já existem na BASE 11670
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 11670 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12277)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 11670
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 11670
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 11670 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12277)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 11670
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 11670
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 11670 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12277)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 11670
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: gtr (BASE: 7307, REMs: 12912)

-- Drivers duplicados que já existem na BASE 7307
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7307 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12912)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7307
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7307
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7307 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12912)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7307
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7307
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7307 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12912)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7307
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: gtrnismo (BASE: 7308, REMs: 11270)

-- Drivers duplicados que já existem na BASE 7308
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7308 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11270)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7308
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7308
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7308 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11270)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7308
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7308
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7308 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11270)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7308
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: hannusrallyteam (BASE: 2560, REMs: 2561)

-- Drivers duplicados que já existem na BASE 2560
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2560 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (2561)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2560
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2560
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2560 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (2561)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2560
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2560
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2560 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (2561)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2560
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: hbsuzukigpteam (BASE: 2484, REMs: 2493)

-- Drivers duplicados que já existem na BASE 2484
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2484 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (2493)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2484
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2484
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2484 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (2493)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2484
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2484
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2484 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (2493)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2484
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: hellapagidracingone (BASE: 2595, REMs: 9873)

-- Drivers duplicados que já existem na BASE 2595
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2595 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9873)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2595
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2595
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2595 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9873)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2595
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2595
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2595 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9873)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2595
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: hennstbirdswapshop (BASE: 2606, REMs: 11948)

-- Drivers duplicados que já existem na BASE 2606
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2606 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11948)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2606
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2606
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2606 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11948)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2606
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2606
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2606 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11948)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2606
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: hitechgp (BASE: 2636, REMs: 2641)

-- Drivers duplicados que já existem na BASE 2636
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2636 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (2641)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2636
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2636
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2636 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (2641)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2636
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2636
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2636 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (2641)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2636
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: hoforracing (BASE: 2645, REMs: 2647)

-- Drivers duplicados que já existem na BASE 2645
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2645 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (2647)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2645
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2645
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2645 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (2647)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2645
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2645
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2645 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (2647)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2645
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: holmanmoody (BASE: 2652, REMs: 7358)

-- Drivers duplicados que já existem na BASE 2652
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2652 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (7358)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2652
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2652
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2652 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (7358)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2652
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2652
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2652 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (7358)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2652
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: hpiracing (BASE: 12901, REMs: 13746)

-- Drivers duplicados que já existem na BASE 12901
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12901 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13746)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12901
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12901
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12901 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13746)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12901
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12901
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12901 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13746)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12901
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: hsf (BASE: 11663, REMs: 12107)

-- Drivers duplicados que já existem na BASE 11663
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 11663 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12107)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 11663
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 11663
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 11663 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12107)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 11663
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 11663
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 11663 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12107)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 11663
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: hubauto (BASE: 8754, REMs: 8915)

-- Drivers duplicados que já existem na BASE 8754
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8754 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (8915)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8754
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8754
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8754 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (8915)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8754
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8754
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8754 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (8915)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8754
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: hubautoracing (BASE: 2696, REMs: 2698)

-- Drivers duplicados que já existem na BASE 2696
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2696 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (2698)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2696
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2696
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2696 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (2698)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2696
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2696
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2696 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (2698)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2696
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: hwm (BASE: 9183, REMs: 9253)

-- Drivers duplicados que já existem na BASE 9183
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9183 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9253)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9183
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9183
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9183 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9253)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9183
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9183
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9183 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9253)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9183
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: iava (BASE: 8829, REMs: 8974)

-- Drivers duplicados que já existem na BASE 8829
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8829 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (8974)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8829
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8829
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8829 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (8974)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8829
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8829
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8829 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (8974)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8829
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: imsacamel (BASE: 2737, REMs: 12070)

-- Drivers duplicados que já existem na BASE 2737
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2737 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12070)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2737
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2737
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2737 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12070)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2737
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2737
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2737 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12070)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2737
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: imsaperformancematmut (BASE: 2736, REMs: 11537, 13468)

-- Drivers duplicados que já existem na BASE 2736
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2736 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11537, 13468)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2736
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2736
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2736 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11537, 13468)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2736
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2736
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2736 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11537, 13468)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2736
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: isomarlboro (BASE: 9184, REMs: 10866)

-- Drivers duplicados que já existem na BASE 9184
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9184 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10866)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9184
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9184
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9184 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10866)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9184
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9184
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9184 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10866)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9184
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: jaguarcarsltd (BASE: 2913, REMs: 9465)

-- Drivers duplicados que já existem na BASE 2913
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2913 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9465)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2913
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2913
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2913 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9465)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2913
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2913
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2913 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9465)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2913
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: japlisson (BASE: 10376, REMs: 13976)

-- Drivers duplicados que já existem na BASE 10376
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10376 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13976)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10376
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10376
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10376 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13976)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10376
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10376
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10376 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13976)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10376
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: jbw (BASE: 9185, REMs: 9254)

-- Drivers duplicados que já existem na BASE 9185
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9185 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9254)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9185
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9185
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9185 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9254)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9185
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9185
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9185 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9254)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9185
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: jdcmillermotorsports (BASE: 2849, REMs: 9594)

-- Drivers duplicados que já existem na BASE 2849
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2849 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9594)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2849
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2849
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2849 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9594)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2849
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2849
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2849 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9594)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2849
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: jeanclaudegiroix (BASE: 10996, REMs: 13492)

-- Drivers duplicados que já existem na BASE 10996
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10996 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13492)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10996
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10996
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10996 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13492)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10996
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10996
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10996 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13492)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10996
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: jedreteaud (BASE: 7392, REMs: 9417)

-- Drivers duplicados que já existem na BASE 7392
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7392 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9417)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7392
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7392
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7392 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9417)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7392
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7392
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7392 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9417)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7392
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: jgsears (BASE: 2834, REMs: 13842)

-- Drivers duplicados que já existem na BASE 2834
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2834 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13842)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2834
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2834
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2834 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13842)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2834
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2834
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2834 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13842)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2834
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: jlpracing (BASE: 2836, REMs: 2864)

-- Drivers duplicados que já existem na BASE 2836
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2836 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (2864)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2836
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2836
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2836 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (2864)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2836
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2836
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2836 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (2864)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2836
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: jmb (BASE: 12265, REMs: 12987)

-- Drivers duplicados que já existem na BASE 12265
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12265 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12987)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12265
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12265
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12265 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12987)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12265
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12265
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12265 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12987)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12265
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: johnwyerautomotiveengineeringltd (BASE: 9006, REMs: 9329)

-- Drivers duplicados que já existem na BASE 9006
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9006 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9329)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9006
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9006
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9006 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9329)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9006
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9006
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9006 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9329)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9006
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: jpgaban (BASE: 7394, REMs: 9418, 9843)

-- Drivers duplicados que já existem na BASE 7394
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7394 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9418, 9843)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7394
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7394
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7394 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9418, 9843)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7394
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7394
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7394 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9418, 9843)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7394
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: jps (BASE: 7926, REMs: 13709)

-- Drivers duplicados que já existem na BASE 7926
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7926 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13709)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7926
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7926
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7926 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13709)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7926
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7926
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7926 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13709)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7926
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: jsracing (BASE: 2829, REMs: 11397)

-- Drivers duplicados que já existem na BASE 2829
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2829 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11397)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2829
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2829
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2829 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11397)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2829
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2829
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2829 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11397)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2829
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: jwaavila (BASE: 2902, REMs: 11532)

-- Drivers duplicados que já existem na BASE 2902
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 2902 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11532)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 2902
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 2902
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 2902 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11532)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 2902
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 2902
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 2902 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11532)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 2902
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: jwagulf (BASE: 10433, REMs: 10856)

-- Drivers duplicados que já existem na BASE 10433
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10433 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10856)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10433
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10433
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10433 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10856)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10433
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10433
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10433 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10856)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10433
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: jwautomotiveengineering (BASE: 7402, REMs: 9330)

-- Drivers duplicados que já existem na BASE 7402
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7402 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9330)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7402
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7402
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7402 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9330)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7402
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7402
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7402 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9330)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7402
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: jwautomotiveengineeringgulf (BASE: 7887, REMs: 10760, 11577)

-- Drivers duplicados que já existem na BASE 7887
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7887 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10760, 11577)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7887
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7887
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7887 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10760, 11577)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7887
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7887
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7887 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10760, 11577)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7887
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: kaidoworks (BASE: 9386, REMs: 10569)

-- Drivers duplicados que já existem na BASE 9386
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9386 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10569)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9386
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9386
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9386 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10569)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9386
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9386
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9386 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10569)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9386
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: kicmotorsport (BASE: 3046, REMs: 3129)

-- Drivers duplicados que já existem na BASE 3046
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3046 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (3129)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3046
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3046
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3046 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (3129)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3046
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3046
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3046 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (3129)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3046
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: kpaxracing (BASE: 3027, REMs: 9423)

-- Drivers duplicados que já existem na BASE 3027
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3027 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9423)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3027
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3027
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3027 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9423)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3027
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3027
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3027 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9423)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3027
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: ksworldrallyteam (BASE: 3023, REMs: 3196)

-- Drivers duplicados que já existem na BASE 3023
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3023 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (3196)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3023
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3023
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3023 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (3196)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3023
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3023
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3023 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (3196)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3023
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: kuhnenagel (BASE: 13348, REMs: 13982)

-- Drivers duplicados que já existem na BASE 13348
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 13348 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13982)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 13348
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 13348
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 13348 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13982)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 13348
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 13348
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 13348 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13982)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 13348
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: lagondaltd (BASE: 3241, REMs: 12978)

-- Drivers duplicados que já existem na BASE 3241
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3241 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12978)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3241
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3241
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3241 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12978)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3241
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3241
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3241 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12978)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3241
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: lambrettasafd (BASE: 3246, REMs: 12448)

-- Drivers duplicados que já existem na BASE 3246
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3246 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12448)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3246
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3246
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3246 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12448)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3246
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3246
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3246 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12448)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3246
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: landmotorsport (BASE: 3250, REMs: 10090)

-- Drivers duplicados que já existem na BASE 3250
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3250 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10090)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3250
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3250
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3250 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10090)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3250
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3250
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3250 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10090)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3250
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: lbworks (BASE: 37, REMs: 9388, 9572, 14505)

-- Drivers duplicados que já existem na BASE 37
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 37 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9388, 9572, 14505)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 37
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 37
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 37 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9388, 9572, 14505)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 37
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 37
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 37 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9388, 9572, 14505)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 37
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: lds (BASE: 9194, REMs: 9255)

-- Drivers duplicados que já existem na BASE 9194
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9194 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9255)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9194
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9194
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9194 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9255)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9194
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9194
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9194 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9255)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9194
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: lecrefrigerationracing (BASE: 9195, REMs: 9256)

-- Drivers duplicados que já existem na BASE 9195
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9195 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9256)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9195
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9195
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9195 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9256)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9195
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9195
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9195 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9256)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9195
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: lemans (BASE: 7463, REMs: 12838)

-- Drivers duplicados que já existem na BASE 7463
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7463 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12838)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7463
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7463
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7463 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12838)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7463
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7463
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7463 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12838)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7463
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: letorchtransports (BASE: 8712, REMs: 8794)

-- Drivers duplicados que já existem na BASE 8712
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8712 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (8794)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8712
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8712
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8712 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (8794)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8712
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8712
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8712 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (8794)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8712
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: liquimolyrichardlloydracing (BASE: 9834, REMs: 13497)

-- Drivers duplicados que já existem na BASE 9834
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9834 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13497)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9834
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9834
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9834 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13497)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9834
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9834
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9834 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13497)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9834
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: map (BASE: 3407, REMs: 12252)

-- Drivers duplicados que já existem na BASE 3407
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3407 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12252)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3407
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3407
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3407 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12252)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3407
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3407
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3407 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12252)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3407
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: martiniracing (BASE: 3619, REMs: 14277)

-- Drivers duplicados que já existem na BASE 3619
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3619 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (14277)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3619
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3619
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3619 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (14277)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3619
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3619
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3619 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (14277)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3619
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: matraelf (BASE: 7515, REMs: 13391)

-- Drivers duplicados que já existem na BASE 7515
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7515 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13391)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7515
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7515
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7515 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13391)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7515
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7515
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7515 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13391)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7515
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: matrasimca (BASE: 7517, REMs: 9432)

-- Drivers duplicados que já existem na BASE 7517
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7517 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9432)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7517
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7517
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7517 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9432)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7517
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7517
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7517 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9432)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7517
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mazdaspeed (BASE: 3660, REMs: 9730)

-- Drivers duplicados que já existem na BASE 3660
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3660 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9730)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3660
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3660
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3660 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9730)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3660
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3660
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3660 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9730)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3660
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mbm (BASE: 9203, REMs: 9257)

-- Drivers duplicados que já existem na BASE 9203
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9203 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9257)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9203
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9203
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9203 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9257)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9203
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9203
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9203 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9257)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9203
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mccormick (BASE: 11091, REMs: 13354)

-- Drivers duplicados que já existem na BASE 11091
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 11091 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13354)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 11091
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 11091
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 11091 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13354)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 11091
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 11091
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 11091 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13354)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 11091
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mcguire (BASE: 9204, REMs: 9259)

-- Drivers duplicados que já existem na BASE 9204
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9204 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9259)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9204
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9204
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9204 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9259)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9204
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9204
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9204 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9259)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9204
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mercedesamg (BASE: 8002, REMs: 11033)

-- Drivers duplicados que já existem na BASE 8002
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8002 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11033)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8002
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8002
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8002 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11033)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8002
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8002
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8002 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11033)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8002
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mercedesamgteamblackfalcon (BASE: 10984, REMs: 11030)

-- Drivers duplicados que já existem na BASE 10984
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10984 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11030)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10984
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10984
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10984 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11030)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10984
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10984
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10984 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11030)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10984
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mercedesbenz (BASE: 31, REMs: 7521)

-- Drivers duplicados que já existem na BASE 31
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 31 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (7521)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 31
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 31
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 31 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (7521)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 31
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 31
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 31 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (7521)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 31
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mf1 (BASE: 9207, REMs: 9258)

-- Drivers duplicados que já existem na BASE 9207
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9207 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9258)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9207
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9207
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9207 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9258)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9207
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9207
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9207 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9258)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9207
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mg (BASE: 3409, REMs: 7490)

-- Drivers duplicados que já existem na BASE 3409
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3409 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (7490)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3409
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3409
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3409 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (7490)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3409
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3409
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3409 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (7490)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3409
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mgcarsltd (BASE: 3446, REMs: 11459)

-- Drivers duplicados que já existem na BASE 3446
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3446 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11459)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3446
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3446
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3446 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11459)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3446
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3446
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3446 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11459)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3446
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mjmotorsports (BASE: 3395, REMs: 3459)

-- Drivers duplicados que já existem na BASE 3395
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3395 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (3459)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3395
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3395
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3395 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (3459)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3395
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3395
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3395 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (3459)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3395
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mkmotorsport (BASE: 3461, REMs: 9813)

-- Drivers duplicados que já existem na BASE 3461
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3461 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9813)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3461
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3461
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3461 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9813)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3461
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3461
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3461 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9813)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3461
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mmotorsport (BASE: 8668, REMs: 9858)

-- Drivers duplicados que já existem na BASE 8668
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8668 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9858)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8668
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8668
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8668 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9858)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8668
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8668
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8668 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9858)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8668
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mobil1 (BASE: 11061, REMs: 11669)

-- Drivers duplicados que já existem na BASE 11061
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 11061 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11669)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 11061
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 11061
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 11061 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11669)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 11061
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 11061
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 11061 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11669)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 11061
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mogilmotorsltd (BASE: 3805, REMs: 9841)

-- Drivers duplicados que já existem na BASE 3805
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3805 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9841)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3805
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3805
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3805 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9841)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3805
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3805
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3805 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9841)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3805
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: monsteryamahatech3 (BASE: 3824, REMs: 11026)

-- Drivers duplicados que já existem na BASE 3824
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3824 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11026)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3824
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3824
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3824 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11026)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3824
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3824
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3824 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11026)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3824
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: montaplastbylandmotorsport (BASE: 3826, REMs: 11220)

-- Drivers duplicados que já existem na BASE 3826
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3826 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11220)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3826
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3826
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3826 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11220)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3826
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3826
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3826 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11220)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3826
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: motorsport (BASE: 7542, REMs: 13132)

-- Drivers duplicados que já existem na BASE 7542
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7542 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13132)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7542
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7542
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7542 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13132)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7542
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7542
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7542 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13132)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7542
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mperformance (BASE: 7483, REMs: 11961)

-- Drivers duplicados que já existem na BASE 7483
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7483 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11961)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7483
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7483
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7483 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11961)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7483
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7483
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7483 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11961)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7483
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mracingymr (BASE: 3392, REMs: 3410)

-- Drivers duplicados que já existem na BASE 3392
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3392 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (3410)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3392
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3392
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3392 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (3410)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3392
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3392
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3392 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (3410)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3392
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mrracing (BASE: 3476, REMs: 3477)

-- Drivers duplicados que já existem na BASE 3476
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3476 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (3477)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3476
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3476
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3476 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (3477)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3476
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3476
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3476 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (3477)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3476
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mrs (BASE: 12576, REMs: 13397)

-- Drivers duplicados que já existem na BASE 12576
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12576 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13397)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12576
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12576
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12576 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13397)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12576
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12576
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12576 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13397)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12576
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: mrsgtracing (BASE: 3483, REMs: 3484)

-- Drivers duplicados que já existem na BASE 3483
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3483 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (3484)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3483
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3483
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3483 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (3484)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3483
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3483
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3483 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (3484)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3483
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: nart (BASE: 3953, REMs: 7566, 9680)

-- Drivers duplicados que já existem na BASE 3953
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3953 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (7566, 9680)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3953
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3953
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3953 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (7566, 9680)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3953
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3953
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3953 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (7566, 9680)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3953
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: newmanjoestracing (BASE: 8012, REMs: 9493)

-- Drivers duplicados que já existem na BASE 8012
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8012 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9493)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8012
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8012
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8012 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9493)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8012
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8012
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8012 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9493)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8012
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: nowmotorsports (BASE: 4072, REMs: 4073)

-- Drivers duplicados que já existem na BASE 4072
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4072 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (4073)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4072
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4072
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4072 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (4073)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4072
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4072
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4072 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (4073)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4072
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: nsu (BASE: 8503, REMs: 8559)

-- Drivers duplicados que já existem na BASE 8503
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8503 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (8559)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8503
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8503
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8503 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (8559)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8503
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8503
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8503 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (8559)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8503
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: ntstproproject (BASE: 3991, REMs: 3992)

-- Drivers duplicados que já existem na BASE 3991
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 3991 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (3992)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 3991
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 3991
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 3991 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (3992)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 3991
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 3991
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 3991 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (3992)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 3991
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: oakracing (BASE: 4103, REMs: 13523)

-- Drivers duplicados que já existem na BASE 4103
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4103 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13523)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4103
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4103
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4103 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13523)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4103
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4103
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4103 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13523)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4103
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: octane126 (BASE: 4110, REMs: 7582)

-- Drivers duplicados que já existem na BASE 4110
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4110 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (7582)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4110
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4110
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4110 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (7582)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4110
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4110
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4110 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (7582)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4110
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: orecamatmut (BASE: 12941, REMs: 12952)

-- Drivers duplicados que já existem na BASE 12941
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12941 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12952)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12941
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12941
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12941 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12952)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12941
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12941
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12941 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12952)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12941
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: osca (BASE: 7591, REMs: 9260)

-- Drivers duplicados que já existem na BASE 7591
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7591 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9260)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7591
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7591
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7591 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9260)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7591
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7591
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7591 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9260)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7591
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: panozmotorsports (BASE: 4295, REMs: 9716)

-- Drivers duplicados que já existem na BASE 4295
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4295 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9716)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4295
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4295
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4295 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9716)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4295
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4295
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4295 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9716)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4295
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: petermitchellthomson (BASE: 8489, REMs: 13863)

-- Drivers duplicados que já existem na BASE 8489
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8489 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13863)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8489
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8489
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8489 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13863)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8489
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8489
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8489 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13863)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8489
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: peugeottalbotsport (BASE: 4403, REMs: 4409)

-- Drivers duplicados que já existem na BASE 4403
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4403 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (4409)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4403
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4403
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4403 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (4409)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4403
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4403
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4403 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (4409)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4403
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: pgfkinfaunamr (BASE: 4214, REMs: 11976)

-- Drivers duplicados que já existem na BASE 4214
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4214 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11976)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4214
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4214
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4214 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11976)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4214
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4214
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4214 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11976)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4214
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: phsport (BASE: 4216, REMs: 4217)

-- Drivers duplicados que já existem na BASE 4216
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4216 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (4217)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4216
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4216
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4216 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (4217)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4216
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4216
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4216 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (4217)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4216
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: porschekg (BASE: 4468, REMs: 9571)

-- Drivers duplicados que já existem na BASE 4468
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4468 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9571)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4468
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4468
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4468 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9571)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4468
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4468
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4468 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9571)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4468
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: pricebscher (BASE: 4516, REMs: 14294)

-- Drivers duplicados que já existem na BASE 4516
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4516 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (14294)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4516
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4516
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4516 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (14294)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4516
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4516
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4516 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (14294)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4516
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: progt (BASE: 12019, REMs: 13554)

-- Drivers duplicados que já existem na BASE 12019
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12019 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13554)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12019
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12019
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12019 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13554)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12019
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12019
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12019 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13554)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12019
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: project1 (BASE: 4549, REMs: 9589)

-- Drivers duplicados que já existem na BASE 4549
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4549 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9589)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4549
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4549
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4549 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9589)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4549
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4549
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4549 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9589)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4549
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: project1ao (BASE: 4550, REMs: 7656)

-- Drivers duplicados que já existem na BASE 4550
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4550 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (7656)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4550
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4550
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4550 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (7656)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4550
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4550
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4550 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (7656)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4550
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: promotorsport (BASE: 4533, REMs: 4563, 4564)

-- Drivers duplicados que já existem na BASE 4533
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4533 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (4563, 4564)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4533
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4533
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4533 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (4563, 4564)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4533
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4533
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4533 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (4563, 4564)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4533
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: prosport (BASE: 7653, REMs: 9435)

-- Drivers duplicados que já existem na BASE 7653
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7653 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9435)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7653
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7653
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7653 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9435)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7653
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7653
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7653 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9435)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7653
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: prosportracing (BASE: 4246, REMs: 9433)

-- Drivers duplicados que já existem na BASE 4246
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4246 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9433)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4246
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4246
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4246 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9433)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4246
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4246
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4246 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9433)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4246
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: psg1corse (BASE: 4251, REMs: 14264)

-- Drivers duplicados que já existem na BASE 4251
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4251 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (14264)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4251
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4251
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4251 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (14264)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4251
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4251
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4251 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (14264)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4251
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: quifelasm (BASE: 11653, REMs: 13438)

-- Drivers duplicados que já existem na BASE 11653
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 11653 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13438)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 11653
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 11653
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 11653 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13438)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 11653
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 11653
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 11653 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13438)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 11653
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: rallytechnology (BASE: 4848, REMs: 4851)

-- Drivers duplicados que já existem na BASE 4848
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4848 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (4851)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4848
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4848
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4848 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (4851)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4848
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4848
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4848 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (4851)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4848
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: ram (BASE: 7684, REMs: 9261)

-- Drivers duplicados que já existem na BASE 7684
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7684 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9261)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7684
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7684
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7684 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9261)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7684
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7684
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7684 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9261)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7684
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: ramchargers (BASE: 9101, REMs: 10558)

-- Drivers duplicados que já existem na BASE 9101
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9101 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10558)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9101
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9101
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9101 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10558)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9101
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9101
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9101 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10558)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9101
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: rauhwelt (BASE: 8174, REMs: 10299)

-- Drivers duplicados que já existem na BASE 8174
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8174 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10299)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8174
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8174
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8174 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10299)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8174
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8174
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8174 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10299)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8174
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: raysracing (BASE: 4872, REMs: 9844)

-- Drivers duplicados que já existem na BASE 4872
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4872 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9844)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4872
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4872
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4872 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9844)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4872
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4872
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4872 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9844)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4872
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: rcmotorsport (BASE: 4648, REMs: 4675)

-- Drivers duplicados que já existem na BASE 4648
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4648 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (4675)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4648
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4648
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4648 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (4675)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4648
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4648
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4648 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (4675)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4648
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: redbullktmtech3 (BASE: 4896, REMs: 4897)

-- Drivers duplicados que já existem na BASE 4896
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4896 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (4897)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4896
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4896
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4896 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (4897)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4896
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4896
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4896 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (4897)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4896
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: redmanbright (BASE: 4920, REMs: 4921)

-- Drivers duplicados que já existem na BASE 4920
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4920 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (4921)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4920
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4920
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4920 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (4921)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4920
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4920
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4920 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (4921)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4920
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: renaultedams (BASE: 4955, REMs: 11007)

-- Drivers duplicados que já existem na BASE 4955
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4955 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11007)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4955
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4955
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4955 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11007)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4955
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4955
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4955 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11007)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4955
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: riverside (BASE: 5014, REMs: 7694)

-- Drivers duplicados que já existem na BASE 5014
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5014 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (7694)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5014
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5014
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5014 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (7694)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5014
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5014
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5014 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (7694)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5014
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: rjracing (BASE: 4635, REMs: 4694)

-- Drivers duplicados que já existem na BASE 4635
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4635 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (4694)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4635
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4635
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4635 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (4694)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4635
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4635
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4635 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (4694)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4635
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: rlrmsport (BASE: 4699, REMs: 10360)

-- Drivers duplicados que já existem na BASE 4699
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4699 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10360)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4699
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4699
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4699 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10360)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4699
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4699
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4699 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10360)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4699
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: rmerracingswitzerland (BASE: 5109, REMs: 5111)

-- Drivers duplicados que já existem na BASE 5109
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5109 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (5111)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5109
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5109
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5109 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (5111)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5109
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5109
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5109 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (5111)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5109
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: rmotorsport (BASE: 4639, REMs: 10317)

-- Drivers duplicados que já existem na BASE 4639
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4639 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10317)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4639
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4639
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4639 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10317)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4639
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4639
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4639 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10317)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4639
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: rollsroyce (BASE: 7696, REMs: 12038)

-- Drivers duplicados que já existem na BASE 7696
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7696 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12038)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7696
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7696
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7696 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12038)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7696
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7696
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7696 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12038)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7696
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: rossocorsa (BASE: 5059, REMs: 12406)

-- Drivers duplicados que já existem na BASE 5059
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5059 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12406)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5059
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5059
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5059 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12406)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5059
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5059
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5059 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12406)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5059
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: rsrallyesport (BASE: 4729, REMs: 4732)

-- Drivers duplicados que já existem na BASE 4729
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 4729 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (4732)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 4729
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 4729
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 4729 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (4732)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 4729
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 4729
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 4729 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (4732)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 4729
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: s7r (BASE: 8404, REMs: 12948)

-- Drivers duplicados que já existem na BASE 8404
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8404 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12948)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8404
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8404
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8404 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12948)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8404
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8404
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8404 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12948)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8404
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: santambroeus (BASE: 9927, REMs: 12263)

-- Drivers duplicados que já existem na BASE 9927
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9927 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12263)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9927
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9927
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9927 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12263)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9927
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9927
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9927 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12263)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9927
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: sapeurspompiersdugard (BASE: 9045, REMs: 12809)

-- Drivers duplicados que já existem na BASE 9045
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9045 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12809)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9045
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9045
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9045 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12809)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9045
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9045
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9045 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12809)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9045
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: sapeurspompiersmoselle (BASE: 8669, REMs: 11892)

-- Drivers duplicados que já existem na BASE 8669
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8669 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11892)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8669
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8669
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8669 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11892)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8669
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8669
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8669 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11892)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8669
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: scheidpartlmotorsport (BASE: 11671, REMs: 12161)

-- Drivers duplicados que já existem na BASE 11671
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 11671 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12161)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 11671
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 11671
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 11671 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12161)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 11671
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 11671
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 11671 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12161)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 11671
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: schenkerco (BASE: 13311, REMs: 13359)

-- Drivers duplicados que já existem na BASE 13311
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 13311 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13359)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 13311
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 13311
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 13311 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13359)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 13311
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 13311
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 13311 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13359)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 13311
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: scuderiajwagulf (BASE: 10305, REMs: 10858)

-- Drivers duplicados que já existem na BASE 10305
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10305 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10858)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10305
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10305
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10305 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10858)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10305
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10305
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10305 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10858)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10305
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: scuderianart (BASE: 12121, REMs: 12390)

-- Drivers duplicados que já existem na BASE 12121
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12121 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12390)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12121
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12121
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12121 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12390)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12121
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12121
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12121 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12390)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12121
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: scuderiasantambroeus (BASE: 5331, REMs: 12480)

-- Drivers duplicados que já existem na BASE 5331
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5331 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12480)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5331
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5331
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5331 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12480)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5331
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5331
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5331 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12480)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5331
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: sdkfz (BASE: 13377, REMs: 13879)

-- Drivers duplicados que já existem na BASE 13377
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 13377 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13879)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 13377
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 13377
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 13377 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13879)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 13377
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 13377
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 13377 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13879)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 13377
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: secautomobilescd (BASE: 5144, REMs: 7704)

-- Drivers duplicados que já existem na BASE 5144
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5144 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (7704)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5144
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5144
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5144 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (7704)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5144
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5144
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5144 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (7704)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5144
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: sefacferrari (BASE: 5118, REMs: 9440)

-- Drivers duplicados que já existem na BASE 5118
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5118 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9440)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5118
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5118
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5118 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9440)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5118
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5118
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5118 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9440)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5118
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: sgdriversproject (BASE: 5147, REMs: 5148)

-- Drivers duplicados que já existem na BASE 5147
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5147 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (5148)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5147
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5147
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5147 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (5148)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5147
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5147
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5147 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (5148)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5147
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: shelbyamericaninc (BASE: 5374, REMs: 11842)

-- Drivers duplicados que já existem na BASE 5374
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5374 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11842)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5374
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5374
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5374 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11842)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5374
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5374
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5374 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11842)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5374
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: signatechalpinematmut (BASE: 5395, REMs: 9619)

-- Drivers duplicados que já existem na BASE 5395
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5395 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9619)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5395
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5395
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5395 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9619)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5395
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5395
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5395 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9619)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5395
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: signatureplus (BASE: 5399, REMs: 12064)

-- Drivers duplicados que já existem na BASE 5399
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5399 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12064)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5399
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5399
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5399 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12064)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5399
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5399
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5399 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12064)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5399
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: skytempestaracing (BASE: 5429, REMs: 9697)

-- Drivers duplicados que já existem na BASE 5429
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5429 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9697)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5429
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5429
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5429 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9697)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5429
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5429
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5429 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9697)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5429
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: sofrevasp (BASE: 5459, REMs: 14437)

-- Drivers duplicados que já existem na BASE 5459
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5459 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (14437)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5459
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5459
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5459 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (14437)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5459
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5459
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5459 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (14437)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5459
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: southdownfleetsupport (BASE: 12280, REMs: 12287)

-- Drivers duplicados que já existem na BASE 12280
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12280 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12287)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12280
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12280
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12280 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12287)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12280
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12280
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12280 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12287)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12280
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: speedlover (BASE: 5492, REMs: 5498)

-- Drivers duplicados que já existem na BASE 5492
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5492 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (5498)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5492
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5492
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5492 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (5498)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5492
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5492
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5492 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (5498)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5492
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: sportquattro (BASE: 7766, REMs: 14013)

-- Drivers duplicados que já existem na BASE 7766
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7766 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (14013)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7766
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7766
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7766 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (14013)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7766
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7766
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7766 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (14013)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7766
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: spsautomotiveperformance (BASE: 5185, REMs: 5186)

-- Drivers duplicados que já existem na BASE 5185
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5185 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (5186)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5185
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5185
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5185 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (5186)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5185
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5185
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5185 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (5186)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5185
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: stingray (BASE: 10559, REMs: 12072)

-- Drivers duplicados que já existem na BASE 10559
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10559 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12072)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10559
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10559
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10559 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12072)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10559
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10559
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10559 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12072)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10559
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: subaru (BASE: 33, REMs: 39)

-- Drivers duplicados que já existem na BASE 33
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 33 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (39)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 33
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 33
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 33 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (39)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 33
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 33
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 33 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (39)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 33
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: talbotlago (BASE: 8834, REMs: 9234)

-- Drivers duplicados que já existem na BASE 8834
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8834 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9234)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8834
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8834
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8834 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9234)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8834
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8834
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8834 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9234)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8834
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: team75 (BASE: 8511, REMs: 13571)

-- Drivers duplicados que já existem na BASE 8511
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8511 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (13571)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8511
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8511
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8511 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (13571)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8511
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8511
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8511 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (13571)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8511
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: teamfelbermayrproton (BASE: 5941, REMs: 5942)

-- Drivers duplicados que já existem na BASE 5941
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5941 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (5942)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5941
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5941
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5941 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (5942)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5941
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5941
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5941 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (5942)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5941
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: teamhanshinridingschool (BASE: 5975, REMs: 5976)

-- Drivers duplicados que já existem na BASE 5975
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5975 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (5976)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5975
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5975
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5975 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (5976)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5975
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5975
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5975 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (5976)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5975
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: teamlemans (BASE: 6034, REMs: 6035)

-- Drivers duplicados que já existem na BASE 6034
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6034 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (6035)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6034
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6034
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6034 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (6035)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6034
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6034
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6034 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (6035)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6034
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: teamtvtvasahidragon (BASE: 8602, REMs: 9717)

-- Drivers duplicados que já existem na BASE 8602
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8602 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9717)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8602
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8602
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8602 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9717)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8602
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8602
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8602 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9717)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8602
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: teamworkmotorsport (BASE: 6242, REMs: 6253)

-- Drivers duplicados que já existem na BASE 6242
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6242 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (6253)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6242
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6242
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6242 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (6253)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6242
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6242
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6242 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (6253)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6242
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: tech1racing (BASE: 6254, REMs: 9929)

-- Drivers duplicados que já existem na BASE 6254
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6254 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9929)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6254
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6254
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6254 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9929)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6254
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6254
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6254 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9929)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6254
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: tech3 (BASE: 6255, REMs: 9779, 13097)

-- Drivers duplicados que já existem na BASE 6255
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6255 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9779, 13097)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6255
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6255
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6255 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9779, 13097)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6255
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6255
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6255 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9779, 13097)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6255
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: tech3eracing (BASE: 6256, REMs: 6260)

-- Drivers duplicados que já existem na BASE 6256
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6256 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (6260)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6256
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6256
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6256 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (6260)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6256
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6256
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6256 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (6260)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6256
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: techspeedmotorsport (BASE: 6258, REMs: 6269)

-- Drivers duplicados que já existem na BASE 6258
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6258 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (6269)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6258
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6258
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6258 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (6269)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6258
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6258
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6258 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (6269)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6258
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: temperogiuffreracing (BASE: 6290, REMs: 6291)

-- Drivers duplicados que já existem na BASE 6290
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6290 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (6291)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6290
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6290
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6290 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (6291)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6290
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6290
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6290 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (6291)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6290
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: theracersgroup (BASE: 6311, REMs: 6312)

-- Drivers duplicados que já existem na BASE 6311
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6311 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (6312)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6311
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6311
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6311 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (6312)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6311
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6311
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6311 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (6312)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6311
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: threebondracing (BASE: 6323, REMs: 6325)

-- Drivers duplicados que já existem na BASE 6323
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6323 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (6325)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6323
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6323
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6323 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (6325)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6323
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6323
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6323 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (6325)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6323
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: tictac (BASE: 11192, REMs: 11858)

-- Drivers duplicados que já existem na BASE 11192
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 11192 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11858)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 11192
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 11192
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 11192 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11858)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 11192
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 11192
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 11192 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11858)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 11192
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: tolimitmotorsport (BASE: 11859, REMs: 11860)

-- Drivers duplicados que já existem na BASE 11859
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 11859 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11860)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 11859
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 11859
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 11859 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11860)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 11859
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 11859
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 11859 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11860)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 11859
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: toms (BASE: 5760, REMs: 5764)

-- Drivers duplicados que já existem na BASE 5760
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 5760 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (5764)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 5760
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 5760
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 5760 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (5764)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 5760
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 5760
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 5760 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (5764)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 5760
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: totalenergies (BASE: 7803, REMs: 10238)

-- Drivers duplicados que já existem na BASE 7803
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 7803 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10238)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 7803
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 7803
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 7803 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10238)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 7803
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 7803
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 7803 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10238)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 7803
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: toyotateamtoms (BASE: 6404, REMs: 6405)

-- Drivers duplicados que já existem na BASE 6404
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6404 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (6405)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6404
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6404
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6404 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (6405)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6404
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6404
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6404 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (6405)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6404
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: transam (BASE: 10457, REMs: 11508)

-- Drivers duplicados que já existem na BASE 10457
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10457 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11508)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10457
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10457
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10457 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11508)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10457
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10457
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10457 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11508)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10457
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: triplea (BASE: 12572, REMs: 12605)

-- Drivers duplicados que já existem na BASE 12572
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12572 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12605)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12572
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12572
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12572 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12605)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12572
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12572
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12572 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12605)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12572
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: twrjaguarracing (BASE: 11111, REMs: 11112)

-- Drivers duplicados que já existem na BASE 11111
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 11111 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11112)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 11111
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 11111
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 11111 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11112)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 11111
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 11111
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 11111 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11112)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 11111
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: udtlaystallracing (BASE: 10425, REMs: 12488, 13300)

-- Drivers duplicados que já existem na BASE 10425
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 10425 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12488, 13300)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 10425
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 10425
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 10425 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12488, 13300)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 10425
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 10425
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 10425 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12488, 13300)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 10425
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: usracing (BASE: 6486, REMs: 6497)

-- Drivers duplicados que já existem na BASE 6486
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6486 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (6497)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6486
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6486
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6486 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (6497)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6486
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6486
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6486 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (6497)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6486
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: vipergtsr (BASE: 12266, REMs: 12357)

-- Drivers duplicados que já existem na BASE 12266
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12266 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12357)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12266
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12266
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12266 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12357)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12266
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12266
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12266 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12357)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12266
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: wcm (BASE: 6664, REMs: 6666)

-- Drivers duplicados que já existem na BASE 6664
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6664 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (6666)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6664
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6664
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6664 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (6666)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6664
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6664
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6664 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (6666)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6664
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: weathertechracing (BASE: 6702, REMs: 9595)

-- Drivers duplicados que já existem na BASE 6702
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6702 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9595)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6702
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6702
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6702 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9595)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6702
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6702
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6702 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9595)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6702
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: wedssport (BASE: 12568, REMs: 12588)

-- Drivers duplicados que já existem na BASE 12568
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12568 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12588)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12568
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12568
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12568 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12588)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12568
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12568
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12568 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12588)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12568
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: wmotors (BASE: 9624, REMs: 11170)

-- Drivers duplicados que já existem na BASE 9624
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 9624 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (11170)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 9624
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 9624
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 9624 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (11170)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 9624
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 9624
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 9624 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (11170)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 9624
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: xjr9 (BASE: 12905, REMs: 12944)

-- Drivers duplicados que já existem na BASE 12905
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12905 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (12944)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12905
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12905
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12905 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (12944)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12905
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12905
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12905 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (12944)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12905
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: xk120 (BASE: 12471, REMs: 14053)

-- Drivers duplicados que já existem na BASE 12471
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 12471 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (14053)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 12471
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 12471
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 12471 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (14053)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 12471
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 12471
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 12471 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (14053)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 12471
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: zolauto (BASE: 8497, REMs: 10119)

-- Drivers duplicados que já existem na BASE 8497
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 8497 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (10119)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 8497
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 8497
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 8497 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (10119)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 8497
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 8497
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 8497 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (10119)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 8497
      AND ct_base.competition_id = ct_rem.competition_id
  );

-- Grupo: zwenterprisesinc (BASE: 6854, REMs: 9821)

-- Drivers duplicados que já existem na BASE 6854
SELECT 'DRIVER_DUPLICATE' as tipo, dt_rem.drivers_id, 6854 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_rem
WHERE dt_rem.teams_id IN (9821)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_drivers_teams dt_base
    WHERE dt_base.teams_id = 6854
      AND dt_base.drivers_id = dt_rem.drivers_id
  );

-- Miniatures duplicadas que já existem na BASE 6854
SELECT 'MINIATURE_DUPLICATE' as tipo, mt_rem.miniatures_id, 6854 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_rem
WHERE mt_rem.teams_id IN (9821)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_miniatures_teams mt_base
    WHERE mt_base.teams_id = 6854
      AND mt_base.miniatures_id = mt_rem.miniatures_id
  );

-- Competitions duplicadas que já existem na BASE 6854
SELECT 'COMPETITION_DUPLICATE' as tipo, ct_rem.competition_id, 6854 as base_team_id
FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_rem
WHERE ct_rem.teams_id IN (9821)
  AND EXISTS (
    SELECT 1 FROM pb7lpfmycz97c19._nc_m2m_competition_teams ct_base
    WHERE ct_base.teams_id = 6854
      AND ct_base.competition_id = ct_rem.competition_id
  );