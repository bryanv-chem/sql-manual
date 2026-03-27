/**********************************************************************
|                                                                     |
|   TUTORIAL 7: More JOIN Operations - Movies Database (SQLZoo)      |
|                                                                     |
|   Bryan Vargas - Data Analyst in transition                         |
|   Fecha: Marzo 2026                                                 |
|                                                                     |
|   Tablas:                                                           |
|   movie(id, title, yr, director, budget, gross)                    |
|   actor(id, name)                                                   |
|   casting(movieid, actorid, ord)                                    |
|                                                                     |
|   Relaciones:                                                       |
|   movie.id = casting.movieid                                        |
|   actor.id = casting.actorid                                        |
|                                                                     |
**********************************************************************/

/*---------------------------------------------------------------------
|   ESTRUCTURA DE TABLAS                                             |
---------------------------------------------------------------------*/

/*
   TABLA: movie
   +-------+-------------------+------+----------+--------+-------+
   | id    | title             | yr   | director | budget | gross |
   +-------+-------------------+------+----------+--------+-------+
   | 11768 | Casablanca        | 1942 | ...      | ...    | ...   |
   | ...   | ...               | ...  | ...      | ...    | ...   |
   +-------+-------------------+------+----------+--------+-------+

   TABLA: actor
   +-----+------------------+
   | id  | name             |
   +-----+------------------+
   | 140 | Glenn Close      |
   | ... | ...              |
   +-----+------------------+

   TABLA: casting
   +---------+---------+-----+
   | movieid | actorid | ord |
   +---------+---------+-----+
   | 11768   | 140     | 5   |
   | ...     | ...     | ... |
   +---------+---------+-----+

   RELACIONES:
   - casting.movieid → movie.id
   - casting.actorid → actor.id
   - ord = 1 → papel principal (protagonista)
*/

/*---------------------------------------------------------------------
|   EJERCICIOS                                                        |
---------------------------------------------------------------------*/

-- 1. Películas de 1962 con presupuesto > 2M
SELECT id, title
FROM movie
WHERE yr = 1962 AND budget > 2000000;

-- 2. Año de estreno de 'Citizen Kane'
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

-- 3. Películas de Star Trek (ordenadas por año)
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr;

-- 4. ID del actor 'Glenn Close'
SELECT id
FROM actor
WHERE name = 'Glenn Close';

-- 5. ID de la película 'Casablanca' (1942)
SELECT id
FROM movie
WHERE title = 'Casablanca' AND yr = 1942;

-- 6. Reparto de 'Casablanca'
SELECT name
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE movie.title = 'Casablanca' AND movie.yr = 1942;

-- 7. Reparto de 'Alien'
SELECT name
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE movie.title = 'Alien';

-- 8. Películas en las que apareció 'Harrison Ford'
SELECT title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford';

-- 9. Películas donde 'Harrison Ford' NO fue protagonista (ord != 1)
SELECT title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford' AND casting.ord != 1;

-- 10. Películas de 1962 con su protagonista
SELECT title, name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE movie.yr = 1962 AND casting.ord = 1;

-- 11. Años más ocupados de 'Rock Hudson' (más de 2 películas por año)
SELECT yr, COUNT(title) AS movie_count
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

-- 12. Películas de 'Julie Andrews' con su protagonista
SELECT title, name
FROM movie
JOIN casting ON movie.id = casting.movieid AND casting.ord = 1
JOIN actor ON casting.actorid = actor.id
WHERE movie.id IN (
    SELECT movieid
    FROM casting
    WHERE actorid IN (
        SELECT id
        FROM actor
        WHERE name = 'Julie Andrews'
    )
);

-- 13. Actores con al menos 15 papeles protagónicos (orden alfabético)
SELECT name
FROM actor
JOIN casting ON actor.id = casting.actorid
WHERE casting.ord = 1
GROUP BY actor.id, name
HAVING COUNT(*) >= 15
ORDER BY name;

-- 14. Películas de 1978 ordenadas por número de actores (desc) y título (asc)
SELECT movie.title, COUNT(casting.actorid) AS cast_size
FROM movie
JOIN casting ON movie.id = casting.movieid
WHERE movie.yr = 1978
GROUP BY movie.id, movie.title
ORDER BY cast_size DESC, movie.title;

-- 15. Personas que trabajaron con 'Art Garfunkel' (excluyéndolo)
SELECT DISTINCT y.name
FROM actor x
JOIN casting z ON x.id = z.actorid
JOIN casting w ON z.movieid = w.movieid
JOIN actor y ON w.actorid = y.id
WHERE x.name = 'Art Garfunkel'
  AND y.name != 'Art Garfunkel'
ORDER BY y.name;

/**********************************************************************
|                                                                     |
|   CONCEPTOS USADOS EN EL TUTORIAL                                   |
|                                                                     |
**********************************************************************/

/*
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║  1. JOIN de tres tablas                                            ║
║     ──────────────────────────────────────────────────────────     ║
║     FROM movie JOIN casting ON movie.id = casting.movieid         ║
║           JOIN actor ON casting.actorid = actor.id                ║
║     Permite combinar información de películas, reparto y actores  ║
║                                                                    ║
║  2. Filtro por papel (ord)                                         ║
║     ──────────────────────────────────────────────────────────     ║
║     ord = 1: protagonista                                          ║
║     ord != 1: reparto secundario                                   ║
║                                                                    ║
║  3. Subconsulta para filtrar por actor                             ║
║     ──────────────────────────────────────────────────────────     ║
║     Ejercicio 12: encontrar películas de Julie Andrews            ║
║     usando subconsulta anidada en WHERE                           ║
║                                                                    ║
║  4. GROUP BY + HAVING                                              ║
║     ──────────────────────────────────────────────────────────     ║
║     Ejercicio 11: agrupar por año, filtrar años con >2 películas  ║
║     Ejercicio 13: agrupar por actor, filtrar con >=15 papeles     ║
║                                                                    ║
║  5. ORDER BY múltiple                                              ║
║     ──────────────────────────────────────────────────────────     ║
║     Ejercicio 14: ORDER BY cast_size DESC, title ASC              ║
║                                                                    ║
║  6. AUTO-JOIN (JOIN de la misma tabla)                             ║
║     ──────────────────────────────────────────────────────────     ║
║     Ejercicio 15: usar actor y casting dos veces para encontrar   ║
║     personas que coincidieron en una película con Art Garfunkel   ║
║                                                                    ║
║  7. DISTINCT para eliminar duplicados                              ║
║     ──────────────────────────────────────────────────────────     ║
║     Ejercicio 15: una persona puede haber trabajado con Art       ║
║     Garfunkel en varias películas, DISTINCT evita repeticiones    ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
*/
