
CREATE DATABASE BDREPSOL_DIAZ
ON
(
NAME=' BDREPSOL_DIAZ _DATOS',
FILENAME='C:\BDREPSOL_DIAZ\BDREPSOL_DIAZ _DATOS.MDF',
SIZE=20MB,
MAXSIZE=80MB,
FILEGROWTH=5MB
)
LOG ON
(
NAME=' BDREPSOL_DIAZ_LOGICO',
FILENAME='C:\BDREPSOL_DIAZ\BDREPSOL_DIAZ_LOGICO.LDF',
SIZE=20MB,
MAXSIZE=100MB,
FILEGROWTH=5MB
)
GO

USE BDREPSOL_DIAZ
GO

CREATE TABLE MOVILIDAD(
NUM_PLACA CHAR(7) PRIMARY KEY NOT NULL,
TIPO_MOVILIDAD VARCHAR(50) NOT NULL,
MARCA VARCHAR(30) NOT NULL,
MODELO VARCHAR(30) NOT NULL,
COLOR VARCHAR(30) NOT NULL
)
GO

CREATE TABLE CLIENTE(
CLI_DNI CHAR(8) PRIMARY KEY NOT NULL,
CLI_NOMBRES VARCHAR(50) NOT NULL,
CLI_APELLIDOS VARCHAR(50) NOT NULL,
NUM_PLACA CHAR(7) NOT NULL
FOREIGN KEY (NUM_PLACA) REFERENCES MOVILIDAD(NUM_PLACA)
)
GO

CREATE TABLE EMPLEADO(
EMP_CODIGO CHAR(5) PRIMARY KEY NOT NULL,
EMP_DNI CHAR(8) NOT NULL,
EMP_NOMBRES VARCHAR(50) NOT NULL,
EMP_APELLIDOS VARCHAR(50) NOT NULL,
FECHA_NACIMINETO DATE NOT NULL,
FECHA_CONTRATO DATE NOT NULL,
)
GO

CREATE TABLE COMBUSTIBLE(
COMB_CODIGO VARCHAR(5) PRIMARY KEY NOT NULL,
COMB_IIPO INT NOT NULL,
COMB_DESCRIPCION VARCHAR(30) NOT NULL,
COMB_STOCK INT NOT NULL,
COMB_PRECIO FLOAT NOT NULL
)
GO

CREATE TABLE VENTA(
NUM_VENTA INT PRIMARY KEY NOT NULL,
FECHA_VENTA DATE NOT NULL,
CLI_DNI CHAR(8) NOT NULL,
EMP_CODIGO CHAR(5) NOT NULL,
FOREIGN KEY (CLI_DNI) REFERENCES CLIENTE(CLI_DNI),
FOREIGN KEY (EMP_CODIGO) REFERENCES EMPLEADO(EMP_CODIGO)
)
GO

CREATE TABLE DETALLEVENTA(
NUM_VENTA INT NOT NULL,
CANTIDAD_VENTA INT NOT NULL,
COMB_CODIGO VARCHAR(5) NOT NULL,
PRECIO_VENTA FLOAT NOT NULL
FOREIGN KEY (NUM_VENTA) REFERENCES VENTA(NUM_VENTA),
FOREIGN KEY (COMB_CODIGO) REFERENCES COMBUSTIBLE(COMB_CODIGO)
)
GO
