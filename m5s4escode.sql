insert into empresa (rut, nombre, direccion, telefono, correo, web) values
('1234567890', 'Construcciones ABC', 'Calle Principal 123', '555123456', 'contacto@abc.com', 'www.abc.com');

insert into herramienta (idherramienta, nombre, preciodia) values
(1, 'Martillo', 5000),
(2, 'Taladro', 15000),
(3, 'Sierra', 12000),
(4, 'Llave Inglesa', 8000),
(5, 'Destornillador', 3000);

insert into cliente (rut, nombre, correo, direccion, celular) values
('1111111111', 'Juan Pérez', 'juan.perez@correo.com', 'Calle Luna 456', '999111222'),
('2222222222', 'Ana Gómez', 'ana.gomez@correo.com', 'Avenida Sol 789', '999333444'),
('3333333333', 'Pedro Ramírez', 'pedro.ramirez@correo.com', 'Calle Estrella 101', '999555666');

delete from cliente where rut='3333333333';

delete from herramienta where idherramienta=1;


insert into arriendo (folio, fecha, dias, valordia, garantia, herramienta_idherramienta, cliente_rut) values
(1001, '2024-11-10', 3, 5000, '15000', 5, '1111111111'),
(1002, '2024-11-15', 5, 12000, '20000', 3, '1111111111'),
(1003, '2024-11-12', 7, 8000, '25000', 4, '2222222222'),
(1004, '2024-11-18', 4, 15000, '30000', 2, '2222222222');


UPDATE cliente
SET email='juanpereznuevo@correo.com'
WHERE rut='1111111111';

select * from herramienta;

select * from arriendo where cliente_rut='2222222222';

select * from cliente where nombre ilike '%a%';

select nombre from herramienta where idherramienta=2;


update arriendo
set fecha='2020-01-15'
where folio=1001 or folio=1002;

select folio,fecha, valordia from arriendo
where to_char(fecha, 'YYYY') = '2020';