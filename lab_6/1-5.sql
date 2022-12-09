# Lab 6
# Zadanie 1
# a)
SELECT AVG(waga)
FROM kreatura
WHERE rodzaj="wiking";
# b)
SELECT rodzaj, AVG(waga), COUNT(rodzaj)
FROM kreatura
GROUP BY rodzaj;
# c)
SELECT rodzaj, AVG(2022-YEAR(dataUr))
FROM kreatura
GROUP BY rodzaj;
# Zadanie 2
# a)
SELECT rodzaj, SUM(waga)
FROM zasob
WHERE rodzaj IS NOT NULL
GROUP BY rodzaj;
# b)
SELECT nazwa, AVG(waga)
FROM zasob
WHERE ilosc>=4
GROUP BY nazwa
HAVING SUM(waga)>10;
# c)
SELECT rodzaj, COUNT(nazwa)
FROM zasob
WHERE rodzaj IS NOT NULL
GROUP BY rodzaj
HAVING MIN(ilosc) > 1;

# Zadanie 3
# a)
SELECT nazwa, SUM(ilosc) AS ile_niesie
FROM kreatura
JOIN ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury
GROUP BY kreatura.idKreatury;
# b)
SELECT kreatura.nazwa, zasob.nazwa
FROM kreatura
JOIN ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury
JOIN zasob ON ekwipunek.idZasobu=zasob.idZasobu
ORDER BY kreatura.nazwa;
# c)
SELECT kreatura.idKreatury, nazwa
FROM kreatura
LEFT JOIN ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury
WHERE ilosc IS NULL;

# Zadanie 4
# a)
SELECT kreatura.idKreatury, kreatura.nazwa, zasob.nazwa, dataUr
FROM kreatura
NATURAL JOIN ekwipunek
JOIN zasob ON ekwipunek.idZasobu=zasob.idZasobu
WHERE (YEAR(dataUr) BETWEEN 1670 AND 1679) 
AND kreatura.rodzaj='wiking'
ORDER BY kreatura.idKreatury;

# b)
SELECT kreatura.nazwa
FROM kreatura
NATURAL JOIN ekwipunek
JOIN zasob ON ekwipunek.idZasobu=zasob.idZasobu
WHERE zasob.rodzaj="jedzenie"
ORDER BY dataUr DESC;

# c)
SELECT k.nazwa, i.nazwa
FROM kreatura k
JOIN kreatura i
WHERE k.idKreatury-i.idKreatury=5;

# Zadanie 5

# a)

SELECT kreatura.rodzaj, AVG(ekwipunek.ilosc*zasob.ilosc*zasob.waga)
FROM kreatura
JOIN ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury
JOIN zasob ON ekwipunek.idZasobu=zasob.idZasobu
WHERE kreatura.rodzaj NOT IN ("malpa", "waz") AND
ekwipunek.ilosc<30
GROUP BY kreatura.rodzaj;

# b)

(SELECT rodzaj, nazwa, dataUr
FROM kreatura
WHERE dataUr IN
(
SELECT MAX(dataUr)
FROM kreatura
GROUP BY rodzaj
))
UNION ALL
(
SELECT rodzaj, nazwa, dataUr
FROM kreatura
WHERE dataUr IN
(
SELECT MIN(dataUr)
FROM kreatura
GROUP BY rodzaj
))
ORDER BY rodzaj;
