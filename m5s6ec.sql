CREATE TABLE cliente (
    rut        VARCHAR(10) NOT NULL,
    nombre     VARCHAR(120) NOT NULL,
    correo     VARCHAR(80) NOT NULL,
    direccion  VARCHAR(120) NOT NULL,
    celular    VARCHAR(15) NOT NULL,
    alta       CHAR(1) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( rut );

CREATE TABLE empresa (
    rut        VARCHAR(10) NOT NULL,
    nombre     VARCHAR(120) NOT NULL,
    direccion  VARCHAR(120) NOT NULL,
    telefono   NUMERIC(15) NOT NULL,
    correo     VARCHAR(80) NOT NULL,
    web        VARCHAR(50) NOT NULL
);

ALTER TABLE empresa ADD CONSTRAINT empresa_pk PRIMARY KEY ( rut );

CREATE TABLE mantencion (
    idmantencion        NUMERIC(12) NOT NULL,
    fecha               DATE NOT NULL,
    trabajosrealizados  VARCHAR(255) NOT NULL,
    venta_folio         NUMERIC(12) NOT NULL
);

ALTER TABLE mantencion ADD CONSTRAINT mantencion_pk PRIMARY KEY ( idmantencion );

CREATE TABLE marca (
    idmarca  NUMERIC(12) NOT NULL,
    nombre   VARCHAR(120) NOT NULL
);

ALTER TABLE marca ADD CONSTRAINT marca_pk PRIMARY KEY ( idmarca );

CREATE TABLE tipovehiculo (
    idtipovehiculo  NUMERIC(12) NOT NULL,
    nombre          VARCHAR(120) NOT NULL
);

ALTER TABLE tipovehiculo ADD CONSTRAINT tipovehiculo_pk PRIMARY KEY ( idtipovehiculo );

CREATE TABLE vehiculo (
    idvehiculo                   NUMERIC(12) NOT NULL,
    patente                      VARCHAR(10) NOT NULL,
    marca                        VARCHAR(20) NOT NULL,
    modelo                       VARCHAR(20) NOT NULL,
    color                        VARCHAR(15) NOT NULL,
    precio                       NUMERIC(12) NOT NULL,
    frecuenciamantencion         NUMERIC(5) NOT NULL,
    tipovehiculo_idtipovehiculo  NUMERIC(12) NOT NULL,
    marca_idmarca                NUMERIC(12) NOT NULL
);

ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pk PRIMARY KEY ( idvehiculo );

CREATE TABLE venta (
    folio                 NUMERIC(12) NOT NULL,
    fecha                 DATE NOT NULL,
    monto                 NUMERIC(12) NOT NULL,
    cliente_rut           VARCHAR(10) NOT NULL,
    vehiculo_idvehiculo   NUMERIC(12) NOT NULL
);

ALTER TABLE venta ADD CONSTRAINT venta_pk PRIMARY KEY ( folio );

ALTER TABLE mantencion
    ADD CONSTRAINT mantencion_venta_fk FOREIGN KEY ( venta_folio )
        REFERENCES venta ( folio );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_marca_fk FOREIGN KEY ( marca_idmarca )
        REFERENCES marca ( idmarca );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_tipovehiculo_fk FOREIGN KEY ( tipovehiculo_idtipovehiculo )
        REFERENCES tipovehiculo ( idtipovehiculo );

ALTER TABLE venta
    ADD CONSTRAINT venta_cliente_fk FOREIGN KEY ( cliente_rut )
        REFERENCES cliente ( rut );

ALTER TABLE venta
    ADD CONSTRAINT venta_vehiculo_fk FOREIGN KEY ( vehiculo_idvehiculo )
        REFERENCES vehiculo ( idvehiculo );


INSERT INTO empresa (rut, nombre, direccion, telefono, correo, web) VALUES
('11111111-1', 'Empresa 1', 'Av. Principal 123', '987654321', 'contacto@empresa1.cl', 'www.empresa1.cl'),
('22222222-2', 'Empresa 2', 'Calle Secundaria 456', '912345678', 'contacto@empresa2.cl', 'www.empresa2.cl');


INSERT INTO cliente (rut, nombre, correo, direccion, celular, alta) VALUES
('33333333-3', 'Juan Pérez', 'juan.perez@gmail.com', 'Calle A 789', '987654321', 'S'),
('44444444-4', 'Ana Gómez', 'ana.gomez@gmail.com', 'Av. B 321', '912345678', 'S');


INSERT INTO marca (idMarca, nombre) VALUES
(1, 'Toyota'),
(2, 'Honda'),
(3, 'Ford');


INSERT INTO tipoVehiculo (idTipoVehiculo, nombre) VALUES
(1, 'Sedán'),
(2, 'SUV'),
(3, 'Camioneta');


INSERT INTO vehiculo (idVehiculo, patente, marca, modelo, color, precio, frecuenciaMantencion, marca_idMarca, tipovehiculo_idTipoVehiculo) VALUES
(1, 'ABC123', 'Corolla', '2020', 'Rojo', 15000, 6, 1, 1),
(2, 'DEF456', 'Civic', '2019', 'Negro', 18000, 6, 2, 1),
(3, 'GHI789', 'Ranger', '2020', 'Blanco', 25000, 12 , 3, 3);


INSERT INTO venta (folio, fecha, monto, vehiculo_idVehiculo, cliente_rut) VALUES
(1001, '2020-01-10', 15000, 1, '33333333-3'),
(1002, '2020-01-15', 18000, 2, '44444444-4');


INSERT INTO mantencion (idMantencion, fecha, trabajosRealizados, venta_folio) VALUES
(1, '2020-06-10', 'Cambio de aceite', 1001),
(2, '2020-06-20', 'Revisión general', 1002);

select * from vehiculo v
    left join venta ve
    on v.idvehiculo=ve.vehiculo_idvehiculo
    where ve.vehiculo_idvehiculo is null;

select 
    venta.folio, venta.fecha, venta.monto, 
    c.nombre, c.rut, 
    v.patente, v.marca, v.modelo
from venta
inner join cliente c
on c.rut=venta.cliente_rut
inner join vehiculo v
on v.idvehiculo=venta.vehiculo_idvehiculo
where venta.fecha between '2020-01-01' and '2020-01-31';


select
    date_trunc('month', v.fecha) as mes,
    ve.marca as marca,
    sum(v.monto) as totalventas
from
    venta v
inner join
    vehiculo ve on v.vehiculo_idvehiculo = ve.idvehiculo
where
    to_char(fecha, 'YYYY') = '2020'
group by
    mes, marca
order by
    mes, marca;

select nombre,rut from cliente
union
select nombre,rut from empresa;

select to_char(fecha,'MM') as mes, count(folio) as reg from arriendo
group by mes;
