/**********************************************************************
|                                                                     |
|   TUTORIAL 8: Using NULL - Teachers and Departments (SQLZoo)       |
|                                                                     |
|   Bryan Vargas - Data Analyst in transition                         |
|   Fecha: Marzo 2026                                                 |
|                                                                     |
|   Tablas:                                                           |
|   teacher(id, dept, name, phone, mobile)                           |
|   dept(id, name)                                                    |
|                                                                     |
|   Relación: teacher.dept → dept.id                                  |
|                                                                     |
**********************************************************************/

/*---------------------------------------------------------------------
|   ESTRUCTURA DE TABLAS                                             |
---------------------------------------------------------------------*/

/*
   TABLA: teacher
   +-----+------+-----------+-------+----------------+
   | id  | dept | name      | phone | mobile         |
   +-----+------+-----------+-------+----------------+
   | 101 | 1    | Shrivell  | 2753  | 07986 555 1234 |
   | 102 | 1    | Throd     | 2754  | 07122 555 1920 |
   | 103 | 1    | Splint    | 2293  | NULL           |
   | 104 | NULL | Spiregrain| 3287  | NULL           |
   | 105 | 2    | Cutflower | 3212  | 07996 555 6574 |
   | 106 | NULL | Deadyawn  | 3345  | NULL           |
   +-----+------+-----------+-------+----------------+

   TABLA: dept
   +----+-------------+
   | id | name        |
   +----+-------------+
   | 1  | Computing   |
   | 2  | Design      |
   | 3  | Engineering |
   +----+-------------+

   RELACIONES:
   - teacher.dept puede ser NULL (profesores sin departamento)
   - dept puede no tener profesores asignados (Engineering)
*/

/*---------------------------------------------------------------------
|   EJERCICIOS                                                        |
---------------------------------------------------------------------*/

-- 1. Profesores que no tienen departamento (dept IS NULL)
SELECT teacher.name
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id
WHERE dept.id IS NULL;

-- 2. INNER JOIN: solo profesores con departamento y departamentos con profesores
SELECT teacher.name, dept.name
FROM teacher
INNER JOIN dept ON teacher.dept = dept.id;

-- 3. LEFT JOIN: todos los profesores (con o sin departamento)
SELECT teacher.name, dept.name
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

-- 4. RIGHT JOIN: todos los departamentos (con o sin profesores)
SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id;

-- 5. COALESCE para móvil: usar '07986 444 2266' si no hay número
SELECT teacher.name, 
       COALESCE(teacher.mobile, '07986 444 2266') AS mobile_number
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

-- 6. COALESCE para departamento: usar 'None' si no hay departamento
SELECT teacher.name, 
       COALESCE(dept.name, 'None') AS department
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

-- 7. Contar profesores y móviles (COUNT ignora NULL)
SELECT COUNT(teacher.name) AS teachers,
       COUNT(teacher.mobile) AS mobiles
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

-- 8. Por departamento: número de profesores (incluye Engineering con 0)
SELECT dept.name, COUNT(teacher.name) AS staff_count
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;

-- 9. CASE: 'Sci' si dept 1 o 2, 'Art' en otro caso
SELECT teacher.name,
       CASE 
           WHEN teacher.dept = 1 OR teacher.dept = 2 THEN 'Sci'
           ELSE 'Art'
       END AS category
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

-- 10. CASE con tres opciones: 'Sci' (dept 1 o 2), 'Art' (dept 3), 'None' (resto)
SELECT teacher.name,
       CASE 
           WHEN teacher.dept = 1 OR teacher.dept = 2 THEN 'Sci'
           WHEN teacher.dept = 3 THEN 'Art'
           ELSE 'None'
       END AS category
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

/**********************************************************************
|                                                                     |
|   CONCEPTOS USADOS EN EL TUTORIAL                                   |
|                                                                     |
**********************************************************************/

/*
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║  1. NULL en SQL                                                    ║
║     ──────────────────────────────────────────────────────────     ║
║     NULL no es un valor, es la ausencia de valor.                 ║
║     No se puede comparar con =, se usa IS NULL o IS NOT NULL.     ║
║                                                                    ║
║  2. LEFT JOIN                                                      ║
║     ──────────────────────────────────────────────────────────     ║
║     Devuelve todas las filas de la tabla izquierda (teacher).     ║
║     Si no hay coincidencia en la derecha, las columnas de dept   ║
║     son NULL.                                                     ║
║                                                                    ║
║  3. RIGHT JOIN                                                     ║
║     ──────────────────────────────────────────────────────────     ║
║     Devuelve todas las filas de la tabla derecha (dept).          ║
║     Si no hay coincidencia en la izquierda, las columnas de      ║
║     teacher son NULL.                                             ║
║                                                                    ║
║  4. COALESCE(valor1, valor2, ...)                                 ║
║     ──────────────────────────────────────────────────────────     ║
║     Devuelve el primer valor no NULL de la lista.                 ║
║     Útil para reemplazar NULLs con valores por defecto.           ║
║                                                                    ║
║  5. COUNT(columna) vs COUNT(*)                                    ║
║     ──────────────────────────────────────────────────────────     ║
║     COUNT(columna) ignora NULLs.                                  ║
║     COUNT(*) cuenta todas las filas (incluye NULLs).              ║
║                                                                    ║
║  6. CASE WHEN                                                      ║
║     ──────────────────────────────────────────────────────────     ║
║     Permite lógica condicional en SQL.                            ║
║     Evalúa condiciones en orden y devuelve el primer THEN.        ║
║                                                                    ║
║  7. LEFT JOIN con IS NULL                                         ║
║     ──────────────────────────────────────────────────────────     ║
║     WHERE dept.id IS NULL encuentra filas sin coincidencia        ║
║     (profesores sin departamento).                                ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
*/
