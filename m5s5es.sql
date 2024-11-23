select 
    p.*, 
    string_agg(r.actor, ', ') as actores
from        
    peliculas p
inner join reparto r on r.id_pelicula = p.id
where
    p.pelicula = 'Titanic'
group by 
    p.id;

select 
    p.director,count(p.director) as peliculas_dirigidas
from 
    peliculas p
group by
    p.director
order by 
    peliculas_dirigidas desc
limit 10;

select count(distinct actor) from reparto;


select
    * 
from 
    peliculas
where
    estreno 
between
    1990 and 1999
order by
    pelicula asc; 


select 
    r.actor
from        
    peliculas p
inner join reparto r on r.id_pelicula = p.id

where
    p.estreno = (SELECT MAX(estreno) FROM peliculas);

begin;
insert into peliculas(id,pelicula,estreno,director) values
    (101,'The Revenant','2015','Alejandro González Iñárritu');
    
begin;
insert into peliculas(id,pelicula,estreno,director) values
    (102,'La mentirita blanca','2017','Tomás Alzamora Muñoz');
commit;

begin;
update peliculas set director = 'director nuevo 1' where id = 1;
update peliculas set director = 'director nuevo 2' where id = 2;
update peliculas set director = 'director nuevo 3' where id = 3;
update peliculas set director = 'director nuevo 4' where id = 4;
update peliculas set director = 'director nuevo 5' where id = 5;
rollback;
commit;

begin;

savepoint antes;
insert into reparto (id_pelicula, actor) values (72, 'Esteban Dido');
insert into reparto (id_pelicula, actor) values (72, 'Aquiles Baeza');
insert into reparto (id_pelicula, actor) values (72, 'Pepe Grillo');
savepoint despues;

commit;



begin;
alter table reparto drop constraint reparto_id_pelicula_fkey;
delete from peliculas where estreno=2008;
rollback;


insert into reparto (id_pelicula, actor)
select p.id, 'Juan Lechuga'
from peliculas p
where p.estreno = 2001;

insert into reparto (id_pelicula, actor)
select p.id, 'Juan Carlos Bodoque'
from peliculas p
where p.estreno = 2001;


begin;

update peliculas 
set pelicula = 'Donkey Kong' 
where pelicula = 'King Kong';

rollback;
