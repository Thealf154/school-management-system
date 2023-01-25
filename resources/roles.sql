#Profesores:
#Profesores es un rol general, en donde pueden acceder a ciertas tablas (promedio, grupo, materia y salones) pero solo podrán acceder a sus propios datos por medio del
#backend, para eso utilizamos la siguiente sentencia:
CREATE ROLE profesor;
GRANT SELECT ON control_escolar.PROMEDIO TO profesor;
GRANT SELECT ON control_escolar.GRUPO TO profesor;
GRANT SELECT ON control_escolar.MATERIA TO profesor;
GRANT SELECT ON control_escolar.HORARIO TO profesor;
GRANT SELECT ON control_escolar.SALON TO profesor;


#Administrador:
#El administrador puede acceder a todas las funciones, para esto utilizamos la siguiente sentencia:
CREATE ROLE admin;
GRANT SELECT, INSERT, UPDATE ON . TO 'admin';

#Supervisores:
#Los administrativos pueden acceder a todas las tablas, pero solo para consultas, para esto utilizamos la siguiente sentencia:
CREATE ROLE supervisor;
GRANT SELECT ON . TO 'supervisor';

#Alumnos:
#Alumnos es un rol general que solo podrá ver sus horarios y promedios, para esto utilizamos la siguiente sentencia:
CREATE ROLE alumno;
GRANT SELECT ON control_escolar.PROMEDIO TO alumno;
GRANT SELECT ON control_escolar.HORARIO TO alumno;
GRANT SELECT ON control_escolar.SALON TO alumno;
GRANT SELECT ON control_escolar.CURSO TO alumno;
