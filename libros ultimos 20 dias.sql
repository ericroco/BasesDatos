USE tallergrupal;
SELECT libros.titulo FROM libros
LEFT JOIN  prestamos ON prestamos.id_libro = libros.id
WHERE 
    (prestamos.fecha_prestamo IS NULL OR prestamos.fecha_prestamo < DATE_SUB(
    CURRENT_DATE, INTERVAL 20 DAY))
GROUP BY 
    libros.titulo;
