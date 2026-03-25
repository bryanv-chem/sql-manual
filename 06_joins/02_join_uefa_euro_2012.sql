/**********************************************************************
|                                                                     |
|   TUTORIAL 6: JOIN - UEFA EURO 2012 (SQLZoo)                       |
|                                                                     |
|   Bryan Vargas - Data Analyst in transition                         |
|   Fecha: Marzo 2026                                                 |
|                                                                     |
|   Base de datos: UEFA EURO 2012 Football Championship              |
|   Fuente: http://sqlzoo.net/euro2012.sql                           |
|                                                                     |
**********************************************************************/

/*---------------------------------------------------------------------
|   ESTRUCTURA DE TABLAS                                             |
---------------------------------------------------------------------*/

/*
   TABLA: game
   +------+-------------------+--------------------------------+-------+-------+
   | id   | mdate             | stadium                        | team1 | team2 |
   +------+-------------------+--------------------------------+-------+-------+
   | 1001 | 8 June 2012       | National Stadium, Warsaw      | POL   | GRE   |
   | 1002 | 8 June 2012       | Stadion Miejski (Wroclaw)     | RUS   | CZE   |
   | 1003 | 12 June 2012      | Stadion Miejski (Wroclaw)     | GRE   | CZE   |
   | 1004 | 12 June 2012      | National Stadium, Warsaw      | POL   | RUS   |
   | ...  | ...               | ...                            | ...   | ...   |
   +------+-------------------+--------------------------------+-------+-------+

   TABLA: goal
   +---------+--------+---------------------+-------+
   | matchid | teamid | player              | gtime |
   +---------+--------+---------------------+-------+
   | 1001    | POL    | Robert Lewandowski  | 17    |
   | 1001    | GRE    | Dimitris Salpingidis| 51    |
   | 1002    | RUS    | Alan Dzagoev        | 15    |
   | 1002    | RUS    | Roman Pavlyuchenko  | 82    |
   | ...     | ...    | ...                 | ...   |
   +---------+--------+---------------------+-------+

   TABLA: eteam
   +-----+-------------------+---------------------+
   | id  | teamname          | coach               |
   +-----+-------------------+---------------------+
   | POL | Poland            | Franciszek Smuda    |
   | RUS | Russia            | Dick Advocaat       |
   | CZE | Czech Republic    | Michal Bilek        |
   | GRE | Greece            | Fernando Santos     |
   | ... | ...               | ...                 |
   +-----+-------------------+---------------------+

   RELACIONES:
   - goal.matchid → game.id
   - goal.teamid → eteam.id
   - game.team1 → eteam.id
   - game.team2 → eteam.id
*/

/*---------------------------------------------------------------------
|   EJERCICIOS BÁSICOS                                               |
---------------------------------------------------------------------*/

-- 1. Goles de Alemania (teamid = 'GER')
SELECT matchid, player
FROM goal
WHERE teamid = 'GER';

-- 2. Datos del partido 1012
SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012;

-- 3. Goles de Alemania con detalles del partido
SELECT player, teamid, stadium, mdate
FROM game
JOIN goal ON id = matchid
WHERE teamid = 'GER';

-- 4. Goles de jugadores llamados Mario
SELECT team1, team2, player
FROM game
JOIN goal ON id = matchid
WHERE player LIKE 'Mario%';

-- 5. Goles en los primeros 10 minutos con datos del equipo
SELECT player, teamid, coach, gtime
FROM goal
JOIN eteam ON teamid = id
WHERE gtime <= 10;

-- 6. Partidos donde Fernando Santos fue entrenador del equipo 1
SELECT mdate, teamname
FROM game
JOIN eteam ON team1 = eteam.id
WHERE coach = 'Fernando Santos';

-- 7. Goles en el Estadio Nacional de Varsovia
SELECT player
FROM goal
JOIN game ON matchid = id
WHERE stadium = 'National Stadium, Warsaw';

/*---------------------------------------------------------------------
|   EJERCICIOS MÁS COMPLEJOS                                         |
---------------------------------------------------------------------*/

-- 8. Jugadores que marcaron contra Alemania
SELECT DISTINCT(player)
FROM game
JOIN goal ON matchid = id
WHERE (team1 = 'GER' OR team2 = 'GER')
  AND teamid != 'GER';

-- 9. Total de goles por equipo
SELECT teamname, COUNT(player) AS goals
FROM eteam
JOIN goal ON id = teamid
GROUP BY teamname
ORDER BY goals DESC;

-- 10. Goles por estadio
SELECT stadium, COUNT(player) AS goals
FROM game
JOIN goal ON matchid = id
GROUP BY stadium
ORDER BY goals DESC;

-- 11. Partidos de Polonia con conteo de goles
SELECT matchid, mdate, COUNT(player) AS goals
FROM game
JOIN goal ON matchid = id
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY matchid, mdate
ORDER BY matchid;

-- 12. Partidos donde Alemania marcó y cuántos goles hizo
SELECT matchid, mdate, COUNT(player) AS german_goals
FROM game
JOIN goal ON matchid = id
WHERE (team1 = 'GER' OR team2 = 'GER')
  AND teamid = 'GER'
GROUP BY matchid, mdate
ORDER BY matchid;

/*---------------------------------------------------------------------
|   EJERCICIO 13: LEFT JOIN y CASE WHEN                               |
---------------------------------------------------------------------*/

/*
   LEFT JOIN: mantiene todas las filas de la tabla izquierda (game)
   aunque no tengan coincidencias en la tabla derecha (goal).
   
   Sin LEFT JOIN, los partidos sin goles (score1=0, score2=0) no
   aparecerían en el resultado porque INNER JOIN los excluiría.
   
   ORDER BY: es obligatorio para que el resultado coincida con el
   esperado en SQLZoo. Sin el ORDER BY, el orden de las filas puede
   variar y la respuesta se considera incorrecta aunque los datos sean
   los mismos.
*/

SELECT mdate,
       team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2
FROM game
LEFT JOIN goal ON id = matchid
GROUP BY mdate, team1, team2, id
ORDER BY mdate, id, team1, team2;

/**********************************************************************
|                                                                     |
|   CONCEPTOS USADOS EN EL TUTORIAL                                   |
|                                                                     |
**********************************************************************/

/*
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║  1. INNER JOIN                                                     ║
║     ──────────────────────────────────────────────────────────     ║
║     FROM tabla1 JOIN tabla2 ON tabla1.col = tabla2.col            ║
║     Combina filas donde hay coincidencia                          ║
║                                                                    ║
║  2. LEFT JOIN                                                      ║
║     ──────────────────────────────────────────────────────────     ║
║     Mantiene todas las filas de la tabla izquierda                ║
║     Útil cuando quieres mostrar filas aunque no tengan            ║
║     coincidencias en la tabla derecha (ej: partidos sin goles)    ║
║                                                                    ║
║  3. CASE WHEN                                                      ║
║     ──────────────────────────────────────────────────────────     ║
║     CASE WHEN condición THEN valor ELSE valor END                 ║
║     Asigna 1 si el gol es de team1, 0 si no                       ║
║     SUM() de estos valores da el total de goles                   ║
║                                                                    ║
║  4. GROUP BY con JOIN                                              ║
║     ──────────────────────────────────────────────────────────     ║
║     GROUP BY mdate, team1, team2, id                              ║
║     Agrupa por partido para calcular goles por equipo             ║
║                                                                    ║
║  5. ORDER BY obligatorio                                           ║
║     ──────────────────────────────────────────────────────────     ║
║     Sin ORDER BY, SQL no garantiza orden de filas                 ║
║     SQLZoo compara resultados exactos, incluyendo orden           ║
║                                                                    ║
║  6. DISTINCT                                                       ║
║     ──────────────────────────────────────────────────────────     ║
║     Elimina duplicados (mismo jugador puede marcar en varios      ║
║     partidos contra Alemania)                                     ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
*/
