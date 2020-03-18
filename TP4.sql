create database tp4;

create table utilisateur(
	id_utilisateur int not null unique auto_increment primary key,
    nom_utilisateur varchar(45),
    pwd varchar(500),
    adresse varchar(50),
    code_postal varchar(5),
    email varchar(255)
);

create table produit(
	id_produit int not null unique auto_increment primary key,
    nom_produit varchar(45),
    prix_produit double not null,
    stock_produit int
);

create table panier(
	id_panier int unique auto_increment primary key,
	id_commande int not null,
	id_produit int not null,
    quantite int not null
);

create table commande(
	id_commande int not null unique auto_increment primary key,
    date_commande datetime,
    id_utilisateur int not null 
);

ALTER TABLE `tp4`.`commande` 
ADD INDEX `fk_commande_ut_idx` (`id_utilisateur` ASC) VISIBLE;
;
ALTER TABLE `tp4`.`commande` 
ADD CONSTRAINT `fk_commande_ut`
  FOREIGN KEY (`id_utilisateur`)
  REFERENCES `tp4`.`utilisateur` (`id_utilisateur`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;
  
ALTER TABLE `tp4`.`panier` 
ADD INDEX `fk_panier_com_idx` (`id_commande` ASC) VISIBLE,
ADD INDEX `fk_panier_pro_idx` (`id_produit` ASC) VISIBLE;
;
ALTER TABLE `tp4`.`panier` 
ADD CONSTRAINT `fk_panier_com`
  FOREIGN KEY (`id_commande`)
  REFERENCES `tp4`.`commande` (`id_commande`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_panier_pro`
  FOREIGN KEY (`id_produit`)
  REFERENCES `tp4`.`produit` (`id_produit`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;








