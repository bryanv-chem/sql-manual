
-- 📚 MANUAL SQL - Bryan Vargas
-- Tema: Fundamentos de consultas (WHERE, IN, BETWEEN, LIKE)
-- Carpeta: 01_basics/

-- ========================================
-- FILTRADO BÁSICO CON WHERE
-- ========================================

-- Mostrar población de un país específico
SELECT population FROM world
WHERE name = 'Germany';

-- Mostrar múltiples columnas
SELECT name, population FROM world
WHERE name = 'Spain';


-- ========================================
-- BUSCAR MÚLTIPLES VALORES CON IN
-- ========================================

-- Países específicos
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- También sirve para otros tipos de datos
SELECT name, area FROM world
WHERE continent IN ('Europe', 'Asia');


-- ========================================
-- RANGOS CON BETWEEN
-- ========================================

-- Países con área entre 200,000 y 250,000 km²
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000;

-- Población entre 5 y 10 millones
SELECT name, population FROM world
WHERE population BETWEEN 5000000 AND 10000000;

-- IMPORTANTE: BETWEEN incluye los límites (INCLUSIVE)


-- ========================================
-- BÚSQUEDA POR PATRONES CON LIKE
-- ========================================

-- Termina con 'a'
SELECT name FROM world
WHERE name LIKE '%a';

-- Empieza con 'Al'
SELECT name FROM world
WHERE name LIKE 'Al%';

-- Contiene 'land' en cualquier parte
SELECT name FROM world
WHERE name LIKE '%land%';

-- Combinaciones con AND/OR
SELECT name FROM world
WHERE name LIKE '%a' OR name LIKE '%l';  -- Termina en a O termina en l


-- ========================================
-- CONDICIONES COMBINADAS (AND / OR)
-- ========================================

-- Área mayor a 50,000 Y población menor a 10 millones
SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000;

-- Europa O Asia
SELECT name, continent
FROM world
WHERE continent = 'Europe' OR continent = 'Asia';


-- ========================================
-- OPERACIONES ARITMÉTICAS EN CONSULTAS
-- ========================================

-- Calcular densidad de población (personas por km²)
SELECT name, population/area AS density
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia');

-- El AS permite renombrar la columna (alias)


-- ========================================
-- NOTAS IMPORTANTES
-- ========================================
-- 1. Las strings SIEMPRE van entre comillas simples: 'texto'
-- 2. Los nombres de tablas y columnas NO llevan comillas
-- 3. Los números se escriben sin comillas: 250000
-- 4. Las condiciones pueden combinarse con AND (todas deben cumplirse) y OR (al menos una debe cumplirse)
-- 5. LIKE distingue mayúsculas/minúsculas depende de la base de datos (en MySQL no distingue por defecto)
