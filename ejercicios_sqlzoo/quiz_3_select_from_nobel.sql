/**********************************************************************
|                                                                     |
|   QUIZ 3: SELECT from Nobel - SQLZoo                                |
|                                                                     |
|   Bryan Vargas - Data Analyst in transition                         |
|   Fecha: Marzo 2026                                                 |
|                                                                     |
|   Tabla: nobel(yr, subject, winner)                                 |
|                                                                     |
**********************************************************************/

/*---------------------------------------------------------------------
|   PREGUNTA 1                                                        |
-----------------------------------------------------------------------
   Pick the code which shows the name of winner's names beginning 
   with C and ending in n
   
   Opciones:
   A. SELECT name FROM nobel WHERE winner LIKE '%C%' AND winner LIKE '%n%'
   B. SELECT name FROM nobel WHERE winner LIKE '%C' AND winner LIKE 'n%'
   C. SELECT name FROM nobel WHERE winner LIKE 'C%' AND winner LIKE '%n'
   D. SELECT winner FROM nobel WHERE winner LIKE '%C' AND winner LIKE 'n%'
   E. SELECT winner FROM nobel WHERE winner LIKE 'C%' AND winner LIKE '%n'
   
   Respuesta correcta: E
   Justificación: 'C%' para que empiece con C, '%n' para que termine con n
*/

/*---------------------------------------------------------------------
|   PREGUNTA 2                                                        |
-----------------------------------------------------------------------
   Select the code that shows how many Chemistry awards were given 
   between 1950 and 1960
   
   Opciones:
   A. SELECT COUNT(subject) FROM nobel WHERE subject = 'Chemistry' AND BETWEEN 1950 and 1960
   B. SELECT COUNT(subject) FROM nobel WHERE subject = 'Chemistry' AND yr BETWEEN (1950, 1960)
   C. SELECT COUNT(subject) FROM nobel WHERE subject = 'Chemistry' AND yr BETWEEN 1950 and 1960
   D. SELECT subject FROM nobel WHERE subject = 'Chemistry' AND yr BETWEEN 1950 and 1960
   E. SELECT subject FROM nobel WHERE subject = 'Chemistry' AND yr BETWEEN (1950, 1960)
   
   Respuesta correcta: C
   Justificación: COUNT(subject) cuenta los registros, yr BETWEEN 1950 and 1960 es la sintaxis correcta
*/

/*---------------------------------------------------------------------
|   PREGUNTA 3                                                        |
-----------------------------------------------------------------------
   Pick the code that shows the amount of years where no Medicine 
   awards were given
   
   Opciones:
   A. SELECT COUNT(DISTINCT yr) FROM nobel WHERE yr IN (SELECT DISTINCT yr FROM nobel WHERE subject <> 'Medicine')
   B. SELECT COUNT(DISTINCT yr) FROM nobel WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')
   C. SELECT DISTINCT yr FROM nobel WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject LIKE 'Medicine')
   D. SELECT COUNT(DISTINCT yr) FROM nobel WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject NOT LIKE 'Medicine')
   E. SELECT COUNT(yr) FROM nobel WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')
   
   Respuesta correcta: B
   Justificación: Años que NO están en la lista de años con premios de Medicina
*/

/*---------------------------------------------------------------------
|   PREGUNTA 4                                                        |
-----------------------------------------------------------------------
   Select the result that would be obtained from the following code:
   SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'
   
   Opciones:
   A. Medicine John Eccles / Medicine Frank Macfarlane Burnet
   B. Chemistry Sir Cyril Hinshelwood / Medicine Sir John Eccles / Medicine Sir Frank Macfarlane Burnet
   C. Medicine John Eccles / Medicine Frank Macfarlane Burnet
   D. Medicine John Eccles / Medicine Frank Macfarlane Burnet
   E. Sir John Eccles / Sir Frank Macfarlane Burnet
   
   Respuesta correcta: B
   Justificación: En 1960-1969, ganadores con 'Sir' incluyen Cyril Hinshelwood (Chemistry) y John Eccles, Frank Macfarlane Burnet (Medicine)
*/

/*---------------------------------------------------------------------
|   PREGUNTA 5                                                        |
-----------------------------------------------------------------------
   Select the code which would show the year when neither a Physics 
   or Chemistry award was given
   
   Opciones:
   A. SELECT yr FROM nobel WHERE subject NOT IN(SELECT yr FROM nobel WHERE subject IN ('Chemistry','Physics'))
   B. SELECT yr FROM nobel WHERE subject NOT IN(SELECT subject FROM nobel WHERE subject IN ('Chemistry','Physics'))
   C. SELECT yr FROM nobel WHERE yr NOT IN(SELECT yr FROM nobel WHERE subject IN ('Chemistry','Physics'))
   D. SELECT yr FROM nobel WHERE yr NOT IN(SELECT subject FROM nobel WHERE subject IN ('Chemistry','Physics'))
   E. SELECT yr FROM subject WHERE yr NOT IN (SELECT yr FROM nobel WHERE subject IN ('Chemistry','Physics'))
   
   Respuesta correcta: C
   Justificación: Años que NO están en la lista de años donde hubo Física o Química
*/

/*---------------------------------------------------------------------
|   PREGUNTA 6                                                        |
-----------------------------------------------------------------------
   Select the code which shows the years when a Medicine award was 
   given but no Peace or Literature award was given
   
   Opciones:
   A. SELECT DISTINCT yr FROM nobel WHERE subject='Medicine' AND subject NOT IN(SELECT yr from nobel WHERE subject='Literature') AND yr NOT IN (SELECT yr FROM nobel WHERE subject='Peace')
   B. SELECT DISTINCT yr FROM nobel WHERE subject='Medicine' AND yr NOT IN(SELECT yr from nobel WHERE subject='Literature' AND subject='Peace')
   C. SELECT DISTINCT yr FROM nobel WHERE subject='Medicine' AND yr NOT IN(SELECT yr FROM nobel WHERE subject='Literature') AND yr NOT IN (SELECT yr FROM nobel WHERE subject='Peace')
   D. SELECT DISTINCT yr FROM subject WHERE subject='Medicine' AND yr NOT IN(SELECT yr from nobel WHERE subject='Literature' AND subject='Peace')
   E. SELECT DISTINCT yr FROM subject WHERE subject='Medicine' AND yr NOT IN('Literature','Peace')
   
   Respuesta correcta: C
   Justificación: Años con Medicina que NO están en años con Literatura NI en años con Paz
*/

/*---------------------------------------------------------------------
|   PREGUNTA 7                                                        |
-----------------------------------------------------------------------
   Pick the result that would be obtained from the following code:
   SELECT subject, COUNT(subject) FROM nobel WHERE yr = '1960' GROUP BY subject
   
   Opciones:
   A. (no muestra)
   B. Chemistry 6 / Chemistry 3 / Literature 1 / Medicine 2 / Peace 0 / Physics 2
   C. Chemistry 1 / Literature 1 / Medicine 2 / Peace 1 / Physics 1
   D. Chemistry 1 / Literature 1 / Peace 1 / Physics 1
   
   Respuesta correcta: C
   Justificación: En 1960: Química 1 (Willard F. Libby), Literatura 1 (Saint-John Perse), Medicina 2 (Burnet y Medawar), Paz 1 (Albert Lutuli), Física 1 (Donald A. Glaser)
*/

/**********************************************************************
|                                                                     |
|   CONCEPTOS USADOS EN EL QUIZ                                       |
|                                                                     |
**********************************************************************/

/*
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║  1. LIKE con patrones                                              ║
║     ──────────────────────────────────────────────────────────     ║
║     'C%'   : comienza con C                                        ║
║     '%n'   : termina con n                                         ║
║     'Sir%' : comienza con Sir                                      ║
║     '196%' : comienza con 196 (años 1960-1969)                    ║
║                                                                    ║
║  2. BETWEEN                                                        ║
║     ──────────────────────────────────────────────────────────     ║
║     yr BETWEEN 1950 AND 1960                                       ║
║     Incluye los límites (1950 y 1960)                             ║
║                                                                    ║
║  3. COUNT y DISTINCT                                               ║
║     ──────────────────────────────────────────────────────────     ║
║     COUNT(subject)  : cuenta registros                             ║
║     COUNT(DISTINCT yr) : cuenta años únicos                       ║
║                                                                    ║
║  4. Subconsultas con NOT IN                                        ║
║     ──────────────────────────────────────────────────────────     ║
║     WHERE yr NOT IN (SELECT yr FROM nobel WHERE subject = '...')   ║
║     Útil para excluir años que cumplen una condición              ║
║                                                                    ║
║  5. GROUP BY                                                       ║
║     ──────────────────────────────────────────────────────────     ║
║     Agrupa por subject para contar premios por categoría           ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
*/
