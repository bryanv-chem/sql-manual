-- 🧪 SQLZoo - Tutorial 4: SELECT within SELECT
-- Fecha: 20/02/2025
-- Ejercicios resueltos (subconsultas)

-- ========================================
-- TUTORIAL 4: SUBCONSULTAS
-- ========================================

-- ----------------------------------------------------
-- Ejercicio 1: Bigger than Russia
-- ----------------------------------------------------
-- List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Russia');


-- ----------------------------------------------------
-- Ejercicio 2: Richer than UK
-- ----------------------------------------------------
-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name FROM world
WHERE gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom')
  AND continent = 'Europe';


-- ----------------------------------------------------
-- Ejercicio 3: Neighbours of Argentina and Australia
-- ----------------------------------------------------
-- List the name and continent of countries in the continents containing 
-- either Argentina or Australia. Order by name.
SELECT name, continent FROM world
WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina')
   OR continent = (SELECT continent FROM world WHERE name = 'Australia')
ORDER BY name;


-- ----------------------------------------------------
-- Ejercicio 4: Between Canada and Poland
-- ----------------------------------------------------
-- Which country has a population that is more than United Kingdom but less than Germany?
SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom')
  AND population < (SELECT population FROM world WHERE name = 'Germany');


-- ----------------------------------------------------
-- Ejercicio 5: Percentages of Germany
-- ----------------------------------------------------
-- Show the name and the population of each country in Europe.
-- Show the population as a percentage of the population of Germany.
SELECT name, 
       CONCAT(ROUND(population * 100 / 
             (SELECT population FROM world WHERE name = 'Germany'), 0), '%') AS percentage
FROM world
WHERE continent = 'Europe';


-- ----------------------------------------------------
-- Ejercicio 6: Bigger than every country in Europe
-- ----------------------------------------------------
-- Which countries have a GDP greater than every country in Europe?
SELECT name
FROM world
WHERE gdp > ALL (SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0);


-- ----------------------------------------------------
-- Ejercicio 7: Largest in each continent
-- ----------------------------------------------------
-- Find the largest country (by area) in each continent.
-- (Correlated subquery - usando alias x e y)
SELECT continent, name, area 
FROM world x
WHERE area >= ALL (SELECT area FROM world y 
                   WHERE y.continent = x.continent AND area > 0);


-- ----------------------------------------------------
-- Ejercicio 8: First country of each continent (alphabetically)
-- ----------------------------------------------------
-- List each continent and the name of the country that comes first alphabetically.
SELECT continent, name
FROM world x
WHERE name = (SELECT MIN(name) FROM world y WHERE y.continent = x.continent);


-- ----------------------------------------------------
-- Ejercicio 9: Difficult Questions
-- ----------------------------------------------------
-- Find the continents where all countries have a population <= 25000000.
-- Then find the names of the countries associated with these continents.
SELECT name, continent, population 
FROM world
WHERE continent NOT IN (SELECT DISTINCT continent 
                        FROM world 
                        WHERE population > 25000000);


-- ----------------------------------------------------
-- Ejercicio 10: Three times bigger
-- ----------------------------------------------------
-- Some countries have populations more than three times that of all their neighbours
-- (in the same continent). Give the countries and continents.
SELECT name, continent 
FROM world x
WHERE population > ALL (SELECT population * 3 
                        FROM world y 
                        WHERE y.continent = x.continent 
                          AND y.name <> x.name
                          AND population > 0);


-- ========================================
-- 💡 CONCEPTOS NUEVOS APRENDIDOS
-- ========================================

-- 1. SUBCONSULTAS ESCALARES (devuelven un solo valor)
--    ------------------------------------------------
--    La subconsulta se ejecuta primero y su resultado se usa en la consulta principal.
--    Ejemplo del Ejercicio 1:
--    SELECT population FROM world WHERE name = 'Russia'  → devuelve 144 millones
--    Luego: WHERE population > 144000000


-- 2. SUBCONSULTAS EN LA MISMA TABLA
--    ---------------------------------
--    Puedes usar múltiples subconsultas en la misma consulta.
--    Ejemplo del Ejercicio 4:
--    WHERE population > (subconsulta UK) AND population < (subconsulta Germany)


-- 3. SUBCONSULTAS CON ALL
--    --------------------
--    ALL compara contra TODOS los valores de la subconsulta.
--    Ejercicio 6: gdp > ALL (SELECT gdp FROM Europe)
--    Significa: más grande que el país con el GDP más alto de Europa.
--    
--    Diferencia:
--    - > ALL  = más grande que el más grande
--    - > (sin ALL) = más grande que cualquiera (pero no necesariamente todos)


-- 4. SUBCONSULTAS CORRELACIONADAS
--    ----------------------------
--    Usan alias (x, y) para referenciar la misma tabla.
--    La subconsulta se ejecuta para CADA fila de la consulta externa.
--    
--    Ejercicio 7: 
--    SELECT ... FROM world x   (alias x para la tabla externa)
--    WHERE area >= ALL (SELECT area FROM world y WHERE y.continent = x.continent)
--    
--    Funciona como un bucle:
--    Para cada país x, busca en la tabla y (con el mismo continente) el área máxima
--    y compara si x.area es mayor o igual a ese máximo.


-- 5. SUBCONSULTAS CON FUNCIONES DE AGREGACIÓN
--    ----------------------------------------
--    Ejercicio 8: SELECT MIN(name) encuentra el nombre alfabéticamente menor.
--    Combinado con subconsulta correlacionada da el primer país de cada continente.


-- 6. SUBCONSULTAS CON NOT IN
--    -----------------------
--    Ejercicio 9: 
--    Primero encuentra continentes con población > 25M
--    Luego selecciona países cuyo continente NO está en esa lista
--    Esto equivale a "continentes donde TODOS los países tienen población <= 25M"


-- 7. SUBCONSULTAS CON OPERACIONES ARITMÉTICAS
--    ----------------------------------------
--    Ejercicio 10: population * 3 dentro de la subconsulta
--    Compara la población de cada país con el triple de la población de sus vecinos


-- ========================================
-- 📝 NOTAS IMPORTANTES PARA RECORDAR
-- ========================================
-- 1. Las subconsultas SIEMPRE van entre paréntesis ( )
-- 2. Las subconsultas escalares deben devolver UNA sola fila y UNA sola columna
-- 3. Las subconsultas correlacionadas usan alias para diferenciar la misma tabla
-- 4. ALL requiere que TODOS los valores cumplan la condición
-- 5. ANY (no visto aquí) requiere que AL MENOS UNO cumpla la condición
-- 6. Las subconsultas pueden usarse en:
--    - WHERE  (para filtrar)
--    - SELECT (para calcular columnas)
--    - FROM   (como tabla temporal)
--    - HAVING (para filtrar grupos)
-- 7. Los alias (x, y) son obligatorios en subconsultas correlacionadas
