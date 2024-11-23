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
    celular VARCHAR(15)
);

create table herramienta(
	idherramienta int primary key,
	nombre varchar(120),
	preciodia int
);

create table arriendo(
	folio int primary key,
	fecha date,
	dias int,
	valordia int,
	garantia varchar(30),
	herramienta_idherramienta int,
	cliente_rut varchar(10),
	foreign key (herramienta_idherramienta) references herramienta(idherramienta),
	foreign key(cliente_rut) references cliente(rut)
);