-- 02_seed.sql
-- Inserción de datos iniciales con inconsistencias

-- camiones
INSERT INTO camiones (id_camion, modelo, año, tipo_combustible, estado) VALUES
(101, 'CAT 797F', 2019, 'Diesel', 'activo'),
(102, 'Komatsu 980E', 2020, 'Diesel', 'activo'),
(103, 'Liebherr T284', 2018, 'Diesel', 'inactivo'),
(104, 'Belaz 75710', 2021, 'Electrico', 'activo'),
(101, 'CAT 797F', 2019, 'Diesel', 'activo'),
(105, 'Hitachi EH5000', 2022, 'Diesel', 'activo'),
(106, 'Caterpillar 793F', 2017, 'Diesel', 'activo'),
(107, 'Komatsu 960E', 2019, 'Diesel', 'inactivo'),
(108, 'Liebherr T236', 2023, 'Diesel', 'activo'),
(109, 'Belaz 75581', 2020, 'Electrico', 'activo'),
(110, 'Terex MT6300', 2016, 'Diesel', 'inactivo');

-- rutas
INSERT INTO rutas (id_ruta, nombre_ruta, distancia_km, dificultad, zona) VALUES
(1, 'Ruta Norte A', 45.5, 'media', 'norte'),
(2, 'Ruta Norte B', 62.3, 'alta', 'norte'),
(3, 'Ruta Sur A', 38.7, 'baja', 'sur'),
(4, 'Ruta Sur B', 51.2, 'media', 'sur'),
(5, 'Ruta Este', 73.8, 'alta', 'este'),
(6, 'Ruta Oeste', 29.4, 'baja', 'oeste'),
(7, 'Ruta Norte C', NULL, 'media', 'norte'),
(8, 'Ruta Sur C', 44.1, NULL, 'sur'),
(9, 'Ruta Central', 55.0, 'media', 'centro');

-- conductores
INSERT INTO conductores (id_conductor, nombre, antiguedad_meses, certificado_vigente, turno_preferido) VALUES
(201, 'Carlos López', 48, 'si', 'dia'),
(202, 'Ana Martínez', 24, 'si', 'noche'),
(203, 'Luis Fernández', 999, 'no', 'dia'),
(204, 'María Gómez', 12, 'si', 'noche'),
(205, 'Jorge Ramírez', 36, 'si', 'dia'),
(206, 'Patricia Soto', 60, 'no', 'noche'),
(207, 'Ricardo Díaz', 8, 'si', 'dia'),
(208, 'Verónica Cruz', 999, 'si', 'noche'),
(209, 'Fernando Torres', 18, 'si', 'dia'),
(210, 'Laura Jiménez', 30, 'no', 'noche');

-- fallas
INSERT INTO fallas (id_falla, id_camion, fecha_falla, tipo_falla, tiempo_inactividad_horas, id_conductor) VALUES
(1001, 101, '2026-03-15', 'motor', 12.5, 201),
(1002, 102, '2026-03-16', 'HIDRAULICA', 8.0, 202),
(1003, 103, '2026-03-17', 'eléctrica', 5.5, 203),
(1004, 101, '2026-03-18', 'motor', 14.0, 201),
(1005, 104, '2026-03-19', 'Motor', 3.0, 204),
(1006, 105, '2026-03-20', 'hidraulica', 10.5, 205),
(1007, 101, '2026-03-21', 'ELÉCTRICA', 7.0, 206),
(1008, 106, '2026-03-22', 'motor', -5.0, 207),
(1009, 107, '2026-13-40', 'hidráulica', 9.0, 208),
(1010, 108, '2026-03-24', 'Motor', 6.5, 209),
(1011, 109, '2026-03-25', 'eléctrica', 4.0, 210),
(1012, 110, '2026-03-26', 'HIDRAULICA', 11.0, 999),
(1013, 101, '2026-03-27', 'motor', 13.0, 201),
(1014, 102, '2026-03-28', NULL, 8.5, 202),
(1015, 111, '2026-03-29', 'eléctrica', 5.0, 203);

-- mantenimiento
INSERT INTO mantenimiento (id_mantenimiento, id_camion, fecha_mantenimiento, tipo_mantenimiento, costo) VALUES
(5001, 101, '2026-03-10', 'preventivo', 2500.00),
(5002, 102, '2026-03-12', 'preventivo', 3200.00),
(5003, 103, '2026-03-14', 'correctivo', 8500.00),
(5004, 101, '2026-03-20', 'correctivo', 12000.00),
(5005, 104, '2026-03-18', 'preventivo', 4100.00),
(5006, 999, '2026-03-22', 'preventivo', 3000.00),
(5007, 105, '2026-03-25', 'correctivo', 7500.00),
(5008, 106, NULL, 'preventivo', 2800.00),
(5009, 107, '2026-03-28', 'correctivo', 9200.00),
(5010, 108, '2026-03-30', 'preventivo', 3800.00);
