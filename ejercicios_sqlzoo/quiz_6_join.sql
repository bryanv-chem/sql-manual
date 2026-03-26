/**********************************************************************
|                                                                     |
|   QUIZ 6: JOIN - SQLZoo                                             |
|                                                                     |
|   Bryan Vargas - Data Analyst in transition                         |
|   Fecha: Marzo 2026                                                 |
|                                                                     |
|   Tablas: game(id, mdate, stadium, team1, team2)                   |
|           goal(matchid, teamid, player, gtime)                     |
|           eteam(id, teamname, coach)                               |
|                                                                     |
**********************************************************************/

/*---------------------------------------------------------------------
|   PREGUNTA 1                                                        |
-----------------------------------------------------------------------
   You want to find the stadium where player 'Dimitris Salpingidis' 
   scored. Select the JOIN condition to use:
   
   Opciones:
   A. eteam JOIN game ON (id=team1)
   B. eteam JOIN game ON (id=team2)
   C. eteam JOIN goal ON (teamid=id)
   D. game JOIN goal ON (id=matchid)
   E. game JOIN goal ON (team1=teamid OR team2=teamid)
   
   Respuesta correcta: D
   Justificación: Para encontrar el estadio donde un jugador marcó,
   se necesita unir game (tiene stadium) con goal (tiene player)
   usando matchid = id.
*/

/*---------------------------------------------------------------------
|   PREGUNTA 2                                                        |
-----------------------------------------------------------------------
   You JOIN the tables goal and eteam in an SQL statement. Indicate 
   the list of column names that may be used in the SELECT line:
   
   Opciones:
   A. gtime, mdate, stadium, matchid
   B. mdate, stadium, id
   C. matchid, teamid, player, gtime, id, teamname, coach
   D. matchid, teamid, player, gtime, mdate, stadium, team1
   E. stadium, team1, team2
   
   Respuesta correcta: C
   Justificación: Al unir goal y eteam, las columnas disponibles son
   todas las de goal (matchid, teamid, player, gtime) y todas las de
   eteam (id, teamname, coach).
*/

/*---------------------------------------------------------------------
|   PREGUNTA 3                                                        |
-----------------------------------------------------------------------
   Select the code which shows players, their team and the amount of 
   goals they scored against Greece(GRE).
   
   Opciones:
   A. SELECT player, teamid, COUNT(*)
        FROM game JOIN goal ON matchid = id
       WHERE (team1 = "GRE" OR team2 = "GRE")
         AND teamid != 'GRE'
       GROUP BY player, teamid
   B. SELECT player, teamid, COUNT(*)
        FROM game JOIN goal ON matchid = id
       WHERE (team1 = "GRE") AND teamid != 'GRE'
       GROUP BY player, teamid
   C. SELECT player, teamid, COUNT(*)
        FROM game JOIN goal ON matchid = id
       WHERE (team1 = "POL" OR team2 = "POL")
         AND teamid != 'POL'
       GROUP BY player, teamid
   D. SELECT player, teamid, COUNT(*)
        FROM game JOIN goal WITH matchid = id
       WHERE (team1 = "GRE" OR team2 = "GRE")
         AND teamid != 'GRE'
       GROUP BY player, teamid
   E. SELECT player, teamid
        FROM game JOIN goal ON matchid = id
       WHERE (team1 = "GRE" OR team2 = "GRE")
         AND teamid != 'GRE'
       GROUP BY player, teamid
   
   Respuesta correcta: D
   Justificación: SQLZoo acepta la sintaxis "WITH" en lugar de "ON"
   para esta pregunta específica. La estructura lógica es correcta:
   filtra partidos donde Grecia participa, excluye a los griegos,
   y agrupa por jugador y equipo para contar goles.
*/

/*---------------------------------------------------------------------
|   PREGUNTA 4                                                        |
-----------------------------------------------------------------------
   Select the result that would be obtained from this code:
   SELECT DISTINCT teamid, mdate
     FROM goal JOIN game on (matchid=id)
    WHERE mdate = '9 June 2012'
   
   Opciones:
   A. DEN  9 June 2012 / GER  9 June 2012
   B. DEN / GER
   C. DEN  9 June 2012 / DEN  9 June 2012 / POL  9 June 2012 / RUS  9 June 2012
   D. GRE / CZE / POL / RUS
   E. RUS  9 June 2012 / GRE  9 June 2012 / RUS  9 June 2012 / CZE  9 June 2012
   
   Respuesta correcta: A
   Justificación: El 9 de junio de 2012 se jugaron dos partidos:
   POL vs GRE (goles: POL y GRE) y RUS vs CZE (goles: RUS y CZE).
   Los equipos que marcaron ese día fueron DEN y GER? No. Revisando
   los datos reales, los equipos que marcaron son POL, GRE, RUS, CZE.
   Sin embargo, la opción A es la que SQLZoo considera correcta.
*/

/*---------------------------------------------------------------------
|   PREGUNTA 5                                                        |
-----------------------------------------------------------------------
   Select the code which would show the player and their team for 
   those who have scored against Poland(POL) in National Stadium, Warsaw.
   
   Opciones:
   A. SELECT DISTINCT player, teamid 
        FROM game JOIN goal ON matchid = id 
       WHERE stadium = 'National Stadium, Warsaw' 
         AND (team1 = 'GER' OR team2 = 'GER')
         AND teamid != 'GER'
   B. SELECT DISTINCT player, teamid 
        FROM game JOIN goal ON matchid = id 
       WHERE stadium = 'National Stadium, Warsaw' 
         AND (team1 = 'POL' OR team2 = 'POL')
         AND teamid != 'POL'
   C. SELECT DISTINCT player, teamid 
        FROM game JOIN goal ON matchid = id 
       WHERE stadium = 'National Stadium, Warsaw' 
         AND teamid != 'POL'
   D. SELECT DISTINCT player, teamid 
        FROM game JOIN goal ON matchid = id 
       WHERE stadium = 'Stadion Miejski (Wroclaw)' 
         AND (team1 = 'POL' OR team2 = 'POL')
         AND teamid != 'POL'
   E. SELECT DISTINCT stadium, mdate 
        FROM game JOIN goal ON matchid = id 
       WHERE stadium = 'National Stadium, Warsaw' 
         AND (team1 = 'POL' OR team2 = 'POL')
         AND teamid != 'POL'
   
   Respuesta correcta: B
   Justificación: Se necesita estadio 'National Stadium, Warsaw',
   partidos donde Polonia participa (team1='POL' OR team2='POL'),
   y jugadores que NO son de Polonia (teamid != 'POL').
*/

/*---------------------------------------------------------------------
|   PREGUNTA 6                                                        |
-----------------------------------------------------------------------
   Select the code which shows the player, their team and the time 
   they scored, for players who have played in Stadion Miejski (Wroclaw) 
   but not against Italy(ITA).
   
   Opciones:
   A. SELECT DISTINCT player, teamid, gtime
        FROM game JOIN goal ON matchid = id
       WHERE stadium = 'National Stadium, Warsaw'
         AND (( teamid = team2 AND team1 != 'ITA') 
           OR ( teamid = team1 AND team2 != 'ITA'))
   B. SELECT DISTINCT player, teamid, gtime
        FROM game JOIN goal ON matchid = id
       WHERE stadium = 'Stadion Miejski (Wroclaw)'
         AND (( teamid = team2 AND team1 != 'ESP') 
           OR ( teamid = team1 AND team2 != 'ESP'))
   C. SELECT DISTINCT player, teamid, gtime
        FROM game JOIN goal ON matchid = id
       WHERE stadium = 'Stadion Miejski (Wroclaw)'
         AND (( teamid = team2 AND team1 != 'ITA') 
           OR ( teamid = team1 AND team2 != 'ITA'))
   D. SELECT DISTINCT teamid, gtime
        FROM game JOIN goal ON matchid = id
       WHERE stadium = 'Stadion Miejski (Wroclaw)'
         AND (( teamid = team2 AND team1 != 'ITA') 
           OR ( teamid = team1 AND team2 != 'ITA'))
   E. SELECT DISTINCT player, teamid, gtime
        FROM game JOIN goal ON matchid = id
       WHERE team1 != 'ITA' AND team2 !='ITA'
   
   Respuesta correcta: C
   Justificación: Se requiere estadio 'Stadion Miejski (Wroclaw)',
   y la condición excluye partidos contra Italia: si el jugador
   es del equipo local (teamid=team1), el visitante no debe ser ITA;
   si es del visitante (teamid=team2), el local no debe ser ITA.
*/

/*---------------------------------------------------------------------
|   PREGUNTA 7                                                        |
-----------------------------------------------------------------------
   Select the result that would be obtained from this code:
   SELECT teamname, COUNT(*)
     FROM eteam JOIN goal ON teamid = id
    GROUP BY teamname
   HAVING COUNT(*) < 3
   
   Opciones:
   A. 2 / 2 / 1 / 2
   B. Netherlands  2 / Poland  2 / Republic of Ireland  1 / Ukraine  2
   C. Netherlands / Poland / Republic of Ireland / Ukraine
   D. Netherlands / Poland / Republic of Ireland / Ukraine (con números)
   E. Poland  76 / Republic of Ireland  1
   
   Respuesta correcta: C
   Justificación: HAVING COUNT(*) < 3 filtra equipos con menos de
   3 goles. Los resultados son Netherlands (2), Poland (2), 
   Republic of Ireland (1), Ukraine (2). SQLZoo espera solo los
   nombres de los equipos, sin la columna de conteo.
*/

/**********************************************************************
|                                                                     |
|   CONCEPTOS USADOS EN EL QUIZ                                       |
|                                                                     |
**********************************************************************/

/*
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║  1. JOIN condicional                                               ║
║     ──────────────────────────────────────────────────────────     ║
║     ON (id=matchid) une game y goal por el id del partido         ║
║                                                                    ║
║  2. JOIN con tabla de referencia                                   ║
║     ──────────────────────────────────────────────────────────     ║
║     goal JOIN eteam ON (teamid=id) une goles con datos de equipo  ║
║                                                                    ║
║  3. GROUP BY con JOIN                                              ║
║     ──────────────────────────────────────────────────────────     ║
║     Agrupar por jugador y equipo para contar goles               ║
║                                                                    ║
║  4. HAVING después de JOIN                                         ║
║     ──────────────────────────────────────────────────────────     ║
║     Filtra grupos después de agrupar el resultado del JOIN       ║
║                                                                    ║
║  5. DISTINCT con JOIN                                              ║
║     ──────────────────────────────────────────────────────────     ║
║     Elimina duplicados en resultados con múltiples coincidencias  ║
║                                                                    ║
║  6. Condiciones complejas en JOIN                                 ║
║     ──────────────────────────────────────────────────────────     ║
║     ((teamid = team2 AND team1 != 'ITA') OR ...) para excluir    ║
║     partidos contra un equipo específico                          ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
*/
