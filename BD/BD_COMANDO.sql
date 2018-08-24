create database BD_COMANDO
use BD_COMANDO
GO

create table clientes
codCli as varchar(30);
Nombre as varchar(50);
Pais as varchar(20);
Direc as varchar(40);
Telef char(10)
go

drop table clientes
go

select * from clientes 

create proc usp_clientes
idCliente as varchar(30);
NombreCia as varchar(50);
idPais as varchar(20);
Direccion as varchar(40);
Telefono varchar(10);
as

select * from tb_clientes
go
 create proc usp_clientes 
 (
 @idcliente as varchar(30);
 @nombre as varchar(50);
 @idpais as varchar(20);
 @direccion as varchar(40);
 @telefonoas varchar(10);
 )
 as
 insert into  tb_clientes(id