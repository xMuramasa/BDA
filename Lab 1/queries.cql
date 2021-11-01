CREATE KEYSPACE inf325 WITH replication={'class':'SimpleStrategy', 'replication_factor' : 3};
use inf325;

drop table if exists postulaciones_por_carrera;
drop table if exists postulaciones_por_carrera_region;
drop table if exists postulaciones_por_facultad;

-- query 1
CREATE TABLE postulaciones_por_carrera ( 
    CEDULA int, 
    PERIODO int, 
    SEXO text, 
    PREFERENCIA text, 
    CARRERA text, 
    MATRICULADO text, 
    FACULTAD text, 
    PUNTAJE int, 
    GRUPO_DEPEN text, 
    REGION text, 
    LATITUD float, 
    LONGITUD float, 
    PTJE_NEM int, 
    PSU_PROMLM int, 
    PACE text, 
    GRATUIDAD text, 
PRIMARY KEY(
    (MATRICULADO, CARRERA), periodo, cedula
)
);

COPY postulaciones_por_carrera ( 
    CEDULA, PERIODO, SEXO, PREFERENCIA, CARRERA, MATRICULADO, 
    FACULTAD, PUNTAJE, GRUPO_DEPEN, REGION, LATITUD, LONGITUD, 
    PTJE_NEM, PSU_PROMLM, PACE, GRATUIDAD
    ) 
FROM 'postulaciones.csv' WITH DELIMITER=',' AND HEADER=TRUE;

select * from postulaciones_por_carrera where matriculado='SI' and carrera='MEDICINA' order by periodo limit 20;
select count(*) from postulaciones_por_carrera where matriculado='SI' and carrera='MEDICINA' order by periodo;
select count(*) from postulaciones_por_carrera;


-- query 2
CREATE TABLE postulaciones_por_carrera_region ( 
    CEDULA int, 
    PERIODO int, 
    SEXO text, 
    PREFERENCIA text, 
    CARRERA text, 
    MATRICULADO text, 
    FACULTAD text, 
    PUNTAJE int, 
    GRUPO_DEPEN text, 
    REGION text, 
    LATITUD float, 
    LONGITUD float, 
    PTJE_NEM int, 
    PSU_PROMLM int, 
    PACE text, 
    GRATUIDAD text, 
PRIMARY KEY(
    (MATRICULADO, CARRERA, region), periodo, cedula
)
);

COPY postulaciones_por_carrera_region ( CEDULA, PERIODO, SEXO, PREFERENCIA, CARRERA, MATRICULADO, FACULTAD, PUNTAJE, GRUPO_DEPEN, REGION, LATITUD, LONGITUD, PTJE_NEM, PSU_PROMLM, PACE, GRATUIDAD) FROM 'postulaciones.csv' WITH DELIMITER=',' AND HEADER=TRUE;

select * from postulaciones_por_carrera_region where matriculado='SI' and carrera='INGENIERÍA CIVIL INFORMÁTICA' and region='MAULE' order by periodo;
select count(*) from postulaciones_por_carrera_region where matriculado='SI' and carrera='INGENIERÍA CIVIL INFORMÁTICA' and region='MAULE' order by periodo;
select count(*) from postulaciones_por_carrera_region;


-- query 3
CREATE TABLE postulaciones_por_facultad ( 
    CEDULA int, 
    PERIODO int, 
    SEXO text, 
    PREFERENCIA text, 
    CARRERA text, 
    MATRICULADO text, 
    FACULTAD text, 
    PUNTAJE int, 
    GRUPO_DEPEN text, 
    REGION text, 
    LATITUD float, 
    LONGITUD float, 
    PTJE_NEM int, 
    PSU_PROMLM int, 
    PACE text, 
    GRATUIDAD text, 
PRIMARY KEY(
    (MATRICULADO, facultad), puntaje, periodo, cedula, carrera
)
);

COPY postulaciones_por_facultad ( CEDULA, PERIODO, SEXO, PREFERENCIA, CARRERA, MATRICULADO, FACULTAD, PUNTAJE, GRUPO_DEPEN, REGION, LATITUD, LONGITUD, PTJE_NEM, PSU_PROMLM, PACE, GRATUIDAD) FROM 'postulaciones.csv' WITH DELIMITER=',' AND HEADER=TRUE;

select * from postulaciones_por_facultad where matriculado='SI' and facultad='CIENCIAS DE LA SALUD' order by puntaje limit 20;
select count(*) from postulaciones_por_facultad where matriculado='SI' and facultad='CIENCIAS DE LA SALUD' order by puntaje;
select count(*) from postulaciones_por_carrera;




alter table inf325.postulaciones_por_carrera ADD lenguaje text;