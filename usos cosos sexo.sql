use practicadatos;
select count(*) as total_empleados from empleados;
select count(salario) as empleados_salario from empleados;
select sum(salario) as salario_total from empleados;


select sum(ventas) as total_ventas from empleados
where departamento = "Ventas";

select avg(salario) as salario_promedio from empleados;
select avg(edad) as edad_promedio from empleados
where cargo = "Desarrollador";
select min(salario) as salario_minimo from empleados;

select min(fecha_ingreso) as fecha_ingreso_antigua from empleados;

select max(salario) as salario_alto from empleados;
select max(fecha_ingreso) as fecha_reciente from empleado;
select departamento, count(*) as total_empleados, sum(salario) as total_salario
from empleados group by departamento;

select departamento, count(*) as total_empleados
from empleados group by departamento
having count(*) >10;

select cargo, count(*) as total_empleados,
avg(salario) as salario_promedio
from empleados group by cargo;

select departamento, sum(salario) as total_salario,
count(*) as total_empleados
from empleados
group by departamento having sum(salario)>100000;

select departamento, max(fecha_ingreso) as ultimo_ingreso
from empleados group by departamento having max(fecha_ingreso) = ultimo_ingreso;
