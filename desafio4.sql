SELECT U.name AS `usuario`,
IF(MAX(YEAR(H.history_date)) >= 2021, "Usuário ativo","Usuário inativo") AS `status_usuario`

FROM SpotifyClone.users  AS U
INNER JOIN SpotifyClone.history AS H ON H.user_id = U.user_id
GROUP BY U.name
ORDER BY U.name ASC; 