create database autoecole;

create table eleve(
	id_eleve int not null unique auto_increment primary key,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    adresse varchar(50) not null,
    code_postal varchar(50) not null,
    ville varchar(50) not null
);

create table cdrom(
	id_cdrom int not null unique auto_increment primary key,
    editeur varchar(50)
);

create table serie(
	
);

create table serie_question(
	id_serie int not null,
    id_question int not null,
    numero_ordre int not null
);

create table question(
	id_question int not null unique auto_increment primary key,
    intitule text not null,
    reponse varchar(50) not null,
    difficulte varchar(10) not null
);