-- SELECT 
--   artists.artist_name AS 'artista',
--   albums.album_name AS 'album',
--   COUNT(following.user_id) AS 'seguidores'
    
-- FROM SpotifyClone.albums 
--   INNER JOIN SpotifyClone.following AS fo ON al.artist_name = fo.artist_name

-- GROUP BY `artista`, `album`
-- ORDER BY `seguidores` DESC, `artista` ASC, `album` ASC;

SELECT art.`artist_name` AS `artista`, alb.`name` AS `album`, COUNT(fol.`artist_id`) AS `seguidores`
FROM SpotifyClone.`albums` AS alb

INNER JOIN SpotifyClone.`artists` AS art
ON art.`artist_id` = alb.`artist_id`

INNER JOIN SpotifyClone.`following` AS fol
ON art.`artist_id` = fol.`artist_id`

GROUP BY `artista`, `album`
ORDER BY `seguidores` DESC, `artista` ASC, `album` ASC;