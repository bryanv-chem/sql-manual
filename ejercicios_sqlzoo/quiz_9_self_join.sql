/**********************************************************************
|                                                                     |
|   QUIZ 9: Self JOIN - Edinburgh Buses (SQLZoo)                      |
|                                                                     |
|   Bryan Vargas - Data Analyst in transition                         |
|   Fecha: Marzo 2026                                                 |
|                                                                     |
|   Tablas: stops(id, name), route(num, company, pos, stop)           |
|                                                                     |
**********************************************************************/

/*---------------------------------------------------------------------
|   PREGUNTA 1                                                        |
-----------------------------------------------------------------------
   Select the code that would show it is possible to get from 
   Craiglockhart to Haymarket
   
   Opciones:
   A. SELECT DISTINCT a.name, b.name FROM stops a JOIN route z IN a.id=z.stop JOIN route y ON y.num = z.num JOIN stops b IN y.stop=b.id WHERE a.name='Craiglockhart' AND b.name ='Haymarket'
   B. SELECT DISTINCT a.name, b.name FROM stops a JOIN route z ON a.id=z.stop JOIN route y JOIN stops b ON y.stop=b.id WHERE a.name='Craiglockhart' AND b.name ='Haymarket'
   C. SELECT DISTINCT a.name, b.name FROM stops a JOIN route z ON a.id=z.stop JOIN route y ON y.num = z.num JOIN stops b ON y.stop=b.id WHERE a.name='Craiglockhart' AND b.name ='Haymarket'
   D. SELECT DISTINCT a.name, b.name from stops a JOIN route z ON a.id=z.stop JOIN route y ON y.num = z.num JOIN stops b ON y.stop=b.id WHERE a.name='Craiglockhart' AND b.name ='Sighthill'
   E. SELECT DISTINCT a.name, b.name FROM stops a JOIN route z ON a.id=z.stop JOIN route y ON y.num = z.num JOIN stops b ON y.stop=b.id WHERE y.name='Craiglockhart' AND z.name ='Haymarket'
   
   Respuesta correcta: C
   Justificación: Self join correcto con ON y.num = z.num, y filtro WHERE con nombres correctos.
*/

/*---------------------------------------------------------------------
|   PREGUNTA 2                                                        |
-----------------------------------------------------------------------
   Select the code that shows the stops that are on route.num '2A' 
   which can be reached with one bus from Haymarket.
   
   Opciones:
   A. SELECT S2.id, S2.name, R2.company, R2.num FROM stops S1, stops S2, route R1, route R2 WHERE S1.name='Haymarket' AND S1.id=R1.stop AND S1.company=S2.company AND S1.num=S2.num AND R2.stop=S2.id AND R1.num='2A'
   B. SELECT S2.id, S2.name, R2.company, R2.num FROM stops S1, stops S2, route R1, route R2 WHERE S1.name='Haymarket' AND S1.id=R1.num AND R1.company=R2.company AND R1.num=R2.num AND R2.stop=S2.id AND R2.num='2A'
   C. SELECT S2.id, S2.name, R2.company, R2.num FROM stops S1, stops S2, route R1, route R2 WHERE S1.name='Haymarket' AND S1.id=R1.stop AND R1.company=R2.company AND R1.num=R2.num AND R2.stop=S2.id
   D. SELECT S2.id, S2.name, R2.company, R2.num FROM stops S1, stops S2, route R1, route R2 WHERE S1.name='Haymarket' AND S1.id=R1.stop AND R1.company=R2.company AND R1.num=R2.num AND R2.stop=S2.id AND R2.num='2'
   E. SELECT S2.id, S2.name, R2.company, R2.num FROM stops S1, stops S2, route R1, route R2 WHERE S1.name='Haymarket' AND S1.id=R1.stop AND R1.company=R2.company AND R1.num=R2.num AND R2.stop=S2.id AND R2.num='2A'
   
   Respuesta correcta: E
   Justificación: Filtro S1.name='Haymarket', S1.id=R1.stop, join por company/num, y R2.num='2A'.
*/

/*---------------------------------------------------------------------
|   PREGUNTA 3                                                        |
-----------------------------------------------------------------------
   Select the code that shows the services available from Tollcross.
   
   Opciones:
   A. SELECT a.company, a.num, stopa.name, stopb.name FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id)
   B. SELECT a.company, a.num, stopa.name, stopb.name FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id) WHERE stopa.name='Sighthill'
   C. SELECT a.company, a.num, stopa.name, stopb.name FROM route a JOIN route b IN (a.company=b.company AND a.num=b.num) JOIN stops stopa IN (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id) WHERE stopa.name='Tollcross'
   D. SELECT a.company, a.num, stopa.name, stopb.name FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id) WHERE stopa.name='Tollcross'
   E. SELECT a.company, a.num, stopa.name, stopb.name FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id) WHERE stopz.name='Tollcross'
   
   Respuesta correcta: D
   Justificación: Self join correcto con filtro WHERE stopa.name='Tollcross'.
*/

/**********************************************************************
|                                                                     |
|   CONCEPTOS USADOS EN EL QUIZ                                       |
|                                                                     |
**********************************************************************/

/*
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║  1. Self JOIN para rutas directas                                  ║
║     ──────────────────────────────────────────────────────────     ║
║     route a JOIN route b ON (a.company=b.company AND a.num=b.num) ║
║     Une dos paradas de la misma ruta                              ║
║                                                                    ║
║  2. JOIN con stops para nombres                                    ║
║     ──────────────────────────────────────────────────────────     ║
║     JOIN stops ON route.stop = stops.id                           ║
║     Convierte IDs en nombres legibles                             ║
║                                                                    ║
║  3. DISTINCT para eliminar duplicados                              ║
║     ──────────────────────────────────────────────────────────     ║
║     Una misma ruta puede visitar una parada una sola vez          ║
║                                                                    ║
║  4. Filtro por nombre de parada                                    ║
║     ──────────────────────────────────────────────────────────     ║
║     WHERE stopa.name = 'Craiglockhart'                            ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
*/
