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