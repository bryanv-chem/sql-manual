# Proyecto SQL: Análisis de flota minera

## Contexto
Empresa minera con flota de camiones de alto tonelaje. Se requiere un informe semanal de eficiencia de la flota para identificar:
- Camiones con mayor tiempo de inactividad
- Tipos de falla más costosos
- Conductores más eficientes
- Anomalías en mantenimiento preventivo

## Estructura de la base de datos

| Tabla | Descripción |
|-------|-------------|
| camiones | Datos de los camiones (modelo, año, combustible, estado) |
| conductores | Datos de los conductores (antigüedad, certificación, turno) |
| fallas | Registro de fallas mecánicas (tipo, tiempo inactividad, fecha) |
| mantenimiento | Registro de mantenimientos (preventivo/correctivo, costo) |
| rutas | Información de rutas (distancia, dificultad, zona) |

## Limpieza de datos aplicada

Se identificaron y corrigieron las siguientes inconsistencias en la tabla `fallas`:

| Problema | Solución |
|----------|----------|
| Tiempo inactividad negativo (-5.0) | Convertido a valor absoluto (5.0) |
| Fecha inválida (2026-13-40) | Fila eliminada |
| id_conductor inexistente (999) | Cambiado a NULL |
| tipo_falla NULL | Cambiado a 'desconocido' |
| id_camion inexistente (111) | Fila eliminada |
| Acentos en tipo_falla ('elÉctrica' vs 'eléctrica') | Normalizado con CASE WHEN |

## Resultados del análisis

### 1. Top 3 camiones con mayor tiempo de inactividad

| id_camion | modelo | total_inactividad (horas) |
|-----------|--------|---------------------------|
| 101 | CAT 797F | 93.0 |
| 102 | Komatsu 980E | 16.5 |
| 110 | Terex MT6300 | 11.0 |

**Conclusión:** El camión CAT 797F (id 101) acumula 93 horas de inactividad, muy por encima del resto. Requiere revisión prioritaria.

### 2. Tipo de falla más costosa (promedio de horas perdidas)

| tipo_falla | tiempo_promedio (horas) |
|------------|------------------------|
| hidraulica | 9.83 |
| motor | 9.00 |
| electrica | 5.50 |

**Conclusión:** Las fallas hidráulicas generan el mayor tiempo de inactividad promedio (9.83 horas), seguidas de cerca por fallas de motor (9.0 horas).

### 3. Ranking de conductores por eficiencia

| nombre | cantidad_fallas | ranking |
|--------|----------------|---------|
| Luis Fernández | 1 | 1 |
| María Gómez | 1 | 1 |
| Jorge Ramírez | 1 | 1 |
| Patricia Soto | 1 | 1 |
| Ricardo Díaz | 1 | 1 |
| Fernando Torres | 1 | 1 |
| Laura Jiménez | 1 | 1 |
| Ana Martínez | 2 | 2 |
| Carlos López | 3 | 3 |

**Conclusión:** Carlos López tiene la menor eficiencia (3 fallas), seguido de Ana Martínez (2 fallas). Los demás conductores tienen solo 1 falla cada uno.

### 4. Conductores con fallas sin mantenimiento preventivo 7 días antes

| nombre | fecha_falla | id_camion | tipo_falla |
|--------|-------------|-----------|------------|
| Luis Fernández | 2026-03-17 | 103 | eléctrica |
| Carlos López | 2026-03-18 | 101 | motor |
| Jorge Ramírez | 2026-03-20 | 105 | hidraulica |
| Patricia Soto | 2026-03-21 | 101 | ELÉCTRICA |
| Ricardo Díaz | 2026-03-22 | 106 | motor |
| Fernando Torres | 2026-03-24 | 108 | Motor |
| Laura Jiménez | 2026-03-25 | 109 | eléctrica |
| Carlos López | 2026-03-27 | 101 | motor |
| Ana Martínez | 2026-03-28 | 102 | desconocido |

**Conclusión:** Se detectaron 9 fallas que ocurrieron sin mantenimiento preventivo en los 7 días anteriores. El camión 101 (CAT 797F) aparece 3 veces en esta lista, lo que refuerza la necesidad de revisar su programa de mantenimiento.

## Tecnologías utilizadas
- SQLite
- SQL (JOINs, subconsultas, window functions, limpieza de datos)

## Cómo ejecutar este proyecto

```bash
# 1. Crear tablas
sqlite3 mineria.db < 01_schema.sql

# 2. Insertar datos
sqlite3 mineria.db < 02_seed.sql

# 3. Limpiar datos
sqlite3 mineria.db < 03_clean.sql

# 4. Ejecutar consultas
sqlite3 mineria.db < 04_queries.sql
