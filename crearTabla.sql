use practicadatos;
create table empleados(
id_empleado int auto_increment primary key,
nombre varchar(100) not null,
edad int not null,
departamento varchar(50) not null,
cargo varchar(50) not null,
salario bigint, 
fecha_ingreso date,
ventas bigint);
