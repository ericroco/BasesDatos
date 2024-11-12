use tallerGrupal;

create table autores(
id int primary key auto_increment,
nombre varchar(20) not null,
nacionalidad varchar(20) not null,
fecha_nacimiento date not null);

create table libros(
id int primary key auto_increment,
titulo varchar(50) not null,
autor_id int,
año_publicacion year not null,
genero varchar(50) not null,
disponibilidad boolean not null,
foreign key(autor_id) references autores(id));

create table usuarios(
id int primary key auto_increment,
nombre_usuario varchar(30) not null,
tipo_usuario varchar(15) not null,
email varchar(40) not null); 

create table prestamos(
id int primary key auto_increment,
id_libro int,
id_usuario int,
fecha_prestamo date not null,
fecha_devolucion date not null,
foreign key(id_libro) references libros(id),
foreign key(id_usuario) references usuarios(id));
