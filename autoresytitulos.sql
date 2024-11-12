use tallergrupal;
select autores.nombre, libros.titulo from autores
inner join libros
on libros.autor_id = autores.id;