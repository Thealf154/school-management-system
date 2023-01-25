/*Crea una vista llamada "V_AlumnoGrupo" 
que muestra al alumno, su grupo y su horario
seleccionando los campos "nombre" de la tabla alumnos,
"expediente" de la tabla grupo
y "hora_entrada" y "hora_salida" de la tabla horario*/

CREATE VIEW V_AlumnoGrupo AS 
SELECT a.nombre AS Nombre_Alumno, g.expediente AS Grupo, 
		h.hora_entrada AS Hora_Entrada, h.hora_salida AS Hora_Salida		
FROM ALUMNO a, Grupo g, horario h, horario_grupo hg
WHERE g.expediente = hg.expediente_grupo
AND a.expediente_grupo = g.expediente
AND hg.id_horario = h.id
ORDER BY g.expediente;