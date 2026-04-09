-- 04_queries.sql
-- Consultas objetivo del proyecto mineria_flota

-- =====================================================
-- OBJETIVO 1: Top 3 camiones con mayor tiempo total de inactividad
-- =====================================================
SELECT camiones.id_camion, modelo, SUM(tiempo_inactividad_horas) as total_inactividad
FROM camiones 
JOIN fallas ON (camiones.id_camion = fallas.id_camion)
GROUP BY camiones.id_camion
ORDER BY total_inactividad DESC
LIMIT 3;

-- =====================================================
-- OBJETIVO 2: Tipo de falla más costosa en tiempo perdido (promedio)
-- =====================================================
SELECT 
    CASE 
        WHEN tipo_falla LIKE '%el%ctrica%' THEN 'electrica'
        ELSE LOWER(tipo_falla)
    END as tipo_normalizado,
    AVG(tiempo_inactividad_horas) as tiempo_promedio
FROM fallas
WHERE tipo_falla IS NOT NULL AND tipo_falla != 'desconocido'
GROUP BY tipo_normalizado
ORDER BY tiempo_promedio DESC;

-- =====================================================
-- OBJETIVO 3: Ranking de conductores por eficiencia (menos fallas)
-- =====================================================
SELECT 
    conductores.nombre,
    COUNT(fallas.id_falla) AS cantidad_fallas,
    DENSE_RANK() OVER (ORDER BY COUNT(fallas.id_falla) ASC) AS ranking
FROM conductores
JOIN fallas ON conductores.id_conductor = fallas.id_conductor
GROUP BY conductores.id_conductor, conductores.nombre
ORDER BY cantidad_fallas ASC;

-- =====================================================
-- OBJETIVO 4: Conductores con fallas pero sin mantenimiento preventivo 7 días antes
-- =====================================================
SELECT c.nombre, f.fecha_falla, f.id_camion, f.tipo_falla
FROM fallas f
JOIN conductores c ON f.id_conductor = c.id_conductor
WHERE NOT EXISTS (
    SELECT 1
    FROM mantenimiento m
    WHERE m.id_camion = f.id_camion
      AND m.tipo_mantenimiento = 'preventivo'
      AND m.fecha_mantenimiento BETWEEN DATE(f.fecha_falla, '-7 days') AND f.fecha_falla
);
