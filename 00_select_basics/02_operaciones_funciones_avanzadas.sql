-- 📚 MANUAL SQL - Bryan Vargas
-- Tema: Operaciones aritméticas y funciones avanzadas
-- Carpeta: 01_basics/
-- Fecha: 19/02/2025

-- ========================================
-- OPERACIONES ARITMÉTICAS EN CONSULTAS
-- ========================================

-- Multiplicación, división, suma y resta directas en SELECT
SELECT name, 
       population, 
       gdp,
       gdp/population AS per_capita_gdp,           -- División
       population/1000000.0 AS population_millions, -- Cambio de unidades
       gdp/1000000000.0 AS gdp_billions,            -- Cambio de unidades
       area * 2 AS double_area,                     -- Multiplicación
       population + 1000000 AS more_people,         -- Suma
       population - 1000000 AS less_people           -- Resta
FROM world
WHERE continent = 'South America';

-- IMPORTANTE: Usar .0 (como 1000000.0) fuerza división decimal
-- Sin el .0, algunos sistemas hacen división entera y truncan decimales


-- ========================================
-- REDONDEO CON ROUND
-- ========================================

-- ROUND(valor, decimales)
-- Decimales positivos: redondea a la cantidad de decimales indicada
SELECT name, 
       ROUND(population/1000000.0, 2) AS two_decimals,  -- 2 decimales
       ROUND(population/1000000.0, 1) AS one_decimal,   -- 1 decimal
       ROUND(population/1000000.0, 0) AS zero_decimals   -- Sin decimales
FROM world
WHERE continent = 'South America';

-- ROUND con decimales negativos (redondea a potencias de 10)
-- -1: redondea a la decena más cercana
-- -2: redondea a la centena más cercana  
-- -3: redondea al millar más cercano
SELECT name, 
       gdp/population AS exact_value,
       ROUND(gdp/population, -1) AS nearest_10,    -- Decena más cercana
       ROUND(gdp/population, -2) AS nearest_100,   -- Centena más cercana
       ROUND(gdp/population, -3) AS nearest_1000    -- Millar más cercano
FROM world
WHERE gdp >= 1000000000000;

-- Ejemplos prácticos de ROUND con negativos:
-- ROUND(7253.86, -3) -> 7000  (redondea al millar)
-- ROUND(7253.86, -2) -> 7300  (redondea a la centena)
-- ROUND(7253.86, -1) -> 7250  (redondea a la decena)


-- ========================================
-- FUNCIONES DE TEXTO: LENGTH
-- ========================================

-- LENGTH() devuelve el número de caracteres de un string
SELECT name, 
       LENGTH(name) AS name_length,
       capital,
       LENGTH(capital) AS capital_length
FROM world
WHERE continent = 'Europe';

-- Comparar longitudes
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);  -- Misma cantidad de caracteres

-- Útil para filtrar por longitud
SELECT name FROM world
WHERE LENGTH(name) > 10;  -- Nombres largos


-- ========================================
-- FUNCIONES DE TEXTO: LEFT
-- ========================================

-- LEFT(texto, n) extrae los primeros n caracteres
SELECT name, 
       LEFT(name, 1) AS first_char,      -- Primera letra
       LEFT(name, 3) AS first_three       -- Primeras 3 letras
FROM world
WHERE continent = 'Europe';

-- Comparar primeras letras
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)    -- Misma primera letra
  AND name <> capital;                      -- Pero no son la misma palabra

-- También existe RIGHT() para los últimos caracteres
SELECT name, RIGHT(name, 1) AS last_char FROM world;


-- ========================================
-- FUNCIONES DE TEXTO: LOWER y UPPER
-- ========================================

-- LOWER() convierte a minúsculas
-- UPPER() convierte a mayúsculas
SELECT name, 
       LOWER(name) AS minusculas,
       UPPER(name) AS mayusculas
FROM world
WHERE continent = 'Europe';

-- Útil para búsquedas sin importar mayúsculas/minúsculas
SELECT name FROM world
WHERE LOWER(name) LIKE '%united%';  -- Encuentra United, UNITED, united, etc.


-- ========================================
-- OPERADOR XOR (OR EXCLUSIVO)
-- ========================================

-- XOR devuelve TRUE si UNA de las condiciones es verdadera, pero NO AMBAS
-- Es como "uno u otro, pero no los dos"

-- Ejemplo: países grandes por área (>3M) O por población (>250M), pero NO ambos
SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000;

-- Esto equivale a:
-- (area > 3000000 OR population > 250000000) 
-- AND NOT (area > 3000000 AND population > 250000000)


-- ========================================
-- OPERADOR <> (DIFERENTE DE)
-- ========================================

-- <> significa "diferente de" (también se puede usar !=)
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
  AND name <> capital;  -- El nombre NO es igual a la capital


-- ========================================
-- BÚSQUEDA DE MÚLTIPLES PATRONES CON LIKE
-- ========================================

-- Encontrar países que contengan TODAS las vocales
SELECT name
FROM world
WHERE LOWER(name) LIKE '%a%'   -- Contiene 'a'
  AND LOWER(name) LIKE '%e%'   -- Y contiene 'e'
  AND LOWER(name) LIKE '%i%'   -- Y contiene 'i'
  AND LOWER(name) LIKE '%o%'   -- Y contiene 'o'
  AND LOWER(name) LIKE '%u%'   -- Y contiene 'u'
  AND name NOT LIKE '% %';      -- Y no tiene espacios


-- ========================================
-- RESUMEN DE FUNCIONES NUEVAS
-- ========================================
-- 1. ROUND(valor, n)        : Redondea a n decimales (n negativo redondea a potencias de 10)
-- 2. LENGTH(texto)          : Número de caracteres
-- 3. LEFT(texto, n)         : Primeros n caracteres
-- 4. RIGHT(texto, n)        : Últimos n caracteres
-- 5. LOWER(texto)           : Convierte a minúsculas
-- 6. UPPER(texto)           : Convierte a mayúsculas
-- 7. XOR                    : Operador OR exclusivo
-- 8. <>                     : Operador "diferente de"
