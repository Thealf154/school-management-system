#Procesos almacenados para insertar informacion

#1.- Cree alumnos

CREATE PROCEDURE crearAlumno 
(IN expediente int(6), 
 IN nombre varchar(254), 
 IN apellidos varchar(254),
 IN genero varchar(30),
 IN email_personal varchar(100),
 IN email_institucional varchar(100),
 IN nip varchar(200),
 IN telefono varchar(12),
 IN fecha_nacimiento date,
 IN domicilio varchar(150)
 IN promedio double,
 IN expediente_grupo int(2)
 )
 INSERT INTO ALUMNO
 (expediente, nombre, apellido, genero, email_personal, email_institucional, nip, telefono, fecha_nacimiento, domicilio, promedio, expediente_grupo)
VALUES
(expediente, nombre, apellido, genero, email_personal, email_institucional, nip, telefono, fecha_nacimiento, domicilio, promedio, expediente_grupo);


#2.-Cree profesores

CREATE PROCEDURE crearProfesor
(IN expediente int(6),
 IN nombre varchar(254),
 IN apellidos varchar(254),
 IN genero varchar(30),
 IN salario double,
 IN email_personale varchar(100),
 IN email_institucional varchar(100).
 IN contra varchar(200),
 IN esta_activo boolean
)
INSERT INTO PROFESOR
 (expediente, nombre, apellidos, genero, salario, email_personal, email_institucional, contraseña, esta_activo) 
VALUES 
(expediente, nombre, apellidos, genero, salario, email_personal, email_institucional, contra, esta_activo);


#3.-Cree una materia 

CREATE PROCEDURE crearMateria
(IN expediente int(6),
 IN nombre varchar(254),
 IN descripcion varchar(254),
 IN expediente_prof int(6),
 IN expediente_curso int(6)
)
INSERT INTO MATERIA 
(expediente, nombre, descripcion, expediente_profesor, expediente_curso) 
VALUES 
(expediente, nombre, descripcion, expediente_prof, expediente_curso);

#4.-Crear Horario

CREATE PROCEDURE crearHorario 
(IN id int(6),
 IN hora_entrada time,
 IN hora_salida time
) 
INSTERT INTO HORARIO 
(id, hora_entrada, hora_salida) 
VALUES 
(id, hora_entrada, hora_salida);

#5.-Crear PROMEDIO

CREATE PROCEDURE crearPromedio
(IN expediente_alumno int(6),
 IN expediente_materia int(6),
 IN promedio double
)
INSERT INTO PROMEDIO 
(expediente_alumno, expediente_meteria, promedio) 
VALUES
(expediente_alumno, expediente_materia, promedio);

#Procesos almacenados para ver informacion

#1.- Ver informacion de un alumno

CREATE PROCEDURE verAlumno 
(IN dato int(6)) 
SELECT expediente, nombre, apellidos, genero, email_personal, email_institucional, nip, telefono, fecha_nacimiento, domicilio, promedio, expediente_grupo AS Grupo 
FROM alumnos 
WHERE expediente = dato;

#2.- Ver promedio de un alumno

CREATE PROCEDURE verPromedioAlumno
(IN dato int(6))
SELECT p.expediente_alumno, promedio, a.nombres, a.apellidos
FROM promedio p
JOIN alumnos a ON p.expediente_alumno = a.expediente
WHERE p.expediente_alumno = dato;

#3.- Ver informacion de un profesor.

CREATE PROCEDURE verProfesor 
(IN dato int(6))
SELECT expediente, nombre, apellidos, genero, salario, email_personal, email_institucional, contraseñas, esta_activo
FROM PROFESOR
WHERE expediente = dato;

#4.- ver las materias y salones que le tocan a un alumno con sus horarios

CREATE PROCEDURE verInfoClaseAlumno 
(IN dato int(6)) 
SELECT a.expediente, a.nombre, a.apellidos, g.nombre AS grupo, m.nombre AS materia, p.nombre AS 'Nombre del mastro', p.apellidos AS '', h.hora_entrada AS entrada, h.hora_salida AS salida, s.nombre AS salon
FROM alumno a
JOIN grupo g ON g.expediente = a.expediente_grupo 
JOIN HORARIO_GRUPO hg ON hg.expediente_grupo = g.expediente
JOIN materia m ON hg.expediente_materia = m.expediente
JOIN profesor p ON m.expediente_profesor = p.expediente
JOIN horario h ON hg.id_horario = h.id
JOIN salon s ON hg.id_salon = s.id
WHERE a.expediente = dato;
