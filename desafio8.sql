SELECT 
  albums.name AS album,
  artists.artist_name AS artista
  

FROM
  SpotifyClone.artists AS artists
  INNER JOIN SpotifyClone.albums AS albums
  ON albums.artist_id = artists.artist_id
    
WHERE artists.artist_name = 'Elis Regina'

ORDER BY album;


-- SELECT art.artist_name AS artista, alb.name AS album
-- FROM SpotifyClone.artists AS art
-- INNER JOIN SpotifyClone.albums AS alb
-- ON art.artist_id = alb.artist_id
-- ORDER BY artista ASC;

