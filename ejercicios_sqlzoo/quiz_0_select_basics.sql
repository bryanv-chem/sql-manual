-- 🧪 SQLZoo - Quiz 0: SELECT basics
-- Fecha: 19/02/2025
-- Quiz resuelto (verificado 100% correcto)

-- ========================================
-- QUIZ: SELECT BASICS
-- ========================================

-- ----------------------------------------------------
-- Pregunta 1: Países con población entre 1M y 1.25M
-- ----------------------------------------------------
-- Enunciado:
-- "Select the code which produces this table
-- name	    population
-- Bahrain	1234571
-- Swaziland	1220000
-- Timor-Leste 1066409"

-- Código correcto (opción C):
SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000;


-- ----------------------------------------------------
-- Pregunta 2: Países que empiezan con "Al"
-- ----------------------------------------------------
-- Enunciado:
-- "Pick the result you would obtain from this code:
-- SELECT name, population
-- FROM world
-- WHERE name LIKE 'Al%'"

-- Resultado correcto (opción E):
-- Albania   3200000
-- Algeria   32900000


-- ----------------------------------------------------
-- Pregunta 3: Países que terminan en A o L
-- ----------------------------------------------------
-- Enunciado:
-- "Select the code which shows the countries that end in A or L"

-- Código correcto (opción E):
SELECT name FROM world
WHERE name LIKE '%a' OR name LIKE '%l';


-- ----------------------------------------------------
-- Pregunta 4: Países de Europa con nombre de 5 letras
-- ----------------------------------------------------
-- Enunciado:
-- "Pick the result from the query
-- SELECT name, length(name)
-- FROM world
-- WHERE length(name)=5 and region='Europe'"

-- Resultado correcto (opción C):
-- Italy   5
-- Malta   5
-- Spain   5


-- ----------------------------------------------------
-- Pregunta 5: Área multiplicada por 2 (población = 64000)
-- ----------------------------------------------------
-- Enunciado:
-- "Pick the result you would obtain from this code:
-- SELECT name, area*2 FROM world WHERE population = 64000"

-- Resultado correcto (opción C):
-- Andorra  936


-- ----------------------------------------------------
-- Pregunta 6: Área > 50000 Y población < 10M
-- ----------------------------------------------------
-- Enunciado:
-- "Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000"

-- Código correcto (opción C):
SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000;


-- ----------------------------------------------------
-- Pregunta 7: Densidad de población (China, Australia, Nigeria, Francia)
-- ----------------------------------------------------
-- Enunciado:
-- "Select the code that shows the population density of China, Australia, Nigeria and France"

-- Código correcto (opción C):
SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia');
