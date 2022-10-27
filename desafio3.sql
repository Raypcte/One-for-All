-- Active: 1666887213015@@127.0.0.1@3307@SpotifyClone
SELECT users.name AS usuario,
COUNT(histoy.song_id) AS qt_de_musicas_ouvidas,
ROUND(SUM(songs.song_duration / 60), 2) AS total_minutos
FROM SpotifyClone.users AS users
INNER JOIN SpotifyClone.history AS histoy ON users.user_id = histoy.user_id
INNER JOIN SpotifyClone.songs AS songs ON songs.song_id = histoy.song_id
GROUP BY users.name
ORDER BY users.name ASC;


