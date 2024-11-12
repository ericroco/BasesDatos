-- Crear esquema
CREATE SCHEMA taller5N;
USE taller5N;

-- Crear tablas
CREATE TABLE Empleados (
    empleado_id INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_contratacion DATE NOT NULL,
    salario DECIMAL(10,2) CHECK(salario > 0)
);

CREATE TABLE Departamentos (
    departamento_id INT PRIMARY KEY NOT NULL,
    nombre_departamento VARCHAR(50) UNIQUE NOT NULL,
    ubicacion VARCHAR(50)
);

CREATE TABLE Proyectos (
    proyecto_id INT PRIMARY KEY NOT NULL,
    nombre_proyecto VARCHAR(100) UNIQUE NOT NULL,
    departamento_id INT NOT NULL,
    presupuesto DECIMAL(12,2) CHECK(presupuesto > 0),
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(departamento_id)
);

CREATE TABLE Asignaciones (
    asignacion_id INT PRIMARY KEY NOT NULL,
    empleado_id INT NOT NULL,
    proyecto_id INT NOT NULL,
    horas_asignadas INT CHECK(horas_asignadas > 0),
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id),
    FOREIGN KEY (proyecto_id) REFERENCES Proyectos(proyecto_id)
);

-- Insertar datos
INSERT INTO Empleados (empleado_id, nombre, apellido, email, fecha_contratacion, salario) VALUES
(1, 'Kirby', 'Puff', 'kirby_eats_all@gmail.com', '2023-03-01', 45000.00),
(2, 'Meta', 'Knight', 'mysterious_knight@gmail.com', '2023-06-15', 52000.00),
(3, 'Dedede', 'King', 'big_hammer_king@gmail.com', '2022-11-22', 48000.00),
(4, 'Link', 'Hyrule', 'savior_of_zelda@gmail.com', '2021-01-10', 54000.00),
(5, 'Zelda', 'Hyrule', 'wise_princess@gmail.com', '2021-05-18', 56000.00),
(6, 'Sans', 'Skeleton', 'bad_puns_24_7@gmail.com', '2020-09-02', 30000.00),
(7, 'Papyrus', 'Skeleton', 'great_papyrus@gmail.com', '2022-12-01', 31000.00),
(8, 'Asgore', 'Dreemurr', 'king_of_monsters@gmail.com', '2021-07-22', 50000.00),
(9, 'Toriel', 'Dreemurr', 'mom_goat_teacher@gmail.com', '2023-05-10', 47000.00),
(10, 'Susie', 'Holiday', 'tough_and_angry@gmail.com', '2023-08-13', 42000.00),
(11, 'Ralsei', 'Goat', 'fluffy_friend@gmail.com', '2023-09-01', 43000.00),
(12, 'Kris', 'Lightner', 'silent_hero@gmail.com', '2021-04-01', 41000.00),
(13, 'Undyne', 'Guard', 'fish_hero@gmail.com', '2022-03-21', 52000.00),
(14, 'Mettaton', 'Ex', 'glam_bot@gmail.com', '2021-06-12', 55000.00),
(15, 'Alphys', 'Nerd', 'dino_scientist@gmail.com', '2023-07-23', 40000.00),
(16, 'Toon', 'Link', 'cartoonish_hero@gmail.com', '2022-05-04', 45000.00),
(17, 'Midna', 'Twilight', 'shadow_princess@gmail.com', '2020-08-29', 48000.00),
(18, 'Ganon', 'Dragmire', 'dark_overlord@gmail.com', '2021-10-14', 53000.00),
(19, 'Ravio', 'Merchant', 'mask_seller@gmail.com', '2022-04-18', 39000.00),
(20, 'Tingle', 'Tingle', 'fairy_wannabe@gmail.com', '2023-01-05', 37000.00),
(21, 'Asriel', 'Dreemurr', 'fluffybun@gmail.com', '2023-02-15', 38000.00),
(22, 'Jevil', 'Jester', 'chaos_chaos@gmail.com', '2021-11-20', 46000.00),
(23, 'Flowey', 'Flower', 'not_a_nice_plant@gmail.com', '2022-06-15', 35000.00),
(24, 'Chara', 'Fallen', 'not_your_friend@gmail.com', '2021-03-10', 33000.00),
(25, 'Muffet', 'Spider', 'bake_sale_queen@gmail.com', '2020-04-14', 36000.00),
(26, 'Temmie', 'Shopkeeper', 'tem_for_president@gmail.com', '2021-02-17', 29000.00),
(27, 'Gaster', 'Scientist', 'royal_scientist@gmail.com', '2023-01-29', 55000.00),
(28, 'Shovel', 'Knight', 'digging_in_deep@gmail.com', '2020-09-05', 37000.00),
(29, 'Mallow', 'Marshmallow', 'cloud_puncher@gmail.com', '2022-12-21', 42000.00),
(30, 'Taranza', 'Spider', 'loyal_spider@gmail.com', '2023-04-12', 41000.00),
(31, 'Rick', 'Hamster', 'rock_n_roll_hamster@gmail.com', '2022-10-30', 33000.00),
(32, 'Prince', 'Fluff', 'cotton_king@gmail.com', '2020-07-27', 38000.00),
(33, 'Shadow', 'Link', 'dark_mirror@gmail.com', '2021-12-11', 46000.00),
(34, 'Kafei', 'Anju', 'running_from_wedding@gmail.com', '2022-08-09', 40000.00),
(35, 'Skull', 'Kid', 'mask_maniac@gmail.com', '2023-03-25', 31000.00),
(36, 'Vaati', 'Sorcerer', 'winds_of_doom@gmail.com', '2021-11-07', 43000.00),
(37, 'Zant', 'Twilight', 'usurper_king@gmail.com', '2020-10-19', 44000.00),
(38, 'Linebeck', 'Adventurer', 'cowardly_captain@gmail.com', '2022-06-05', 35000.00),
(39, 'Epona', 'Horse', 'horse_of_heroes@gmail.com', '2023-07-17', 28000.00),
(40, 'Impa', 'Sheikah', 'shadow_guardian@gmail.com', '2023-08-21', 52000.00);

INSERT INTO Departamentos (departamento_id, nombre_departamento, ubicacion) VALUES
(1, 'Recursos Humanos', 'Edificio Principal'),
(2, 'Tecnología de la Información', 'Torre Norte'),
(3, 'Desarrollo de Juegos', 'Planta Baja'),
(4, 'Finanzas', 'Edificio Este'),
(5, 'Investigación y Desarrollo', 'Torre Oeste'),
(6, 'Marketing', 'Edificio Principal'),
(7, 'Atención al Cliente', 'Edificio Sur'),
(8, 'Operaciones', 'Edificio Norte'),
(9, 'Producción', 'Planta Alta'),
(10, 'Soporte Técnico', 'Torre Este');

INSERT INTO Departamentos (departamento_id, nombre_departamento, ubicacion) VALUES
(11, 'Atención a Proveedores', 'Torre Sur'),
(12, 'Recursos Digitales', 'Edificio Central'),
(13, 'Desarrollo de Inteligencia Artificial', 'Planta Baja'),
(14, 'Redes y Conectividad', 'Torre Norte'),
(15, 'Arquitectura de Software', 'Planta Alta'),
(16, 'Control de Calidad', 'Edificio Este'),
(17, 'Gestión de Proyectos', 'Planta Baja'),
(18, 'Investigación de Mercado', 'Edificio Principal'),
(19, 'Planificación Estratégica', 'Torre Oeste'),
(20, 'Auditoría Interna', 'Edificio Central'),
(21, 'Desarrollo de Contenidos', 'Torre Sur'),
(22, 'Capacitación y Formación', 'Planta Alta'),
(23, 'Gestión de Riesgos', 'Torre Este'),
(24, 'Operaciones Internacionales', 'Planta Baja'),
(25, 'Seguridad de la Información', 'Edificio Principal'),
(26, 'Gestión de Innovación', 'Edificio Norte'),
(27, 'Desarrollo de Aplicaciones Móviles', 'Torre Este'),
(28, 'Consultoría Técnica', 'Edificio Sur'),
(29, 'Marketing Digital', 'Planta Alta'),
(30, 'Gestión de Logística', 'Edificio Oeste');


INSERT INTO Proyectos (proyecto_id, nombre_proyecto, departamento_id, presupuesto) VALUES
(1, 'Sistema de Gestión de Aventuras', 1, 50000.00),
(2, 'Automatización de Calabozos', 2, 75000.00),
(3, 'Plataforma de Jefes Finales', 3, 120000.00),
(4, 'Sistema de Nómina de Héroes', 4, 65000.00),
(5, 'Red de Transporte de Mazmorras', 5, 90000.00),
(6, 'Aplicación para Combate por Turnos', 6, 105000.00),
(7, 'Asistente Virtual de Hechizos', 7, 80000.00),
(8, 'Simulador de Peleas Aleatorias', 8, 95000.00),
(9, 'Sistema de Crafteo de Armas', 9, 85000.00),
(10, 'Soporte para Modo Multijugador', 10, 110000.00);

INSERT INTO Proyectos (proyecto_id, nombre_proyecto, departamento_id, presupuesto) VALUES
(11, 'Rediseño de Plataforma Web', 2, 65000.00),
(12, 'Implementación de CRM', 1, 70000.00),
(13, 'Desarrollo de Software de Facturación', 4, 80000.00),
(14, 'Creación de App de Reservas', 6, 90000.00),
(15, 'Sistema de Gestión de Inventarios', 9, 75000.00),
(16, 'Mejora de Infraestructura de Red', 14, 100000.00),
(17, 'Desarrollo de Prototipo de IA', 13, 95000.00),
(18, 'Automatización de Procesos Administrativos', 7, 85000.00),
(19, 'Expansión de Servicio en Línea', 8, 110000.00),
(20, 'Reestructuración de Plataforma de Soporte', 10, 105000.00),
(21, 'Mejoras en Seguridad Web', 2, 60000.00),
(22, 'Desarrollo de Sistema de Facturación en la Nube', 5, 95000.00),
(23, 'Optimización de Aplicaciones Móviles', 27, 50000.00),
(24, 'Sistema de Gestión de Recursos Humanos', 7, 80000.00),
(25, 'Integración de Plataforma con Redes Sociales', 6, 70000.00),
(26, 'Implementación de CRM para Proveedores', 1, 45000.00),
(27, 'Desarrollo de Aplicación para Mantenimiento', 9, 95000.00),
(28, 'Plataforma de Educación Virtual', 12, 105000.00),
(29, 'Desarrollo de Sistema de Control de Acceso', 16, 85000.00),
(30, 'Consultoría en Transformación Digital', 18, 110000.00);


INSERT INTO Asignaciones (asignacion_id, empleado_id, proyecto_id, horas_asignadas) VALUES
(1, 1, 1, 120),
(2, 2, 2, 200),
(3, 3, 3, 180),
(4, 4, 4, 100),
(5, 5, 5, 140),
(6, 6, 6, 160),
(7, 7, 7, 110),
(8, 8, 8, 130),
(9, 9, 9, 150),
(10, 10, 10, 170),
(11, 11, 1, 130),
(12, 12, 2, 115),
(13, 13, 3, 180),
(14, 14, 4, 90),
(15, 15, 5, 160),
(16, 16, 6, 190),
(17, 17, 7, 145),
(18, 18, 8, 175),
(19, 19, 9, 155),
(20, 20, 10, 200),
(21, 21, 1, 110),
(22, 22, 2, 95),
(23, 23, 3, 135),
(24, 24, 4, 145),
(25, 25, 5, 165),
(26, 26, 6, 105),
(27, 27, 7, 190),
(28, 28, 8, 140),
(29, 29, 9, 120),
(30, 30, 10, 110),
(31, 31, 1, 130),
(32, 32, 2, 180),
(33, 33, 3, 150),
(34, 34, 4, 140),
(35, 35, 5, 160),
(36, 36, 6, 120),
(37, 37, 7, 130),
(38, 38, 8, 100),
(39, 39, 9, 140),
(40, 40, 10, 170);

-- Crear índices
CREATE INDEX idx_empleado_id ON Empleados (empleado_id);
CREATE INDEX idx_asignaciones_empleado_proyecto ON Asignaciones(empleado_id, proyecto_id);
show index from empleados;
show index from asignaciones;


-- Crear roles si no existen
CREATE ROLE analista;
CREATE ROLE gestor;

-- Asignar permisos a roles
GRANT SELECT, INSERT, UPDATE ON Empleados TO analista;
GRANT SELECT, INSERT, UPDATE ON Proyectos TO gestor;

-- 1
SELECT E.nombre, E.apellido, P.nombre_proyecto
FROM Empleados E
JOIN Asignaciones A ON E.empleado_id = A.empleado_id
JOIN Proyectos P ON A.proyecto_id = P.proyecto_id
JOIN Departamentos D ON P.departamento_id = D.departamento_id
WHERE D.nombre_departamento = 'Tecnología de la Información';

-- 2
SELECT E.nombre, E.apellido, SUM(A.horas_asignadas) AS total_horas
FROM Empleados E
JOIN Asignaciones A ON E.empleado_id = A.empleado_id
GROUP BY E.empleado_id;

-- 3
SELECT nombre_proyecto, presupuesto
FROM Proyectos
WHERE presupuesto > 100000;

-- 4
SELECT E.nombre, E.apellido, E.salario, D.nombre_departamento
FROM Empleados E
JOIN Asignaciones A ON E.empleado_id = A.empleado_id
JOIN Proyectos P ON A.proyecto_id = P.proyecto_id
JOIN Departamentos D ON P.departamento_id = D.departamento_id
WHERE E.salario > 50000;

-- 5
SELECT P.nombre_proyecto, COUNT(A.empleado_id) AS numero_empleados
FROM Proyectos P
JOIN Asignaciones A ON P.proyecto_id = A.proyecto_id
GROUP BY P.proyecto_id
HAVING COUNT(A.empleado_id) > 5;
