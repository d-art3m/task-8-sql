

erDiagram
    file {
        id SERIAL PK
        file_name VARCHAR
        mime_type VARCHAR
        file_key TEXT
        file_url TEXT
        created_at TIMESTAMP
        updated_at TIMESTAMP
    }

    user {
        id SERIAL PK
        username VARCHAR
        first_name VARCHAR
        last_name VARCHAR
        email VARCHAR
        password_hash VARCHAR
        avatar_file_id INT FK
        created_at TIMESTAMP
        updated_at TIMESTAMP
    }

    country {
        id SERIAL PK
        name VARCHAR
        created_at TIMESTAMP
        updated_at TIMESTAMP
    }

    person {
        id SERIAL PK
        first_name VARCHAR
        last_name VARCHAR
        biography TEXT
        date_of_birth DATE
        gender gender_enum
        country_id INT FK
        avatar_file_id INT FK
        created_at TIMESTAMP
        updated_at TIMESTAMP
    }

    person_photos {
        person_id INT PK, FK
        file_id INT PK, FK
        created_at TIMESTAMP
        updated_at TIMESTAMP
    }

    movie {
        id SERIAL PK
        title VARCHAR
        description TEXT
        budget MONEY
        release_date DATE
        duration INTERVAL
        director_id INT FK
        country_id INT FK
        poster_file_id INT FK
        created_at TIMESTAMP
        updated_at TIMESTAMP
    }

    genre {
        id SERIAL PK
        name VARCHAR
        created_at TIMESTAMP
        updated_at TIMESTAMP
    }

    movie_genre {
        movie_id INT PK, FK
        genre_id INT PK, FK
        created_at TIMESTAMP
        updated_at TIMESTAMP
    }

    character {
        id SERIAL PK
        name VARCHAR
        description TEXT
        character_role role_enum
        created_at TIMESTAMP
        updated_at TIMESTAMP
    }

    movie_cast {
        id SERIAL PK
        movie_id INT FK
        character_id INT FK
        person_id INT FK
        created_at TIMESTAMP
        updated_at TIMESTAMP
    }

    favorite_movies {
        user_id INT PK, FK
        movie_id INT PK, FK
        created_at TIMESTAMP
        updated_at TIMESTAMP
    }

	file ||--o{ user : "avatar"
	
	country ||--o{ person : ""
	file ||--o{ person : "avatar"
	
	person ||--o{ person_photos : ""
	file ||--o{ person_photos : "photo"
	
	person ||--o{ movie : "director"
	country ||--o{ movie : ""
	file ||--o{ movie : "poster"
	
	movie ||--o{ movie_genre : ""
	genre ||--o{ movie_genre : ""

	movie ||--o{ movie_cast : ""
	character ||--o{ movie_cast : ""
	person ||--o{ movie_cast : ""
	
	user ||--o{ favorite_movies : ""
	movie ||--o{ favorite_movies : ""
