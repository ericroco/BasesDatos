	-- 1 agrupaciones
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

    -- 2 Agrupaciones
    USE hr;
	SELECT 
		c.country_name,
		SUM(e.salary) AS total_salarios,
		COUNT(*) AS cantidad_empleados
	FROM 
		employees e
	INNER JOIN 
		departments d ON e.department_id = d.department_id
	INNER JOIN 
		locations l ON d.location_id = l.location_id
	INNER JOIN 
		countries c ON l.country_id = c.country_id
	GROUP BY 
		c.country_name;

-- 3 agrupaciones

SELECT 
    j.job_title,
    AVG(e.salary) AS salario_promedio,
    AVG(e.commission_pct) AS comision_promedio
FROM 
    employees e
JOIN 
    jobs j ON e.job_id = j.job_id
GROUP BY 
    j.job_title;
    
-- 4 agrupaciones

SELECT 
    l.location_id,
    d.department_name,
    COUNT(e.employee_id) AS total_empleados
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    locations l ON d.location_id = l.location_id
GROUP BY 
    l.location_id, d.department_name
ORDER BY 
    l.location_id, d.department_name;

-- 5 agrupaciones
SELECT 
    d.department_name,
    MAX(e.salary) AS salario_maximo
FROM 
    departments d
JOIN 
    employees e ON d.department_id = e.department_id
WHERE 
    d.department_id IN (
        SELECT 
            department_id
        FROM 
            employees
        GROUP BY 
            department_id
        HAVING 
            COUNT(employee_id) > 1
    )
GROUP BY 
    d.department_name;
    
-- 6 agrupaciones

SELECT 
    r.region_name,
    SUM(e.salary) AS salario_total,
    AVG(e.salary) AS salario_promedio
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    locations l ON d.location_id = l.location_id
JOIN 
    countries c ON l.country_id = c.country_id
JOIN 
    regions r ON c.region_id = r.region_id
GROUP BY 
    r.region_name;
    
-- 1 multitabla

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name,
    l.location_id
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    locations l ON d.location_id = l.location_id;

-- 2 multitabla

SELECT 
    c.country_name,
    r.region_name,
    COUNT(e.employee_id) AS total_empleados
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
JOIN 
    locations l ON d.location_id = l.location_id
JOIN 
    countries c ON l.country_id = c.country_id
JOIN 
    regions r ON c.region_id = r.region_id
GROUP BY 
    c.country_name, r.region_name;
-- 3 multitabla
SELECT 
	job_title,
    min_salary,
    max_salary
FROM jobs;

-- 4 multitablas
SELECT 
    e.first_name,
    e.last_name,
    e.manager_id,
    d.department_name,
    d.department_id
FROM
    departments d
LEFT JOIN employees e ON e.department_id = d.department_id
GROUP BY 
    e.first_name,
    e.last_name,
    e.manager_id,
    d.department_name,
    d.department_id;
    
-- 5 multitabla
SELECT 
	e.first_name,
    e.last_name,
    e.email,
    c.country_name,
    l.city
FROM countries c
JOIN locations l ON c.country_id = l.country_id
JOIN departments d ON l.location_id = d.location_id
JOIN employees e ON d.department_id = e.department_id
GROUP BY
	e.first_name,
    e.last_name,
    e.email,
    c.country_name,
    l.city;
-- 6 multitablas
SELECT
	e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name,
    j.job_title
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
LEFT JOIN jobs j ON e.job_id = j.job_id
GROUP BY employee_id,
    first_name,
    last_name,
    d.department_name,
    job_title;
-- 1 subconsultas
SELECT 
	employee_id,
    first_name,
    salary
FROM employees
WHERE salary > (
	SELECT
		AVG(salary) AS promedio
	FROM employees
);
-- 2 subconsultas
SELECT
	country_name
FROM countries c
WHERE (
	SELECT 
		AVG(e.salary) AS promedio
	FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    JOIN locations l ON d.location_id = l.location_id
    WHERE l.country_id = c.country_id
) > 8000;

-- 3 subconsultas
SELECT 
    region_name,
    department_name,
    salario_promedio
FROM (
    SELECT 
        r.region_name,
        d.department_name,
        AVG(e.salary) AS salario_promedio,
        ROW_NUMBER() OVER (PARTITION BY r.region_name ORDER BY AVG(e.salary) DESC) AS ranka
    FROM
        employees e
    INNER JOIN
        departments d ON e.department_id = d.department_id
    INNER JOIN
        locations l ON d.location_id = l.location_id
    INNER JOIN
        countries c ON l.country_id = c.country_id
    INNER JOIN
        regions r ON c.region_id = r.region_id
    GROUP BY
        r.region_name, d.department_name
) AS subquery
WHERE 
    ranka = 1;
    
    
    -- 4 subconsultas

WITH EmployeeServiceYears AS (
    SELECT 
        e.employee_id,
        e.first_name,
        e.last_name,
        d.department_name,
        TIMESTAMPDIFF(YEAR, e.hire_date, CURRENT_DATE) AS years_of_service,
        ROW_NUMBER() OVER (PARTITION BY d.department_id ORDER BY TIMESTAMPDIFF(YEAR, e.hire_date, CURRENT_DATE) DESC) AS rn
    FROM 
        employees e
    JOIN 
        departments d ON e.department_id = d.department_id
)

SELECT 
    employee_id,
    first_name,
    last_name,
    department_name,
    years_of_service
FROM 
    EmployeeServiceYears
WHERE 
    rn = 1
ORDER BY 
    department_name;
    
    -- 5 subconsultas
SELECT 
    job_id,
    job_title,
    salario_promedio
FROM 
    (SELECT 
         e.job_id,
         j.job_title,
         AVG(e.salary) AS salario_promedio
     FROM 
         employees e
     JOIN 
         jobs j ON e.job_id = j.job_id
     GROUP BY 
         e.job_id, j.job_title) AS promedio_por_trabajo
WHERE 
    salario_promedio > (
        SELECT 
            MAX(e.salary)
        FROM 
            employees e
        WHERE 
            e.job_id = promedio_por_trabajo.job_id
    );
    
    -- 6 subconsultas
SELECT 
    r.region_name,
    d.department_name,
    dept_count.num_empleados
FROM 
    regions r
JOIN 
    countries c ON r.region_id = c.region_id
JOIN 
    locations l ON c.country_id = l.country_id
JOIN 
    departments d ON l.location_id = d.location_id
JOIN 
    (SELECT 
         department_id,
         COUNT(*) AS num_empleados
     FROM 
         employees
     GROUP BY 
         department_id) AS dept_count ON d.department_id = dept_count.department_id
JOIN 
    (SELECT 
         r.region_id,
         MAX(dept_count.num_empleados) AS max_empleados
     FROM 
         regions r
     JOIN 
         countries c ON r.region_id = c.region_id
     JOIN 
         locations l ON c.country_id = l.country_id
     JOIN 
         departments d ON l.location_id = d.location_id
     JOIN 
         (SELECT 
              department_id,
              COUNT(*) AS num_empleados
          FROM 
              employees
          GROUP BY 
              department_id) AS dept_count ON d.department_id = dept_count.department_id
     GROUP BY 
         r.region_id) AS max_dept ON r.region_id = max_dept.region_id
                                  AND dept_count.num_empleados = max_dept.max_empleados
ORDER BY 
    r.region_name;








