-- 📚 MANUAL SQL - Bryan Vargas
-- Tema: 04 - Ordenamiento avanzado y manejo de strings especiales
-- Carpeta: 01_basics/
-- Fecha: 19/02/2025

-- ========================================
-- ORDENAMIENTO AVANZADO CON ORDER BY
-- ========================================

-- Ordenar por múltiples columnas
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner ASC;
-- Primero ordena por año (más reciente primero)
-- Luego por nombre (alfabético) dentro del mismo año

-- ========================================
-- ORDENAR POR EXPRESIONES BOOLEANAS
-- ========================================

-- En SQL, una condición booleana devuelve 1 (verdadero) o 0 (falso)
-- Podemos ordenar por ese valor

SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY subject IN ('chemistry', 'physics'), subject;
-- Las filas con subject IN (...) devuelven 1 (van al final)
-- Las filas con subject NOT IN (...) devuelven 0 (van al inicio)
-- Luego ordena alfabéticamente por subject

-- ========================================
-- ESCAPAR CARACTERES ESPECIALES
-- ========================================

-- Para incluir una comilla simple en un string, usa dos comillas simples
SELECT * FROM nobel
WHERE winner = 'Eugene O''Neill';
-- Se lee como: Eugene O'Neill

-- Para caracteres no ASCII (como ü, ñ, é), escríbelos directamente
SELECT * FROM nobel
WHERE winner = 'Peter Grünberg';
-- La base de datos debe soportar UTF-8

-- ========================================
-- NOT IN PARA EXCLUIR MÚLTIPLES VALORES
-- ========================================

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980
  AND subject NOT IN ('chemistry', 'medicine');
-- Más limpio que: subject <> 'chemistry' AND subject <> 'medicine'

-- ========================================
-- USO DE PARÉNTESIS EN CONDICIONES COMPLEJAS
-- ========================================

-- Cuando mezclas AND y OR, usa paréntesis para claridad
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'medicine' AND yr < 1910)
   OR (subject = 'literature' AND yr >= 2004);
-- Los paréntesis hacen obvio qué condiciones se agrupan

-- ========================================
-- LIKE CON PATRONES SIMPLES
-- ========================================

SELECT winner FROM nobel
WHERE winner LIKE 'John%';
-- Todos los que empiezan con 'John'

SELECT winner FROM nobel
WHERE winner LIKE '%Einstein';
-- Todos los que terminan con 'Einstein'

SELECT winner FROM nobel
WHERE winner LIKE '%Grünberg%';
-- Contiene 'Grünberg' en cualquier parte
