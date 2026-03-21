/**********************************************************************
|                                                                     |
|   TUTORIAL 0: Old JOIN Tutorial - Table Tennis Olympics            |
|                                                                     |
|   Bryan Vargas - Data Analyst in transition                         |
|   Fecha: Marzo 2026                                                 |
|                                                                     |
|   Tablas:                                                           |
|   ttms(games, color, who, country) - Men's Singles                  |
|   ttws(games, color, who, country) - Women's Singles                |
|   ttmd(games, color, team, country) - Men's Doubles                 |
|   country(id, name) - Países                                        |
|   games(yr, city, country) - Sedes olímpicas                        |
|   team(id, name) - Equipos de dobles                                |
|                                                                     |
**********************************************************************/

/*---------------------------------------------------------------------
|   PARTE 1: Men's Singles (ttms)                                     |
---------------------------------------------------------------------*/

-- 1. Atleta y nombre del país para medallistas en 2000
SELECT who, country.name
FROM ttms
JOIN country ON ttms.country = country.id
WHERE games = 2000;

-- 2. Atleta y color de medalla para ganadores de 'Sweden'
SELECT who, color
FROM ttms
JOIN country ON ttms.country = country.id
WHERE name = 'Sweden';

-- 3. Años en que 'China' ganó medalla de oro
SELECT games
FROM ttms
JOIN country ON ttms.country = country.id
WHERE name = 'China' AND color = 'gold';

/*---------------------------------------------------------------------
|   PARTE 2: Women's Singles (ttws)                                   |
---------------------------------------------------------------------*/

-- 4. Ganadores de medalla en los juegos de 'Barcelona'
SELECT who
FROM ttws
JOIN games ON ttws.games = games.yr
WHERE city = 'Barcelona';

-- 5. Ciudad y color de medalla para 'Jing Chen'
SELECT city, color
FROM ttws
JOIN games ON ttws.games = games.yr
WHERE who = 'Jing Chen';

-- 6. Ganadores de medalla de oro y la ciudad
SELECT who, city
FROM ttws
JOIN games ON ttws.games = games.yr
WHERE color = 'gold';

/*---------------------------------------------------------------------
|   PARTE 3: Men's Doubles (ttmd)                                     |
---------------------------------------------------------------------*/

-- 7. Juegos y color de medalla para el equipo que incluye 'Yan Sen'
SELECT games, color
FROM ttmd
JOIN team ON ttmd.team = team.id
WHERE name = 'Yan Sen';

-- 8. Ganadores de medalla de oro en 2004
SELECT name
FROM ttmd
JOIN team ON ttmd.team = team.id
WHERE color = 'gold' AND games = 2004;

-- 9. Nombre de cada medallista del país 'FRA'
SELECT name
FROM ttmd
JOIN team ON ttmd.team = team.id
WHERE country = 'FRA';

/**********************************************************************
|                                                                     |
|   CONCEPTOS USADOS EN EL TUTORIAL                                   |
|                                                                     |
**********************************************************************/

/*
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║  1. JOIN básico                                                    ║
║     ──────────────────────────────────────────────────────────     ║
║     FROM tabla1 JOIN tabla2 ON tabla1.col = tabla2.col            ║
║     Combina filas donde hay coincidencia                          ║
║                                                                    ║
║  2. JOIN con WHERE                                                 ║
║     ──────────────────────────────────────────────────────────     ║
║     El WHERE filtra después de la combinación                     ║
║     Útil para: país específico, año, color de medalla             ║
║                                                                    ║
║  3. Relaciones uno a muchos                                        ║
║     ──────────────────────────────────────────────────────────     ║
║     Un país tiene muchos medallistas                               ║
║     Una ciudad sede tiene muchos eventos                           ║
║     Un equipo tiene muchos integrantes                             ║
║                                                                    ║
║  4. Tablas intermedias                                             ║
║     ──────────────────────────────────────────────────────────     ║
║     ttms, ttws, ttmd son tablas de resultados                     ║
║     country, games, team son tablas de referencia                 ║
║                                                                    ║
║  5. Sintaxis de JOIN en SQLZoo                                     ║
║     ──────────────────────────────────────────────────────────     ║
║     SELECT columnas                                                ║
║     FROM tabla_principal                                           ║
║     JOIN tabla_secundaria ON (tabla_principal.col = tabla_secundaria.col)
║     WHERE condiciones;                                             ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
*/
