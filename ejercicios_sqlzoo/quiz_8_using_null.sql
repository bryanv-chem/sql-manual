/**********************************************************************
|                                                                     |
|   QUIZ 8: Using NULL - SQLZoo                                       |
|                                                                     |
|   Bryan Vargas - Data Analyst in transition                         |
|   Fecha: Marzo 2026                                                 |
|                                                                     |
|   Tablas: teacher(id, dept, name, phone)                            |
|           dept(id, name)                                            |
|                                                                     |
**********************************************************************/

/*---------------------------------------------------------------------
|   PREGUNTA 1                                                        |
-----------------------------------------------------------------------
   Select the code which uses an outer join correctly.
   
   Opciones:
   A. SELECT teacher.name, dept.name FROM teacher JOIN dept ON (dept = id)
   B. SELECT teacher.name, dept.name FROM teacher, dept INNER JOIN ON (teacher.dept = dept.id)
   C. SELECT teacher.name, dept.name FROM teacher, dept JOIN WHERE(teacher.dept = dept.id)
   D. SELECT teacher.name, dept.name FROM teacher OUTER JOIN dept ON dept.id
   E. SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)
   
   Respuesta correcta: E
   Justificación: LEFT OUTER JOIN es la sintaxis correcta para outer join.
*/

/*---------------------------------------------------------------------
|   PREGUNTA 2                                                        |
-----------------------------------------------------------------------
   Select the correct statement that shows the name of department 
   which employs Cutflower.
   
   Opciones:
   A. SELECT dept.name FROM teacher JOIN dept ON (dept.id = (SELECT dept FROM teacher WHERE name = 'Cutflower'))
   B. SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE dept.id = (SELECT dept FROM teacher HAVING name = 'Cutflower')
   C. SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'
   D. SELECT dept.name FROM teacher JOIN dept WHERE dept.id = (SELECT dept FROM teacher WHERE name = 'Cutflower')
   E. SELECT name FROM teacher JOIN dept ON (id = dept) WHERE id = (SELECT dept FROM teacher WHERE name = 'Cutflower')
   
   Respuesta correcta: C
   Justificación: JOIN correcto y filtro directo con WHERE teacher.name = 'Cutflower'.
*/

/*---------------------------------------------------------------------
|   PREGUNTA 3                                                        |
-----------------------------------------------------------------------
   Select out of following the code which uses a JOIN to show a list 
   of all the departments and number of employed teachers.
   
   Opciones:
   A. SELECT dept.name, COUNT(*) FROM teacher LEFT JOIN dept ON dept.id = teacher.dept
   B. SELECT dept.name, COUNT(teacher.name) FROM teacher, dept JOIN ON dept.id = teacher.dept GROUP BY dept.name
   C. SELECT dept.name, COUNT(teacher.name) FROM teacher JOIN dept ON dept.id = teacher.dept GROUP BY dept.name
   D. SELECT dept.name, COUNT(teacher.name) FROM teacher LEFT OUTER JOIN dept ON dept.id = teacher.dept GROUP BY dept.name
   E. SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name
   
   Respuesta correcta: E
   Justificación: RIGHT JOIN incluye todos los departamentos (Engineering sin profesores).
*/

/*---------------------------------------------------------------------
|   PREGUNTA 4                                                        |
-----------------------------------------------------------------------
   Using SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher 
   on teacher table will:
   
   Opciones:
   A. display 0 in result column for all teachers
   B. display 0 in result column for all teachers without department
   C. do nothing - the statement is incorrect
   D. set dept value of all teachers to 0
   E. set dept value of all teachers without department to 0
   
   Respuesta correcta: B
   Justificación: COALESCE muestra el primer valor no NULL, '0' para profesores sin dept.
*/

/*---------------------------------------------------------------------
|   PREGUNTA 5                                                        |
-----------------------------------------------------------------------
   Query:
   SELECT name,
          CASE WHEN phone = 2752 THEN 'two'
               WHEN phone = 2753 THEN 'three'
               WHEN phone = 2754 THEN 'four'
               END AS digit
     FROM teacher
   shows following 'digit':
   
   Opciones:
   A. 'four' for Throd
   B. NULL for all teachers
   C. NULL for Shrivell
   D. 'two' for Cutflower
   E. 'two' for Deadyawn
   
   Respuesta correcta: A
   Justificación: Throd tiene phone = 2754 → CASE devuelve 'four'.
*/

/*---------------------------------------------------------------------
|   PREGUNTA 6                                                        |
-----------------------------------------------------------------------
   Select the result that would be obtained from the following code:
   SELECT name, 
          CASE 
           WHEN dept IN (1) THEN 'Computing' 
           ELSE 'Other' 
          END 
     FROM teacher
   
   Opciones:
   A. Table-A: Shrivell Computing, Throd Computing, Splint Computing, Spiregrain Other, Cutflower Other, Deadyawn Other
   B. Table-B: todos Computing
   C. Table-C: solo los de Computing
   D. Table-D: solo los Other
   E. Table-E: 1 para Computing, 0 para Other
   
   Respuesta correcta: A
   Justificación: dept = 1 son Shrivell, Throd, Splint (Computing); los demás Other.
*/

/**********************************************************************
|                                                                     |
|   CONCEPTOS USADOS EN EL QUIZ                                       |
|                                                                     |
**********************************************************************/

/*
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║  1. LEFT/RIGHT OUTER JOIN                                          ║
║     ──────────────────────────────────────────────────────────     ║
║     LEFT JOIN: todas las filas de la tabla izquierda (teacher)    ║
║     RIGHT JOIN: todas las filas de la tabla derecha (dept)        ║
║                                                                    ║
║  2. COALESCE                                                       ║
║     ──────────────────────────────────────────────────────────     ║
║     Devuelve el primer valor no NULL de la lista                  ║
║     Ej: COALESCE(dept, 0) muestra 0 si dept es NULL               ║
║                                                                    ║
║  3. CASE WHEN                                                      ║
║     ──────────────────────────────────────────────────────────     ║
║     Evaluación condicional en SQL                                 ║
║     Si no hay ELSE, devuelve NULL cuando ninguna condición se cumple ║
║                                                                    ║
║  4. COUNT con JOIN                                                 ║
║     ──────────────────────────────────────────────────────────     ║
║     RIGHT JOIN + GROUP BY para mostrar departamentos sin profesores ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
*/
