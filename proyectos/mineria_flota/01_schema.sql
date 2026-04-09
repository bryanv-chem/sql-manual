-- 01_schema.sql
-- Creación de tablas del proyecto mineria_flota

CREATE TABLE camiones (
    id_camion INTEGER,
    modelo TEXT,
    año INTEGER,
    tipo_combustible TEXT,
    estado TEXT
);

CREATE TABLE rutas (
    id_ruta INTEGER,
    nombre_ruta TEXT,
    distancia_km REAL,
    dificultad TEXT,
    zona TEXT
);

CREATE TABLE conductores (
    id_conductor INTEGER,
    nombre TEXT,
    antiguedad_meses INTEGER,
    certificado_vigente TEXT,
    turno_preferido TEXT
);

CREATE TABLE fallas (
    id_falla INTEGER,
    id_camion INTEGER,
    fecha_falla TEXT,
    tipo_falla TEXT,
    tiempo_inactividad_horas REAL,
    id_conductor INTEGER
);

CREATE TABLE mantenimiento (
    id_mantenimiento INTEGER,
    id_camion INTEGER,
    fecha_mantenimiento TEXT,
    tipo_mantenimiento TEXT,
    costo REAL
);
