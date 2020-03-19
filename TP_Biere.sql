-- TP Bière
--
-- Question 1
select NUMERO_TICKET from ventes where ID_ARTICLE = 500;

-- Question 2
select * from ticket where DATE_VENTE = '2014-01-15';

-- Question 3
select * from ticket where DATE_VENTE between '2014-01-15' and '2014-01-17';

-- Question 4
select distinct NOM_ARTICLE from article as a inner join ventes as v on a.ID_ARTICLE = v.ID_ARTICLE
where v.QUANTITE >= 50; 

-- Question 5
select * from ticket where ANNEE = 2014 and month(DATE_VENTE) = 3;