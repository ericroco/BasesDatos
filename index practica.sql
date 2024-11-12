CREATE SCHEMA practicaindices;
use practicaindices;
CREATE TABLE empleados (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    departamento VARCHAR(50),
    salario DECIMAL(10, 2)
);


INSERT INTO empleados (id, nombre, apellido, departamento, salario) VALUES 
(1, 'Ana', 'López', 'IT', 4500.00),
(2, 'Juan', 'Pérez', 'Ventas', 5200.00),
(3, 'Luis', 'Martínez', 'Finanzas', 6000.00),
(4, 'María', 'Díaz', 'IT', 4700.00),
(5, 'Pedro', 'Gómez', 'Marketing', 4100.00),
(6, 'Sofía', 'Ramos', 'Ventas', 5500.00),
(7, 'Carlos', 'Núñez', 'RRHH', 4800.00),
(8, 'Lucía', 'Santos', 'Finanzas', 6300.00),
(9, 'José', 'Cruz', 'IT', 4500.00),
(10, 'Marta', 'Morales', 'Ventas', 5400.00);

create index idx_nombre on empleados(nombre);
show index from empleados;
create index idx_nombre_apellido on empleados(nombre,apellido);
show index from empleados;
create index idx_id_unico on empleados(id);
show index from empleados;
create index idx_departamento on empleados(departamento);
show index from empleados;

create index idx_salario on empleados(salario);
select * from empleados
where salario = 4100;