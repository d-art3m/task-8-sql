SELECT
    u.id AS "ID",
    u.username AS "Username",
    COALESCE(array_agg(fm.movie_id), '{}') AS "Favorite movie IDs"
FROM "user" u
LEFT JOIN favorite_movies fm ON u.id = fm.user_id
GROUP BY u.id, u.username
ORDER BY u.id;