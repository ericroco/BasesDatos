USE tallergrupal;
SELECT libros.titulo, 
    COUNT(prestamos.id_libro) AS total_prestamos FROM libros
LEFT JOIN prestamos ON prestamos.id_libro = libros.id
WHERE prestamos.fecha_prestamo >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
GROUP BY libros.titulo
ORDER BY total_prestamos ASC
LIMIT 1;
