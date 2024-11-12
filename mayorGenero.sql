use tallergrupal;
SELECT 
    genero, 
    COUNT(*) AS cantidad
FROM 
    libros
GROUP BY 
    genero
ORDER BY 
    cantidad DESC
LIMIT 1;
