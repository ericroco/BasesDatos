use tallergrupal;
SELECT 
    AVG(numero_prestamos) AS promedio_prestamos_por_usuario
FROM (
    SELECT 
        id_usuario, 
        COUNT(*) AS numero_prestamos
    FROM 
        prestamos
    GROUP BY 
        id_usuario
) AS prestamosProm;