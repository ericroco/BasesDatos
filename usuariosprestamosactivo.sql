use tallergrupal;
select usuarios.nombre_usuario, libros.titulo
from usuarios 
left join prestamos on usuarios.id = prestamos.id_usuario 
left join libros on prestamos.id_libro = libros.id
where(fecha_devolucion > current_date);