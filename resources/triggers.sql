CREATE TRIGGER TR_ALUMNO_AUDITORIA ON ALUMNO_AUDITORIA
    FOR INSERT, UPDATE, DELETE
AS
    DECLARE @login_name varchar(128)

CREATE TRIGGER TR_PROMEDIO_AUDITORIA ON PROMEDIO_AUDITORIA
    FOR INSERT, UPDATE, DELETE
AS

CREATE TRIGGER TR_PROFESOR_AUDITORIA ON PROFESOR_AUDITORIA
    FOR INSERT, UPDATE, DELETE
AS