create database Mantenimiento
go

use Mantenimiento
go

create table Cliente(
codigo int primary key,
nombre varchar(30),
sexo char(1),
fecha date
)

create table Usuario(
codigo int primary key,
nombre varchar(30) not null,
sexo char(1) null
)

insert into Usuario values(5,'',null)

select * from Usuario
go

create proc ListarCliente
as
	begin
		select * from Cliente	
	end
go

alter proc InsertarCliente
@nombre varchar(30),
@codigo int  ,
@sexo char(1),
@fecha date
as
	begin
		insert into Cliente values(@nombre,@codigo,@sexo,@fecha)
		insert into Cliente (nombre,codigo,sexo,fecha) 
		values(@nombre,@codigo,@sexo,@fecha)
	end

	insert into cliente values
('C0001','Alex Diaz','01-295-3988','Av,Arequipa 790','01/02/1978'),
('C0002','Juan Jesus','01-234-5678','Av,Arenales 890','01/06/1980'),
('C0003','Mollo Quispe','01-345-3427','Av,Colmena 111','01/02/1990'),
('C0004','wilson Diaz','01-567-8796','Av,Miguel Grau 222','01/02/2001'),
('C0005','Monica Quispe','01-546-7843','Av,Lampa 543','01/02/2000')

















