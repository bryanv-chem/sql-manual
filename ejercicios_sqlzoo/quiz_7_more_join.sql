/**********************************************************************
|                                                                     |
|   QUIZ 7: More JOIN Operations - SQLZoo                             |
|                                                                     |
|   Bryan Vargas - Data Analyst in transition                         |
|   Fecha: Marzo 2026                                                 |
|                                                                     |
|   Tablas: movie(id, title, yr, director, budget, gross)            |
|           actor(id, name)                                           |
|           casting(movieid, actorid, ord)                           |
|                                                                     |
**********************************************************************/

/*---------------------------------------------------------------------
|   PREGUNTA 1                                                        |
-----------------------------------------------------------------------
   Select the statement which lists the unfortunate directors of the 
   movies which have caused financial loses (gross < budget)
   
   Opciones:
   A. SELECT JOIN(name FROM actor, movie ON actor.id:director WHERE gross < budget) GROUP BY name
   B. SELECT name FROM actor INNER JOIN movie BY actor.id = director HAVING gross < budget
   C. SELECT name FROM actor INNER JOIN movie ON actor.id = director WHERE gross < budget
   D. SELECT name FROM actor INNER JOIN movie ON actor.id:director WHERE gross < budget
   E. SELECT name FROM director INNER JOIN movie ON movie.id = director.id WHERE gross < budget
   
   Respuesta correcta: C
   Justificación: INNER JOIN con condición actor.id = director (el director es un actor)
   WHERE gross < budget filtra películas con pérdidas.
*/

/*---------------------------------------------------------------------
|   PREGUNTA 2                                                        |
-----------------------------------------------------------------------
   Select the correct example of JOINing three tables
   
   Opciones:
   A. SELECT * FROM actor JOIN casting BY actor.id = actorid JOIN movie BY movie.id = movieid
   B. SELECT * FROM actor JOIN casting ON actor.id = actorid AND JOIN movie ON movie.id = movieid
   C. SELECT * FROM actor JOIN casting JOIN movie ON actor.id = actorid AND movie.id = movieid
   D. SELECT * FROM actor JOIN casting ON actor.id = actorid AND movie ON movie.id = movieid
   E. SELECT * FROM actor JOIN casting ON actor.id = actorid JOIN movie ON movie.id = movieid
   
   Respuesta correcta: E
   Justificación: La sintaxis correcta para encadenar JOINs es:
   tabla1 JOIN tabla2 ON condición1 JOIN tabla3 ON condición2
*/

/*---------------------------------------------------------------------
|   PREGUNTA 3                                                        |
-----------------------------------------------------------------------
   Select the statement that shows the list of actors called 'John' 
   by order of number of movies in which they acted
   
   Opciones:
   A. SELECT name, COUNT(movieid) FROM actor JOIN casting ON actorid=actor.id WHERE name IN 'John %' GROUP BY name ORDER BY 2
   B. SELECT name, COUNT(movieid) FROM actor JOIN casting ON actorid=actor.id WHERE name LIKE 'J%' GROUP BY name ORDER BY 2 DESC
   C. SELECT name, COUNT(movieid) FROM casting JOIN actor ON actorid=actor.id WHERE name LIKE 'John %' GROUP BY name ORDER BY 2 DESC
   D. SELECT name, COUNT(movieid) FROM casting JOIN actor WHERE (actorid ON actor.id) AND name LIKE 'John %' GROUP BY name ORDER BY 2 DESC
   E. SELECT name, COUNT(movieid) FROM casting JOIN actor WHERE name LIKE 'John %' GROUP BY name ORDER BY COUNT(movieid) DESC
   
   Respuesta correcta: C
   Justificación: JOIN correcto (casting JOIN actor), filtro LIKE 'John %',
   GROUP BY name, ORDER BY 2 DESC (ordena por COUNT descendente)
*/

/*---------------------------------------------------------------------
|   PREGUNTA 4                                                        |
-----------------------------------------------------------------------
   Select the result that would be obtained from the following code:
   SELECT title 
     FROM movie JOIN casting ON (movieid=movie.id)
                JOIN actor   ON (actorid=actor.id)
    WHERE name='Paul Hogan' AND ord = 1
   
   Opciones:
   A. Table-A con columnas title y ord
   B. Table-B con solo títulos: "Crocodile" Dundee, Crocodile Dundee in Los Angeles, Flipper, Lightning Jack
   C. Table-C con título y Paul Hogan
   D. Table-D con título, Paul Hogan y ord
   E. Table-E con título y Paul Hogan
   
   Respuesta correcta: B
   Justificación: SELECT solo title, sin columnas adicionales.
   Las películas donde Paul Hogan fue protagonista (ord=1) son esas cuatro.
*/

/*---------------------------------------------------------------------
|   PREGUNTA 5                                                        |
-----------------------------------------------------------------------
   Select the statement that lists all the actors that starred in 
   movies directed by Ridley Scott who has id 351
   
   Opciones:
   A. SELECT name FROM movie JOIN casting AND actor ON movie.id = movieid AND actor.id = actorid WHERE ord = 1 AND actor = 351
   B. SELECT name FROM movie JOIN casting JOIN actor ON movie.id = movieid OR actor.id = actorid WHERE ord = 1 AND director = 351
   C. SELECT name FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid WHERE ord = 1 AND actorid = 351
   D. SELECT name FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid WHERE ord = 1 AND director = 351
   E. SELECT name FROM movie JOIN casting ON movie.id = actorid JOIN actor ON actor.id = movieid WHERE director = 351
   
   Respuesta correcta: D
   Justificación: Se necesita filtrar por director = 351 (Ridley Scott),
   ord = 1 (protagonistas), y unir las tres tablas correctamente.
*/

/*---------------------------------------------------------------------
|   PREGUNTA 6                                                        |
-----------------------------------------------------------------------
   There are two sensible ways to connect movie and actor. They are:
   
   Opciones:
   A. link the director column in movies with the id column in actor / join casting to itself
   B. link the actor column in movies with the primary key in actor / connect the primary keys of movie and actor via the casting table
   C. link the director column in movies with the primary key in actor / connect the primary keys of movie and actor via the casting table
   D. link the director column in movies with the primary key in actor / connect the primary keys of movie and casting via the actor table
   E. link the movie column in actor with the director column in actor / connect movie and actor via the casting table
   
   Respuesta correcta: C
   Justificación: 
   1. Director en movie se relaciona con id en actor (un director es un actor)
   2. La relación principal entre movie y actor es a través de casting (tabla intermedia)
*/

/*---------------------------------------------------------------------
|   PREGUNTA 7                                                        |
-----------------------------------------------------------------------
   Select the result that would be obtained from the following code:
   SELECT title, yr 
     FROM movie, casting, actor 
    WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3
   
   Opciones:
   A. Table-A con título, año y ord
   B. Table-B con título y año
   C. Table-C con título y ord
   D. Table-D solo títulos
   E. Table-E con título, nombre y año
   
   Respuesta correcta: B
   Justificación: SELECT title, yr (solo título y año).
   Las películas donde Robert De Niro tuvo ord=3 son A Bronx Tale (1993),
   Bang the Drum Slowly (1973), Limitless (2011).
*/

/**********************************************************************
|                                                                     |
|   CONCEPTOS USADOS EN EL QUIZ                                       |
|                                                                     |
**********************************************************************/

/*
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║  1. JOIN de dos tablas                                             ║
║     ──────────────────────────────────────────────────────────     ║
║     FROM actor INNER JOIN movie ON actor.id = director            ║
║     Relaciona actores con películas que dirigieron                ║
║                                                                    ║
║  2. JOIN de tres tablas                                            ║
║     ──────────────────────────────────────────────────────────     ║
║     FROM movie JOIN casting ON movie.id = movieid                 ║
║           JOIN actor ON actor.id = actorid                        ║
║     Permite combinar películas, reparto y actores                 ║
║                                                                    ║
║  3. GROUP BY con JOIN                                              ║
║     ──────────────────────────────────────────────────────────     ║
║     GROUP BY name ORDER BY COUNT(movieid) DESC                    ║
║     Agrupa por actor y ordena por cantidad de películas           ║
║                                                                    ║
║  4. Filtro por papel (ord)                                        ║
║     ──────────────────────────────────────────────────────────     ║
║     ord = 1: protagonista                                          ║
║     ord = 3: tercer papel en importancia                          ║
║                                                                    ║
║  5. Director como actor                                            ║
║     ──────────────────────────────────────────────────────────     ║
║     La columna director en movie es un actor (referencia a id)    ║
║                                                                    ║
║  6. Tabla intermedia casting                                       ║
║     ──────────────────────────────────────────────────────────     ║
║     Conecta movie y actor en una relación muchos a muchos         ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
*/
