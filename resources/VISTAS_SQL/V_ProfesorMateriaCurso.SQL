/*Crea una vista llamada "V_ProfesorMateriaCurso"
que muestra al profesor, materia que imparte y curso al que da clase
seleccionando los campos "nombre" y "apellido" de la tabla profesor,
"nombre" de la tabla materia y "nombre" de la tabla curso
*/
CREATE VIEW V_ProfesorMateriaCurso AS
SELECT CONCAT(p.nombre, ' ', p.apellidos) AS Nombre_Profesor, m.nombre AS Materia, 
		c.nombre AS Curso		
FROM PROFESOR p, MATERIA m, CURSO c
WHERE p.expediente = m.expediente_profesor
AND c.expediente = m.expediente_curso
ORDER BY  Nombre_Profesor;
