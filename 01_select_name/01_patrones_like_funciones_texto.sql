

-- ========================================
-- PATRONES CON LIKE (WILDCARDS)
-- ========================================

-- ----------------------------------------------------
-- El símbolo % (porcentaje) - coincide con CERO o MÁS caracteres
-- ----------------------------------------------------

-- Empieza con 'Y' (cualquier cosa después)
SELECT name FROM world
WHERE name LIKE 'Y%';  -- Yemen, Yugoslavia, etc.

-- Termina con 'y' (cualquier cosa antes)
SELECT name FROM world
WHERE name LIKE '%y';  -- Germany, Italy, etc.

-- Contiene 'x' en cualquier posición
SELECT name FROM world
WHERE name LIKE '%x%';  -- Luxembourg, Mexico

-- Empieza con 'C' Y termina con 'ia'
SELECT name FROM world
WHERE name LIKE 'C%' AND name LIKE '%ia';  -- Cambodia, Colombia, Croatia

-- Tiene 'oo' en alguna parte
SELECT name FROM world
WHERE name LIKE '%oo%';  -- Cameroon

-- Tres o más 'a' (repite el patrón)
SELECT name FROM world
WHERE name LIKE '%a%a%a%';  -- Afghanistan, Bahamas, etc.


-- ----------------------------------------------------
-- El símbolo _ (guion bajo) - coincide con EXACTAMENTE UN carácter
-- ----------------------------------------------------

-- Segundo carácter = 't' (_ significa "cualquier primer carácter")
SELECT name FROM world
WHERE name LIKE '_t%';  -- Ethiopia, Italy

-- Dos 'o' separadas por exactamente dos caracteres
SELECT name FROM world
WHERE name LIKE '%o__o%';  -- Lesotho, Moldova, Morocco

-- Exactamente 4 caracteres (cuatro guiones bajos)
SELECT name FROM world
WHERE name LIKE '____';  -- Chad, Mali, Togo, Iran, Iraq, Laos, Oman, Cuba, Fiji, Peru


-- ========================================
-- FUNCIÓN CONCAT (Concatenar strings)
-- ========================================

-- CONCAT une dos o más strings
SELECT CONCAT('Hello', ' ', 'World');  -- 'Hello World'

-- Útil para construir patrones dinámicos
SELECT name FROM world
WHERE capital = CONCAT(name, ' City');  -- capital = "Mexico City", "Kuwait City", etc.

-- Buscar capital que CONTENGA el nombre del país
SELECT capital, name FROM world
WHERE capital LIKE CONCAT('%', name, '%');

-- Capital que EMPIEZA con el nombre del país (y es más larga)
SELECT capital, name FROM world
WHERE capital LIKE CONCAT(name, '%')
  AND capital NOT LIKE name;


-- ========================================
-- FUNCIÓN REPLACE (Buscar y reemplazar)
-- ========================================

-- REPLACE(texto, buscado, reemplazo)
SELECT REPLACE('vessel', 'e', 'a');  -- 'vassal'

-- Extraer la "extensión" de la capital (lo que sobra después del nombre)
SELECT name, 
       REPLACE(capital, name, '') AS extension
FROM world
WHERE capital LIKE CONCAT(name, '_%');
-- Para Monaco: capital = 'Monaco-Ville' → REPLACE quita 'Monaco' → queda '-Ville'


-- ========================================
-- FUNCIONES ÚTILES PARA ORDENAR
-- ========================================

-- ORDER BY para ordenar resultados
SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name;  -- Orden alfabético ascendente

-- ORDER BY DESC para orden descendente
SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name DESC;


-- ========================================
-- RESUMEN DE PATRONES COMUNES
-- ========================================
/*
'U%'      → Empieza con U
'%y'      → Termina con y
'%x%'     → Contiene x
'C%ia'    → Empieza con C y termina con ia
'%oo%'    → Contiene oo
'%a%a%a%' → Al menos tres a
'_t%'     → t como segunda letra
'%o__o%'  → Dos o separadas por 2 caracteres
'____'    → Exactamente 4 caracteres
*/

-- ========================================
-- NOTAS IMPORTANTES
-- ========================================
-- 1. LIKE NO distingue mayúsculas/minúsculas en MySQL (sí en otras bases)
-- 2. % puede coincidir con CERO caracteres (útil para bordes)
-- 3. _ coincide con EXACTAMENTE UN carácter
-- 4. CONCAT es más limpio que usar '+' para strings
-- 5. REPLACE es sensible a mayúsculas/minúsculas
