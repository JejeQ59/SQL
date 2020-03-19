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


