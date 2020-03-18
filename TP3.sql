create database tp3;

create table utilisateur(
	id_utilisateur int not null unique auto_increment primary key,
    nom_utilisateur varchar(45)
);

create table article(
	id_article int not null unique auto_increment primary key,
    nom_article varchar(45),
    contenu_article text,
    id_utilisateur int not null,
    id_categorie int not null
);

create table categorie(
	id_categorie int not null unique auto_increment primary key,
    nom_categorie varchar(45) not null
);

create table commentaire(
	id_commentaire int not null unique auto_increment primary key,
    commentaire varchar(255) not null,
    id_utilisateur int not null,
    id_article int not null
);

create table tag(
	id_tag int not null unique auto_increment primary key,
    nom_tag varchar(45)
);

create table article_tag(
	id_article int not null,
    id_tag int not null
);

ALTER TABLE `tp3`.`article_tag` 
ADD INDEX `fk_article_at_idx` (`id_article` ASC) VISIBLE,
ADD INDEX `fk_tag_at_idx` (`id_tag` ASC) VISIBLE;
;
ALTER TABLE `tp3`.`article_tag` 
ADD CONSTRAINT `fk_article_at`
  FOREIGN KEY (`id_article`)
  REFERENCES `tp3`.`article` (`id_article`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tag_at`
  FOREIGN KEY (`id_tag`)
  REFERENCES `tp3`.`tag` (`id_tag`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;
  
  ALTER TABLE `tp3`.`commentaire` 
ADD INDEX `fk_utilisateur_com_idx` (`id_utilisateur` ASC) VISIBLE,
ADD INDEX `fk_article_com_idx` (`id_article` ASC) VISIBLE;
;
ALTER TABLE `tp3`.`commentaire` 
ADD CONSTRAINT `fk_utilisateur_com`
  FOREIGN KEY (`id_utilisateur`)
  REFERENCES `tp3`.`utilisateur` (`id_utilisateur`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_article_com`
  FOREIGN KEY (`id_article`)
  REFERENCES `tp3`.`article` (`id_article`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;
  
  ALTER TABLE `tp3`.`article` 
ADD INDEX `fk_utilisateur_art_idx` (`id_utilisateur` ASC) VISIBLE,
ADD INDEX `fk_categorie_art_idx` (`id_categorie` ASC) VISIBLE;
;
ALTER TABLE `tp3`.`article` 
ADD CONSTRAINT `fk_utilisateur_art`
  FOREIGN KEY (`id_utilisateur`)
  REFERENCES `tp3`.`utilisateur` (`id_utilisateur`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_categorie_art`
  FOREIGN KEY (`id_categorie`)
  REFERENCES `tp3`.`categorie` (`id_categorie`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;















