-- 🧪 SQLZoo - Tutorial 1: SELECT from WORLD
-- Fecha: 19/02/2025
-- Ejercicios resueltos del tutorial

-- ========================================
-- TUTORIAL 1: SELECT from WORLD
-- ========================================

-- ----------------------------------------------------
-- Ejercicio 1: Introduction
-- ----------------------------------------------------
-- Enunciado: Show the name, continent and population of all countries.
SELECT name, continent, population FROM world;


-- ----------------------------------------------------
-- Ejercicio 2: Large Countries
-- ----------------------------------------------------
-- Enunciado: Show the name for the countries that have a population of at least 200 million.
SELECT name FROM world
WHERE population >= 200000000;


-- ----------------------------------------------------
-- Ejercicio 3: Per capita GDP
-- ----------------------------------------------------
-- Enunciado: Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp/population FROM world
WHERE population >= 200000000;


-- ----------------------------------------------------
-- Ejercicio 4: South America In millions
-- ----------------------------------------------------
-- Enunciado: Show the name and population in millions for the countries of the continent 'South America'.
SELECT name, population/1000000 FROM world
WHERE continent = 'South America';


-- ----------------------------------------------------
-- Ejercicio 5: France, Germany, Italy
-- ----------------------------------------------------
-- Enunciado: Show the name and population for France, Germany, Italy.
SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy');


-- ----------------------------------------------------
-- Ejercicio 6: United
-- ----------------------------------------------------
-- Enunciado: Show the countries which have a name that includes the word 'United'.
SELECT name FROM world
WHERE name LIKE '%United%';


-- ----------------------------------------------------
-- Ejercicio 7: Two ways to be big
-- ----------------------------------------------------
-- Enunciado: Show the countries that are big by area (more than 3 million sq km) 
--            or big by population (more than 250 million). Show name, population and area.
SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000;


-- ----------------------------------------------------
-- Ejercicio 8: One or the other (but not both)
-- ----------------------------------------------------
-- Enunciado: Show the countries that are big by area (more than 3 million) 
--            or big by population (more than 250 million) but not both.
--            (Exclusive OR - XOR)
SELECT name, population, area FROM world
WHERE area > 3000000 XOR population > 250000000;


-- ----------------------------------------------------
-- Ejercicio 9: Rounding
-- ----------------------------------------------------
-- Enunciado: Show the name and population in millions and the GDP in billions 
--            for the countries of the continent 'South America'. 
--            Use the ROUND function to show the values to two decimal places.
SELECT name, 
       ROUND(population/1000000.0, 2) AS population_millions,
       ROUND(gdp/1000000000.0, 2) AS gdp_billions
FROM world
WHERE continent = 'South America';


-- ----------------------------------------------------
-- Ejercicio 10: Trillion dollar economies
-- ----------------------------------------------------
-- Enunciado: Show the name and per-capita GDP for those countries with a GDP of at least one trillion.
--            Round this value to the nearest 1000.
SELECT name, ROUND(gdp/population, -3) AS per_capita_gdp
FROM world
WHERE gdp >= 1000000000000;


-- ----------------------------------------------------
-- Ejercicio 11: Name and capital have the same length
-- ----------------------------------------------------
-- Enunciado: Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);


-- ----------------------------------------------------
-- Ejercicio 12: Matching name and capital
-- ----------------------------------------------------
-- Enunciado: Show the name and the capital where the first letters of each match.
--            Don't include countries where the name and the capital are the same word.
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) 
  AND name <> capital;


-- ----------------------------------------------------
-- Ejercicio 13: All the vowels
-- ----------------------------------------------------
-- Enunciado: Find the country that has all the vowels (a e i o u) and no spaces in its name.
SELECT name
FROM world
WHERE LOWER(name) LIKE '%a%' 
  AND LOWER(name) LIKE '%e%' 
  AND LOWER(name) LIKE '%i%'
  AND LOWER(name) LIKE '%o%' 
  AND LOWER(name) LIKE '%u%' 
  AND name NOT LIKE '% %';
-- Resultado: Mozambique


-- ========================================
-- 💡 CONCEPTOS NUEVOS APRENDIDOS
-- ========================================
-- 1. Operaciones aritméticas en SELECT: gdp/population (per cápita)
-- 2. Divisiones para cambiar unidades: /1000000 (millones), /1000000000 (miles de millones)
-- 3. ROUND con decimales positivos: ROUND(valor, 2) para 2 decimales
-- 4. ROUND con decimales negativos: ROUND(valor, -3) para redondear a miles
-- 5. Uso de .0 en divisiones para evitar división entera: /1000000.0
-- 6. Función LENGTH() para contar caracteres
-- 7. Función LEFT() para extraer primeros caracteres
-- 8. Operador XOR (OR exclusivo) para condiciones que se excluyen mutuamente
-- 9. Operador <> para "diferente de"
-- 10. LOWER() para convertir a minúsculas y facilitar búsquedas
