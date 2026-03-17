/**********************************************************************
|                                                                     |
|   TUTORIAL 2: SELECT from WORLD - SQLZoo                           |
|                                                                     |
|   Bryan Vargas - Data Analyst in transition                         |
|   Fecha: Marzo 2026                                                 |
|                                                                     |
|   Tabla: world(name, continent, area, population, gdp)             |
|                                                                     |
**********************************************************************/

/*---------------------------------------------------------------------
|   1. Introducción - Mostrar todos los países                       |
---------------------------------------------------------------------*/
SELECT name, continent, population FROM world;

/*---------------------------------------------------------------------
|   2. Países con población >= 200 millones                          |
---------------------------------------------------------------------*/
SELECT name FROM world
WHERE population >= 200000000;

/*---------------------------------------------------------------------
|   3. Per cápita GDP para países con población >= 200M              |
---------------------------------------------------------------------*/
SELECT name, gdp/population AS per_capita_gdp
FROM world
WHERE population >= 200000000;

/*---------------------------------------------------------------------
|   4. Población en millones (Sudamérica)                            |
---------------------------------------------------------------------*/
SELECT name, population/1000000 AS population_millions
FROM world
WHERE continent = 'South America';

/*---------------------------------------------------------------------
|   5. Francia, Alemania, Italia                                     |
---------------------------------------------------------------------*/
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

/*---------------------------------------------------------------------
|   6. Países que contienen 'United'                                 |
---------------------------------------------------------------------*/
SELECT name
FROM world
WHERE name LIKE '%United%';

/*---------------------------------------------------------------------
|   7. Grandes por área (>3M) O población (>250M)                    |
---------------------------------------------------------------------*/
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

/*---------------------------------------------------------------------
|   8. Grandes por área O población, pero NO ambos (XOR)             |
---------------------------------------------------------------------*/
SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000;

/*---------------------------------------------------------------------
|   9. Redondeo a 2 decimales (Sudamérica)                           |
---------------------------------------------------------------------*/
SELECT name, 
       ROUND(population/1000000.0, 2) AS population_millions,
       ROUND(gdp/1000000000.0, 2) AS gdp_billions
FROM world
WHERE continent = 'South America';

/*---------------------------------------------------------------------
|   10. Países con GDP >= 1 trillion, per cápita redondeado a 1000   |
---------------------------------------------------------------------*/
SELECT name, ROUND(gdp/population, -3) AS per_capita_rounded
FROM world
WHERE gdp >= 1000000000000;

/*---------------------------------------------------------------------
|   11. Nombre y capital con igual longitud                           |
---------------------------------------------------------------------*/
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);

/*---------------------------------------------------------------------
|   12. Primera letra coincide, pero no son iguales                  |
---------------------------------------------------------------------*/
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
  AND name <> capital;

/*---------------------------------------------------------------------
|   13. Países con todas las vocales y sin espacios                  |
---------------------------------------------------------------------*/
SELECT name
FROM world
WHERE LOWER(name) LIKE '%a%'
  AND LOWER(name) LIKE '%e%'
  AND LOWER(name) LIKE '%i%'
  AND LOWER(name) LIKE '%o%'
  AND LOWER(name) LIKE '%u%'
  AND name NOT LIKE '% %';

/**********************************************************************
|                                                                     |
|   CONCEPTOS USADOS EN EL TUTORIAL                                   |
|                                                                     |
**********************************************************************/

/*
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║  1. FILTRADO BÁSICO                                                 ║
║     ├── WHERE population >= valor                                  ║
║     ├── WHERE continent = 'texto'                                  ║
║     └── WHERE name IN ('A', 'B', 'C')                              ║
║                                                                    ║
║  2. OPERACIONES ARITMÉTICAS                                         ║
║     ├── gdp/population (per cápita)                                ║
║     ├── population/1000000 (millones)                              ║
║     └── gdp/1000000000 (miles de millones)                         ║
║                                                                    ║
║  3. BÚSQUEDA DE PATRONES                                            ║
║     ├── LIKE '%United%' (contiene)                                 ║
║     ├── LIKE '%a%' AND ... (múltiples condiciones)                 ║
║     └── name NOT LIKE '% %' (sin espacios)                         ║
║                                                                    ║
║  4. FUNCIONES NUMÉRICAS                                             ║
║     ├── ROUND(valor, decimales)                                    ║
║     └── ROUND(valor, -3) (redondeo a miles)                        ║
║                                                                    ║
║  5. FUNCIONES DE TEXTO                                              ║
║     ├── LENGTH() - longitud del string                             ║
║     ├── LEFT(texto, 1) - primer carácter                           ║
║     └── LOWER() - convertir a minúsculas                           ║
║                                                                    ║
║  6. OPERADORES LÓGICOS                                              ║
║     ├── OR (o inclusivo)                                           ║
║     ├── XOR (o exclusivo, uno u otro pero no ambos)                ║
║     └── <> (diferente de)                                          ║
║                                                                    ║
║  7. ORDEN DE EJECUCIÓN                                              ║
║     1. FROM → 2. WHERE → 3. SELECT → 4. ORDER BY (si existe)      ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
*/
