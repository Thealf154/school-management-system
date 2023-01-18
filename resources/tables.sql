DROP DATABASE control_escolar;
CREATE DATABASE control_escolar;
USE control_escolar;

CREATE TABLE GRUPO (
    expediente integer(6) PRIMARY KEY,
    nombre varchar(254) NOT NULL,
    total_estudiantes integer(2)
);

CREATE TABLE CURSO (
    expediente integer(6) PRIMARY KEY,
    nombre varchar(254) NOT NULL
);

CREATE TABLE ALUMNO (
    expediente integer(6) PRIMARY KEY,
    nombre varchar(254) NOT NULL,
    apellidos varchar(254) NOT NULL,
    genero varchar(30) NOT NULL,
    email_personal varchar(100) NOT NULL,
    email_institucional varchar(100) NOT NULL,
    nip varchar(200) NOT NULL,
    telefono varchar(12) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    domicilio varchar(150),
    promedio double(4,2),
    expediente_grupo integer(2),
    CONSTRAINT fk_alumno_grupo
        FOREIGN KEY (expediente_grupo) 
        REFERENCES GRUPO(expediente)
);

CREATE TABLE PROFESOR (
    expediente integer(6) PRIMARY KEY,
    nombre varchar(254) NOT NULL,
    apellidos varchar(254) NOT NULL,
    genero varchar(30) NOT NULL,
    salario double(4,4) NOT NULL,
    email_personal varchar(100) NOT NULL,
    email_institucional varchar(100) NOT NULL,
    contraseña varchar(200) NOT NULL,
    esta_activo boolean,
); 

CREATE TABLE MATERIA(
    expediente integer(6) PRIMARY KEY,
    nombre varchar(254) NOT NULL,
    descripcion varchar(254),
    expediente_profesor integer(6) NOT NULL,
    expediente_curso integer(6) NOT NULL,
    CONSTRAINT fk_materia_expediente_profesor
        FOREIGN KEY (expediente_profesor) 
        REFERENCES PROFESOR(expediente),
    CONSTRAINT fk_materia_expediente_curso
        FOREIGN KEY (expediente_curso) 
        REFERENCES CURSO(expediente)
);



CREATE TABLE PROMEDIO (
    expediente_alumno integer(6) NOT NULL,
    expediente_materia integer(6) NOT NULL,
    promedio double(4,2) NOT NULL,
    CONSTRAINT fk_promedio_alumno
        FOREIGN KEY (expediente_alumno) 
        REFERENCES ALUMNO(expediente),
    CONSTRAINT fk_promedio_materia
        FOREIGN KEY (expediente_materia) 
        REFERENCES MATERIA(expediente)
);

CREATE TABLE HORARIO (
    id integer(6) PRIMARY KEY,
    hora_entrada TIMESTAMP,
    hora_salida TIMESTAMP
);

CREATE TABLE SALON(
    id integer(6) PRIMARY KEY,
    nombre varchar(10) NOT NULL,
    es_laboratorio boolean NOT NULL
);

CREATE TABLE HORARIO_GRUPO (
    id integer(6) PRIMARY KEY,
    expediente_grupo integer(6) NOT NULL,
    expediente_materia integer(6) NOT NULL,
    id_horario integer(6) NOT NULL,
    id_salon integer(6) NOT NULL,
    CONSTRAINT fk_horario_grupo_id_grupo
        FOREIGN KEY (expediente_grupo) 
        REFERENCES GRUPO(expediente),
    CONSTRAINT fk_horario_grupo_expediente_materia
        FOREIGN KEY (expediente_materia) 
        REFERENCES MATERIA(expediente),
    CONSTRAINT fk_horario_grupo_id_horario
        FOREIGN KEY (id_horario) 
        REFERENCES HORARIO(id)
);

CREATE TABLE ALUMNO_AUDITORIA (
    audit_id integer(6) PRIMARY KEY,
    expediente integer(6),
    nombre varchar(254) NOT NULL,
    apellidos varchar(254) NOT NULL,
    genero varchar(30) NOT NULL,
    email_personal varchar(100) NOT NULL,
    email_institucional varchar(100) NOT NULL,
    nip varchar(200) NOT NULL,
    telefono varchar(12) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    domicilio varchar(150),
    promedio double(4,2),
    expediente_grupo integer(2),
    fecha_actualizacion date,
    modificado_por varchar(128),
    operacion varchar(1) NOT NULL
);

CREATE TABLE PROMEDIO_AUDITORIA (
    audit_id integer(6) PRIMARY KEY,
    expediente_alumno integer(6) NOT NULL,
    expediente_materia integer(6) NOT NULL,
    promedio double(4,2) NOT NULL,
    fecha_actualizacion date,
    modificado_por varchar(128),
    operacion varchar(1) NOT NULL
);

CREATE TABLE PROFESOR_AUDITORIA (
    audit_id integer(6) PRIMARY KEY,
    expediente integer(6),
    nombre varchar(254) NOT NULL,
    apellidos varchar(254) NOT NULL,
    genero varchar(30) NOT NULL,
    salario double(4,4) NOT NULL,
    email_personal varchar(100) NOT NULL,
    email_institucional varchar(100) NOT NULL,
    contraseña varchar(200) NOT NULL,
    esta_activo boolean,
    fecha_actualizacion date,
    modificado_por varchar(128),
    operacion varchar(1) NOT NULL
);