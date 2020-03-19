-- TP Bière
--
-- Question 1
select NUMERO_TICKET from ventes where ID_ARTICLE = 500;

-- Question 2
select * from ticket where DATE_VENTE = '2014-01-15';

-- Question 3
select * from ticket where DATE_VENTE = '2014-01-15' and DATE_VENTE = '2014-01-17';

-- Question 4
select distinct NOM_ARTICLE from article as a inner join ventes as v on a.ID_ARTICLE = v.ID_ARTICLE
where v.QUANTITE >= 50; 

-- Question 5
select * from ticket where ANNEE = 2014 and month(DATE_VENTE) = 3;

-- Question 6
select * from ticket where ANNEE = 2014 and (month(DATE_VENTE) = 3 or month(DATE_VENTE) = 4);

-- Question 7
select * from ticket where ANNEE = 2014 and (month(DATE_VENTE) = 3 or month(DATE_VENTE) = 6);

-- Question 8
select ID_ARTICLE, NOM_ARTICLE, c.NOM_COULEUR from article as a inner join couleur as c on a.ID_Couleur = c.ID_Couleur order by c.NOM_COULEUR;

-- Question 9
select ID_ARTICLE, NOM_ARTICLE, id_couleur from article where ID_Couleur is null;

-- Question 10
select sum(quantite), NUMERO_TICKET from ventes group by NUMERO_TICKET order by 1 desc;

-- Question 11
select sum(quantite), NUMERO_TICKET from ventes group by NUMERO_TICKET having sum(quantite) > 500 order by 1 desc;

-- Question 12
select sum(quantite), NUMERO_TICKET from ventes where quantite < 50
group by NUMERO_TICKET having sum(quantite) > 500  order by 1 desc;

-- Question 13
select ID_ARTICLE, NOM_ARTICLE, VOLUME, TITRAGE, t.NOM_TYPE from article as a inner join type as t on a.ID_TYPE = t.ID_TYPE
where t.NOM_TYPE = 'Trappiste';

-- Question 14
select m.NOM_MARQUE, c.NOM_CONTINENT from marque as m inner join pays as p on m.ID_PAYS = p.ID_PAYS inner join continent as c on p.ID_CONTINENT = c.ID_CONTINENT
where c.NOM_CONTINENT = 'Afrique';

-- Question 15
select a.NOM_ARTICLE, c.NOM_CONTINENT from article as a inner join marque as m on a.ID_MARQUE = m.ID_MARQUE inner join pays as p on m.ID_PAYS = p.ID_PAYS inner join continent as c on p.ID_CONTINENT = c.ID_CONTINENT
where c.NOM_CONTINENT = 'Afrique';

-- Question 16
select v.NUMERO_TICKET, v.ANNEE, ROUND(sum(a.prix_achat * quantite * 1.15), 2) as Prix_total_ticket from ventes as v inner join article as a on v.ID_ARTICLE = a.ID_ARTICLE
group by v.NUMERO_TICKET, v.ANNEE;

-- Question 17
select v.ANNEE, ROUND(sum(a.prix_achat * quantite * 1.15), 2) as CA from ventes as v inner join article as a on v.ID_ARTICLE = a.ID_ARTICLE
group by v.ANNEE;

-- Question 18
select sum(QUANTITE), id_article, annee from ventes where annee = 2016 group by id_article, annee order by id_article;

-- Question 19
select sum(QUANTITE), id_article, annee from ventes where annee in (2014, 2015, 2016) group by id_article, annee order by id_article;

-- Question 20
select ID_ARTICLE, NOM_ARTICLE from article where id_article not in (select id_article from ventes where annee = 2014);  

-- Question 21
select distinct NOM_PAYS from pays as p inner join marque as m on p.ID_PAYS = m.ID_PAYS 
inner join article as a on m.ID_MARQUE = a.ID_MARQUE 
inner join type as t on a.ID_TYPE = t.ID_TYPE where t.NOM_TYPE = 'Trappiste';

select distinct NOM_PAYS from pays as p inner join marque as m on p.ID_PAYS = m.ID_PAYS 
where m.ID_MARQUE in ( 
select m2.id_marque from marque as m2 inner join article as a on m2.ID_MARQUE = a.ID_MARQUE
inner join type as t on a.ID_TYPE = t.ID_TYPE where t.NOM_TYPE = 'Trappiste' );

select distinct NOM_PAYS from pays as p inner join marque as m on p.ID_PAYS = m.ID_PAYS 
where m.ID_MARQUE in ( 
select m2.id_marque from marque as m2 where m2.ID_MARQUE in (select ID_MARQUE from article as a
inner join type as t on a.ID_TYPE = t.ID_TYPE where t.NOM_TYPE = 'Trappiste' ));

-- Question 22
select numero_ticket from ventes where id_article in(
select ID_ARTICLE from ventes where annee = 2014 and NUMERO_TICKET = 856);

-- Question 23
select ID_ARTICLE, NOM_ARTICLE from article where TITRAGE > (
select max(titrage) from article as a
inner join type as t on a.ID_TYPE = t.ID_TYPE where t.NOM_TYPE = 'Trappiste');

-- Question 24
select sum(quantite), c.NOM_COULEUR  from ventes as v inner join article as a on v.ID_ARTICLE = a.ID_ARTICLE inner join couleur as c 
on a.id_couleur = c.id_couleur group by c.NOM_COULEUR;

-- Question 25
select f.NOM_FABRICANT , count(distinct NUMERO_TICKET) from fabricant as f inner join marque as m on f.ID_FABRICANT = m.ID_FABRICANT 
inner join article as a on m.ID_MARQUE = a.ID_MARQUE inner join ventes as v on a.ID_ARTICLE = v.ID_ARTICLE group by f.NOM_FABRICANT;

-- Question 26
select a.ID_ARTICLE, a.NOM_ARTICLE, a.VOLUME, sum(quantite) as quantite_vendue from article as a 
inner join ventes as v on a.ID_ARTICLE = v.ID_ARTICLE 
where ANNEE = 2016
group by a.ID_ARTICLE, a.NOM_ARTICLE, a.VOLUME order by 4 desc limit 20;

-- Question 27
select a.ID_ARTICLE, a.NOM_ARTICLE, a.VOLUME, sum(quantite) as quantite_vendue, t.nom_type from article as a 
inner join ventes as v on a.ID_ARTICLE = v.ID_ARTICLE 
inner join type as t on a.ID_TYPE = t.ID_TYPE where ANNEE = 2016 and t.NOM_TYPE = 'Trappiste'
group by a.ID_ARTICLE, a.NOM_ARTICLE, a.VOLUME order by 4 desc limit 5;

-- Question 28
select a.ID_ARTICLE, a.NOM_ARTICLE, a.VOLUME,
(select sum(quantite) from ventes v1
where ANNEE = 2015 and a.ID_ARTICLE = v1.ID_ARTICLE) as quantite_2015, 
(select sum(quantite) from ventes v1
where ANNEE = 2016 and a.ID_ARTICLE = v1.ID_ARTICLE) as quantite_2016 ,
(((select sum(quantite) from ventes v1
where ANNEE = 2016 and a.ID_ARTICLE = v1.ID_ARTICLE) - (select sum(quantite) from ventes v1
where ANNEE = 2015 and a.ID_ARTICLE = v1.ID_ARTICLE)) / (select sum(quantite) from ventes v1
where ANNEE = 2016 and a.ID_ARTICLE = v1.ID_ARTICLE)) * 100 as variation
from article as a where (((select sum(quantite) from ventes v1
where ANNEE = 2016 and a.ID_ARTICLE = v1.ID_ARTICLE) - (select sum(quantite) from ventes v1
where ANNEE = 2015 and a.ID_ARTICLE = v1.ID_ARTICLE)) / (select sum(quantite) from ventes v1
where ANNEE = 2016 and a.ID_ARTICLE = v1.ID_ARTICLE)) * 100 between -1 and 1; 

-- Question 29
select a.ID_ARTICLE, a.NOM_ARTICLE, a.VOLUME,
(select sum(quantite) from ventes v1
where ANNEE = 2015 and a.ID_ARTICLE = v1.ID_ARTICLE) as quantite_2015, 
(select sum(quantite) from ventes v1
where ANNEE = 2016 and a.ID_ARTICLE = v1.ID_ARTICLE) as quantite_2016, 
((select sum(quantite) from ventes v1
where ANNEE = 2016 and a.ID_ARTICLE = v1.ID_ARTICLE) - (select sum(quantite) from ventes v1
where ANNEE = 2015 and a.ID_ARTICLE = v1.ID_ARTICLE))   as variation
from article as a order by variation;

-- Question 30
select * from ticket where numero_ticket not in (select numero_ticket from ventes);

-- Question 31
SELECT a.id_article, a.nom_article , SUM(v.QUANTITE) FROM article as a
INNER JOIN ventes as v on a.ID_ARTICLE = v.ID_ARTICLE
WHERE v.ANNEE = 2016 
GROUP BY a.ID_ARTICLE
HAVING SUM(v.QUANTITE) >= (SELECT SUM(QUANTITE-(QUANTITE*15/100)) as quantite FROM ventes
									WHERE ANNEE = 2016 GROUP BY ID_ARTICLE ORDER BY quantite DESC LIMIT 1);

-- Question 32
update article as a inner join type as t on a.id_type = t.ID_TYPE 
INNER JOIN couleur as c ON c.ID_Couleur = a.ID_COULEUR set prix_achat = prix_achat * 1.1 where t.NOM_TYPE = 'Trappiste' and c.NOM_COULEUR = 'Blonde';

-- Question 33
 update article as a inner join (select min(titrage) as min_tit, a.id_couleur, a.id_type from article as a inner join couleur as c on a.id_couleur = c.id_couleur
 inner join type as t on a.id_type = t.id_type group by  a.id_couleur, a.id_type) as art
 on art.id_couleur = a.id_couleur and art.id_type = a.id_type set titrage = min_tit
 where titrage is null and a.id_couleur is not null and a.id_type is not null;  

-- Question 34




