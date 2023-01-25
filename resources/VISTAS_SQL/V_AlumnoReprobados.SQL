/*Crea una vista que muestra a los alumnos
con promedio menor a 6, seleccionando
la columna "nombre" y "apellido" de la tabla Alumno
y la columna "promedio" de la tabla promedio
*/
CREATE VIEW V_AlumnoReprobados AS
SELECT CONCAT(ALUMNO.nombre, ' ', ALUMNO.apellidos) AS Alumno,PROMEDIO.promedio AS Promedio
FROM ALUMNO
INNER JOIN PROMEDIO
ON ALUMNO.expediente = PROMEDIO.expediente_alumno
GROUP BY ALUMNO.nombre
HAVING PROMEDIO.promedio < 6;