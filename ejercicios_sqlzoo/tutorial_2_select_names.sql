-- 🧪 SQLZoo - Tutorial 2: SELECT names
-- Fecha: 19/02/2025
-- Ejercicios resueltos (Pattern Matching)

-- ========================================
-- TUTORIAL 2: SELECT NAMES (LIKE y funciones de texto)
-- ========================================

-- ----------------------------------------------------
-- Ejercicio 1: Countries that start with Y
-- ----------------------------------------------------
SELECT name FROM world
WHERE name LIKE 'Y%';


-- ----------------------------------------------------
-- Ejercicio 2: Countries that end with y
-- ----------------------------------------------------
SELECT name FROM world
WHERE name LIKE '%y';


-- ----------------------------------------------------
-- Ejercicio 3: Countries that contain the letter x
-- ----------------------------------------------------
SELECT name FROM world
WHERE name LIKE '%x%';


-- ----------------------------------------------------
-- Ejercicio 4: Countries that end with land
-- ----------------------------------------------------
SELECT name FROM world
WHERE name LIKE '%land';


-- ----------------------------------------------------
-- Ejercicio 5: Countries that start with C and end with ia
-- ----------------------------------------------------
SELECT name FROM world
WHERE name LIKE 'C%' AND name LIKE '%ia';


-- ----------------------------------------------------
-- Ejercicio 6: Countries that have 'oo' in the name
-- ----------------------------------------------------
SELECT name FROM world
WHERE name LIKE '%oo%';


-- ----------------------------------------------------
-- Ejercicio 7: Countries that have three or more 'a'
-- ----------------------------------------------------
SELECT name FROM world
WHERE name LIKE '%a%a%a%';


-- ----------------------------------------------------
-- Ejercicio 8: Countries that have 't' as the second character
-- ----------------------------------------------------
SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name;


-- ----------------------------------------------------
-- Ejercicio 9: Countries with two 'o' separated by two others
-- ----------------------------------------------------
SELECT name FROM world
WHERE name LIKE '%o__o%';


-- ----------------------------------------------------
-- Ejercicio 10: Countries with exactly four characters
-- ----------------------------------------------------
SELECT name FROM world
WHERE name LIKE '____';


-- ========================================
-- PARTE 2: HARDER QUESTIONS (Opcionales)
-- ========================================

-- ----------------------------------------------------
-- Ejercicio 11: Country where name equals capital
-- ----------------------------------------------------
SELECT name
FROM world
WHERE name = capital;


-- ----------------------------------------------------
-- Ejercicio 12: Country where capital = name + ' City'
-- ----------------------------------------------------
SELECT name
FROM world
WHERE capital = concat(name, ' City');


-- ----------------------------------------------------
-- Ejercicio 13: Capital includes the name of the country
-- ----------------------------------------------------
SELECT capital, name
FROM world
WHERE capital LIKE concat('%', name, '%');


-- ----------------------------------------------------
-- Ejercicio 14: Capital is an extension of name (longer)
-- ----------------------------------------------------
SELECT capital, name
FROM world
WHERE capital LIKE concat(name, '%')
  AND capital NOT LIKE name;


-- ----------------------------------------------------
-- Ejercicio 15: Extension of name (usando REPLACE)
-- ----------------------------------------------------
SELECT name, 
       REPLACE(capital, name, '') AS extension
FROM world
WHERE capital LIKE concat(name, '_%');
