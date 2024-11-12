USE tallergrupal;

SELECT 
    libros.genero, 
    COUNT(prestamos.id_libro) AS total_prestamos
FROM 
    libros
LEFT JOIN 
    prestamos ON prestamos.id_libro = libros.id
GROUP BY 
    libros.genero
ORDER BY 
    total_prestamos DESC;
