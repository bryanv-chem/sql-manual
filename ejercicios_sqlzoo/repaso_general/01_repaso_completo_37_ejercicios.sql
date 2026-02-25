-- ========================================
-- 🧪 REPASO GENERAL SQL - EJERCICIOS 1 AL 37
-- ========================================
-- Temas: WHERE, LIKE, GROUP BY, HAVING, subconsultas escalares, 
--        subconsultas correlacionadas, subconsultas en SELECT y HAVING
-- Nivel: principiante a intermedio
-- Ejercicios progresivos (1 al 37)

-- ========================================
-- PARTE 1: WHERE (filtros básicos)
-- ========================================

-- ----------------------------------------------------
-- Ejercicio 1: WHERE con >
-- ----------------------------------------------------
-- Enunciado: Muestra los países con población mayor a 100 millones.
SELECT pais, poblacion 
FROM world 
WHERE poblacion > 100;

-- ----------------------------------------------------
-- Ejercicio 2: WHERE con BETWEEN
-- ----------------------------------------------------
-- Enunciado: Muestra los países con población entre 50 y 150 millones (inclusive).
SELECT pais, poblacion 
FROM world 
WHERE poblacion BETWEEN 50 AND 150;

-- ----------------------------------------------------
-- Ejercicio 3: WHERE con OR
-- ----------------------------------------------------
-- Enunciado: Muestra los países que están en Europa o tienen población mayor a 200 millones.
SELECT pais, poblacion 
FROM world 
WHERE continente = 'Europa' OR poblacion > 200;

-- ----------------------------------------------------
-- Ejercicio 4: WHERE con <>
-- ----------------------------------------------------
-- Enunciado: Muestra los países que no están en Europa.
SELECT pais, poblacion 
FROM world 
WHERE continente <> 'Europa';

-- ----------------------------------------------------
-- Ejercicio 5: WHERE con LIKE (empieza con)
-- ----------------------------------------------------
-- Enunciado: Muestra los países cuyo nombre empieza con 'A'.
SELECT pais
FROM world 
WHERE pais LIKE 'A%';

-- ----------------------------------------------------
-- Ejercicio 6: WHERE con LIKE (termina con)
-- ----------------------------------------------------
-- Enunciado: Muestra los países cuyo nombre termina con 'land'.
SELECT pais
FROM world 
WHERE pais LIKE '%land';

-- ----------------------------------------------------
-- Ejercicio 7: WHERE con LIKE (contiene)
-- ----------------------------------------------------
-- Enunciado: Muestra los países cuyo nombre contiene la letra 'x'.
SELECT pais
FROM world 
WHERE pais LIKE '%x%';

-- ----------------------------------------------------
-- Ejercicio 8: WHERE con LIKE (longitud fija)
-- ----------------------------------------------------
-- Enunciado: Muestra los países con nombre de exactamente 4 letras.
SELECT pais
FROM world 
WHERE pais LIKE '____';

-- ----------------------------------------------------
-- Ejercicio 9: WHERE con LIKE (múltiples condiciones)
-- ----------------------------------------------------
-- Enunciado: Muestra los países que empiezan con 'C' y terminan con 'a'.
SELECT pais
FROM world 
WHERE pais LIKE 'C%' AND pais LIKE '%a';

-- ----------------------------------------------------
-- Ejercicio 10: WHERE con LIKE (posición específica)
-- ----------------------------------------------------
-- Enunciado: Muestra los países con 'r' como segunda letra.
SELECT pais
FROM world 
WHERE pais LIKE '_r%';

-- ----------------------------------------------------
-- Ejercicio 11: WHERE con >, AND y exclusión
-- ----------------------------------------------------
-- Enunciado: Muestra los países con población mayor a 120 millones y que no están en Asia.
SELECT pais, poblacion, continente
FROM paises
WHERE poblacion > 120
AND continente <> 'Asia';

-- ----------------------------------------------------
-- Ejercicio 12: WHERE con BETWEEN y exclusión
-- ----------------------------------------------------
-- Enunciado: Muestra los países con población entre 30 y 200 millones y que no están en África.
SELECT pais, poblacion, continente
FROM paises
WHERE poblacion BETWEEN 30 AND 200
AND continente <> 'Africa';

-- ----------------------------------------------------
-- Ejercicio 13: WHERE con LIKE (empieza y termina)
-- ----------------------------------------------------
-- Enunciado: Muestra los países cuyo nombre empieza con 'M' y termina con 'a'.
SELECT pais
FROM paises
WHERE pais LIKE 'M%' AND pais LIKE '%a';

-- ----------------------------------------------------
-- Ejercicio 14: WHERE con LIKE (longitud fija y empieza con)
-- ----------------------------------------------------
-- Enunciado: Muestra los países con exactamente 6 letras y que empiezan con 'B'.
SELECT pais
FROM paises
WHERE pais LIKE 'B%' AND pais LIKE '______';

-- ----------------------------------------------------
-- Ejercicio 15: WHERE con LIKE (posición específica y terminación)
-- ----------------------------------------------------
-- Enunciado: Muestra los países con 'r' en la tercera posición y que terminan con 'ia'.
SELECT pais
FROM paises
WHERE pais LIKE '__r%' AND pais LIKE '%ia';

-- ========================================
-- PARTE 2: GROUP BY (agrupaciones simples)
-- ========================================

-- ----------------------------------------------------
-- Ejercicio 16: GROUP BY con COUNT
-- ----------------------------------------------------
-- Enunciado: Muestra el número total de países por continente.
SELECT continente, COUNT(pais) AS total_paises
FROM world 
GROUP BY continente;

-- ----------------------------------------------------
-- Ejercicio 17: GROUP BY con SUM
-- ----------------------------------------------------
-- Enunciado: Muestra la población total de cada continente.
SELECT continente, SUM(poblacion) AS poblacion_total
FROM world 
GROUP BY continente;

-- ----------------------------------------------------
-- Ejercicio 18: GROUP BY con AVG
-- ----------------------------------------------------
-- Enunciado: Muestra el promedio de población por país en cada continente.
SELECT continente, AVG(poblacion) AS poblacion_promedio
FROM world 
GROUP BY continente;

-- ========================================
-- PARTE 3: HAVING (filtros sobre grupos)
-- ========================================

-- ----------------------------------------------------
-- Ejercicio 19: HAVING con COUNT
-- ----------------------------------------------------
-- Enunciado: Muestra los continentes con más de 5 países.
SELECT continente, COUNT(pais) AS total_paises
FROM world 
GROUP BY continente 
HAVING COUNT(pais) > 5;

-- ----------------------------------------------------
-- Ejercicio 20: HAVING con SUM
-- ----------------------------------------------------
-- Enunciado: Muestra los continentes con población total mayor a 500 millones.
SELECT continente, SUM(poblacion) AS poblacion_total
FROM world 
GROUP BY continente 
HAVING SUM(poblacion) > 500;

-- ----------------------------------------------------
-- Ejercicio 21: HAVING con AVG
-- ----------------------------------------------------
-- Enunciado: Muestra los continentes con promedio de población mayor a 100 millones.
SELECT continente, AVG(poblacion) AS poblacion_promedio
FROM world 
GROUP BY continente 
HAVING AVG(poblacion) > 100;

-- ----------------------------------------------------
-- Ejercicio 22: GROUP BY con COUNT y HAVING (rango)
-- ----------------------------------------------------
-- Enunciado: Muestra los continentes que tienen entre 3 y 6 países.
SELECT continente, COUNT(pais) AS total_paises 
FROM paises
GROUP BY continente
HAVING COUNT(pais) BETWEEN 3 AND 6;

-- ----------------------------------------------------
-- Ejercicio 23: GROUP BY con SUM y HAVING (rango)
-- ----------------------------------------------------
-- Enunciado: Muestra los continentes con población total entre 500 y 3000 millones.
SELECT continente, SUM(poblacion) AS poblacion_total 
FROM paises
GROUP BY continente
HAVING SUM(poblacion) BETWEEN 500 AND 3000;

-- ----------------------------------------------------
-- Ejercicio 24: GROUP BY con AVG y HAVING (condiciones estrictas)
-- ----------------------------------------------------
-- Enunciado: Muestra los continentes con promedio de población por país mayor a 80 M y menor a 500 M.
SELECT continente, AVG(poblacion) AS poblacion_promedio 
FROM paises
GROUP BY continente
HAVING AVG(poblacion) > 80 AND AVG(poblacion) < 500;

-- ========================================
-- PARTE 4: SUBCONSULTAS ESCALARES
-- ========================================

-- ----------------------------------------------------
-- Ejercicio 25: Subconsulta en WHERE (comparación con un valor fijo)
-- ----------------------------------------------------
-- Enunciado: Muestra los países con población mayor que la de Francia.
SELECT pais, poblacion
FROM world 
WHERE poblacion > (SELECT poblacion FROM world WHERE pais = 'Francia');

-- ----------------------------------------------------
-- Ejercicio 26: Subconsulta en WHERE (comparación con promedio)
-- ----------------------------------------------------
-- Enunciado: Muestra los países con población mayor al promedio mundial.
SELECT pais, continente, poblacion
FROM world 
WHERE poblacion > (SELECT AVG(poblacion) FROM world);

-- ----------------------------------------------------
-- Ejercicio 27: Subconsulta escalar en WHERE (comparación con país específico)
-- ----------------------------------------------------
-- Enunciado: Muestra los países con población mayor que la de China.
SELECT pais, poblacion
FROM paises
WHERE poblacion > (SELECT poblacion FROM paises WHERE pais = 'China');

-- ----------------------------------------------------
-- Ejercicio 28: Subconsulta escalar con AVG
-- ----------------------------------------------------
-- Enunciado: Muestra los países con población menor al promedio de Europa.
SELECT pais, poblacion
FROM paises
WHERE poblacion < (SELECT AVG(poblacion) FROM paises WHERE continente = 'Europa');

-- ========================================
-- PARTE 5: SUBCONSULTAS CORRELACIONADAS
-- ========================================

-- ----------------------------------------------------
-- Ejercicio 29: Subconsulta correlacionada (mayor que promedio del continente)
-- ----------------------------------------------------
-- Enunciado: Muestra los países con población mayor al promedio de su propio continente.
SELECT pais, continente, poblacion
FROM world x
WHERE poblacion > (SELECT AVG(poblacion) 
                   FROM world y 
                   WHERE x.continente = y.continente);

-- ----------------------------------------------------
-- Ejercicio 30: Subconsulta correlacionada (entre promedio y máximo)
-- ----------------------------------------------------
-- Enunciado: Muestra los países con población mayor al promedio de su continente
--            pero menor al máximo de su continente.
SELECT pais, continente, poblacion
FROM world x
WHERE poblacion > (SELECT AVG(poblacion) 
                   FROM world y 
                   WHERE x.continente = y.continente)
AND poblacion < (SELECT MAX(poblacion) 
                   FROM world y 
                   WHERE x.continente = y.continente);

-- ----------------------------------------------------
-- Ejercicio 31: Subconsulta correlacionada básica (menor que promedio del continente)
-- ----------------------------------------------------
-- Enunciado: Muestra los países con población menor al promedio de su continente.
SELECT pais, continente, poblacion
FROM paises y
WHERE poblacion < (SELECT AVG(poblacion) FROM paises x WHERE x.continente = y.continente);

-- ----------------------------------------------------
-- Ejercicio 32: Subconsulta correlacionada con AVG y MAX
-- ----------------------------------------------------
-- Enunciado: Muestra los países con población mayor al promedio y menor al máximo de su continente.
SELECT pais, continente, poblacion
FROM paises y
WHERE poblacion > (SELECT AVG(poblacion) FROM paises x WHERE x.continente = y.continente)
AND poblacion < (SELECT MAX(poblacion) FROM paises x WHERE x.continente = y.continente);

-- ----------------------------------------------------
-- Ejercicio 33: Subconsulta correlacionada con operación aritmética
-- ----------------------------------------------------
-- Enunciado: Muestra los países con población mayor al doble del mínimo de su continente.
SELECT pais, continente, poblacion
FROM paises y
WHERE poblacion > 2*(SELECT MIN(poblacion) FROM paises x WHERE x.continente = y.continente);

-- ----------------------------------------------------
-- Ejercicio 34: Subconsulta correlacionada con condiciones inversas
-- ----------------------------------------------------
-- Enunciado: Muestra los países con población menor al promedio y mayor a la mitad del máximo.
SELECT pais, continente, poblacion
FROM paises y
WHERE poblacion < (SELECT AVG(poblacion) FROM paises x WHERE x.continente = y.continente)
AND poblacion > (SELECT MAX(poblacion) FROM paises x WHERE x.continente = y.continente)/2;

-- ----------------------------------------------------
-- Ejercicio 35: Subconsulta correlacionada con porcentaje
-- ----------------------------------------------------
-- Enunciado: Muestra los países con población mayor al 80% del máximo de su continente.
SELECT pais, continente, poblacion
FROM paises y
WHERE poblacion > 0.8*(SELECT MAX(poblacion) FROM paises x WHERE x.continente = y.continente);

-- ========================================
-- PARTE 6: SUBCONSULTAS EN SELECT
-- ========================================

-- ----------------------------------------------------
-- Ejercicio 36: Subconsulta en SELECT (diferencia con máximo)
-- ----------------------------------------------------
-- Enunciado: Muestra cada país con su población y la diferencia con el máximo de su continente.
SELECT pais, poblacion, 
       ((SELECT MAX(poblacion) FROM paises x WHERE x.continente = y.continente) - poblacion) AS diferencia_con_maximo
FROM paises y;

-- ========================================
-- PARTE 7: SUBCONSULTAS EN HAVING (DOBLE NIVEL)
-- ========================================

-- ----------------------------------------------------
-- Ejercicio 37: Subconsulta en HAVING con doble nivel
-- ----------------------------------------------------
-- Enunciado: Muestra los continentes con población total menor al promedio de las poblaciones totales.
SELECT continente, SUM(poblacion) AS poblacion_total 
FROM paises
GROUP BY continente
HAVING SUM(poblacion) < (SELECT AVG(total) 
                         FROM (SELECT SUM(poblacion) AS total 
                               FROM paises 
                               GROUP BY continente) AS sub);

-- ========================================
-- 💡 RESUMEN DE CONCEPTOS PRACTICADOS
-- ========================================
-- 1. WHERE: >, <, BETWEEN, OR, AND, <>, LIKE (%, _, combinaciones)
-- 2. GROUP BY: agrupar por continente, usar COUNT, SUM, AVG
-- 3. HAVING: filtrar grupos después de GROUP BY
-- 4. Subconsultas escalares en WHERE (independientes)
-- 5. Subconsultas correlacionadas en WHERE
-- 6. Subconsultas en SELECT (columna calculada)
-- 7. Subconsultas en HAVING con doble nivel (tabla derivada + AVG)
-- 8. Uso de alias en subconsultas anidadas
