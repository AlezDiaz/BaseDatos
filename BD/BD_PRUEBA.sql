
USE MASTER
GO
IF EXISTS(SELECT * FROM SYSDATABASES WHERE NAME='DB_PRUEBA')
DROP DATABASE DB_PRUEBA

CREATE DATABASE DB_PRUEBA
GO
USE DB_PRUEBA

CREATE TABLE EMPLEADO(
CODIGO INT PRIMARY KEY IDENTITY(1,1),
NOMBRES VARCHAR(50),
APELLIDOS VARCHAR(50),
NACIMIENTO DATETIME,
SUELDO DECIMAL(8,2)
)

CREATE PROCEDURE SP_LISTAR_EMPLEADO
AS
BEGIN
SELECT * FROM EMPLEADO
END


--- CREANDO PROCEDIMINETO ALMACENADO

CREATE PROCEDURE SP_MANTE_EMPLEADO
@CODIGO INT,@NOMBRES VARCHAR(50),@APELLIDOS VARCHAR(50),
@NACIMIENTO VARCHAR(15),@SUELDO DECIMAL(8,2),@CONDICION INT 
AS
BEGIN
 IF @CONDICION=1 ----NUEVO REGISTRO
 BEGIN
 INSERT INTO EMPLEADO VALUES(@NOMBRES,@APELLIDOS,@NACIMIENTO,@SUELDO)
 END 
  IF @CONDICION=2 ----ACTUALIZAR
  BEGIN
 UPDATE EMPLEADO SET NOMBRES=@NOMBRES,APELLIDOS=@APELLIDOS,
 NACIMIENTO=@NACIMIENTO,SUELDO=@SUELDO
 WHERE CODIGO=@CODIGO
 END
 IF @CONDICION=3 ------ELIMINAR
 BEGIN 
 DELETE FROM EMPLEADO WHERE CODIGO=@CODIGO
 END
 END


