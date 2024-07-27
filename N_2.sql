SELECT
    m.id AS "ID",
    m.title AS "Title",
    COUNT(mc.person_id) AS "Actors count"
FROM movie m
LEFT JOIN movie_cast mc ON m.id = mc.movie_id
WHERE m.release_date >= CURRENT_DATE - INTERVAL '5 years'
GROUP BY m.id, m.title
ORDER BY m.id;