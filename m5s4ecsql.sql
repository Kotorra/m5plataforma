create table departamentos(
	id int primary key,
	nombre varchar(100) not null,
	ubicacion varchar(100) not null
);

create table empleados(
	id int primary key,
	nombre varchar(100) not null,
	puesto varchar(100) not null,
	salario decimal(12, 2) not null,
	fecha_contratacion date not null,
	departamento_id int,
	foreign key (departamento_id) references departamentos(id)
);

alter table empleados add email varchar(100);
alter table empleados rename to trabajadores;
drop table departamentos cascade;
