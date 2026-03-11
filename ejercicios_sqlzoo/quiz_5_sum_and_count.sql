/**********************************************************************
|                                                                     |
|   QUIZ 5: SUM and COUNT - SQLZoo                                    |
|                                                                     |
|   Bryan Vargas - Data Analyst in transition                         |
|   Fecha: Marzo 2026                                                 |
|                                                                     |
|   Tabla: bbc(name, region, area, population, gdp)                   |
|                                                                     |
**********************************************************************/

/*---------------------------------------------------------------------
|   PREGUNTA 1                                                        |
-----------------------------------------------------------------------
   Select the statement that shows the sum of population of all countries in 'Europe'
   
   Opciones:
   A. SELECT name, population FROM bbc WHERE region = 'Europe'
   B. SELECT population FROM bbc WHERE region = 'Europe' SUM BY region
   C. SELECT SUM(population) FROM bbc WHERE region = 'Europe'
   D. SELECT SUM(population FROM bbc WHERE region = 'Europe')
   E. SUM population FROM bbc WHERE region = 'Europe'
   
   Respuesta correcta: C
   Justificación: SUM es función de agregado, debe ir en SELECT y la condición en WHERE
*/

/*---------------------------------------------------------------------
|   PREGUNTA 2                                                        |
-----------------------------------------------------------------------
   Select the statement that shows the number of countries with population smaller than 150000
   
   Opciones:
   A. SELECT COUNT(name) FROM bbc WHERE population < 150000
   B. SELECT COUNT(population < 150000) FROM bbc
   C. SELECT name FROM bbc WHERE population < 150000
   D. SELECT population AS COUNT FROM bbc WHERE population < 150000
   E. SELECT SUM() FROM bbc WHERE population < 150000
   
   Respuesta correcta: A
   Justificación: COUNT(name) cuenta países que cumplen condición WHERE
*/

/*---------------------------------------------------------------------
|   PREGUNTA 3                                                        |
-----------------------------------------------------------------------
   Select the list of core SQL aggregate functions
   
   Opciones:
   A. AVG(), COUNT(), FIRST(), LAST(), SUM()
   B. AVG(), COUNT(), MAX(), MEDIAN(), MIN(), ROUND(), SUM()
   C. AVG(), COUNT(), CONCAT(), FIRST(), LAST(), MAX(), MIN(), SUM()
   D. AVG(), COUNT(), MAX(), MIN(), SUM()
   E. COUNT(), SUM()
   
   Respuesta correcta: D
   Justificación: Las funciones de agregado core son AVG, COUNT, MAX, MIN, SUM
*/

/*---------------------------------------------------------------------
|   PREGUNTA 4                                                        |
-----------------------------------------------------------------------
   Select the result that would be obtained from the following code:
   
   SELECT region, SUM(area)
     FROM bbc 
    WHERE SUM(area) > 15000000 
    GROUP BY region
   
   Opciones:
   A. Table-A (Europe 17000000)
   B. Table-B (Europe 17000000, Asia-Pacific 23460000, North America 21660000)
   C. Table-C (Europe, Asia-Pacific, North America)
   D. No result due to invalid use of the GROUP BY function
   E. No result due to invalid use of the WHERE function
   
   Respuesta correcta: E
   Justificación: SUM(area) no puede usarse en WHERE porque WHERE filtra antes de agrupar
*/

/*---------------------------------------------------------------------
|   PREGUNTA 5                                                        |
-----------------------------------------------------------------------
   Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'
   
   Opciones:
   A. SELECT AVG(population) FROM bbc WHERE name = ('Poland', 'Germany', 'Denmark')
   B. SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')
   C. SELECT AVG(population) FROM bbc WHERE name LIKE ('Poland', 'Germany', 'Denmark')
   D. SELECT AVG(population) FROM bbc WHERE name LIKE (Poland, Germany, Denmark)
   E. SELECT population FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')
   
   Respuesta correcta: B
   Justificación: IN para múltiples valores, AVG para promedio
*/

/*---------------------------------------------------------------------
|   PREGUNTA 6                                                        |
-----------------------------------------------------------------------
   Select the statement that shows the medium population density of each region
   
   Opciones:
   A. SELECT region, AVG(population/area) AS density FROM bbc
   B. SELECT region, COUNT(population)/COUNT(area) AS density FROM bbc GROUP BY region
   C. SELECT region, SUM(population)/COUNT(area) AS density FROM bbc GROUP BY region
   D. SELECT region, SUM(population)/SUM(area) AS density FROM bbc HAVING region
   E. SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region
   
   Respuesta correcta: E
   Justificación: La densidad correcta es población total / área total de la región
*/

/*---------------------------------------------------------------------
|   PREGUNTA 7                                                        |
-----------------------------------------------------------------------
   Select the statement that shows the name and population density of the country with the largest population
   
   Opciones:
   A. SELECT name, density AS population/area FROM bbc WHERE population = MAX(population)
   B. SELECT name, density AS population/area FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)
   C. SELECT name, MAX (population) FROM bbc WHERE population / (SELECT area FROM bbc)
   D. SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)
   E. SELECT name, population/area AS density FROM bbc WHERE population > (SELECT MAX(population) FROM bbc)
   
   Respuesta correcta: D
   Justificación: Subconsulta para obtener MAX, luego cálculo de densidad
*/

/*---------------------------------------------------------------------
|   PREGUNTA 8                                                        |
-----------------------------------------------------------------------
   Pick the result that would be obtained from the following code:
   
   SELECT region, SUM(area) 
     FROM bbc 
    GROUP BY region 
    HAVING SUM(area) <= 20000000
   
   Opciones:
   A. Table-A (732240, 13403102, 17740392, 4943771)
   B. Table-B (Africa 22550927, Asia-Pacific 28759578, Europe 23866987, North America 21660000)
   C. Table-C (Africa, Asia-Pacific, Europe, North America)
   D. Table-D (Americas 732240, Middle East 13403102, South America 17740392, South Asia 9437710)
   E. Table-E (Americas, Middle East, South America, South Asia)
   
   Respuesta correcta: E
   Justificación: HAVING filtra grupos con área total <= 20M, muestra solo nombres de región
*/

/**********************************************************************
|                                                                     |
|   CONCEPTOS USADOS EN EL QUIZ                                       |
|                                                                     |
**********************************************************************/

/*
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║  1. FUNCIONES DE AGREGADO                                          ║
║     ├── SUM()    - Suma de valores                                 ║
║     ├── COUNT()  - Conteo de filas                                 ║
║     ├── AVG()    - Promedio                                        ║
║     ├── MAX()    - Valor máximo                                    ║
║     └── MIN()    - Valor mínimo                                    ║
║                                                                    ║
║  2. FILTRADO                                                       ║
║     ├── WHERE    - Filtra filas antes de agrupar                   ║
║     ├── HAVING   - Filtra grupos después de agrupar                ║
║     └── IN       - Comparación con múltiples valores               ║
║                                                                    ║
║  3. AGRUPAMIENTO                                                    ║
║     └── GROUP BY - Agrupa filas por columnas                       ║
║                                                                    ║
║  4. SUBCONSULTAS                                                    ║
║     └── Escalares - (SELECT MAX...) para valores únicos            ║
║                                                                    ║
║  5. OPERACIONES MATEMÁTICAS                                         ║
║     └── Densidad poblacional: población / área                     ║
║         Densidad por región: SUM(population)/SUM(area)            ║
║                                                                    ║
║  6. ERRORES COMUNES IDENTIFICADOS                                   ║
║     ├── Usar funciones de agregado en WHERE                        ║
║     ├── Usar = en lugar de IN para múltiples valores               ║
║     ├── Calcular densidad como AVG(population/area)                ║
║     └── Comparar directamente con MAX sin subconsulta              ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
*/
