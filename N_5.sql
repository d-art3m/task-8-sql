SELECT
    m.id AS "ID",
    m.title AS "Title",
    m.release_date AS "Release date",
    m.duration AS "Duration",
    m.description AS "Description",
    json_build_object(
		'ID', f.id,
        'file_name', f.file_name,
        'mime_type', f.mime_type,
        'file_key', f.file_key,
        'file_url', f.file_url
    ) AS "Poster",
    json_build_object(
        'ID', d.id,
        'First name', d.first_name,
        'Last name', d.last_name
    ) AS "Director"
FROM movie m
JOIN "file" f ON m.poster_file_id = f.id
JOIN person d ON m.director_id = d.id
JOIN movie_genre mg ON m.id = mg.movie_id
JOIN genre g ON mg.genre_id = g.id
WHERE m.country_id = 1
  AND m.release_date >= '2022-01-01'
  AND m.duration > '02:15:00'
  AND g.name IN ('Action', 'Drama')
GROUP BY m.id, f.id, f.file_name, f.mime_type, f.file_key, f.file_url, d.id, d.first_name, d.last_name;