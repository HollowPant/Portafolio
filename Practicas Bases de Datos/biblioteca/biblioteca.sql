-- Active: 1698722748862@@127.0.0.1@3306@biblioteca
Create database biblioteca;
use biblioteca;
Create table edificio(
    idedificio int(4) not null AUTO_INCREMENT,
    nombre varchar(30) not null,
    ubicacion varchar(30) not null,
    Constraint pk_edificio PRIMARY KEY(idedificio)
);

Create table editorial(
    ideditorial int(4) not null AUTO_INCREMENT,
    nombre varchar(30) not null,
    Constraint pk_editorial PRIMARY KEY(ideditorial)
);

Create table libro(
    idlibro int(4) not null AUTO_INCREMENT,
    titulo varchar(50) not null,
    paginas int(4) not null,
    cantidad int(3) not null,
    ideditorial int(4) not null,
    constraint pk_libro PRIMARY KEY(idlibro),
    constraint fk_libroEditorial Foreign Key (ideditorial) REFERENCES editorial(ideditorial)
);

Create table usuario(
    idusuario int(4) not null AUTO_INCREMENT,
    nombre varchar(30) not null,
    paterno varchar(30) not null,
    materno VARCHAR(30) not null,
    celular varchar(10) not null,
    correo VARCHAR(50) not null,
    constraint pk_usuario PRIMARY KEY(idusuario)
);

Create table nacionalidad(
    idnacionalidad int(4) not null AUTO_INCREMENT,
    nombre varchar(30) not null,
    constraint pk_nacionalidad PRIMARY KEY(idnacionalidad)
);

Create table autor(
    idautor int(4) not null AUTO_INCREMENT,
    nombre VARCHAR(30) not null,
    apellido VARCHAR(30) not null,
    fechanacimiento date not null,
    idnacionalidad int(4) not null,
    Constraint pk_autor PRIMARY KEY(idautor),
    Constraint fk_autornacionalidad Foreign Key (idnacionalidad) REFERENCES nacionalidad(idnacionalidad)
);

Create table prestamo(
    idprestamo int(4) not null AUTO_INCREMENT,
    idusuario int(4) not null,
    idlibro int(4) not null,
    fechaprestamo date not null,
    fechadevolucion date not null,
    Constraint pk_prestamo PRIMARY KEY(idprestamo),
    Constraint fk_prestamoUsuario Foreign Key (idusuario) REFERENCES usuario(idusuario),
    Constraint fk_prestamoLibro Foreign Key (idlibro) REFERENCES libro(idlibro)
);

Create table libroautor(
    idlibroautor int(4) not null AUTO_INCREMENT,
    idlibro int(4) not null,
    idautor int(4) not null,
    Constraint pk_libroautor PRIMARY KEY(idlibroautor),
    Constraint fk_libroautorLibro Foreign Key (idlibro) REFERENCES libro(idlibro),
    Constraint fk_libroautorAutor Foreign Key (idautor) REFERENCES autor(idautor)
);

INSERT INTO nacionalidad (nombre) 
VALUES ('México'), ('USA'), ('Canadá'), ('Alemania'), ('Inglaterra'), ('Países Bajos'), ('Francia'), ('España'), ('Dinamarca');

INSERT INTO edificio (nombre, ubicacion) 
VALUES ('Biblioteca Central', 'Ciudad Universitaria'), ('Acervo Cultural', 'Teatro Universitario'), 
       ('Biblioteca de Ciencias', 'Facultad de Ciencias'), ('Biblioteca de Humanidad', 'Facultad de Filosofía'), ('Acervo Deportivo', 'Estadio Universitario');

INSERT INTO editorial(nombre) 
VALUES('OReilly'), ('Cambridge'), ('Wiley'), ('World Scientific'), ('McGraw Hill'), ('Prentice Hall'), 
      ('QUE'), ('HARLA'), ('Marcombo'), ('Alfaomega'), ('MT Books'), ('FCE'), ('Orbis'), ('Siglo XXI');

INSERT INTO libro (titulo, paginas, cantidad, ideditorial) 
VALUES ('Python para Programadores', 750, 5, 5), ('Python Machine Learning', 950, 7, 9), ('Introducción a las Ecuaciones Diferenciales', 650, 12, 4),
       ('Monte Carlo Frameworks', 550, 10, 3), ('Un Primer Curso en Ecuaciones Integrales', 450, 4, 2), ('Linux Device Drivers', 550, 2, 1),
       ('Linux Kernel', 600, 3, 1), ('Sistemas Operativos', 550, 4, 6), ('Los Microprocesadores Intel', 750, 2, 6),
       ('Visual C++ 5', 800, 4, 6), ('Protocolos TCP/IP', 450, 5, 6), ('Programación en Linux', 350, 3, 7), 
       ('Diseño de Compiladores', 455, 4, 5), ('Física Moderna', 350, 5, 8), ('Teoría Electromagnética', 400, 3, 5),
       ('Fundamentos de los Microprocesadores', 650, 12, 5), ('Construya su propio Supercomputador', 240, 2, 9), ('Matlab Aplicado a Telecomunicaciones', 290, 5, 10),
       ('Métodos Numéricos con Aplicaciones', 410, 7, 10), ('Teach Yourself Russian', 450, 3, 5), ('German Grammar', 440, 5, 5),
       ('Fractal Programming in C', 470, 1, 11), ('Fenomenología del Espíritu', 540, 4, 12), ('Tratado de la Naturaleza Humana', 750, 5, 13),
       ('El Capital', 990, 1, 14);

INSERT INTO autor (nombre, apellido, fechanacimiento, idnacionalidad) 
VALUES ('Paul', 'Deitel', '1960-04-20', 2), ('Sebastian', 'Raschka', '1965-02-28', 3), ('Jacob', 'Rubinstein', '1972-01-23', 5),
       ('Yehuda', 'Pinchover', '1985-03-15', 5), ('Daniel', 'Duff', '1985-03-15', 5), ('Jorg', 'Kienitz', '1985-03-15', 4),
       ('Abdul', 'Wazwaz', '1980-06-15', 5), ('Alessandro', 'Rubini', '1986-07-22', 2), ('Jonathan', 'Corbet', '1984-08-31', 2),
       ('Daniel', 'Bonet', '1987-07-14', 2), ('Marco', 'Cesati', '1986-02-25', 2), ('Andrew', 'Tannenbaum', '1955-03-01', 6),
       ('Barry', 'Brey', '1990-09-09', 2), ('Daniel', 'Bennet', '1991-11/07', 2), ('Douglas', 'Comer', '1960/10/24', 2),
       ('Kurt', 'Wall', '1977/02/02', 2), ('Jean', 'Treamblay', '1979/05/16', 7), ('Paul', 'Sorenson', '1978/09/24', 9),
       ('Virgilio',  'Acosta', '1956/06/13', 1), ('William', 'Hayt', '1961/06/17', 2), ('Roger', 'Tokheim', '1962/04/06', 2),
       ('Sergio', 'Iserte', '1988/03/25', 8), ('Sandra', 'Catalán', '1991/01/07', 8), ('Rocío', 'Catarratalá', '1989/08/19', 8),
       ('Sergio', 'López', '1992/11/30', 8), ('Mauricio', 'Ortega', '1994/10/14', 1), ('Juan', 'Izar', '1992/12/02', 8),
       ('Michel', 'Frewin', '1984/02/15', 8), ('Jenny', 'Russ', '1965/04/26', 5), ('Roger', 'Stevens', '1967/07/08', 2),
       ('Georg', 'Hegel', '1850/09/04', 4), ('David', 'Hume', '1870/09/19', 5), ('Karl', 'Marx', '1886/11/11', 4);

INSERT INTO usuario (nombre, paterno, materno, celular, correo) 
VALUES ('Sonia', 'Labidi', 'Barriuso', '8152369854', 'slabidi@uceca.edu.mx'), ('Alex', 'Laguardia', 'Alquiza', '8245695745', 'alaguardia@uceca.edu.mx'), 
       ('Juan', 'Laguna', 'Hacha', '8324016958', 'jlaguna@uceca.edu.mx'), ('María', 'Leyva', 'Azurica', '8456952130', 'mleyva@uceca.edu.mx'), 
       ('Nora', 'Lomana', 'Urrutia', '8420153625', 'nlomana@uceca.edu.mx'), ('Edgar', 'Ayala', 'López', '8236147895', 'eayala@uceca.edu.mx'), 
       ('Fernanda', 'Encina', 'López', '8012479652', 'fencina@uceca.edu.mx'), ('Derek', 'Jasso', 'Rodríguez', '8631257402', 'djasso@uceca.edu.mx'), 
       ('Barbara', 'Mendoza', 'Medina', '8694520178', 'bmendoza@uceca.edu.mx'), ('Erick', 'Oliva', 'San Juan', '8023451269', 'eoliva@uceca.edu.mx'),
       ('Kevin', 'Rangel', 'Torres', '8430124065', 'krangel@uceca.edu.mx'), ('Alejandro', 'Blanco', 'Zindy', '8443659972', 'ablanco@uceca.edu.mx'), 
       ('Azael', 'Pérez', 'Gómez', '8736105490', 'aperez@uceca.edu.mx'), ('Carlos', 'Ramírez', 'Kick', '8732694025', 'cramirez@uceca.edu.mx'), 
       ('David', 'Rangel', 'López', '8021554030', 'drangel@uceca.edu.mx'), ('Melissa', 'Vazquez', 'Maldonado', '8302465021', 'mvazquez@uceca.edu.mx'), 
       ('Miranda', 'Elizondo', 'Garza', '8432650125', 'melizondo@uceca.edu.mx'), ('Aracely', 'Saldaña', 'Ruíz', '8475013265', 'asaldana@uceca.edu.mx'), 
       ('David', 'Sánchez', 'Alvarado', '8473620125', 'dsanchez@uceca.edu.mx'), ('Daniel', 'Alonso', 'Muñoz', '8501326947', 'dalonso@uceca.edu.mx'),
       ('Oscar', 'Arias', 'Cuevas', '8432651024', 'oarias@uceca.edu.mx'), ('Mauricio', 'Barragán', 'Fernández', '8102136597', 'mbarragan@uceca.edu.mx'), 
       ('Javier', 'Barrientos', 'Luna', '8869542013', 'jbarrientos@uceca.edu.mx'), ('Alexia', 'Bracamontes', 'López', '8451215632', 'abracamontes@uceca.edu.mx'), 
       ('Antonio', 'Camarillo', 'Obregón', '8956256847', 'acamarillo@uceca.edu.mx'), ('Anastasia', 'Chapa', 'Lara', '8012342510', 'achapa@uceca.edu.mx'), 
       ('Mariana', 'Contreras', 'Pérez', '8132052162', 'mcontreras@uceca.edu.mx'), ('Fernanda', 'Alba', 'Carranza', '8235012540', 'falba@uceca.edu.mx'), 
       ('Jared', 'Díaz', 'Godinez', '8130254062', 'jdiaz@uceca.edu.mx'), ('Carlos', 'Díaz', 'Hernández', '8105472136', 'cdiaz@uceca.edu.mx'),
       ('David', 'Díaz', 'Mendoza', '8151025414', 'ddiaz@uceca.edu.mx'), ('Miranda', 'Luna', 'Elizondo', '8230304552', 'mluna@uceca.edu.mx'), 
       ('Javier', 'Barrientos', 'Luna', '8223566401', 'jbarrientos@uceca.edu.mx'), ('Iván', 'Enriquez', 'Medina', '8455011247', 'ienriquez@uceca.edu.mx'), 
       ('Alejandro', 'Fernández', 'Gil', '8331002541', 'afernandez@uceca.edu.mx'), ('Luis', 'García', 'Munguía', '8455440122', 'lgarcia@uceca.edu.mx'), 
       ('Carlos', 'Garza', 'Gil', '8326550477', 'cgarza@uceca.edu.mx'), ('Rodrigo', 'Flores', 'Tavitas', '8369940212', 'rflores@uceca.edu.mx'), 
       ('Emiliano', 'González', 'Carrillo', '8322642100', 'egonzalez@uceca.edu.mx'), ('Vanessa', 'Gaytán', 'Puentes', '8341201551', 'vgaytan@uceca.edu.mx');

INSERT INTO prestamo (idusuario, idlibro, fechaprestamo, fechadevolucion) 
VALUES (1, 1, '2020-01-06', '2020-01-08') ,(2, 5, '2020-01-06', '2020-01-08'), (4, 7, '2020-01-06', '2020-01-08'),
       (2, 1, '2020-01-09', '2020-01-16'), (4, 3, '2020-01-09', '2020-01-16'), (3, 2, '2020-01-09', '2020-02-16'),
       (2, 15, '2020-01-09', '2020-01-16'), (1, 14, '2020-01-14', '2020-01-21'), (2, 25, '2020-01-14', '2020-01-21'),
       (4, 17, '2020-01-25', '2020-02-01'), (7, 14, '2020-01-25', '2020-02-01'), (9, 13, '2020-01-25', '2020-02-01'),
       (22, 12, '2020-02-05', '2020-02-12'), (21, 25, '2020-02-05', '2020-02-12'), (35, 10, '2020-02-07', '2020-02-14'),
       (40, 15, '2020-02-07', '2020-02-14'), (15, 7, '2020-02-07', '2020-02-14'), (17, 10, '2020-02-13', '2020-02-20'),
       (11, 3, '2020-02-13', '2020-02-20'), (16, 2, '2020-02-13', '2020-02-20'), (18, 5, '2020-02-13', '2020-02-20'),
       (20, 11, '2020-02-21', '2020-02-28'), (8, 15, '2020-02-21', '2020-02-28'), (5, 17, '2020-02-21', '2020-02-28'),
       (20, 21, '2020-02-25', '2020-03-03'), (40, 23, '2020-02-25', '2020-03-03'), (32, 12, '2020-03-04', '2020-03-11'),
       (24, 5, '2020-03-04', '2020-03-11'), (12, 1, '2020-03-05', '2020-03-12'), (29, 15, '2020-03-07', '2020-03-14'),
       (4, 7, '2020-03-07', '2020-03-14'), (2, 11, '2020-03-12', '2020-03-19'), (14, 13, '2020-03-18', '2020-03-25'),
       (33, 22, '2020-03-18', '2020-03-25'), (12, 15, '2020-03-26', '2020-04-02'), (35, 2, '2020-04-02', '2020-04-09'), 
       (24, 5, '2020-04-08', '2020-04-15'), (17, 1, '2020-04-08', '2020-04-15'), (26, 15, '2020-04-11', '2020-04-19'),
       (14, 17, '2020-04-11', '2020-04-19'), (2, 21, '2020-04-14', '2020-04-21'), (4, 13, '2020-04-14', '2020-04-21'),
       (3, 25, '2020-04-14', '2020-04-21'), (12, 15, '2020-04-16', '2020-04-23'), (34, 2, '2020-04-16', '2020-04-23'),
       (28, 5, '2020-04-16', '2020-04-23'), (27, 5, '2020-04-16', '2020-04-23'), (23, 5, '2020-04-18', '2020-04-25'),
       (12, 5, '2020-04-18', '2020-04-25'), (20, 5, '2020-04-18', '2020-04-25');

INSERT INTO libroautor (idlibro, idautor) 
VALUES (1, 1), (2, 2), (3, 3), (3, 4), (4, 5), (4, 6),
       (5, 7), (6, 8), (6, 9), (7, 10), (7, 11), (8, 12),
       (9, 13), (10, 14), (11, 15), (12, 16), (13, 17), (13, 18),
       (14, 19), (15, 20), (16, 21), (17, 22), (17, 23), (17, 24),
       (17, 25), (18, 26), (19, 27), (20, 28), (21, 29), (22, 30),
       (23, 31), (24, 32), (25, 33);

/* a) Listado de nombre completo de autores y nombre de nacionalidades ordenadas por nombre de nacionalidad */
SELECT au.nombre as NombreAutor, au.apellido as ApellidoAutor, nac.nombre as Nacionalidad
FROM autor au 
inner join nacionalidad nac on au.idnacionalidad = nac.idnacionalidad
ORDER BY nac.nombre;

/* b) Listado de titulos de libros y nombres de editoriales ordenados por nombre de editorial */
SELECT li.titulo as TituloLibro, ed.nombre as NombreEditorial
FROM libro li
inner join editorial ed on li.ideditorial = ed.ideditorial
ORDER BY ed.nombre;

/* c) Listado de nombres de editoriales, nombre de titulos de libros y nombre completo de autores
    ordenados por nombre de editorial y nombre de titulo de libros */
SELECT ed.nombre as Editorial,li.titulo as TituloLibro, 
au.nombre as NombreAutor, au.apellido as ApellidoAutor
FROM libroautor lia
inner join libro li on lia.idlibro = li.idlibro
inner join autor au on lia.idautor = au.idautor
inner join editorial ed on li.ideditorial = ed.ideditorial
ORDER BY ed.nombre,li.titulo;

/* d) Listado de prestamos de libros que incluya titulos de los libros, nombre completo de los usuarios
    que solicitaron los prestamos y fechas de prestamo y de devolucion */
SELECT li.titulo as TituloLibro,us.nombre as NombreUsuario, 
us.paterno as ApellidoPaterno,us.materno as ApellidoMaterno, 
pr.fechaprestamo as FechaPrestamo, pr.fechadevolucion as FechaDevolucion
FROM prestamo pr
inner join usuario us on pr.idusuario = us.idusuario
inner join libro li on pr.idlibro = li.idlibro;

/* e) Listado que muestre el total de prestamos solicitados por titulo de libro */
SELECT count(idusuario) as librosPrestamos, li.titulo as TituloLibro
FROM prestamo pr INNER join libro li on pr.idlibro = li.idlibro
GROUP BY li.titulo;

/* f) Listado que muestre el total de libros publicados por cada editorial */
SELECT COUNT(li.ideditorial) as CantidadLibros,ed.nombre as NombreEditorial FROM libro li
inner join editorial ed on li.ideditorial = ed.ideditorial
GROUP BY ed.nombre;

/* g) Listado que muestre el total de autores por nacionalidad */
SELECT COUNT(au.idnacionalidad) as CantidadNacionalidad, nac.nombre as Nacionalidad
FROM autor au inner join nacionalidad nac on au.idnacionalidad = nac.idnacionalidad
GROUP BY nac.nombre;

/* h) Listado que muestre el total de prestamos solicitados por cada mes */
SELECT DATE_FORMAT(fechaprestamo,'%Y-%m') as mesYanio, COUNT(*) as PrestamosPorMes
FROM prestamo 
GROUP BY mesYanio;

/* i) Listado que muestre el total de prestamos solicitados por usuario (que muestre el nombre completo
    del usuario) */
SELECT COUNT(pr.idusuario) as PrestamosUsuario,us.nombre as nombreUsuario,
us.paterno as ApellidoPaterno,us.materno as ApellidoMaterno
from prestamo pr
inner join usuario us on pr.idusuario = us.idusuario
GROUP BY us.nombre;

/* j) Listado de datos completos de los usuarios que nunca han solicitado prestamos */
SELECT *from usuario
where idusuario not in (SELECT DISTINCT idusuario from prestamo);

/* k) Listado de titulos de libros que nunca han sido solicitados en prestamo */
SELECT titulo from libro
where idlibro not in (SELECT DISTINCT idlibro from prestamo);

/* l) Listado de titulos de libros que tengan mas de un autor ordenados por titulo */
SELECT DISTINCT li.titulo as TituloLibro from libro li
inner join libroautor lia on li.idlibro = lia.idlibro
inner join libroautor lia2 on li.idlibro = lia.idlibro
where lia.idautor <> lia2.idautor
ORDER BY li.titulo;

/* --- Parcial 3 - Tarea 2 --- */
/* a) funcion que devuelva el total de libros consultados por un usuario, cuyo nombre sea pasado como 
    parametro a la funcion */
drop Function `totalLibrosConsultados`;
DELIMITER //
create FUNCTION totalLibrosConsultados(nombreUsuario VARCHAR(30))
RETURNS varchar(100)
BEGIN
    DECLARE existeUsuario int;
    DECLARE libros int;

    SELECT COUNT(*) into existeUsuario from usuario where nombre = nombreUsuario;
    if existeUsuario > 0 THEN
        select COUNT(*) into libros 
        from prestamo pr
        inner join usuario us on pr.idusuario = us.idusuario
        where us.nombre = nombreUsuario;
        RETURN CAST(libros as char);
    else 
        return "El nombre del usuario no existe";
    end if;
END;
//
DELIMITER;
SELECT totalLibrosConsultados('juan');

/* b) Funcion que devuelva el total de usuarios que han consultado al menos un libro en un periodo de tiempo, 
    pasando como parametros a la funcion la fecha de inicio y la fecha de fin del periodo a consultar */
drop Function fechaConsulta;
DELIMITER //
create Function fechaConsulta(fechaInicio date, fechaFinal date)
returns varchar(100)
BEGIN
    DECLARE existeFechaInicio int;
    DECLARE existeFechaFinal int;
    declare totalUsuarios int;

    select count(*) into existeFechaInicio from prestamo where fechaprestamo = fechaInicio;
    select count(*) into existeFechaFinal from prestamo where fechadevolucion = fechaFinal;

    if existeFechaInicio > 0 and existeFechaFinal > 0 THEN
        select count(idusuario) into totalUsuarios from prestamo
        where fechaprestamo >= fechaInicio and fechadevolucion <= fechaFinal
        GROUP BY fechaprestamo;
        return CAST(totalUsuarios as CHAR);
    else 
        return "Los valores ingresados son incorrectos";
    end if;
END
//
DELIMITER;
select fechaConsulta('2020-01-14','2020-01-21');

/* c) Trigger que se active al momento de agregar un prestamo, que valide la fecha del prestamo que sea la
    fecha actual y la fecha de devolucion establecerla a una semana despues */
DELIMITER //
create Trigger validarFecha
BEFORE insert on prestamo
for each row
BEGIN
    if new.fechaprestamo != CURDATE() THEN
        signal SQLSTATE '45000'
        set MESSAGE_TEXT = 'La fecha ingresada debe ser actual';
    else 
        set new.fechadevolucion = CURDATE() + INTERVAL 1 week;
    end if;
END
//
delimiter;
insert into prestamo(idusuario,idlibro,fechaprestamo,fechadevolucion)
values (1,6,CURDATE(),NULL);
insert into prestamo(idusuario,idlibro,fechaprestamo,fechadevolucion)
values (1,6,'2020-01-01',NULL);

/* d) trigger que se active al momento de agregar un prestamo, que valide que el usuario no tenga ya un prestamo
    con devolucion pendiente */
drop TRIGGER validarUsuario;
DELIMITER //
create TRIGGER validarUsuario
before insert on prestamo
for each row 
BEGIN
    DECLARE existePrestamo int;
    
    SELECT COUNT(*) into existePrestamo from prestamo 
    where idusuario = new.idusuario;

    if existePrestamo > 0 THEN
        signal SQLSTATE '45000'
        set MESSAGE_TEXT = 'El usuario ingresado ya tiene un prestamo pendiente';
    end if;
END
//
DELIMITER;
insert into prestamo(idusuario,idlibro,fechaprestamo,fechadevolucion)
values (1,1,CURDATE(),NULL);

/* e) Evento que se active cada dia a las 8 de la mañana, que muestre los prestamos que deben devolverse ese dia */
drop EVENT prestamosPedientes
DELIMITER //
create event prestamosPendientes
on schedule every 1 DAY
starts TIMESTAMP(CURDATE(),'08:00:00')
do
    SELECT pr.idprestamo, us.nombre as nombreUsuario, li.titulo as tituloLibro,
    pr.fechaprestamo, pr.fechadevolucion
    from prestamo pr
    inner join usuario us on pr.idusuario = us.idusuario
    inner join libro li on pr.idlibro = li.idlibro
    where pr.fechadevolucion = CURDATE();

//
delimiter;
SHOW EVENTS;