SELECT 
    users.user_name AS usuario,
    COUNT(q.music_id) AS qt_de_musicas_ouvidas,
    ROUND(SUM(t.duration_seconds / 60), 2) AS total_minutos
FROM
    SpotifyClone.users AS history
        INNER JOIN SpotifyClone.history_reproduction AS songs 
        ON users.user_id = q.user_id
        INNER JOIN SpotifyClone.musics AS t 
        ON q.music_id = t.music_id
GROUP BY usuario
ORDER BY usuario;