USE DB_MOVIES;

-- Ej. 01
SELECT * FROM directors;

-- Ej. 02
SELECT name AS nombre_del_director FROM directors;

-- Ej. 03
SELECT * FROM directors ORDER BY name;

-- Ej. 04
SELECT * FROM movies WHERE title LIKE '%:%';

-- Ej. 05
SELECT * FROM stars WHERE name LIKE 'm%';

-- Ej. 06
SELECT * FROM stars WHERE name LIKE '%e_';

-- Ej. 07
-- Opcion 1:
SELECT year FROM movies GROUP BY year;
-- Opcion 2:
SELECT DISTINCT year as TOTAL FROM movies;

-- Ej. 08
SELECT COUNT(DISTINCT year) as TOTAL FROM movies;

-- Ej. 09
SELECT * FROM movies  WHERE title = 'Pulp Fiction';

-- Ej. 10
SELECT * FROM movies  WHERE id = 6;

-- Ej. 11
SELECT * FROM movies  WHERE id > 3;

-- Ej. 12
SELECT * FROM movies  WHERE id <= 6 AND id >= 3;

-- Ej. 13
SELECT * FROM movies  WHERE id BETWEEN 3 AND 6;

-- Ej. 14
-- Opción 1: 
SELECT * FROM movies  WHERE year != 2013;
-- Opcion 2:
SELECT * FROM movies  WHERE year > 2013 OR year < 2013;

-- Ej. 15
SELECT * FROM movies  WHERE year = 1895 OR year = 1994 OR year = 1997;

-- Ej. 16
SELECT * FROM movies  WHERE year != 2014 AND year != 1994 AND year != 2013;

-- Ej. 17
SELECT * FROM movies  WHERE year >= 2000 OR imdb_rating >= 8.5;

-- Ej. 18
SELECT * FROM movies  WHERE year <= 2005 OR imdb_rating >= 8.5;

-- Ej. 19
-- a. 
SELECT * FROM movies ORDER BY year, imdb_rating DESC;
-- b. 
SELECT * FROM movies ORDER BY 3, 7 DESC;

-- Ej. 20
SELECT * FROM stars LIMIT 3;

-- Ej. 21
SELECT * FROM movies ORDER BY imdb_rating DESC LIMIT 5;

-- Ej. 22
SELECT MIN(imdb_rating) AS MIN_RATING, MAX(imdb_rating) AS MAX_RATING FROM movies;

-- Ej. 23
SELECT AVG(imdb_rating) AS RATING_AVG FROM movies;

-- Ej. 24
SELECT ROUND(AVG(imdb_rating), 2) AS RATING_AVG FROM movies;

-- Ej. 25
SELECT COUNT(id) AS TOTAL_DIRECTORES FROM directors;

-- Ej. 26
SELECT ROUND(SUM(imdb_rating), 2) AS RATING_POINTS FROM movies;

-- Ej. 27
SELECT * FROM movies WHERE imdb_rating > (SELECT AVG(imdb_rating) FROM movies);

-- Ej. 28
SELECT * FROM movies WHERE id NOT BETWEEN 2 AND 4;

-- Ej. 29
SELECT mov.title AS TITULO, dir.name AS DIRECTOR
FROM movies_directors md, movies mov, directors dir 
WHERE md.movies_id = mov.id AND md.directors_id = dir.id;

-- Ej. 30
-- Opción 1:
SELECT movies.title, stars.name 
FROM movies, stars, movies_stars
WHERE movies.id = movies_stars.movies_id 
AND stars.id = movies_stars.stars_id
AND movies.title = 'Pulp Fiction';
-- Opción 2:
SELECT movies.title, stars.name 
FROM ((movies
LEFT JOIN movies_stars ON movies_stars.movies_id = movies.id)
RIGHT JOIN stars ON movies_stars.stars_id = stars.id)
WHERE movies.title = 'Pulp Fiction';

-- Ej. 31
SELECT movies.title AS TITULO, genres.name AS GENERO
FROM ((movies
LEFT JOIN movies_genres ON movies_genres.movies_id = movies.id)
RIGHT JOIN genres ON movies_genres.genres_id = genres.id);

-- Ej. 32
SELECT movies.title AS TITULO, genres.name AS GENERO, stars.name AS ACTOR, directors.name AS DIRECTOR
FROM ((((((movies
LEFT JOIN movies_genres ON movies_genres.movies_id = movies.id)
RIGHT JOIN genres ON movies_genres.genres_id = genres.id)
LEFT JOIN movies_stars ON movies_stars.movies_id = movies.id)
RIGHT JOIN stars ON movies_stars.stars_id = stars.id)
LEFT JOIN movies_directors ON movies_directors.movies_id = movies.id)
RIGHT JOIN directors ON movies_directors.directors_id = directors.id)
;

-- Ej. 33
-- Opción 1:
SELECT movies.title, COUNT(movies_genres.genres_id) AS GENRES
FROM movies, movies_genres
WHERE movies.id = movies_genres.movies_id
GROUP BY movies.title;
-- Opción 2:
SELECT movies.title, COUNT(movies_genres.genres_id) AS GENRES
FROM movies
INNER JOIN movies_genres ON movies.id = movies_genres.movies_id
GROUP BY movies.title;

-- Ej. 34
SELECT directors.name AS DIRECTOR, COUNT(movies_directors.movies_id) AS TOTAL_PELICULAS
FROM directors
INNER JOIN movies_directors ON directors.id = movies_directors.directors_id
GROUP BY directors.id;

-- Ej. 35
SELECT title AS TITULO, 
CASE 
	WHEN imdb_rating >= 8 THEN 'EXCELENTE'
    WHEN imdb_rating < 8 AND imdb_rating >= 7 THEN 'NOTABLE'
    WHEN imdb_rating < 7 AND imdb_rating >= 6 THEN 'BIEN'
    WHEN imdb_rating < 6 AND imdb_rating >= 5 THEN 'SUFICIENTE'
    ELSE 'INSUFICIENTE'
END AS NOTA_PELICULA
FROM movies;

-- Ej. 36
-- DOS NUEVOS INSERTS Y UN UPDATE CON PUNTUACIONES ERRONEAS
INSERT INTO movies VALUES 
(NULL, 'Maquia: Una Historia De Amor Inmortal', 2018, 'https://www.imdb.com/title/tt7339826/mediaviewer/rm2762501888/?ref_=tt_ov_i', 'NO', 1, 77.4, 'Una chica inmortal y un chico normal se conocen y se hacen amigos y establecen un vínculo que perdura a lo largo de los años.', 72, 6300, 0),
(NULL, 'Yojimbo', 1961, 'https://www.imdb.com/title/tt0055630/mediaviewer/rm1707082240/?ref_=tt_ov_i', 'NO', 1, -8.2, 'Un astuto samurái ronin llega a un pueblo dividido por dos bandas criminales y decide enfrentar a una contra otra para liberar el pueblo.', 93, 121000, 0)
;
UPDATE movies SET imdb_rating = 28.0 WHERE id = 1;

SELECT title AS TITULO, 
CASE 
	WHEN imdb_rating <= 10 AND imdb_rating >= 8 THEN 'EXCELENTE'
    WHEN imdb_rating < 8 AND imdb_rating >= 7 THEN 'NOTABLE'
    WHEN imdb_rating < 7 AND imdb_rating >= 6 THEN 'BIEN'
    WHEN imdb_rating < 6 AND imdb_rating >= 5 THEN 'SUFICIENTE'
    WHEN imdb_rating < 5 AND imdb_rating >= 0 THEN 'INSUFICIENTE'
    ELSE 'ERROR'
END AS NOTA_PELICULA
FROM movies;
