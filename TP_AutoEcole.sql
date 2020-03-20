create database autoecole;

create table eleve(
	id_eleve int not null unique auto_increment primary key,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    date_naissance datetime,
    adresse varchar(50) not null,
    code_postal varchar(50) not null,
    ville varchar(50) not null
);

create table cdrom(
	id_cdrom int not null unique auto_increment primary key,
    editeur varchar(50)
);

create table serie(
	id_serie int not null unique auto_increment primary key,
    id_cdrom int not null
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
    difficulte varchar(10) not null,
    id_theme int not null
);

create table theme(
	id_theme int not null unique auto_increment primary key,
    intitule varchar(50) not null
);

create table session(
	id_session int not null unique auto_increment primary key,
    libelle_session varchar(50),
    date_session datetime not null,
    id_serie int not null
);

create table session_eleve(
	id_session int not null,
    id_eleve int not null,
    nb_fautes int not null
);

create table examen(
	id_examen int not null unique auto_increment primary key,
    date_examen datetime not null
);

create table examen_eleve(
	id_examen int not null,
    id_eleve int not null,
    isRecu boolean not null default false
);

ALTER TABLE `autoecole`.`serie` 
ADD INDEX `fk_id_cdrom_idx` (`id_cdrom` ASC) VISIBLE;
;
ALTER TABLE `autoecole`.`serie` 
ADD CONSTRAINT `fk_id_cdrom`
  FOREIGN KEY (`id_cdrom`)
  REFERENCES `autoecole`.`cdrom` (`id_cdrom`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;
  
ALTER TABLE `autoecole`.`question` 
ADD INDEX `fk_id_theme_idx` (`id_theme` ASC) VISIBLE;
;
ALTER TABLE `autoecole`.`question` 
ADD CONSTRAINT `fk_id_theme`
  FOREIGN KEY (`id_theme`)
  REFERENCES `autoecole`.`theme` (`id_theme`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;
  
ALTER TABLE `autoecole`.`serie_question` 
ADD INDEX `fk_id_serie_idx` (`id_serie` ASC) VISIBLE,
ADD INDEX `fk_id_question_idx` (`id_question` ASC) VISIBLE;
;

ALTER TABLE `autoecole`.`serie_question` 
ADD CONSTRAINT `fk_id_serie`
  FOREIGN KEY (`id_serie`)
  REFERENCES `autoecole`.`serie` (`id_serie`)
  ON DELETE CASCADE
  ON UPDATE RESTRICT,
ADD CONSTRAINT `fk_id_question`
  FOREIGN KEY (`id_question`)
  REFERENCES `autoecole`.`question` (`id_question`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;
  
ALTER TABLE `autoecole`.`session` 
ADD INDEX `fk_id_serie_idx` (`id_serie` ASC) VISIBLE;
;
ALTER TABLE `autoecole`.`session` 
ADD CONSTRAINT `fk_id_serie_s`
  FOREIGN KEY (`id_serie`)
  REFERENCES `autoecole`.`serie` (`id_serie`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE; 
  
ALTER TABLE `autoecole`.`session_eleve` 
ADD INDEX `fk_id_session_se_idx` (`id_session` ASC) VISIBLE,
ADD INDEX `fk_id_eleve_idx` (`id_eleve` ASC) VISIBLE;
;
ALTER TABLE `autoecole`.`session_eleve` 
ADD CONSTRAINT `fk_id_session_se`
  FOREIGN KEY (`id_session`)
  REFERENCES `autoecole`.`session` (`id_session`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_id_eleve`
  FOREIGN KEY (`id_eleve`)
  REFERENCES `autoecole`.`eleve` (`id_eleve`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;
  
 ALTER TABLE `autoecole`.`examen_eleve` 
ADD INDEX `fk_ideleve_ex_idx` (`id_eleve` ASC) VISIBLE,
ADD INDEX `fk_idexamen_ex_idx` (`id_examen` ASC) VISIBLE;
;
ALTER TABLE `autoecole`.`examen_eleve` 
ADD CONSTRAINT `fk_ideleve_ex`
  FOREIGN KEY (`id_eleve`)
  REFERENCES `autoecole`.`eleve` (`id_eleve`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_idexamen_ex`
  FOREIGN KEY (`id_examen`)
  REFERENCES `autoecole`.`examen` (`id_examen`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE; 
  
-- eleve qui ont au moins échoué une fois à l'examen
select nom from eleve as e inner join examen_eleve as ee on e.id_eleve = ee.id_eleve
