create table empresa(
	rut varchar(10) primary key,
	nombre varchar(120),
	direccion varchar(120),
	telefono varchar(15),
	correo varchar(80),
	web varchar(50)
);

create table cliente (
    rut VARCHAR(10) primary key,
    nombre VARCHAR(120),
    correo VARCHAR(80),
    direccion VARCHAR(120),
    celular VARCHAR(15),
    alta DATE
);

create table tipovehiculo(
	idtipovehiculo int primary key,
	nombre varchar(120)
);

create table marca(
	idmarca int primary key,
	nombre varchar(120)
);

create table vehiculo(
	idvehiculo int primary key,
	patente varchar(10),
	marca varchar(20),
	modelo varchar(20),
	color varchar(20),
	precio int,
	frecuenciamantencion int,
	marca_idmarca int,
	tipovehiculo_idtipovehiculo int,
	foreign key (marca_idmarca) references marca(idmarca),
	foreign key (tipovehiculo_idtipovehiculo) references tipovehiculo(idtipovehiculo)	
);

create table venta(
	folio int primary key,
	fecha date,
	monto int,
	vehiculo_idvehiculo int,
	cliente_rut varchar(10),
	foreign key (vehiculo_idvehiculo) references vehiculo(idvehiculo),
	foreign key (cliente_rut) references cliente(rut)
);

create table mantencion(
	idmantencion int,
	fecha date,
	trabajosrealizados varchar(1000),
	venta_folio int,
	foreign key (venta_folio) references venta(folio)
);
