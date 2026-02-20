-- 🧪 SQLZoo - Quiz 4: Nested SELECT
-- Fecha: 20/02/2025
-- Quiz resuelto (6/7) - VERSIÓN CORREGIDA

-- ========================================
-- QUIZ 4: SUBCONSULTAS ANIDADAS
-- ========================================

-- ----------------------------------------------------
-- Pregunta 1: Smallest country in each region
-- ----------------------------------------------------
-- Enunciado: Select the code that shows the name, region and population 
-- of the smallest country in each region

-- Código correcto (opción C):
SELECT region, name, population 
FROM bbc x 
WHERE population <= ALL (SELECT population 
                         FROM bbc y 
                         WHERE y.region = x.region AND population > 0);


-- ----------------------------------------------------
-- Pregunta 2: Regions with all populations over 50000
-- ----------------------------------------------------
-- Enunciado: Select the code that shows the countries belonging to regions 
-- with all populations over 50000

-- Código correcto (opción B):
SELECT name, region, population 
FROM bbc x 
WHERE 50000 < ALL (SELECT population 
                   FROM bbc y 
                   WHERE x.region = y.region AND y.population > 0);


-- ----------------------------------------------------
-- Pregunta 3: Less than a third of neighbours
-- ----------------------------------------------------
-- Enunciado: Select the code that shows the countries with a less than 
-- a third of the population of the countries around it

-- Código correcto (opción A):
SELECT name, region 
FROM bbc x
WHERE population < ALL (SELECT population/3 
                        FROM bbc y 
                        WHERE y.region = x.region AND y.name != x.name);


-- ----------------------------------------------------
-- Pregunta 4: Result from code with population > UK and region = UK
-- ----------------------------------------------------
-- Enunciado: Select the result that would be obtained from the given code
-- 
-- El código busca países con:
-- 1. Población mayor que UK
-- 2. Región igual a la de UK (Europe)

-- Resultado correcto (opción C: France, Germany)
-- Table-C: France, Germany


-- ----------------------------------------------------
-- Pregunta 5: Greater GDP than any country in Africa
-- ----------------------------------------------------
-- Enunciado: Select the code that would show the countries with a greater GDP 
-- than any country in Africa (some countries may have NULL gdp values).

-- ⚠️ RESPUESTA CORRECTA (opción B):
SELECT name FROM bbc
WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa');

-- 📝 EXPLICACIÓN DE POR QUÉ ESTA ES LA CORRECTA:
-- 
-- La pregunta pide: "greater GDP than any country in Africa"
-- 
-- Esto se puede interpretar de DOS formas:
--
-- 1. Usando ALL:  gdp > ALL (SELECT gdp FROM bbc WHERE region = 'Africa')
--    ✅ Esto funciona, pero NO es una opción disponible en el quiz.
--
-- 2. Usando MAX:  gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')
--    ✅ Esta SÍ es una opción (opción B) y es equivalente a la anterior.
--    Porque si el GDP es mayor que el GDP máximo de África, entonces
--    automáticamente es mayor que TODOS los GDP de África.
--
-- ❌ Opción D (gdp > ALL SELECT) no estaba disponible en el quiz.
-- ❌ Opción E falla por el manejo incorrecto de NULL (gdp<>NULL no funciona).


-- ----------------------------------------------------
-- Pregunta 6: Population smaller than Russia but bigger than Denmark
-- ----------------------------------------------------
-- Enunciado: Select the code that shows the countries with population 
-- smaller than Russia but bigger than Denmark

-- Código correcto (opción B):
SELECT name FROM bbc
WHERE population < (SELECT population FROM bbc WHERE name = 'Russia')
  AND population > (SELECT population FROM bbc WHERE name = 'Denmark');


-- ----------------------------------------------------
-- Pregunta 7: Population > ALL Europe MAX in South Asia
-- ----------------------------------------------------
-- Enunciado: Select the result from the code that finds countries in South Asia
-- with population greater than the maximum population in Europe

-- Resultado correcto (opción B: Bangladesh, India, Pakistan)
-- Table-B: Bangladesh, India, Pakistan


-- ========================================
-- 💡 RESUMEN DE APRENDIZAJE
-- ========================================

-- 1. EQUIVALENCIAS ÚTILES:
--    gdp > ALL (SELECT gdp FROM table WHERE condition)
--    ES EQUIVALENTE A:
--    gdp > (SELECT MAX(gdp) FROM table WHERE condition)
--
-- 2. gdp > ANY (SELECT gdp ...)
--    ES EQUIVALENTE A:
--    gdp > (SELECT MIN(gdp) ...)
--
-- 3. TRUCO PARA EL QUIZ:
--    Cuando NO veas una opción con ALL, busca la opción con MAX o MIN
--    que sea lógicamente equivalente.
--
-- 4. NULL nunca se compara con =, <>, >, <.
--    Siempre usa IS NULL o IS NOT NULL.
