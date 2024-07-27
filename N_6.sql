SELECT
    m.id AS "ID",
    m.title AS "Title",
    m.release_date AS "Release date",
    m.duration AS "Duration",
    m.description AS "Description",
    json_build_object(
        'file_name', f.file_name,
        'mime_type', f.mime_type,
        'file_key', f.file_key,
        'file_url', f.file_url
    ) AS "Poster",
    json_build_object(
        'id', d.id,
        'first_name', d.first_name,
        'last_name', d.last_name,
        'photo', json_build_object(
            'file_name', dphoto.file_name,
            'mime_type', dphoto.mime_type,
            'file_key', dphoto.file_key,
            'file_url', dphoto.file_url
        )
    ) AS "Director",
    json_agg(
        json_build_object(
            'id', a.id,
            'first_name', a.first_name,
            'last_name', a.last_name,
            'photo', json_build_object(
                'file_name', aphoto.file_name,
                'mime_type', aphoto.mime_type,
                'file_key', aphoto.file_key,
                'file_url', aphoto.file_url
            )
        )
    ) AS "Actors",
    json_agg(
        json_build_object(
            'id', g.id,
            'name', g.name
        )
    ) AS "Genres"
FROM movie m
LEFT JOIN "file" f ON m.poster_file_id = f.id
LEFT JOIN person d ON m.director_id = d.id
LEFT JOIN "file" dphoto ON d.avatar_file_id = dphoto.id
LEFT JOIN movie_cast mc ON m.id = mc.movie_id
LEFT JOIN person a ON mc.person_id = a.id
LEFT JOIN "file" aphoto ON a.avatar_file_id = aphoto.id
LEFT JOIN movie_genre mg ON m.id = mg.movie_id
LEFT JOIN genre g ON mg.genre_id = g.id
WHERE m.id = 1
GROUP BY m.id, f.file_name, f.mime_type, f.file_key, f.file_url,
         d.id, dphoto.file_name, dphoto.mime_type, dphoto.file_key, dphoto.file_url;