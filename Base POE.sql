CREATE TABLE IF NOT EXISTS poe.utilisateur (
  id_utilisateur INT not null auto_increment ,
  nom VARCHAR(45) NOT NULL,
  prenom VARCHAR(45) NOT NULL,
  date_naissance DATE NULL,
  email VARCHAR(255) NOT NULL,
  adresse VARCHAR(45) NULL,
  id_ville INT NULL,
  sexe ENUM("f", "m", "n") default 'n',
  PRIMARY KEY (id_utilisateur),
  UNIQUE INDEX id_utilisateur_UNIQUE (id_utilisateur ASC) VISIBLE);
  
 drop table poe.ville; 
  
 CREATE TABLE IF NOT EXISTS poe.ville (
	id_ville INT not null auto_increment ,
    nom_ville varchar(45),
    code_postal varchar(5),
    id_departement int not null,
    PRIMARY KEY (id_ville),
  UNIQUE INDEX id_ville_UNIQUE (id_ville ASC) VISIBLE);
 
 
 CREATE TABLE IF NOT EXISTS poe.departement (
	id_departement INT not null auto_increment ,
    nom_departement varchar(45),
    id_region int not null,
 PRIMARY KEY (id_departement),
  UNIQUE INDEX id_departement_UNIQUE (id_departement ASC) VISIBLE);
  
  CREATE TABLE IF NOT EXISTS poe.region (
	id_region INT not null auto_increment ,
    nom_region varchar(45),
 PRIMARY KEY (id_region),
  UNIQUE INDEX id_region_UNIQUE (id_region ASC) VISIBLE);
  
  alter table utilisateur
  add constraint foreign key (id_ville)
  references ville (id_ville);
  
  alter table ville
  add constraint foreign key (id_departement)
  references departement (id_departement);
  
  alter table departement
  add constraint foreign key (id_region)
  references region (id_region);
  
 create table poe.privilege(
 id_privilege int not null auto_increment unique primary key,
 nom_privilege varchar(50) not null
 );
 
 create table utilisateur_privilege(
	id_utilisateur int not null,
    id_privilege int not null
 );
 
 alter table utilisateur_privilege
 add constraint fk_utilisateur foreign key(id_utilisateur)
 references utilisateur(id_utilisateur)
 on delete restrict
 on update cascade;
 
 alter table utilisateur_privilege
 add constraint fk_privilege foreign key(id_privilege)
 references privilege(id_privilege)
 on delete restrict
 on update cascade;
 
 insert into