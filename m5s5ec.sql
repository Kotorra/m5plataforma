create table editoriales(
	codigo serial primary key,
	nombre varchar(50)
);


create table libros(
	codigo serial primary key,
	titulo varchar,
	precio int,
	codigo_editorial int,
	foreign key (codigo_editorial) references editoriales(codigo)
);

insert into editoriales (codigo,nombre) values
	(1,'Anaya'),
	(2,'Andina'),
	(3,'S.M.');

insert into libros (titulo,autor,precio,codigo_editorial) values
	('Don Quijote de La Mancha I','Miguel de Cervantes',150,1),
	('El principito','Antoine SaintExupery',120,2),
	('El príncipe','Maquiavelo',180,3),
	('Diplomacia','Henry Kissinger',170,3),
	('Don Quijote de La Mancha 2','Miguel de Cervantes',140,1);

insert into libros (titulo,autor,precio,codigo_editorial) values
	('La peste','Albert Camus',190,2),
	('Ciencia y conducta humana','B.F. Skinner',250,3);

begin;

	delete from libros where codigo_editorial=1;
	
rollback;



begin;

	update editoriales
		set nombre='Iberlibro'
		where codigo=2;


begin;
	update editoriales
		set nombre='Mountain'
		where codigo=3;
commit;
