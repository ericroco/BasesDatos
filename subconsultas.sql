use subconsultas;
select nombre, salario
from empleados
where salario > (Select avg(salario) from empleados);

select nombre, presupuesto
from departamentos
where presupuesto = (select min(presupuesto) from departamentos);

select nombre
from empleados
where departamento_id in(select id from departamentos
where ciudad IN("CiudadA","CiudadB"));

select nombre 
from empleados
where cargo_id in(select id from cargos 
where titulo in("Gerente", "Analista"));

SELECT NOMBRE
FROM EMPLEADOS
Where (cargo_id, salario)= 
(select cargo_id,salario from empleados where nombre = "Juan Perez"); 

select nombre 
from departamentos
where(presupuesto, num_empleados) 
= (select presupuesto, num_empleados from departamentos where nombre = "Ventas");

select nombre,salario,departamento_id from empleados
where (departamento_id,salario)
in(select departamento_id, salario
from empleados
group by departamento_id, salario
having count(salario) > 1);

select nombre
from departamentos
where exists(select departamento_id from empleados 
where empleados.departamento_id = departamentos.id and salario >3000);

select nombre, salario, departamento_id
from empleados e1
where salario >(select avg(salario)
from empleados e2
where e2.departamento_id  = e1.departamento_id);

