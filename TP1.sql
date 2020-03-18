create database tp1;

create table logs(
        adresse_ip varchar(45) not null unique key primary key,
        premiere_visite date not null default now(),
        derniere_visite date not null,
		nombre_visite int 
);

ALTER TABLE `tp1`.`logs` 
CHANGE COLUMN `nombre_visite` `nombre_visite` INT NOT NULL ;

INSERT INTO `tp1`.`logs` (`adresse_ip`, `premiere_visite`, `derniere_visite`, `nombre_visite`) VALUES ('80.80.80.80', '2019-01-01', now(), '2');
INSERT INTO `tp1`.`logs` (`adresse_ip`, `premiere_visite`, `derniere_visite`, `nombre_visite`) VALUES ('120.12.11.10', '2020-01-01', now(), '10');
INSERT INTO `tp1`.`logs` (`adresse_ip`, `premiere_visite`, `derniere_visite`, `nombre_visite`) VALUES ('85.12.1.35', '2020-02-01', now(), '4');
INSERT INTO `tp1`.`logs` (`adresse_ip`, `premiere_visite`, `derniere_visite`, `nombre_visite`) VALUES ('154.32.45.65', '2020-03-01', '2020-03-01', '1');
INSERT INTO `tp1`.`logs` (`adresse_ip`, `premiere_visite`, `derniere_visite`, `nombre_visite`) VALUES ('20.20.20.20', '2019-01-01', now(), '2');
INSERT INTO `tp1`.`logs` (`adresse_ip`, `premiere_visite`, `derniere_visite`, `nombre_visite`) VALUES ('14.14.14.14', '2020-01-01', now(), '10');
INSERT INTO `tp1`.`logs` (`adresse_ip`, `premiere_visite`, `derniere_visite`, `nombre_visite`) VALUES ('12.14.15.16', '2020-02-01', now(), '4');
INSERT INTO `tp1`.`logs` (`adresse_ip`, `premiere_visite`, `derniere_visite`, `nombre_visite`) VALUES ('122.11.15.18', '2020-03-01', '2020-03-01', '1');

select count(*) from logs where derniere_visite = date(now());

UPDATE visiteur set nombre_visite = (nombre_visite + 1) where adresse_ip = "80.80.80.80";






