--creando base de datos personalizada
-- validando la exixtencia de la base de datos
IF DB_ID('BD_INSTITUTO') IS NOT NULL
DROP DATABASE BD_INSTITUTO
GO
CREATE DATABASE BD_INSTITUTO
ON(
NAME='BD_INSTITUTO_PRI',
FILENAME='C:\INSTITUTO\DATOS\BD_INSTITUTO_PRI.MDF',
SIZE=10MB,
MAXSIZE=200MB,
FILEGROWTH=3M
)
LOG ON
(
NAME='BD_INSTITUTO_TRA',
FILENAME='C:\INSTITUTO\TRANSACCIONES\BD_INSTITUTO_TRA.LDF',
SIZE=2MB,
MAXSIZE=80MB,
FILEGROWTH=20%
)
GO



