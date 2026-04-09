-- 03_clean.sql
-- Limpieza de inconsistencias en datos de fallas

-- 1. Tiempo negativo → convertir a positivo
UPDATE fallas SET tiempo_inactividad_horas = ABS(tiempo_inactividad_horas) WHERE id_falla = 1008;

-- 2. Fecha inválida (2026-13-40) → eliminar fila
DELETE FROM fallas WHERE id_falla = 1009;

-- 3. id_conductor inexistente (999) → cambiar a NULL
UPDATE fallas SET id_conductor = NULL WHERE id_falla = 1012;

-- 4. tipo_falla NULL → cambiar a 'desconocido'
UPDATE fallas SET tipo_falla = 'desconocido' WHERE id_falla = 1014;

-- 5. id_camion inexistente (111) → eliminar fila
DELETE FROM fallas WHERE id_falla = 1015;

-- Verificar limpieza (debe devolver 0 filas)
SELECT * FROM fallas WHERE fecha_falla = '2026-13-40' OR tiempo_inactividad_horas < 0 OR id_camion NOT IN (SELECT id_camion FROM camiones) OR (id_conductor NOT IN (SELECT id_conductor FROM conductores) AND id_conductor IS NOT NULL) OR tipo_falla IS NULL;
