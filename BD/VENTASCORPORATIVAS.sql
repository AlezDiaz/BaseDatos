use master
go
/*
archivos de base de datos agrupados y se tiene en grupoo defaul llamado primary
log de transacciones 
*/
create database VentasCorporativas
on primary
(name='ventas', filename='c:\data\ventascorp.mdf',
size=200MB, maxsize=5000MB,filegrowth=25%)
log on
(name='ventaslog', filename='c:\data\ventascorplof.ldf',
size=100MB, maxsize=1000MB, filegrowth=25%)
go
