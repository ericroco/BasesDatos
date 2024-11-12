use practicajoin;
select empleados.nombre, departamentos.nombre from empleados
inner join departamentos
on empleados.departamento_id = departamentos.id;
select empleados.nombre, proyectos.nombre
from empleados
left join proyectos on empleados.proyecto_id = proyectos.id;

select proyectos.nombre, empleados.nombre from proyectos
right join empleados on proyectos.id = empleados;

select empleados.nombre, departamentos.nombre
from empleados
cross join departamentos;

select e.nombre, d.nombre
from empleados e inner join departamentos d on
e.departamento_id = d.id;

select e.nombre, p.nombre from empleados e
left join proyectos p on e.proyecto_id = p.id;

select d.nombre, e.nombre from departamentos d
right join empleados e on d.id = e.departamento_id;

select p.nombre, d.nombre from proyectos p 
inner join departamentos d on p.departamento_id = d.id;

select e.nombre, p.nombre from empleados e
cross join proyectos p;