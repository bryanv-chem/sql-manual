-- 🧪 SQLZoo - Tutorial 0: SELECT basics
-- Fecha: 19/02/2025
-- Ejercicios resueltos del tutorial introductorio

-- ========================================
-- TUTORIAL 0: SELECT BASICS
-- ========================================

-- ----------------------------------------------------
-- Ejercicio 1: Introducing the world table of countries
-- ----------------------------------------------------
-- Enunciado:
-- "The example uses a WHERE clause to show the population of 'France'.
-- Modify it to show the population of Germany"

SELECT population FROM world
WHERE name = 'Germany';
-- Resultado: 80716000


-- ----------------------------------------------------
-- Ejercicio 2: Scandinavia
-- ----------------------------------------------------
-- Enunciado:
-- "Show the name and the population for 'Sweden', 'Norway' and 'Denmark'."

SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');
-- Resultado:
-- Denmark   5634437
-- Norway    5124383
-- Sweden    9675885


-- ----------------------------------------------------
-- Ejercicio 3: Just the right size
-- ----------------------------------------------------
-- Enunciado:
-- "Show the country and the area for countries with an area between 200,000 and 250,000."

SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000;
-- Resultado: Belarus, Ghana, Guinea, Guyana, Laos, Romania, Uganda, United Kingdom
