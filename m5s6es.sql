
select a.folio,a.fecha,a.valordia,c.nombre,c.rut 
from arriendo a
inner join cliente c
on c.rut=a.cliente_rut;

select a.folio,a.fecha,a.valordia,c.nombre,c.rut 
from arriendo a
left join cliente c
on c.rut=a.cliente_rut
where a.cliente_rut is null;

select nombre,rut from cliente
union
select nombre,rut from empresa;


select to_char(fecha,'MM') as mes, count(folio) as reg from arriendo
group by mes;