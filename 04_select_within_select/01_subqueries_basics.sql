-- 📚 MANUAL SQL - Bryan Vargas
-- Tema: 05 - Subconsultas (SELECT within SELECT)
-- Carpeta: 01_basics/
-- Fecha: 20/02/2025

-- ========================================
-- SUBCONSULTAS ESCALARES (devuelven un solo valor)
-- ========================================

-- Ejemplo: Países más poblados que Rusia
SELECT name FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Russia');

-- La subconsulta (SELECT population FROM world WHERE name = 'Russia')
-- devuelve un solo número (aprox 144 millones)


-- ========================================
-- SUBCONSULTAS EN LA MISMA TABLA
-- ========================================

-- Comparar con múltiples valores usando AND/OR
SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom')
  AND population < (SELECT population FROM world WHERE name = 'Germany');


-- ========================================
-- SUBCONSULTAS CON ALL
-- ========================================

-- ALL compara contra TODOS los valores de la subconsulta
-- GDP mayor que TODOS los países de Europa
SELECT name FROM world
WHERE gdp > ALL (SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0);

-- Esto es diferente a usar > sin ALL:
-- > ALL = más grande que el más grande
-- > (sin ALL) = más grande que cualquiera (pero no necesariamente todos)


-- ========================================
-- SUBCONSULTAS CORRELACIONADAS
-- ========================================

-- Usan alias (x, y) para referenciar la misma tabla
-- La subconsulta se ejecuta para CADA fila de la consulta externa

-- Encontrar el país más grande de cada continente
SELECT continent, name, area 
FROM world x
WHERE area >= ALL (SELECT area FROM world y 
                   WHERE y.continent = x.continent AND area > 0);
-- Para cada continente, busca el área máxima y la compara


-- ========================================
-- SUBCONSULTAS CON FUNCIONES DE AGREGACIÓN
-- ========================================

-- Encontrar el primer país alfabéticamente de cada continente
SELECT continent, name
FROM world x
WHERE name = (SELECT MIN(name) FROM world y WHERE y.continent = x.continent);
-- MIN(name) da el nombre alfabéticamente menor


-- ========================================
-- SUBCONSULTAS CON NOT IN
-- ========================================

-- Encontrar continentes donde TODOS los países tienen población <= 25M
SELECT name, continent, population 
FROM world
WHERE continent NOT IN (SELECT DISTINCT continent 
                        FROM world 
                        WHERE population > 25000000);
-- Primero encuentra continentes con algún país > 25M
-- Luego selecciona los que NO están en esa lista


-- ========================================
-- SUBCONSULTAS CON OPERACIONES ARITMÉTICAS
-- ========================================

-- Países con población 3 veces mayor que todos sus vecinos
SELECT name, continent 
FROM world x
WHERE population > ALL (SELECT population * 3 
                        FROM world y 
                        WHERE y.continent = x.continent 
                          AND y.name <> x.name
                          AND population > 0);
-- Multiplica la población de cada vecino por 3 y compara


-- ========================================
-- NOTAS IMPORTANTES
-- ========================================
-- 1. Las subconsultas deben ir entre paréntesis
-- 2. Las subconsultas escalares deben devolver UNA sola fila y UNA sola columna
-- 3. Las subconsultas correlacionadas usan alias para diferenciar la misma tabla
-- 4. ALL requiere que TODOS los valores cumplan la condición
-- 5. ANY (no visto aquí) requiere que AL MENOS UNO cumpla la condición
-- 6. Las subconsultas pueden usarse en SELECT, FROM, WHERE, HAVING
