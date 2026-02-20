-- 🧪 SQLZoo - Quiz 1: SELECT from WORLD
-- Fecha: 19/02/2025
-- Quiz resuelto (verificado 100% correcto - 7/7)

-- ========================================
-- QUIZ 1: SELECT FROM WORLD
-- ========================================

-- ----------------------------------------------------
-- Pregunta 1: Countries beginning with U
-- ----------------------------------------------------
-- Enunciado: Select the code which gives the name of countries beginning with U

-- Código correcto (opción E):
SELECT name
FROM world
WHERE name LIKE 'U%';


-- ----------------------------------------------------
-- Pregunta 2: Population of United Kingdom
-- ----------------------------------------------------
-- Enunciado: Select the code which shows just the population of United Kingdom

-- Código correcto (opción D):
SELECT population
FROM world
WHERE name = 'United Kingdom';


-- ----------------------------------------------------
-- Pregunta 3: Problem with SQL code
-- ----------------------------------------------------
-- Enunciado: Select the answer which shows the problem with this SQL code
--            (the intended result should be the continent of France):
--            SELECT continent 
--            FROM world 
--            WHERE 'name' = 'France'

-- Respuesta correcta (opción B):
-- "'name' should be name"
-- (Las columnas no deben ir entre comillas)


-- ----------------------------------------------------
-- Pregunta 4: Population divided by 10
-- ----------------------------------------------------
-- Enunciado: Select the result that would be obtained from:
--            SELECT name, population / 10 
--            FROM world 
--            WHERE population < 10000

-- Resultado correcto (opción Nauru 990):
-- Nauru	990
-- (Andorra tiene 64000, no cumple population < 10000)


-- ----------------------------------------------------
-- Pregunta 5: Countries in Europe and Asia
-- ----------------------------------------------------
-- Enunciado: Select the code which would reveal the name and population of countries in Europe and Asia

-- Código correcto (opción B):
SELECT name, population
FROM world
WHERE continent IN ('Europe', 'Asia');


-- ----------------------------------------------------
-- Pregunta 6: Two rows
-- ----------------------------------------------------
-- Enunciado: Select the code which would give two rows

-- Código correcto (opción D):
SELECT name FROM world
WHERE name IN ('Cuba', 'Togo');


-- ----------------------------------------------------
-- Pregunta 7: South America with population > 40M
-- ----------------------------------------------------
-- Enunciado: Select the result that would be obtained from:
--            SELECT name FROM world
--            WHERE continent = 'South America'
--            AND population > 40000000

-- Resultado correcto (opción: Brazil y Colombia):
-- Brazil
-- Colombia


-- ========================================
-- 💡 RESUMEN DE APRENDIZAJE
-- ========================================
-- 1. LIKE 'U%' → países que empiezan con U
-- 2. Las columnas NO van entre comillas en WHERE
-- 3. IN ('Europe', 'Asia') funciona para múltiples valores
-- 4. AND combina condiciones (continente Y población)
-- 5. population/10 es una operación aritmética válida
