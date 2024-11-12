use tallergrupal;
SELECT 
    id_usuario, 
    COUNT(*) AS numero_prestamos
FROM 
    prestamos
GROUP BY 
    id_usuario
ORDER BY 
    id_usuario;
