USE hr;
SELECT 
    d.department_name,
    AVG(e.salary) AS promedio_salario,
    MAX(e.salary) AS salario_maximo,
    MIN(e.salary) AS salario_minimo
FROM 
    employees e
INNER JOIN 
    departments d ON e.department_id = d.department_id
GROUP BY 
    d.department_name;

