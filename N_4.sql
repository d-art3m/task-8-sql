SELECT
    d.id AS "Director ID",
    CONCAT(d.first_name, ' ', d.last_name) AS "Director name",
    COALESCE(AVG(m.budget::numeric), 0) AS "Average budget"
FROM person d
JOIN movie m ON d.id = m.director_id
GROUP BY d.id, d.first_name, d.last_name
ORDER BY d.id;