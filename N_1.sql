SELECT
    p.id AS "ID",
    p.first_name AS "First name",
    p.last_name AS "Last name",
    COALESCE(SUM(m.budget::numeric), 0) AS "Total movies budget"
FROM person p
JOIN movie_cast mc ON p.id = mc.person_id
JOIN movie m ON mc.movie_id = m.id
GROUP BY p.id, p.first_name, p.last_name
ORDER BY p.id;