USE tallergrupal;

SELECT autores.nombre
FROM autores
JOIN libros ON libros.autor_id = autores.id
JOIN prestamos ON prestamos.id_libro = libros.id
WHERE (prestamos.fecha_devolucion > current_date);
