-- Se agrega los valores del alumno cada vez que hay un insert
CREATE OR REPLACE  TRIGGER TR_ALUMNO_AUDITORIA_INSERT
    BEFORE INSERT
ON ALUMNO
FOR EACH ROW
    INSERT INTO ALUMNO_AUDITORIA
    (
        expediente,
        new_email_personal,
        new_email_institucional,
        new_nip,
        new_promedio_general,
        fecha_actualizacion,
        modificado_por,
        operacion
    )
    VALUES
    (
        NEW.expediente,
        NEW.email_personal,
        NEW.email_institucional,
        NEW.nip,
        NEW.promedio_general,
        SYSDATE(),
        (SELECT USER()),
        'I'
    );

-- Se agrega los valores del alumno cada vez que hay un update
CREATE OR REPLACE  TRIGGER TR_ALUMNO_AUDITORIA_UPDATE
    BEFORE UPDATE
ON ALUMNO
FOR EACH ROW
    INSERT INTO ALUMNO_AUDITORIA
    (
        expediente,
        old_email_personal,
        old_email_institucional,
        old_nip,
        old_promedio_general,
        new_email_personal,
        new_email_institucional,
        new_nip,
        new_promedio_general,
        fecha_actualizacion,
        modificado_por,
        operacion
    )
    VALUES
    (
        NEW.expediente,
        OLD.email_personal,
        OLD.email_institucional,
        OLD.nip,
        OLD.promedio_general,
        NEW.email_personal,
        NEW.email_institucional,
        NEW.nip,
        NEW.promedio_general,
        SYSDATE(),
        (SELECT USER()),
        'U'
    );

-- Se agrega los valores del alumno cada vez que hay un delete
CREATE OR REPLACE  TRIGGER TR_ALUMNO_AUDITORIA_DELETE
    BEFORE DELETE
ON ALUMNO
FOR EACH ROW
    INSERT INTO ALUMNO_AUDITORIA
    (
        expediente,
        old_email_personal,
        old_email_institucional,
        old_nip,
        old_promedio_general,
        fecha_actualizacion,
        modificado_por,
        operacion
    ) 
    VALUES
    (
        OLD.expediente,
        OLD.email_personal,
        OLD.email_institucional,
        OLD.nip,
        OLD.promedio_general,
        SYSDATE(),
        (SELECT USER()),
        'D'
    );

-- Se agrega los valores del promedio cada vez que hay un insert
CREATE OR REPLACE  TRIGGER TR_PROMEDIO_AUDITORIA_INSERT
    BEFORE INSERT
ON PROMEDIO
FOR EACH ROW
    INSERT INTO PROMEDIO_AUDITORIA
    (
        expediente_alumno,
        new_expediente_materia,
        new_promedio,
        fecha_actualizacion,
        modificado_por,
        operacion
    )
    VALUES
    (
        NEW.expediente_alumno,
        NEW.expediente_materia,
        NEW.promedio,
        SYSDATE(),
        (SELECT USER()),
        'I'
    );

-- Se agrega los valores del promedio cada vez que hay un update
CREATE OR REPLACE  TRIGGER TR_PROMEDIO_AUDITORIA_UPDATE
    BEFORE UPDATE
ON PROMEDIO
FOR EACH ROW
    INSERT INTO PROMEDIO_AUDITORIA
    (
        expediente_alumno,
        old_expediente_materia,
        old_promedio,
        new_expediente_materia,
        new_promedio,
        fecha_actualizacion,
        modificado_por,
        operacion
    )
    VALUES
    (

        NEW.expediente_alumno,
        OLD.expediente_materia,
        OLD.promedio,
        NEW.expediente_materia,
        NEW.promedio,
        SYSDATE(),
        (SELECT USER()),
        'U'
    );

-- Se calcula el promedio general del alumno cada vez que hay un insert 
CREATE OR REPLACE  TRIGGER CALCULAR_PROMEDIO_INSERT
    AFTER INSERT
ON PROMEDIO
FOR EACH ROW
    UPDATE ALUMNO 
    SET promedio_general = 
    (
        SELECT AVG(promedio)
        FROM PROMEDIO
        WHERE expediente_alumno = NEW.expediente_alumno
    )
    WHERE expediente = NEW.expediente_alumno;

-- Se calcula el promedio general del alumno cada vez que hay un update 
CREATE OR REPLACE  TRIGGER CALCULAR_PROMEDIO_UPDATE
    AFTER UPDATE
ON PROMEDIO
FOR EACH ROW
    UPDATE ALUMNO 
    SET promedio_general = 
    (
        SELECT AVG(promedio)
        FROM PROMEDIO
        WHERE expediente_alumno = NEW.expediente_alumno
    )
    WHERE expediente = NEW.expediente_alumno;

-- Se calcula el promedio general del alumno cada vez que hay un delete 
CREATE OR REPLACE  TRIGGER CALCULAR_PROMEDIO_DELETE
    AFTER DELETE
ON PROMEDIO
FOR EACH ROW
    UPDATE ALUMNO 
    SET promedio_general = 
    (
        SELECT AVG(promedio)
        FROM PROMEDIO
        WHERE expediente_alumno = OLD.expediente_alumno
    )
    WHERE expediente = OLD.expediente_alumno;

-- Se agrega los valores del profesor cada vez que hay un insert
CREATE OR REPLACE  TRIGGER TR_PROFESOR_AUDITORIA_INSERT
    BEFORE INSERT
ON PROFESOR
FOR EACH ROW
    INSERT INTO PROFESOR_AUDITORIA
    (
        expediente,
        new_salario,
        new_email_personal,
        new_email_institucional,
        new_contraseña,
        new_esta_activo,
        fecha_actualizacion,
        modificado_por,
        operacion
    )
    VALUES
    (
        NEW.expediente,
        NEW.salario,
        NEW.email_personal,
        NEW.email_institucional,
        NEW.contraseña,
        NEW.esta_activo,
        SYSDATE(),
        (SELECT USER()),
        'I'
    );
    
-- Se agrega los valores del profesor cada vez que hay un update
CREATE OR REPLACE  TRIGGER TR_PROFESOR_AUDITORIA_UPDATE
    BEFORE UPDATE
ON PROFESOR
FOR EACH ROW
    INSERT INTO PROFESOR_AUDITORIA
    (
        expediente,
        new_salario,
        new_email_personal,
        new_email_institucional,
        new_contraseña,
        new_esta_activo,
        old_salario,
        old_email_personal,
        old_email_institucional,
        old_contraseña,
        old_esta_activo,
        fecha_actualizacion,
        modificado_por,
        operacion
    )
    VALUES
    (
        NEW.expediente,
        NEW.salario,
        NEW.email_personal,
        NEW.email_institucional,
        NEW.contraseña,
        NEW.esta_activo,
        OLD.salario,
        OLD.email_personal,
        OLD.email_institucional,
        OLD.contraseña,
        OLD.esta_activo,
        SYSDATE(),
        (SELECT USER()),
        'U'
    );

-- Se agrega los valores del profesor cada vez que hay un delete
CREATE OR REPLACE  TRIGGER TR_PROFESOR_AUDITORIA_DELETE
    BEFORE DELETE
ON PROFESOR
FOR EACH ROW
    INSERT INTO PROFESOR_AUDITORIA 
    (
        expediente,
        old_salario,
        old_email_personal,
        old_email_institucional,
        old_contraseña,
        old_esta_activo,
        fecha_actualizacion,
        modificado_por,
        operacion
    )
    VALUES
    (
        OLD.expediente,
        OLD.salario,
        OLD.email_personal,
        OLD.email_institucional,
        OLD.contraseña,
        OLD.esta_activo,
        SYSDATE(),
        (SELECT USER()),
        'D'
    );

-- Se agrega un alumno al total de estudiantes por grupo
CREATE OR REPLACE  TRIGGER TR_TOTAL_SUMAR_ALUMNOS_GRUPO
BEFORE INSERT
ON ALUMNO
FOR EACH ROW
    UPDATE GRUPO
    SET total_estudiantes = total_estudiantes + 1
    WHERE expediente = NEW.expediente_grupo;

-- Se resta un alumno al total de estudiantes por grupo
CREATE OR REPLACE  TRIGGER TR_TOTAL_RESTAR_ALUMNOS_GRUPO
BEFORE DELETE
ON ALUMNO
FOR EACH ROW
    UPDATE GRUPO
    SET total_estudiantes = total_estudiantes - 1
    WHERE expediente = OLD.expediente_grupo;