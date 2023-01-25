/*Crea una vista que muestra a los alumnos
con promedio menor a 6, seleccionando
la columna "nombre" y "apellido" de la tabla Alumno
y la columna "promedio" de la tabla promedio
*/
CREATE VIEW V_AlumnoReprobados AS
SELECT CONCAT(alumno.nombre, ' ', alumno.apellido) AS Alumno,promedio.promedio AS Promedio
FROM alumno
INNER JOIN promedio
ON alumno.expediente = promedio.expediente_alumno
GROUP BY alumno.nombre
HAVING promedio.promedio < 6;