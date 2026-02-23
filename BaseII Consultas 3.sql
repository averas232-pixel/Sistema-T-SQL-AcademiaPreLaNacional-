USE AcademiaPreLaNacional;
GO 

--1. SELECTS
SELECT * FROM ADMINISTRATIVO;
SELECT * FROM ASISTENCIA;
SELECT * FROM AULA;
SELECT * FROM CLIENTE;
SELECT * FROM CURSO;
SELECT * FROM DEPENDIENTE;
SELECT * FROM DOCENTE;
SELECT * FROM EMPLEADO;
SELECT * FROM EVALUACION;
SELECT * FROM INSCRIPCION;
SELECT * FROM INVENTARIO;
SELECT * FROM JEFE;
SELECT * FROM LIMPIEZA;
SELECT * FROM MATERIAL;
SELECT * FROM PAGO;
SELECT * FROM PERSONA;
SELECT * FROM PLANILLA;
SELECT * FROM RECLAMO;
SELECT * FROM SECRETARIA;
SELECT * FROM SUCURSAL;

SELECT * FROM ADMINISTRATIVO WHERE Area_Trabajo = 'Jefatura Académica';
SELECT DNI_Empleado,Funcion1 FROM ADMINISTRATIVO;
SELECT DNI_Empleado FROM ADMINISTRATIVO WHERE Funcion1 = 'Cobros';

SELECT * FROM ASISTENCIA WHERE Cod_Asistencia = 'AS001';
SELECT DNI_Cliente,DNI_Secretaria FROM ASISTENCIA WHERE Hora_Entrada = '2025-01-19 07:55:00.000';
SELECT Cod_Asistencia FROM ASISTENCIA;

SELECT Numero_Aula,Cod_Aula FROM AULA WHERE Numero_Aula >= 104 AND Numero_Aula <= 109;
SELECT * FROM AULA WHERE Cod_Inventario = 'INV002';
SELECT Capacidad FROM AULA WHERE Cod_Aula = 'A006';

SELECT * FROM CLIENTE WHERE Carrera_postula LIKE '%Ingeniería%';
SELECT DNI_Persona, Colegio_procedencia FROM CLIENTE WHERE Tipo_colegio = 'Privado';
SELECT DISTINCT Lugar_procedencia FROM CLIENTE;

SELECT Nombre, Fecha_Inicio FROM CURSO WHERE Fecha_Inicio > '2025-01-01';
SELECT * FROM CURSO WHERE Nombre = 'Física';
SELECT Codigo_Curso, DNI_Docente FROM CURSO;

SELECT * FROM DEPENDIENTE WHERE Parentesco IN ('Hijo', 'Hija');
SELECT Nombre, Telefono FROM DEPENDIENTE;
SELECT * FROM DEPENDIENTE WHERE DNI_Empleado <> '73412058';

SELECT * FROM DOCENTE WHERE Grado_Academico = 'Ingeniero';
SELECT DISTINCT Especialidad FROM DOCENTE;
SELECT DNI_Empleado, Materia1, Materia2 FROM DOCENTE;

SELECT * FROM EMPLEADO WHERE Sueldo > 2500.00;
SELECT DNI_Persona, Tipo_Empleado FROM EMPLEADO WHERE Anios_Experiencia > 5;
SELECT DNI_Persona, Fecha_Contratacion FROM EMPLEADO WHERE Sucursal_Asignada LIKE 'S001';

SELECT * FROM EVALUACION WHERE Puntaje < 180.00 AND Puntaje > 100;
SELECT Codigo_evaluacion, Puntaje FROM EVALUACION WHERE Modulo = 'A';

SELECT * FROM INSCRIPCION WHERE Fecha_inscripcion <> '2025-02-15';
SELECT DNI_Cliente, DNI_Secretaria FROM INSCRIPCION;
SELECT Codigo_inscripcion FROM INSCRIPCION WHERE DNI_Cliente = '74700189';

SELECT * FROM INVENTARIO WHERE Cantidad < 65;
SELECT Descripcion, Cod_Sucursal FROM INVENTARIO;
SELECT * FROM INVENTARIO WHERE Fecha_Actualizacion >= '2025-01-01';

SELECT DNI_Administrativo FROM JEFE;
SELECT * FROM JEFE WHERE DNI_Administrativo = '70234891';

SELECT * FROM LIMPIEZA WHERE Turno = 'Mañana y Tarde';
SELECT DNI_Empleado FROM LIMPIEZA;
SELECT * FROM LIMPIEZA WHERE Turno <> 'Noche';

SELECT Titulo, Tipo_material FROM MATERIAL WHERE Autor = 'Equipo Académico';
SELECT * FROM MATERIAL WHERE Cod_Curso = 'C001';
SELECT Titulo, Descripcion FROM MATERIAL WHERE Tipo_material = 'Libro';

SELECT * FROM PAGO WHERE Tipo_Pago = 'Efectivo';
SELECT Id_pago, Monto, DNI_Cliente FROM PAGO WHERE Estado_Pago = 1;
SELECT Monto, Fecha FROM PAGO WHERE Monto > 500;

SELECT Nombre, Apellido_Paterno, Fecha_Nacimiento FROM PERSONA WHERE Fecha_Nacimiento < '2000-01-01';
SELECT * FROM PERSONA WHERE Telefono = '987654189';
SELECT Nombre, Gmail FROM PERSONA WHERE Gmail LIKE '%@gmail.com';

SELECT Cod_Empleado, Salario_Neto FROM PLANILLA WHERE Salario_Neto > 3000;
SELECT * FROM PLANILLA WHERE Bonificaciones > 0;
SELECT Cod_Empleado, Descuento FROM PLANILLA WHERE Fecha_Pago = '2025-01-31';

SELECT * FROM RECLAMO WHERE Estado_Reclamo = 0;
SELECT Fecha_Reclamo, Descripcion FROM RECLAMO WHERE Tipo_Reclamo = 'Administrativo';
SELECT * FROM RECLAMO WHERE DNI_Cliente = '74701345';

SELECT DNI_Administrativo FROM SECRETARIA;
SELECT DNI_Administrativo FROM SECRETARIA WHERE DNI_Administrativo = '64850327';

SELECT Nombre, Direccion_Calle FROM SUCURSAL WHERE Cantidad_aulas > 15;
SELECT Telefono FROM SUCURSAL WHERE Codigo_sucursal = 'S001';
SELECT * FROM SUCURSAL WHERE Empleados_Asignados > 30;

--2. Insert

INSERT INTO PERSONA (DNI, Nombre, Apellido_Paterno, Apellido_Materno, Telefono, Gmail, Fecha_Nacimiento) VALUES
('78994512', 'Ricardo', 'Zevallos', 'Pinedo', '987000111', 'ricardo.zevallos@gmail.com', '2006-05-14'),
('78195634', 'Jimena', 'Sánchez', 'Villar', '987222333', 'jimena.sanchez@hotmail.com', '2005-11-20'),
('78196756', 'Roberto', 'Arriaga', 'Torres', '987444555', 'roberto.arriaga@outlook.com', '2006-02-03');

INSERT INTO CLIENTE (DNI_Persona, Colegio_procedencia, Lugar_procedencia, Tipo_colegio, Carrera_postula) VALUES
('78994512', 'San Juan', 'Cajamarca', 'Público', 'Ingeniería de Sistemas'),
('78195634', 'Nuestra Señora de la Merced', 'Cajamarca', 'Público', 'Administración'),
('78196756', 'San Marcelino Champagnat', 'Cajamarca', 'Público', 'Ingeniería Industrial');

INSERT INTO INVENTARIO (Codigo_Inventario, Descripcion, Cantidad, Fecha_Actualizacion, Cod_Sucursal) VALUES
('INV004', 'Sillas',585, '2025-02-10', 'S001'),
('INV005', 'Mesas', 585, '2025-02-12', 'S001');

INSERT INTO MATERIAL (Codigo_material, Autor, Titulo, Tipo_material, Descripcion, Cod_Curso, Cod_Inventario) VALUES
('MAT002', 'Equipo Académico', 'Compendio de Geometría', 'Libro', 'Ejercicios nivel avanzado', 'C001', 'INV002'),
('MAT003', 'Editorial Lumbreras', 'Física Dinámica', 'Libro', 'Teoría y práctica', 'C002', 'INV002');

INSERT INTO PAGO (Monto, Tipo_Pago, Fecha, Estado_Pago, DNI_Cliente, DNI_Secretaria) VALUES
(950.00, 'Efectivo', '2025-02-18 10:00:00', 1, '78994512', '64850327'),
(950.00, 'Tarjeta', '2025-02-18 11:30:00', 1, '78195634', '64850327'),
(950.00, 'Yape', '2025-02-18 15:45:00', 1, '78196756', '64850327');

INSERT INTO MATERIAL (Codigo_material, Autor, Titulo, Tipo_material, Descripcion, Cod_Curso, Cod_Inventario)
SELECT 
    'MAT010', 
    'Editorial Nacional', 
    'Guía Práctica ' + CU.Nombre, 
    'Libro', 
    INV.Descripcion, 
    CU.Codigo_Curso, 
    INV.Codigo_Inventario
FROM INVENTARIO INV
INNER JOIN SUCURSAL S ON INV.Cod_Sucursal = S.Codigo_sucursal
INNER JOIN CURSO CU ON CU.Nombre = 'Álgebra'
WHERE INV.Codigo_Inventario = 'INV002';

--3.Delete

DELETE P FROM PAGO P
INNER JOIN PERSONA PE ON P.DNI_Cliente = PE.DNI
WHERE PE.DNI = '78196756';

DELETE FROM CLIENTE 
WHERE DNI_Persona = '78196756';

DELETE FROM PERSONA 
WHERE DNI = '78196756';-

DELETE M
FROM MATERIAL M
INNER JOIN CURSO CU ON M.Cod_Curso = CU.Codigo_Curso
WHERE CU.Nombre = 'Física';

DELETE m
FROM MATERIAL m
WHERE EXISTS (
    SELECT 1
    FROM CURSO c
    WHERE c.Codigo_Curso = m.Cod_Curso
      AND c.Nombre = 'Física'
);
-- 4.Update

-- 1. Activar pagos (Estado_Pago = 1) para alumnos que postulan a Ingeniería
UPDATE p
SET p.Estado_Pago = 1
FROM PAGO p
INNER JOIN CLIENTE c ON p.DNI_Cliente = c.DNI_Persona
WHERE c.Carrera_postula = 'Ingeniería'
  AND p.Estado_Pago = 0;

  -- 2. Aumentar Sueldo +200.00 a empleados no docentes en sucursales con "Cajamarca" en el nombre
UPDATE e
SET e.Sueldo = e.Sueldo + 200.00
FROM EMPLEADO e
INNER JOIN SUCURSAL s ON e.Sucursal_Asignada = s.Codigo_sucursal
WHERE s.Nombre LIKE '%Cajamarca%'
  AND e.Tipo_Empleado <> 'Docente'
  AND e.Sueldo IS NOT NULL;
  -- 1. Actualizar el estado de todos los reclamos pendientes (Estado_Reclamo = 0) a resueltos (1)
-- solo para reclamos de alumnos que postulan a Medicina
UPDATE r
SET r.Estado_Reclamo = 1,
    r.Fecha_Reclamo = GETDATE()  -- opcional: actualizar fecha si se resuelve ahora
FROM RECLAMO r
INNER JOIN CLIENTE c ON r.DNI_Cliente = c.DNI_Persona
WHERE c.Carrera_postula = 'Medicina'
  AND r.Estado_Reclamo = 0;
  -- 2. Aumentar 15% el sueldo a todos los docentes con más de 8 años de experiencia
-- y que estén asignados a la sucursal S001
UPDATE e
SET e.Sueldo = e.Sueldo * 1.15
FROM EMPLEADO e
INNER JOIN DOCENTE d ON e.DNI_Persona = d.DNI_Empleado
WHERE e.Anios_Experiencia > 8
  AND e.Sucursal_Asignada = 'S001'
  AND e.Tipo_Empleado = 'Docente';
--5.Procedimientos almacenados

--Registro de incripcion mas el pago de alumno
CREATE OR ALTER PROCEDURE sp_RegistrarInscripcionYPago
    @DNI_Cliente        CHAR(8),
    @DNI_Secretaria     CHAR(8),
    @Fecha_Inscripcion  DATE           = NULL,
    @Monto              DECIMAL(10,2),
    @Tipo_Pago          VARCHAR(30),
    @Carrera_Postula    VARCHAR(30)    = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        IF NOT EXISTS (SELECT 1 FROM CLIENTE WHERE DNI_Persona = @DNI_Cliente)
        BEGIN
            RAISERROR('El DNI del cliente no existe en la tabla CLIENTE.', 16, 1);
            RETURN;
        END

        IF NOT EXISTS (SELECT 1 FROM SECRETARIA WHERE DNI_Administrativo = @DNI_Secretaria)
        BEGIN
            RAISERROR('El DNI de la secretaria no es válido.', 16, 1);
            RETURN;
        END
        DECLARE @UltimoNumero INT = 0;
        DECLARE @Cod_Inscripcion VARCHAR(10);

        SELECT @UltimoNumero = ISNULL(MAX(CAST(Codigo_inscripcion AS INT)), 0)
        FROM INSCRIPCION
        WHERE Codigo_inscripcion NOT LIKE '%[^0-9]%';   

        DECLARE @NuevoNumero INT = @UltimoNumero + 1;
        SET @Cod_Inscripcion = RIGHT('0000' + CAST(@NuevoNumero AS VARCHAR(4)), 4);

        INSERT INTO INSCRIPCION 
            (Codigo_inscripcion, DNI_Cliente, DNI_Secretaria, Fecha_inscripcion)
        VALUES 
            (@Cod_Inscripcion, 
             @DNI_Cliente, 
             @DNI_Secretaria, 
             ISNULL(@Fecha_Inscripcion, CAST(GETDATE() AS DATE)));

        IF @Carrera_Postula IS NOT NULL
        BEGIN
            UPDATE CLIENTE
               SET Carrera_postula = @Carrera_Postula
             WHERE DNI_Persona = @DNI_Cliente;
        END

        INSERT INTO PAGO 
            (Monto, Tipo_Pago, Fecha, Estado_Pago, DNI_Cliente, DNI_Secretaria)
        VALUES 
            (@Monto, @Tipo_Pago, GETDATE(), 1, @DNI_Cliente, @DNI_Secretaria);

        COMMIT TRANSACTION;

        SELECT 
            'Inscripción y pago registrados correctamente' AS Mensaje,
            @Cod_Inscripcion                               AS CodigoInscripcion;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMsg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMsg, 16, 1);
    END CATCH
END;
--Ejecucion
EXEC sp_RegistrarInscripcionYPago
    @DNI_Cliente     = '78994512',
    @DNI_Secretaria  = '64850327',
    @Monto           = 950.00,
    @Tipo_Pago       = 'Yape',
    @Carrera_Postula = 'Medicina Humana';
--Por si se desea eliminar el procedimiento almacenado
DROP PROCEDURE sp_RegistrarInscripcionYPago;

--procedimiento almacenado donde si 
--la secretaria logra el pago de 2 alumnos hermanos, se le de un bono de 50 soles
CREATE PROCEDURE sp_BonoHermanosSecretaria
    @DNI_NuevoAlumno CHAR(8),
    @DNI_Secretaria CHAR(8),
    @MontoPago DECIMAL(10,2),
    @TipoPago VARCHAR(30)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO PAGO (Monto, Tipo_Pago, Fecha, Estado_Pago, DNI_Cliente, DNI_Secretaria)
    VALUES (@MontoPago, @TipoPago, GETDATE(), 1, @DNI_NuevoAlumno, @DNI_Secretaria);
    IF EXISTS (
        SELECT 1 
        FROM DEPENDIENTE D1
        INNER JOIN DEPENDIENTE D2 ON D1.DNI_Empleado = D2.DNI_Empleado 
        WHERE D1.DNI_Dependiente = @DNI_NuevoAlumno         
        AND D2.DNI_Dependiente <> @DNI_NuevoAlumno          
        AND EXISTS (SELECT 1 FROM CLIENTE WHERE DNI_Persona = D2.DNI_Dependiente) 
    )
    BEGIN
        UPDATE PLANILLA
        SET Bonificaciones = Bonificaciones + 50.00
        WHERE Cod_Empleado = @DNI_Secretaria 
        AND MONTH(Fecha_Pago) = MONTH(GETDATE()) 
        AND YEAR(Fecha_Pago) = YEAR(GETDATE());

        PRINT '¡Bono de 50 soles aplicado! Se detectó que el alumno tiene un hermano en la academia.';
    END
    ELSE
    BEGIN
        PRINT 'Pago registrado. No se detectaron hermanos para aplicar el bono.';
    END
END;
--Ejecucion
EXEC sp_BonoHermanosSecretaria 
    @DNI_NuevoAlumno = '75194512', 
    @DNI_Secretaria = '64850327', 
    @MontoPago = 950.00, 
    @TipoPago = 'Efectivo';
--Por si se desea eliminar el procedimiento almacenado
DROP PROCEDURE sp_BonoHermanosSecretaria;

--Registrar alumnos con pagos pendientes
CREATE PROCEDURE sp_ListarAlumnosConDeuda
    @MontoMinimoPendiente DECIMAL(10,2) = 0.00
AS
BEGIN
    SET NOCOUNT ON;

    WITH Deudas AS (
        SELECT 
            c.DNI_Persona                           AS DNI_Alumno,
            p.Nombre + ' ' + p.Apellido_Paterno + ' ' + ISNULL(p.Apellido_Materno, '') 
                                                    AS Nombre_Completo,
            c.Carrera_postula,
            COUNT(pa.Id_pago)                       AS Cantidad_Pagos,
            ISNULL(SUM(pa.Monto), 0)                AS Pagado,
            950.00                                  AS Monto_Esperado,   
            950.00 - ISNULL(SUM(pa.Monto), 0)       AS Deuda
        FROM CLIENTE c
        INNER JOIN PERSONA p ON p.DNI = c.DNI_Persona
        LEFT JOIN PAGO pa ON pa.DNI_Cliente = c.DNI_Persona 
                         AND pa.Estado_Pago = 1
        GROUP BY 
            c.DNI_Persona,
            p.Nombre, p.Apellido_Paterno, p.Apellido_Materno,
            c.Carrera_postula
    )
    SELECT *
    FROM Deudas
    WHERE Deuda > @MontoMinimoPendiente
    ORDER BY Deuda DESC;
END;
--Ejecucion
EXEC sp_ListarAlumnosConDeuda @MontoMinimoPendiente = 0;
EXEC sp_ListarAlumnosConDeuda @MontoMinimoPendiente = 200.00;
----Por si se desea eliminar el procedimiento almacenado
DROP PROCEDURE sp_ListarAlumnosConDeuda;

--Mostrar asistencias mensuales de los alumnos 
CREATE PROCEDURE sp_ConteoAsistenciaMensual
    @Mes   INT,
    @Anio  INT
AS
BEGIN
    SELECT 
        c.DNI_Persona                           AS DNI,
        pe.Nombre + ' ' + pe.Apellido_Paterno   AS Alumno,
        COUNT(*)                                AS Veces_Registrado,
        COUNT(DISTINCT CAST(a.Hora_Entrada AS DATE)) AS Dias_Con_Asistencia
    FROM ASISTENCIA a
    INNER JOIN CLIENTE c ON c.DNI_Persona = a.DNI_Cliente
    INNER JOIN PERSONA pe ON pe.DNI = c.DNI_Persona
    WHERE YEAR(a.Hora_Entrada) = @Anio
      AND MONTH(a.Hora_Entrada) = @Mes
    GROUP BY 
        c.DNI_Persona,
        pe.Nombre,
        pe.Apellido_Paterno
    ORDER BY Dias_Con_Asistencia DESC;
END;
--Ejecucion
EXEC sp_ConteoAsistenciaMensual
    @Mes = 1, 
    @Anio = 2026;
--Por si se desea eliminar
DROP PROCEDURE sp_ConteoAsistenciaMensual;


-- Calculo de edad
CREATE FUNCTION dbo.fn_CalcularEdad
(
    @FechaNacimiento DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @Edad INT;

    SET @Edad = DATEDIFF(YEAR, @FechaNacimiento, GETDATE());

    IF (MONTH(@FechaNacimiento) > MONTH(GETDATE())) 
       OR (MONTH(@FechaNacimiento) = MONTH(GETDATE()) 
           AND DAY(@FechaNacimiento) > DAY(GETDATE()))
    BEGIN
        SET @Edad = @Edad - 1;
    END

    RETURN @Edad;
END;

SELECT p.Nombre,
       dbo.fn_CalcularEdad(fecha_nacimiento) AS Edad
FROM PERSONA p INNER JOIN CLIENTE c ON p.DNI = c.DNI_PERSONA;

-- Pagos
CREATE FUNCTION dbo.fn_TotalPago
(
    @dniCliente CHAR(8)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2);

    SELECT @Total = ISNULL(SUM(Monto),0)
    FROM PAGO
    WHERE DNI_Cliente = @dniCliente;

    RETURN @Total;
END;
 
 SELECT DNI_Cliente,
       dbo.fn_TotalPago(DNI_Cliente) AS TotalPagado
FROM PAGO;



CREATE FUNCTION dbo.fn_CalcularPuntajeEvaluacion
(
    @CorrectasAptitud INT,
    @CorrectasConocimiento INT,
    @TotalIncorrectas INT
)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @Puntaje DECIMAL(5,2);

    SET @Puntaje =
        (@CorrectasAptitud * 8) +
        (@CorrectasConocimiento * 6) -
        (@TotalIncorrectas * 0.51);

    RETURN @Puntaje;
END;
INSERT INTO EVALUACION
VALUES (
'EV013',
'74700189',
'A',
'2025-03-25',
dbo.fn_CalcularPuntajeEvaluacion(22, 40, 28)
);
SELECT * FROM EVALUACION WHERE Codigo_evaluacion = 'EV013';

--Estudiante y su inscripcion
CREATE VIEW vw_EstudiantesDetalle
AS
SELECT 
    p.DNI,
    p.Nombre,
    (p.Apellido_Paterno + ' '+p.Apellido_Materno) as Apellidos,
    i.fecha_inscripcion
FROM CLIENTE cl
INNER JOIN PERSONA p ON cl.DNI_Persona = p.DNI
INNER JOIN INSCRIPCION i ON cl.DNI_Persona = I.DNI_Cliente

SELECT * FROM vw_EstudiantesDetalle;

--Datos Docentes
CREATE VIEW vw_ReporteDocente
AS
SELECT 
    p.DNI,
    p.Nombre,
   (p.Apellido_Paterno + ' '+p.Apellido_Materno) as Apellidos,
    c.Nombre as NombreCurso,
    c.descripcion
FROM DOCENTE d
INNER JOIN PERSONA p ON d.DNI_Empleado = p.DNI
LEFT JOIN CURSO c ON d.DNI_Empleado = c.DNI_Docente;

select *from vw_ReporteDocente;

--Reporte Inventario

CREATE VIEW vw_Inventario
AS
SELECT 
    m.Codigo_material,
    m.descripcion,
    i.Cantidad,
    m.Tipo_material
FROM INVENTARIO i
INNER JOIN MATERIAL m ON i.Codigo_Inventario = m.Cod_Inventario;

select*from vw_Inventario;

--Constraints 

-- 1. Restringe que el monto de pago sea mayor a 0
IF NOT EXISTS (
    SELECT 1 
    FROM sys.check_constraints 
    WHERE name = 'CHK_Pago_Monto_Positivo' 
      AND parent_object_id = OBJECT_ID('PAGO')
)
BEGIN
    ALTER TABLE PAGO
    ADD CONSTRAINT CHK_Pago_Monto_Positivo
    CHECK (Monto > 0.00);
    
    PRINT 'Constraint CHK_Pago_Monto_Positivo creado correctamente.';
END
ELSE
BEGIN
    PRINT 'El constraint CHK_Pago_Monto_Positivo ya existe.';
END
GO

INSERT INTO PAGO (Monto, Tipo_Pago, Fecha, Estado_Pago, DNI_Cliente, DNI_Secretaria)
VALUES (-10.00, 'Efectivo', GETDATE(), 1, '74700189', '64850327');

-- 2. Impide que se registren evaluaciones con fecha futura
IF NOT EXISTS (
    SELECT 1 
    FROM sys.check_constraints 
    WHERE name = 'CHK_Evaluacion_Fecha_NoFutura' 
      AND parent_object_id = OBJECT_ID('EVALUACION')
)
BEGIN
    ALTER TABLE EVALUACION
    ADD CONSTRAINT CHK_Evaluacion_Fecha_NoFutura
    CHECK (Fecha_evaluacion <= CAST(GETDATE() AS DATE));
    
    PRINT 'Constraint CHK_Evaluacion_Fecha_NoFutura creado correctamente.';
END
ELSE
BEGIN
    PRINT 'El constraint CHK_Evaluacion_Fecha_NoFutura ya existe.';
END
GO

-- Prueba constraint 2 (debería fallar si la fecha es futura)
INSERT INTO EVALUACION (Codigo_evaluacion, DNI_Cliente, Modulo, Fecha_evaluacion, Puntaje)
VALUES ('EV999', '74700189', 'A', '2026-12-31', 300.00);

-- 3. Limita los valores permitidos en Tipo_colegio (CLIENTE)
IF NOT EXISTS (
    SELECT 1 
    FROM sys.check_constraints 
    WHERE name = 'CHK_Cliente_TipoColegio_Valido' 
      AND parent_object_id = OBJECT_ID('CLIENTE')
)
BEGIN
    ALTER TABLE CLIENTE
    ADD CONSTRAINT CHK_Cliente_TipoColegio_Valido
    CHECK (Tipo_colegio IN ('Público', 'Privado'));
    
    PRINT 'Constraint CHK_Cliente_TipoColegio_Valido creado correctamente.';
END
ELSE
BEGIN
    PRINT 'El constraint CHK_Cliente_TipoColegio_Valido ya existe.';
END
GO

UPDATE CLIENTE 
SET Tipo_colegio = 'SemiPrivado' 
WHERE DNI_Persona = '74700189';

--
-- t1, auditoría de pagos
CREATE OR ALTER TRIGGER trg_PAGO_Auditoria
ON dbo.PAGO
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    IF EXISTS (SELECT 1 FROM inserted WHERE Fecha > GETDATE())
    BEGIN
        RAISERROR('La fecha de pago no puede ser futura', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    PRINT 'Pago registrado correctamente. Total de registros afectados: ' + 
          CAST(@@ROWCOUNT AS VARCHAR(10));
END;
GO
INSERT INTO PAGO (Monto, Tipo_Pago, Fecha, Estado_Pago, DNI_Cliente, DNI_Secretaria)
VALUES (950.00, 'Yape', '2026-12-31', 1, '74701345', '64850327');
GO

-- t2, validar coherencia de datos en PLANILLA
CREATE OR ALTER TRIGGER trg_PLANILLA_Validar_Datos
ON dbo.PLANILLA
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    IF EXISTS (SELECT 1 FROM inserted WHERE Salario_Bruto <= 0)
    BEGIN
        RAISERROR('El salario bruto debe ser mayor a cero', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    IF EXISTS (SELECT 1 FROM inserted WHERE ISNULL(Descuento, 0) > Salario_Bruto)
    BEGIN
        RAISERROR('El descuento no puede ser mayor al salario bruto', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    PRINT 'Planilla registrada correctamente.';
END;
GO
INSERT INTO PLANILLA (Cod_Planilla, Cod_Empleado, Salario_Bruto, Descuento, Bonificaciones, Fecha_Pago)
VALUES ('PL998', '70234891', 0.00, 0.00, 0.00, '2025-04-30');
GO

-- t3, validar horarios de asistencia
CREATE OR ALTER TRIGGER trg_ASISTENCIA_Validar_Horarios
ON dbo.ASISTENCIA
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    IF EXISTS (
        SELECT 1 
        FROM inserted 
        WHERE Hora_Salida IS NOT NULL 
          AND Hora_Salida <= Hora_Entrada
    )
    BEGIN
        RAISERROR('La hora de salida debe ser posterior a la hora de entrada', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO
INSERT INTO ASISTENCIA (Cod_Asistencia, DNI_Cliente, DNI_Secretaria, Hora_Entrada, Hora_Salida)
VALUES ('AS998', '74700189', '64850327', '2025-03-25 08:00:00', '2025-03-25 07:59:00');
GO






