USE tallergrupal;

SELECT 
    autores.nombre AS nombre_autor, 
    COUNT(libros.id) AS total_libros
FROM 
    autores
JOIN 
    libros ON libros.autor_id = autores.id
WHERE 
    libros.disponibilidad = TRUE
GROUP BY 
    autores.nombre
ORDER BY 
    total_libros DESC;
