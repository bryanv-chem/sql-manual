-- 🧪 SQLZoo - Tutorial 3: SELECT from Nobel
-- Fecha: 19/02/2025
-- Ejercicios resueltos

-- ========================================
-- TUTORIAL 3: SELECT FROM NOBEL
-- ========================================

-- ----------------------------------------------------
-- Ejercicio 1: Winners from 1950
-- ----------------------------------------------------
-- Display Nobel prizes for 1950
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;


-- ----------------------------------------------------
-- Ejercicio 2: 1962 Literature
-- ----------------------------------------------------
-- Show who won the 1962 prize for literature
SELECT winner
FROM nobel
WHERE yr = 1962
  AND subject = 'literature';


-- ----------------------------------------------------
-- Ejercicio 3: Albert Einstein
-- ----------------------------------------------------
-- Show the year and subject that won 'Albert Einstein' his prize
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';


-- ----------------------------------------------------
-- Ejercicio 4: Recent Peace Prizes
-- ----------------------------------------------------
-- Give the name of the 'Peace' winners since the year 2000, including 2000
SELECT winner
FROM nobel
WHERE subject = 'Peace'
  AND yr >= 2000;


-- ----------------------------------------------------
-- Ejercicio 5: Literature in the 1980's
-- ----------------------------------------------------
-- Show all details of the literature prize winners for 1980 to 1989 inclusive
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'literature'
  AND yr >= 1980
  AND yr <= 1989;


-- ----------------------------------------------------
-- Ejercicio 6: Only Presidents
-- ----------------------------------------------------
-- Show all details of the presidential winners
SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt', 
                 'Thomas Woodrow Wilson', 
                 'Jimmy Carter', 
                 'Barack Obama');


-- ----------------------------------------------------
-- Ejercicio 7: John
-- ----------------------------------------------------
-- Show the winners with first name John
SELECT winner
FROM nobel
WHERE winner LIKE 'John%';


-- ----------------------------------------------------
-- Ejercicio 8: Chemistry and Physics from different years
-- ----------------------------------------------------
-- Show physics winners for 1980 together with chemistry winners for 1984
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'physics' AND yr = 1980)
   OR (subject = 'chemistry' AND yr = 1984);


-- ----------------------------------------------------
-- Ejercicio 9: Exclude Chemists and Medics
-- ----------------------------------------------------
-- Show winners for 1980 excluding chemistry and medicine
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980
  AND subject NOT IN ('chemistry', 'medicine');


-- ----------------------------------------------------
-- Ejercicio 10: Early Medicine, Late Literature
-- ----------------------------------------------------
-- Show Medicine winners before 1910 together with Literature winners from 2004 onwards
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'medicine' AND yr < 1910)
   OR (subject = 'literature' AND yr >= 2004);


-- ========================================
-- HARDER QUESTIONS
-- ========================================

-- ----------------------------------------------------
-- Ejercicio 11: Umlaut
-- ----------------------------------------------------
-- Find all details of the prize won by PETER GRÜNBERG
SELECT *
FROM nobel
WHERE winner = 'Peter Grünberg';


-- ----------------------------------------------------
-- Ejercicio 12: Apostrophe
-- ----------------------------------------------------
-- Find all details of the prize won by EUGENE O'NEILL
-- (Escaping single quotes with two single quotes)
SELECT *
FROM nobel
WHERE winner = 'Eugene O''Neill';


-- ----------------------------------------------------
-- Ejercicio 13: Knights of the realm
-- ----------------------------------------------------
-- List winners starting with 'Sir', most recent first, then by name order
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner ASC;


-- ----------------------------------------------------
-- Ejercicio 14: Chemistry and Physics last
-- ----------------------------------------------------
-- Show 1984 winners ordered by subject and winner name,
-- but with chemistry and physics listed last
SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY subject IN ('chemistry', 'physics'), subject, winner;


-- ========================================
-- 💡 CONCEPTOS NUEVOS APRENDIDOS
-- ========================================
-- 1. Combinar condiciones con AND / OR usando paréntesis para claridad
-- 2. NOT IN para excluir múltiples valores
-- 3. ORDER BY con expresión booleana (subject IN ('chemistry','physics') da 1 o 0)
-- 4. Escapar comillas simples: O''Neill (dos comillas simples)
-- 5. ORDER BY múltiples columnas: yr DESC, winner ASC
-- 6. LIKE con patrones simples: 'John%', 'Sir%'
