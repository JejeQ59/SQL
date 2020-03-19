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

select * from ventes where id_article = 1063 and annee = 2016

