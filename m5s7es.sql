select c.*
from cliente c
where c.rut not in (
    select cliente_rut
    from arriendo
);


select a.folio,a.fecha,a.valordia,c.nombre,c.rut
from arriendo a
inner join cliente c on a.cliente_rut = c.rut;

select
    c.nombre,c.rut,
    count(folio) as arriendos,
    to_char(a.fecha, 'MM') as mes,
    case
        when count(a.folio)=1 or count(a.folio)=0 then 'Bajo'
        when count(a.folio) >1 and count(a.folio) < 3 then 'Medio'
        else 'Alto'
    end as clasificacion
from arriendo a
inner join cliente c
on c.rut=a.cliente_rut
group by mes,c.nombre,c.rut;


select nombre,rut,herramienta_idherramienta, num_arriendos,hnombre
from (
    select c.nombre,c.rut,a.herramienta_idherramienta,h.nombre as hnombre, count(a.folio) as num_arriendos
    from arriendo a
    inner join cliente c
    on c.rut=a.cliente_rut
    inner join herramienta h
    on h.idherramienta=a.herramienta_idherramienta
    group by a.herramienta_idherramienta,c.nombre,c.rut,h.nombre
)
where num_arriendos = (
    select max(num_arriendos)
    from (
        select count(a.folio) as num_arriendos
        from arriendo a
        group by a.herramienta_idherramienta
    )
);