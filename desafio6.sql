SELECT CAST(MIN(PL.plan_value) AS DECIMAL(5, 2)) AS faturamento_minimo,
CAST(MAX(PL.plan_value) AS DECIMAL(5, 2)) AS faturamento_maximo,
CAST(AVG(PL.plan_value) AS DECIMAL(5, 2)) AS faturamento_medio,
CAST(SUM(PL.plan_value) AS DECIMAL(5, 2)) AS faturamento_total
FROM SpotifyClone.plan AS PL
INNER JOIN SpotifyClone.users AS U ON PL.plan_id = U.plan_id;