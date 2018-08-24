/*                         Trabajo SQl Server 2008

 AL FINALIZAR LA PRACTICA ENVIELO AL CORREO ROSASCACERES@IDAT.EDU.PE
 EN EL ASUNTO ESCRIBA "PRACTICA SQL SECCION 3206" FECHA DE ENVIO MAXIMO
 LUNES 9 DE ENERO DEL 2012.


1.Crea una BD "Bodega" con la siguiente definición:
     Archivo Primario:
	Nombre primario: Bodega_Dat
	Archivo físico: BodegaDat.mdf
	Tamaño inicial: 25mb
	Tamaño máximo: 20mb
	Incremento: 3mb
     Archivo Segundario:
	Nombre segundario: Bodega_Log
	Archivo físico: BodegaLog.Ldf
	Tamaño inicial: 10mb
	Tamaño máximo: 15mb
	Incremento: 5%
*/
use master
go
if exists(select * from sysdatabases where name='Bodega')
		Drop database Bodega
go
create database Bodega
On primary
(NAME = Bodega_dat,
FILENAME   = 'C:\BodegaDat.mdf',
SIZE       = 25MB,
MAXSIZE    = 20MB,
FILEGROWTH = 3MB)
LOG ON
(Name = Bodega_log,
Filename = 'c:\BodegaLog.ldf',
SIZE = 10MB,
FIENAME = 15MB,
FILEGROWTH = 5MB)
go
use Bodega
go



/*2.Crear una tabla con la siguiente definición:
    Nombre de la tabla: Producto
    Nombre Columna		Tipo			Restricciones
    ----------------	---------		---------------------------
	CodigoProducto		Int				Llave primaria
	NombreProducto		Varchar(20)
	FechaIngreso		Datetime
	PrecioProducto		Real			Diferente de 0
*/
create table producto
(
CodigoProducto int primary key not null,
NombreProducto nvarchar(20),
PrecioProducto real constraint c_PrecioProducto check (PrecioProducto <> 0)
 ) 

/*3.Crear una tabla con la siguiente definición:
    Nombre de la tabla: Compras
    Nombre Columna		Tipo		Restricciones
    ----------------	-------		-----------------------
	CodigoProducto		Int			Clave foránea
	CodigoCliente		Int
	CantidadComprada	real  		No aceptara valores nulos		
*/
create table compras
(
CodigoProducto int Foreign Key References Producto (CodigoProducto),
CodigoCliente int,
CantidadComprada real constraint c_CantidadComprada check (CantidadComprada  is not null)
)
go


/*4.Añada una restricción a la columna CodigoProducto de la tabla
  Producto donde solo se aceptara valore de 1 a 60. 
*/
alter table Producto
Add constraint C_CodigoProducto check (CodigoProducto between 1 and 60)

go



/*5.Añada una restricción a la columna CodigoCliente de la tabla
  Compras que no aceptara valores nulos.
*/
alter table Compras
Add constraint C_CodigoCliente check (CodigoCliente is not null)
go



/*6.Añada una nueva columna a la tabla Producto con la siguiente definición
	Nombre de la Columna	: Stock
	Tipo					: Entero
	Constraint  			: No acepta valores nulos
*/

alter table Producto
Add stock integer constraint C_stock check (stock is not null)
go

/*7.Añada una columna a la tabla Compras con nombre 
	“Observacion” Char(20).
*/
alter table Compras
Add Observacion char (20)
go

 
/*8.Añada una restricción a la columna “Observacion” de la tabla
	Compras  que tendrá como valor por default “Cliente Activado”
*/
alter table Compras
Add constraint C_Observacion default 'Cliente Activado'
FOR Observacion
go



/*9.Ingrese dos fila de datos para la  tabla Producto */

Insert into Producto Values(10260,'Leche','04/08/1994',2.80,100)
Insert into Producto Values(10261,'Conserva','04/08/1994',3.20,100)
go

/*10.Ingrese cinco filas de datos para la tabla Compras  */

Insert into Compras Values(10262,1,6)
Insert into Compras Values(10248,2,1)
Insert into Compras Values(10249,3,3)
Insert into Compras Values(10249,4,2)
Insert into Compras Values(10248,5,3)
go
 




/*11.Actualice la tabla Producto, para aquellas filas que no
	tenga Stock , ingrese  un valor de 10 unidades 
*/
update producto
set stock = 10
Where Stock is null

go





/*12.Elimine la columna Observacion de la tabla Compras  */

alter table Compras
Drop constraint C_Observacion
go
alter table Compras
Drop column Observacion
go

 




/*13.Elimine los registros de la tabla Compras donde la 
	cantidad comprada es cero
*/

Delete from compras
Where cantidadcomprada=0
go






	
