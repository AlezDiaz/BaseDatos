use master
go

create database PAPELETAS_DIAZ

go
use PAPELETAS_DIAZ

go
create table grado_policia(
codigo_grado int primary key,
descripcion varchar(30) not null
)

go
create table policia(
dni_plicia char(8) primary key,
nombres_policia varchar(30) not null,
apellido_pat varchar(30) not null,
apellido_mat varchar(30) not null,
codigo_grado int foreign key references grado_policia
)

go
create table papelete(
numero_papelete int primary key,
fecha date not null,
dni_policia char(8) foreign key references policia
)

go
create table infractor(
numero_licencia char(9) primary key,
dni_infractor char(8) unique,
nombre_infractor varchar(30),
apellido_pat varchar(30),
apellido_mat varchar(30),
direccion_infractor varchar(50)
)

go
create table lugar_infraccion(
codigo_infraccion int primary key,
direccion_infraccion varchar(50),
ciudad_infraccion varchar(30)
)

GO
create table infraccion(
codigo_infraccion int primary key,
descripcion varchar(50)
)

go
create table detalle_infractor(
numero_papelete int foreign key references papelete,
numero_licencia char(9) foreign key references infractor,
codigo_lugar int foreign key references lugar_infraccion,
)

go

create table gravedad_infraccion(
codigo_gravedad int primary key,
descripcion varchar(50)
)


go
create table detalle_infraccion(
numero_papeleta int foreign key references papelete,
numero_licencia char(9) foreign key references infractor,
codigo_infraccion int foreign key references infraccion,
codigo_gravedad int foreign key references gravedad_infraccion)