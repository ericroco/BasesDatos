
USE tallergrupal;

SELECT 
    usuarios.nombre_usuario, 
    COUNT(prestamos.id_libro) AS total_prestamos
FROM 
    usuarios
JOIN 
    prestamos ON prestamos.id_usuario = usuarios.id
GROUP BY 
    usuarios.nombre_usuario
HAVING 
    COUNT(prestamos.id_libro) >= 2
ORDER BY 
    total_prestamos DESC;
