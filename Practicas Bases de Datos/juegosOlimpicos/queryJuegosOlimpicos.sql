-- Active: 1698722748862@@127.0.0.1@3306@juegosolimpicos
create database juegosOlimpicos;
use juegosolimpicos;
create table Pais(
    idPais int not null AUTO_INCREMENT,
    Nombre varchar(30) not null,
    Abreviatura varchar(3) not null,
    constraint PK_Pais PRIMARY KEY (idPais)
);
insert into Pais 
VALUES  (1,'Argentina','ARG'),
        (2,'Belgica','BEL'),
        (3,'Mexico','MEX');

create table Genero(   
    idGenero int not null AUTO_INCREMENT,
    Nombre varchar(30) not null,
    constraint PK_Genero PRIMARY KEY (idGenero)
);
insert into Genero 
values  (1,'FEMENINO'),
        (2,'MASCULINO');
create table Atleta(
    idAtleta int not null AUTO_INCREMENT,
    Nombre VARCHAR(30) not null,
    idPais int not null,
    idGenero int not null,
    constraint PK_Atleta PRIMARY KEY (idAtleta),
    constraint FK_PaisAtleta Foreign Key (idPais) REFERENCES Pais(idPais),
    constraint FK_GeneroAtleta Foreign Key (idGenero) REFERENCES Genero(idGenero)
);

insert into Atleta 
values  (1,'Ana','3','1'),
        (2,'Eric','2','2'),
        (3,'Eva','1','1'),
        (4,'Juan','3','2'),
        (5,'Lara','2','1'),
        (6,'Hugo','1','2');
insert into Atleta
values  (7,'Ivan',3,2),
        (8,'Leo',3,2),
        (9,'Luz',2,1),
        (10,'Mar',2,1);

create table Tipo(
    idTipo int not null AUTO_INCREMENT,
    Nombre varchar(10) not null,
    constraint PK_Tipo PRIMARY KEY (idTipo)
);
insert into Tipo
values  (1,'Red'),
        (2,'Combate'),
        (3,'Tiempo');

create table Deporte(
    idDeporte int not null AUTO_INCREMENT,
    Nombre varchar(30) not null,
    idTipo int not null,
    constraint PK_Deporte PRIMARY key (idDeporte),
    constraint FK_TipoDeporte Foreign Key (idTipo) REFERENCES Tipo(idTipo)
);
insert into Deporte 
values  (1,'Voleibol',1),
        (2,'Boxeo',2),
        (3,'Natacion',3);

create table Competencia(
    idCompetencia int not null AUTO_INCREMENT,
    Nombre varchar(50) not null,
    Fecha DATE,
    idDeporte int not null,
    idTipo int not null,
    constraint PK_Competencia PRIMARY KEY (idCompetencia),
    constraint FK_DeporteCompetencia Foreign Key (idDeporte) REFERENCES Deporte(idDeporte),
    constraint FK_TipoCompetencia Foreign Key (idTipo) REFERENCES Tipo(idTipo)
);
insert into Competencia
values  (1,'Natacion','2023-12-15',3,3),
        (2,'Boxeo','2024-01-10',2,2),
        (3,'Voleibol','2024-01-15',1,1);

create table Medalla(
    idMedalla int not null AUTO_INCREMENT,
    Nombre VARCHAR(10) not null,
    constraint PK_Medalla PRIMARY KEY (idMedalla)
);
insert into Medalla
values  (1,'Oro'),
        (2,'Plata'),
        (3,'Bronce');

create table Categoria(
    idCategoria int not null AUTO_INCREMENT,
    Nombre varchar(10) not null,
    constraint PK_Categoria PRIMARY KEY (idCategoria)
);
insert into Categoria
values  (1,'Masculino'),
        (2,'Femenino');

create table CompetenciaAtleta(
    idCompetenciaAtleta int not null AUTO_INCREMENT,
    idCompetencia int not null,
    idAtleta int not null,
    idCategoria int not null,
    idMedalla int not null,
    constraint PK_CompetenciaAtleta PRIMARY key (idCompetenciaAtleta),
    constraint FK_CompentenciaCompetenciaAtleta foreign key (idCompetencia) REFERENCES Competencia(idCompetencia),
    constraint FK_AtletaCompenteciaAtleta foreign key (idAtleta) REFERENCES Atleta(idAtleta),
    constraint FK_CategoriaCompetenciaAtleta Foreign Key (idCategoria) REFERENCES Categoria(idCategoria),
    constraint FK_MedallaCompetenciaAtleta foreign key (idMedalla) REFERENCES Medalla(idMedalla)
);
insert into CompetenciaAtleta
values  (1,1,2,1,1),
        (2,1,4,1,2),
        (3,2,1,2,1),
        (4,2,3,1,2),
        (5,3,5,1,1),
        (6,3,6,1,2),
        (7,2,7,1,1),
        (8,2,8,2,2);

/* b) Escribir el comando select para obtener un listado de los atletas que incluya nombres
    del atleta, de su genero, y de su pais */
select at.`Nombre` as NombreAtleta,ge.`Nombre` AS Genero,pa.`Nombre` as Pais
from atleta at
inner join genero ge on at.`idGenero`= ge.`idGenero`
inner join pais pa on at.`idPais` = pa.`idPais`;

/* c) Escribir el comando select para obtener un listado de las competencias realizadas
    que incluya nombre de la competencia, fecha de la competencia, nombre del deporte y 
    del tipo de deporte */
select comp.`Nombre` as nombreCompetencia,comp.`Fecha`,dep.`Nombre` as Deporte,ti.`Nombre` as TipoDeporte
from competencia comp
inner join tipo ti on comp.`idTipo` = ti.`idTipo`
inner join deporte dep on comp.`idDeporte` = dep.`idDeporte`;

/* d) Escribir el comando select para obtener un listado de los atletas que hayan obtenido una medalla
    de oro en alguna competencia que incluya nombre del atleta, nombre de la competencia y 
    fecha de la competencia */
select at.`Nombre` as nombreAtleta,comp.`Nombre` as nombreCompetencia, comp.`Fecha`, med.`Nombre` as Medalla
from competenciaatleta compa
inner join atleta at on compa.`idAtleta` = at.`idAtleta`
inner join competencia comp on compa.`idCompetencia` = comp.`idCompetencia` 
inner join medalla med on compa.`idMedalla` = med.`idMedalla`
where med.`Nombre` = 'Oro';


/* -- Parcial 3. Actividad 1 --*/
/* b. Escribir un procedimiento almacenado para agregar un atleta pero verificando primero si existe
    el pais y el genero que le corresponde, si existen se agrega el atleta, si no existen, no se agregara */
DELIMITER //
create Procedure agregarAtleta(
    in nombreCP VARCHAR(30),
    in idpaisCP int,
    in idgeneroCP int
)
BEGIN
    DECLARE paisExiste int;
    DECLARE geneExiste int;
    select idPais into paisExiste from pais where idPais = idpaisCP;
    select idGenero into geneExiste from genero WHERE idGenero = idgeneroCP;

    if paisExiste > 0 and geneExiste > 0 THEN
        insert into Atleta(Nombre,idPais,idGenero)
        VALUES(nombreCP,idpaisCP,idgeneroCP);
    ELSE
        SELECT 'El pais y el genero no existen.' AS Alerta;
    end if;
end;
//
DELIMITER;
call agregarAtleta('Angel',2,1);
SELECT *from atleta;

/* c. Escribir un procedimiento almacenado para agregar un pais verificando primero que no exista
    ni el nombre ni la abreviatura, si existe mostrar datos del pais, si no existe agregar los 
    datos a la tabla */
DELIMITER //
create Procedure verificarPais(
    in nombrePais varchar(30),
    in abrevPais VARCHAR(3)
)
BEGIN
    declare paisExiste int;
    DECLARE abreExiste int;
    SELECT idPais into paisExiste from pais WHERE Nombre = nombrePais;
    SELECT idPais into abreExiste from pais where Abreviatura = abrevPais;

    if paisExiste > 0 and abreExiste > 0 THEN
        SELECT 'El pais y la abreviatura ya existen' as Alerta;
        SELECT * from pais WHERE Nombre = nombrePais and Abreviatura = abrevPais;
    ELSE
        SELECT 'El pais y la abreviatura NO ya existen. Agregar datos:' as Alerta;
        insert into pais(`Nombre`,`Abreviatura`)
        VALUES(nombrePais,abrevPais);
    end if;
END;
//
DELIMITER;
call verificarPais('Angona','AGO');
SELECT * from pais;

/* d. Escribir un procedimiento almacenado para calcular el total de medallas obtenidas por
    todos los paises en todas las competencias */
DELIMITER //
create Procedure Medallas()
BEGIN
    select pa.`Nombre` as Pais, COUNT(ca.`idMedalla`) as Medallas
    from pais pa
    inner join atleta at on at.`idPais` = pa.`idPais`
    inner join competenciaatleta ca on ca.`idAtleta` = at.`idAtleta`
    GROUP BY pa.`Nombre`;
END;
//
DELIMITER;
call Medallas();

/* e. Escribir un procedimiento almacenado para obtener un listado de las competencias
    donde un pais obtuvo medallas, pasando como parametros el nombre del pais y 
    el nombre de la medalla. */
DELIMITER //
create Procedure CompetenciasPais(
    in Pais varchar(30),
    in Medalla varchar(10)
)
BEGIN
    DECLARE paisExiste int;
    DECLARE medExiste int;
    select idPais into paisExiste from pais where `Nombre` = Pais;
    select idMedalla into medExiste from medalla where `Nombre` = Medalla;

    if paisExiste > 0 and medExiste > 0 THEN
        SELECT pa.`Nombre` as Pais,me.`Nombre` as Medalla, co.`Nombre` as Competencia
        from competencia co
        inner join competenciaatleta ca on co.`idCompetencia` = ca.`idCompetencia`
        inner join atleta at on ca.`idAtleta` = at.`idAtleta`
        inner join pais pa on at.`idPais` = pa.`idPais`
        inner join medalla me on ca.`idMedalla` = me.`idMedalla`
        where pa.`Nombre` = Pais and me.`Nombre` = Medalla;
    ELSE
        SELECT 'El pais y la medalla no existen' as Alerta;
    end if;
END;
//
DELIMITER;
call CompetenciasPais('Argentina','Plata');

/* f. Escribir un procedimiento almacenado para obtener un listado de competencias en una
    fecha en particular, pasando como parametro la fecha deseada */
DELIMITER //
create Procedure CompetenciasFechas(
    in FechaCom date
)
BEGIN
    DECLARE fecExiste int;
    SELECT idCompetencia into fecExiste FROM competencia where `Fecha` = FechaCom;

    if fecExiste > 0 THEN
        SELECT `Nombre` as Competencia from competencia where `Fecha` = FechaCom;
    ELSE
        SELECT 'La fecha no existe' as Alerta;
    end if;
END;
//
DELIMITER;
call CompetenciasFechas('2023-12-15');