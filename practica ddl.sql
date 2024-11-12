create schema praticaddl;
use praticaddl;

create table departamentos(
id_departaemtndo int primary key,
nombre_departamento varchar(100) unique not null,
ubicacion varchar(100),
presupuesto decimal(10,2) check (presupuesto>5000)
);

create table empleados(
id_empleado int primary key,
nombre varchar(50),
edad int check (edad >= 18 and edad <= 65)
);

create table productos(
id_producto int primary key,
nombre_producto varchar(50),
stock int default 10
);

INSERT INTO departamentos (id_departaemtndo, nombre_departamento, ubicacion, presupuesto) VALUES
(1, 'Recursos Humanos', 'Edificio A', 7000.00),
(2, 'Finanzas', 'Edificio B', 12000.50),
(3, 'Marketing', 'Edificio C', 9000.75),
(4, 'IT', 'Edificio D', 15000.00),
(5, 'Logística', 'Edificio E', 8500.00),
(6, 'Ventas', 'Edificio F', 10000.00),
(7, 'Compras', 'Edificio G', 6500.00),
(8, 'Producción', 'Edificio H', 11000.00),
(9, 'Investigación', 'Edificio I', 13000.00),
(10, 'Desarrollo', 'Edificio J', 14000.00);


INSERT INTO empleados (id_empleado, nombre, edad) VALUES
(1, 'Juan Perez', 25),
(2, 'Ana Gomez', 34),
(3, 'Luis Torres', 40),
(4, 'Maria Lopez', 30),
(5, 'Carlos Ruiz', 28),
(6, 'Laura Sanchez', 37),
(7, 'Pedro Jimenez', 50),
(8, 'Sofia Martinez', 22),
(9, 'Miguel Angel', 45),
(10, 'Josefa Diaz', 29);


INSERT INTO productos (id_producto, nombre_producto, stock) VALUES
(1, 'Laptop', 20),
(2, 'Teclado', 50),
(3, 'Monitor', 15),
(4, 'Impresora', 12),
(5, 'Mouse', 40),
(6, 'Escritorio', 5),
(7, 'Silla de Oficina', 8),
(8, 'Proyector', 10),
(9, 'Teléfono', 25),
(10, 'Router', 18);

create table clientes( id_cliente int primary key,
nombre_cliente varchar(100) not null,
email varchar(100) unique,
edad int check( edad >= 18),
pais varchar(100) default "desconocido");


INSERT INTO clientes (id_cliente, nombre_cliente, email, edad, pais) VALUES
(1, 'Carlos Mendoza', 'c.mendoza@correo.com', 28, 'México'),
(2, 'Ana López', 'ana.lopez@gmail.com', 34, 'Argentina'),
(3, 'Luis Ramírez', 'luis.ramirez@yahoo.com', 22, 'España'),
(4, 'María Fernández', 'mariaf@hotmail.com', 40, 'Chile'),
(5, 'Jorge Sánchez', 'jorge.sanchez@correo.com', 30, 'Perú'),
(6, 'Laura Torres', 'laura.t@gmail.com', 25, 'Colombia'),
(7, 'Miguel Pérez', 'miguel.perez@yahoo.com', 50, 'Ecuador'),
(8, 'Sofía Morales', 'sofia.m@correo.com', 18, 'Uruguay'),
(9, 'Andrés Martínez', 'andres.martinez@gmail.com', 27, 'Bolivia'),
(10, 'Claudia Díaz', 'claudia.diaz@hotmail.com', 33, pais);
