/**********************************************************************
|                                                                     |
|   TUTORIAL 5: SUM and COUNT (SQLZoo)                               |
|                                                                     |
|   Bryan Vargas - Químico Industrial en transición a Data Analyst   |
|   Fecha: Marzo 2026                                                 |
|                                                                     |
|   Objetivo: Aplicar funciones de agregación y agrupamiento         |
|   Tabla: world(name, continent, area, population, gdp)             |
|                                                                     |
**********************************************************************/

/*---------------------------------------------------------------------
|   PARTE 1: AGREGADOS BÁSICOS (sin GROUP BY)                        |
---------------------------------------------------------------------*/

-- 1. Población total del mundo
SELECT SUM(population) AS total_population
FROM world;

-- 2. Lista de continentes (sin duplicados)
SELECT DISTINCT continent
FROM world
ORDER BY continent;

-- 3. GDP total de África
SELECT SUM(gdp) AS total_gdp_africa
FROM world
WHERE continent = 'Africa';

-- 4. Países con área >= 1,000,000
SELECT COUNT(name) AS big_countries
FROM world
WHERE area >= 1000000;

-- 5. Población total de países bálticos
SELECT SUM(population) AS baltic_population
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

/*---------------------------------------------------------------------
|   PARTE 2: GROUP BY - Agrupamiento por continente                  |
---------------------------------------------------------------------*/

-- 6. Número de países por continente
SELECT continent, COUNT(name) AS num_countries
FROM world
GROUP BY continent
ORDER BY num_countries DESC;

-- 7. Población total por continente
SELECT continent, SUM(population) AS total_pop
FROM world
GROUP BY continent
ORDER BY total_pop DESC;

-- 8. WHERE vs GROUP BY: países con población > 200M (agrupados)
SELECT continent, COUNT(name) AS big_countries
FROM world
WHERE population > 200000000
GROUP BY continent;

/*---------------------------------------------------------------------
|   PARTE 3: HAVING - Filtrar después de agrupar                     |
---------------------------------------------------------------------*/

-- 9. Continentes con población total >= 500M
SELECT continent, SUM(population) AS total_pop
FROM world
GROUP BY continent
HAVING SUM(population) > 500000000
ORDER BY total_pop DESC;

-- 10. Número de países por continente (versión redundante del 6)
SELECT continent, COUNT(name) AS num_countries
FROM world
GROUP BY continent;

-- 11. Continentes con países >= 10M de población
SELECT continent, COUNT(name) AS countries_over_10M
FROM world
WHERE population >= 10000000
GROUP BY continent
ORDER BY countries_over_10M DESC;

-- 12. Continentes con población total >= 100M (usando subconsulta)
SELECT continent
FROM world x
WHERE (SELECT SUM(population) 
       FROM world y 
       WHERE y.continent = x.continent) >= 100000000
GROUP BY continent;

/*---------------------------------------------------------------------
|   CONCEPTOS CLAVE APLICADOS                                        |
---------------------------------------------------------------------*/
/*
╔══════════════════════════════════════════════════════════════════╗
║                                                                  ║
║  SUM()      - Suma valores numéricos                             ║
║  COUNT()    - Cuenta filas                                       ║
║  DISTINCT   - Elimina duplicados                                 ║
║  GROUP BY   - Agrupa filas con valores comunes                   ║
║  HAVING     - Filtra grupos (después de GROUP BY)                ║
║  WHERE      - Filtra filas (antes de GROUP BY)                   ║
║  ORDER BY   - Ordena resultados                                  ║
║                                                                  ║
║  ORDEN DE EJECUCIÓN:                                             ║
║  1. FROM → 2. WHERE → 3. GROUP BY → 4. HAVING → 5. SELECT → 6. ORDER BY
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝
*/
