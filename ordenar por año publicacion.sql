use tallergrupal;
select titulo, año_publicacion
from libros
where(select max(año_publicacion) from libros)
order by año_publicacion desc
limit 1;