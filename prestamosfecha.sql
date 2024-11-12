use tallergrupal;
select usuarios.nombre_usuario, libros.titulo, fecha_prestamo,fecha_devolucion
from usuarios
join prestamos on prestamos.id_usuario = usuarios.id
join libros on prestamos.id_libro = libros.id;