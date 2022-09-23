CREATE DATABASE Asignacion1;

USE Asignacion1;

GO
CREATE TABLE Hotel(
Codigo VARCHAR(50) PRIMARY KEY,
Nombre VARCHAR(50) not null,
Direccion VARCHAR(50) not null);

insert into Hotel values('H1-2001','Clarion','Tegucigalpa, kennedy');
insert into Hotel values('H1-2002','Relay','Tegucigalpa, Plaza');
insert into Hotel values('H1-2003','Clinton','Tegucigalpa, Emisoras');

GO
CREATE TABLE Cliente(
IDN	INT PRIMARY KEY,
Nombre VARCHAR(50) not null,
Telefono VARCHAR(50) not null
);

insert into Cliente values(04021,
'Juan David',
'99-88-77-33'),(0302,'Carlos Moncada','88-99-55-66');

select * from Cliente;

GO
CREATE TABLE Reserva(
Codigo_reserva VARCHAR(100) PRIMARY KEY,
FechaIni DATETIME,
FechaOut DATETIME,
Cantidad_Personas int default 0,
IDN_Cliente	INT,
Codigo_Hotel VARCHAR(50),
FOREIGN KEY(IDN_Cliente) REFERENCES Cliente(IDN),
FOREIGN KEY(Codigo_Hotel) REFERENCES Hotel(Codigo)
);

insert into Reserva(FechaIni,FechaOut,Codigo_Hotel,IDN_Cliente,Codigo_reserva) values(CURRENT_TIMESTAMP,24/9/2022,'H1-2003'
,04021,122
);

select*from Reserva;

GO
CREATE TABLE Aerolinea(
Codigo VARCHAR(50) PRIMARY KEY,
Descuento decimal(10,2)
CHECK(Descuento>=10)
);

Insert into Aerolinea values('AE-123',10)
Insert into Aerolinea values('AE-124',11)
select*from Aerolinea;

GO
CREATE TABLE Boleto(
Codigo VARCHAR(50) PRIMARY KEY,
No_Vuelo VARCHAR(50) not null,
Fecha DATETIME not null,
Destino VARCHAR(100) not null 
CHECK(Destino='Mexico' OR Destino='Guatemala' OR Destino='Panama'),
IDN_Cliente	INT,
FOREIGN KEY(IDN_Cliente) REFERENCES Cliente(IDN),
Codigo_Aerolinea VARCHAR(50),
FOREIGN KEY(Codigo_Aerolinea) REFERENCES Aerolinea(Codigo)
);

insert into Boleto values('B-121','V12G',CURRENT_TIMESTAMP,'Guatemala',1232,'AE-123');
insert into Boleto values('B-123','V12P',CURRENT_TIMESTAMP,'Panama',1232,'AE-123');
insert into Boleto values('B-124','V12H',CURRENT_TIMESTAMP,'Honduras',1232,'AE-123');

select*from Boleto;

select Cantidad_Personas from Reserva;

select*from Hotel;