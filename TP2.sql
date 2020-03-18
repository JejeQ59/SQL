create database tp2;

create table pays(
id_pays int not null auto_increment unique primary key,
nom_pays varchar(45));

create table ville(
id_ville int not null auto_increment unique primary key,
nom_ville varchar(45),
id_pays int not null);

create table langue(
id_langue int not null auto_increment unique primary key,
nom_langue varchar(45)
);

create table langue_pays(
	id_pays int not null,
    id_langue int not null
);

ALTER TABLE `tp2`.`ville` 
ADD CONSTRAINT `fk_pays`
  FOREIGN KEY (`id_pays`)
  REFERENCES `tp2`.`pays` (`id_pays`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `tp2`.`langue_pays` 
ADD INDEX `fk_pays_idx` (`id_pays` ASC) VISIBLE,
ADD INDEX `fk_langue_idx` (`id_langue` ASC) VISIBLE;
;
ALTER TABLE `tp2`.`langue_pays` 
ADD CONSTRAINT `fk_pays_2`
  FOREIGN KEY (`id_pays`)
  REFERENCES `tp2`.`pays` (`id_pays`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_langue_2`
  FOREIGN KEY (`id_langue`)
  REFERENCES `tp2`.`langue` (`id_langue`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;  

insert into tp2.pays values (1, 'Allemagne');
insert into tp2.pays values (2, 'Autriche');
insert into tp2.pays values (3, 'Belgique');
insert into tp2.pays values (4, 'Chine');
insert into tp2.pays values (5, 'France');
insert into tp2.pays values (6, 'Italie');
insert into tp2.pays values (7, 'Angleterre');
insert into tp2.pays values (8, 'Etats-Unis');
insert into tp2.pays values (9, 'Inde');

insert into tp2.ville values(1, 'Berlin', 1);
insert into tp2.ville values(2, 'Autriche', 2);
insert into tp2.ville values(3, 'Bruxelles', 3);
insert into tp2.ville values(4, 'Pekin', 4);
insert into tp2.ville values(5, 'Paris', 5);
insert into tp2.ville values(6, 'Rome', 6);
insert into tp2.ville values(7, 'Lille', 5);
insert into tp2.ville values(8, 'Londres', 7);
insert into tp2.ville values(9, 'New-York', 8);
insert into tp2.ville values(10, 'Bombay', 9);

insert into tp2.langue values(1, 'Allemand');
insert into tp2.langue values(2, 'Français');
insert into tp2.langue values(3, 'Anglais');
insert into tp2.langue values(4, 'Mandarin');
insert into tp2.langue values(5, 'Italien');
insert into tp2.langue values(6, 'Flamand');

insert into tp2.langue_pays values(1, 1);
insert into tp2.langue_pays values(2, 1);
insert into tp2.langue_pays values(4, 4);
insert into tp2.langue_pays values(3, 2);
insert into tp2.langue_pays values(3, 6);
insert into tp2.langue_pays values(7, 3);
insert into tp2.langue_pays values(8, 3);
insert into tp2.langue_pays values(9, 3);

select a.nom_pays, c.nom_langue from tp2.pays as a inner join tp2.langue_pays as b on a.id_pays = b.id_pays
inner join tp2.langue as c on b.id_langue = c.id_langue where c.nom_langue = 'Anglais';   
