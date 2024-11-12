create schema practicaAR;
use practicaAr;

create table departamentos(
id_departamento int primary key,
nombre_departamento varchar(100),
ubicacion varchar(40));

create table empleados(
id_empleados int primary key,
nombre varchar(100),
id_departamento int,
salario int,
foreign key (id_departamento)references departamentos(id_departamento)
);

create table proyectos(
id_proyecto int primary key,
nombre_proyecto varchar(100),
id_departamento int,
foreign key (id_departamento)references departamentos(id_departamento)
);

create table trabaja_en(
id_empleado int,
foreign key (id_empleado)references empleados(id_empleados),
id_proyecto int,
foreign key (id_proyecto)references proyectos(id_proyecto),
horas timestamp);


INSERT INTO departamentos (id_departamento, nombre_departamento, ubicacion) VALUES
(1, 'Diagnóstico', 'Princeton-Plainsboro'),
(2, 'Oncología', 'Princeton-Plainsboro'),
(3, 'Neurología', 'Princeton-Plainsboro'),
(4, 'Cardiología', 'Princeton-Plainsboro'),
(5, 'Emergencias', 'Princeton-Plainsboro'),
(6, 'Radiología', 'Princeton-Plainsboro'),
(7, 'Laboratorio', 'Princeton-Plainsboro'),
(8, 'Cirugía', 'Princeton-Plainsboro'),
(9, 'Administración', 'Princeton-Plainsboro'),
(10, 'Psiquiatría', 'Princeton-Plainsboro');


INSERT INTO empleados (id_empleados, nombre, id_departamento, salario) VALUES
(1, 'Gregory House', 1, 10000),
(2, 'James Wilson', 2, 9500),
(3, 'Lisa Cuddy', 9, 9000),
(4, 'Eric Foreman', 1, 8500),
(5, 'Robert Chase', 1, 8000),
(6, 'Allison Cameron', 1, 7500),
(7, 'Chris Taub', 1, 7200),
(8, 'Lawrence Kutner', 1, 7000),
(9, 'Remy Hadley', 1, 6800),
(10, 'Amber Volakis', 5, 6500);


INSERT INTO proyectos (id_proyecto, nombre_proyecto, id_departamento) VALUES
(1, 'Caso Lupus', 1),
(2, 'Tratamiento Experimental de Cáncer', 2),
(3, 'Terapia Neuromuscular', 3),
(4, 'Estudio Cardiológico', 4),
(5, 'Diagnóstico de Dolor Crónico', 1),
(6, 'Control de Emergencias', 5),
(7, 'Interpretación de Imágenes', 6),
(8, 'Investigación Patológica', 7),
(9, 'Operación Quirúrgica Compleja', 8),
(10, 'Evaluación Psiquiátrica', 10);


INSERT INTO trabaja_en (id_empleado, id_proyecto, horas) VALUES
(1, 1, '2024-11-11 08:00:00'),
(2, 2, '2024-11-11 09:30:00'),
(3, 9, '2024-11-11 10:00:00'),
(4, 1, '2024-11-11 11:45:00'),
(5, 5, '2024-11-11 13:00:00'),
(6, 5, '2024-11-11 14:30:00'),
(7, 6, '2024-11-11 15:15:00'),
(8, 8, '2024-11-11 16:00:00'),
(9, 1, '2024-11-11 17:30:00'),
(10, 6, '2024-11-11 18:45:00');

-- 1
SELECT * FROM empleados WHERE salario > 5000;

-- 2
SELECT empleados.nombre, departamentos.nombre_departamento
FROM empleados
JOIN departamentos ON empleados.id_departamento = departamentos.id_departamento;

-- 3 
SELECT empleados.nombre AS nombre_empleado, proyectos.nombre_proyecto
FROM empleados
JOIN proyectos ON empleados.id_departamento = proyectos.id_departamento;

-- 4
SELECT DISTINCT departamentos.nombre_departamento
FROM departamentos
JOIN empleados ON departamentos.id_departamento = empleados.id_departamento
JOIN proyectos ON departamentos.id_departamento = proyectos.id_departamento;

-- 5
SELECT nombre FROM empleados
WHERE id_empleados NOT IN (SELECT id_empleado FROM trabaja_en);

-- 6
SELECT empleados.nombre AS nombre_empleado, proyectos.nombre_proyecto
FROM empleados
JOIN trabaja_en ON empleados.id_empleados = trabaja_en.id_empleado
JOIN proyectos ON trabaja_en.id_proyecto = proyectos.id_proyecto;

-- 7
SELECT nombre 
FROM empleados e
WHERE NOT EXISTS (
    SELECT id_proyecto
    FROM proyectos
    WHERE id_departamento = 1
    AND id_proyecto NOT IN (
        SELECT id_proyecto
        FROM trabaja_en
        WHERE trabaja_en.id_empleado = e.id_empleados
    )
);
