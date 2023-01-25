/*se crea una vista llamada "V_AlumnoPromedio" 
que muestra al alumno y su promedio
seleccionando los campos "nombre" y "apellido" de la tabla alumno
y "promedio" de la tabla promedio*/

CREATE VIEW V_AlumnoPromedio AS 
SELECT a.nombre, a.apellidos, p.promedio 
FROM ALUMNO a, PROMEDIO p
WHERE a.expediente = p.expediente_alumno;