-- 🧪 SQLZoo - Lección 0: SELECT basics
-- Fecha: 19/02/2025
-- Ejercicios resueltos (incluye práctica y quiz)

-- ========================================
-- PARTE 1: EJERCICIOS PRÁCTICOS
-- ========================================

-- ----------------------------------------------------
-- Ejercicio 1: Introducing the world table of countries
-- ----------------------------------------------------
-- Enunciado:
-- "The example uses a WHERE clause to show the population of 'France'.
-- Note that strings (pieces of text that are data) should be in 'single quotes';
-- Modify it to show the population of Germany"

SELECT population FROM world
WHERE name = 'Germany';
-- Resultado: 80716000


-- ----------------------------------------------------
-- Ejercicio 2: Scandinavia
-- ----------------------------------------------------
-- Enunciado:
-- "Checking a list The word IN allows us to check if an item is in a list.
-- The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.
-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'."

SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');
-- Resultado:
-- Denmark  5634437
-- Norway   5124383
-- Sweden   9675885


-- ----------------------------------------------------
-- Ejercicio 3: Just the right size
-- ----------------------------------------------------
-- Enunciado:
-- "Which countries are not too small and not too big? BETWEEN allows range checking
-- (range specified is inclusive of boundary values). The example below shows countries
-- with an area of 250,000-300,000 sq. km. Modify it to show the country and the area
-- for countries with an area between 200,000 and 250,000."

SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000;
-- Resultado: Belarus, Ghana, Guinea, Guyana, Laos, Romania, Uganda, United Kingdom


-- ========================================
-- PARTE 2: QUIZ - SELECT basics
-- ========================================
-- Cada respuesta fue verificada como correcta

-- ----------------------------------------------------
-- Pregunta 1: 
-- "Select the code which produces this table
-- name	    population
-- Bahrain	1234571
-- Swaziland	1220000
-- Timor-Leste 1066409"
-- ----------------------------------------------------
-- Código correcto (opción C):
SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000;


-- ----------------------------------------------------
-- Pregunta 2:
-- "Pick the result you would obtain from this code:
-- SELECT name, population
-- FROM world
-- WHERE name LIKE 'Al%'"
-- ----------------------------------------------------
-- Resultado correcto (opción E):
-- Albania   3200000
-- Algeria   32900000


-- ----------------------------------------------------
-- Pregunta 3:
-- "Select the code which shows the countries that end in A or L"
-- ----------------------------------------------------
-- Código correcto (opción E):
SELECT name FROM world
WHERE name LIKE '%a' OR name LIKE '%l';


-- ----------------------------------------------------
-- Pregunta 4:
-- "Pick the result from the query
-- SELECT name, length(name)
-- FROM world
-- WHERE length(name)=5 and region='Europe'"
-- ----------------------------------------------------
-- Resultado correcto (opción C):
-- Italy   5
-- Malta   5
-- Spain   5


-- ----------------------------------------------------
-- Pregunta 5:
-- "Pick the result you would obtain from this code:
-- SELECT name, area*2 FROM world WHERE population = 64000"
-- ----------------------------------------------------
-- Resultado correcto (opción C):
-- Andorra  936


-- ----------------------------------------------------
-- Pregunta 6:
-- "Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000"
-- ----------------------------------------------------
-- Código correcto (opción C):
SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000;


-- ----------------------------------------------------
-- Pregunta 7:
-- "Select the code that shows the population density of China, Australia, Nigeria and France"
-- ----------------------------------------------------
-- Código correcto (opción C):
SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia');


-- 💡 RESUMEN DE APRENDIZAJE DE LA LECCIÓN
-- ========================================
-- 1. WHERE filtra filas según una condición
-- 2. Las strings van entre comillas simples: 'Germany'
-- 3. IN permite buscar múltiples valores: IN ('A', 'B', 'C')
-- 4. BETWEEN incluye los límites (rango inclusive)
-- 5. LIKE para búsquedas con patrones:
--    - '%a'  = termina en a
--    - 'a%'  = empieza con a
--    - '%al%' = contiene "al"
-- 6. AND / OR para múltiples condiciones
-- 7. Operadores aritméticos: population/area (densidad)
-- 8. SELECT especifica las columnas a mostrar
-- 9. length() funciona en algunos sistemas para contar caracteres
