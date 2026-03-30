/**********************************************************************
|                                                                     |
|   TUTORIAL 9: Self JOIN - Edinburgh Buses (SQLZoo)                 |
|                                                                     |
|   Bryan Vargas - Data Analyst in transition                         |
|   Fecha: Marzo 2026                                                 |
|                                                                     |
|   Tablas:                                                           |
|   stops(id, name)                                                   |
|   route(num, company, pos, stop)                                    |
|                                                                     |
|   Relación: route.stop = stops.id                                   |
|                                                                     |
**********************************************************************/

/*---------------------------------------------------------------------
|   ESTRUCTURA DE TABLAS                                             |
---------------------------------------------------------------------*/

/*
   TABLA: stops
   +-----+------------------+
   | id  | name             |
   +-----+------------------+
   | 53  | Craiglockhart    |
   | 149 | London Road      |
   | 115 | Haymarket        |
   | 137 | Leith            |
   | ... | ...              |
   +-----+------------------+

   TABLA: route
   +-----+---------+-----+------+
   | num | company | pos | stop |
   +-----+---------+-----+------+
   | 4   | LRT     | 1   | 19   |
   | 4   | LRT     | 2   | 177  |
   | ... | ...     | ... | ...  |
   +-----+---------+-----+------+

   RELACIONES:
   - Cada ruta (num + company) tiene múltiples stops (pos ordena)
   - Self join: route a JOIN route b ON (a.num=b.num AND a.company=b.company)
*/

/*---------------------------------------------------------------------
|   EJERCICIOS                                                        |
---------------------------------------------------------------------*/

-- 1. Número total de paradas
SELECT COUNT(name) AS total_stops
FROM stops;

-- 2. ID de la parada 'Craiglockhart'
SELECT id
FROM stops
WHERE name = 'Craiglockhart';

-- 3. Paradas del servicio '4' de 'LRT'
SELECT stops.id, stops.name
FROM stops
JOIN route ON stops.id = route.stop
WHERE route.num = '4' AND route.company = 'LRT';

-- 4. Rutas que visitan London Road (149) o Craiglockhart (53) (ambas)
SELECT company, num, COUNT(*) AS stops_count
FROM route
WHERE stop = 149 OR stop = 53
GROUP BY company, num
HAVING COUNT(*) = 2;

-- 5. Servicios desde Craiglockhart a London Road
SELECT a.company, a.num, a.stop, b.stop
FROM route a
JOIN route b ON a.company = b.company AND a.num = b.num
WHERE a.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart')
  AND b.stop = (SELECT id FROM stops WHERE name = 'London Road');

-- 6. Servicios entre Craiglockhart y London Road (con nombres)
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a
JOIN route b ON a.company = b.company AND a.num = b.num
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'London Road';

-- 7. Servicios que conectan Haymarket (115) y Leith (137)
SELECT DISTINCT a.company, a.num
FROM route a
JOIN route b ON a.company = b.company AND a.num = b.num
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Haymarket' AND stopb.name = 'Leith';

-- 8. Servicios que conectan Craiglockhart y Tollcross
SELECT DISTINCT a.company, a.num
FROM route a
JOIN route b ON a.company = b.company AND a.num = b.num
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross';

-- 9. Paradas alcanzables desde Craiglockhart en un bus (LRT)
SELECT DISTINCT stopb.name, b.company, b.num
FROM route a
JOIN route b ON a.company = b.company AND a.num = b.num
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart'
ORDER BY b.num, stopb.name;

-- 10. Dos buses desde Craiglockhart a Lochend
SELECT DISTINCT 
    a.num AS first_bus_num,
    a.company AS first_bus_company,
    stopb.name AS transfer_stop,
    c.num AS second_bus_num,
    c.company AS second_bus_company
FROM route a
JOIN route b ON a.num = b.num AND a.company = b.company
JOIN route c ON b.stop = c.stop
JOIN route d ON c.num = d.num AND c.company = d.company
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
JOIN stops stopd ON d.stop = stopd.id
WHERE stopa.name = 'Craiglockhart'
  AND stopd.name = 'Lochend'
  AND (a.num != c.num OR a.company != c.company)
ORDER BY a.num, stopb.name, c.num;

/**********************************************************************
|                                                                     |
|   CONCEPTOS USADOS EN EL TUTORIAL                                   |
|                                                                     |
**********************************************************************/

/*
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║  1. Self JOIN                                                      ║
║     ──────────────────────────────────────────────────────────     ║
║     Unir una tabla consigo misma usando alias                     ║
║     Útil para comparar filas dentro de la misma tabla             ║
║     Ej: route a JOIN route b ON (a.num=b.num AND a.company=b.company)
║                                                                    ║
║  2. JOIN de dos Self Joins                                         ║
║     ──────────────────────────────────────────────────────────     ║
║     Para encontrar rutas de dos buses:                            ║
║     Primer bus: a (inicio) → b (transferencia)                    ║
║     Segundo bus: c (transferencia) → d (destino)                  ║
║     Se unen b.stop = c.stop (misma parada de transferencia)       ║
║                                                                    ║
║  3. JOIN con stops para nombres                                    ║
║     ──────────────────────────────────────────────────────────     ║
║     JOIN stops ON route.stop = stops.id                           ║
║     Permite mostrar nombre de parada en lugar de id               ║
║                                                                    ║
║  4. DISTINCT para eliminar duplicados                              ║
║     ──────────────────────────────────────────────────────────     ║
║     Una misma ruta puede visitar una parada una sola vez          ║
║                                                                    ║
║  5. Subconsulta en WHERE                                           ║
║     ──────────────────────────────────────────────────────────     ║
║     Para evitar hacer JOIN adicional con stops                    ║
║     Ej: WHERE a.stop = (SELECT id FROM stops WHERE name = '...')  ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
*/
