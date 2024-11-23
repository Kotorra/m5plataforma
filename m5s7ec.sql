select c.*
from cliente c
where c.rut not in (
    select cliente_rut
    from venta
);

select v.folio,v.fecha,v.monto,c.nombre,c.rut
from venta v
inner join cliente c on v.cliente_rut = c.rut;

select
	c.nombre,c.rut,
    sum(v.monto) as total,
    to_char(v.fecha, 'YYYY') as year,
    case
        when sum(v.monto) < 1000000 then 'Standar'
        when sum(v.monto) >= 1000000 and sum(v.monto) < 3000000 then 'Gold'
        else 'Premium'
    end as clasificacion
from venta v
inner join cliente c
on c.rut=v.cliente_rut
group by to_char(v.fecha, 'YYYY'),c.nombre,c.rut;


--4 (2 formas de realizar)
with marcas_mas_vendidas as (
    select ve.marca, count(v.folio) as num_ventas
    from venta v
    inner join vehiculo ve on v.vehiculo_idvehiculo = ve.idvehiculo
    group by ve.marca
    having count(v.folio) = ( 
        select max(num_ventas)
        from (
            select count(v.folio) as num_ventas
            from venta v
            inner join vehiculo ve on v.vehiculo_idvehiculo = ve.idvehiculo
            group by ve.marca
        )
    )
)

select v.*
from venta v
inner join vehiculo ve on v.vehiculo_idvehiculo = ve.idvehiculo
where ve.marca in (select marca from marcas_mas_vendidas);


select v.*
from venta v
inner join vehiculo ve on v.vehiculo_idvehiculo = ve.idvehiculo
where ve.marca in (
    select ve.marca
    from venta v
    inner join vehiculo ve on v.vehiculo_idvehiculo = ve.idvehiculo
    group by ve.marca
    having count(v.folio) = (
        select max(num_ventas)
        from (
            select count(v.folio) as num_ventas
            from venta v
            inner join vehiculo ve on v.vehiculo_idvehiculo = ve.idvehiculo
            group by ve.marca
        )
    )
);

--4