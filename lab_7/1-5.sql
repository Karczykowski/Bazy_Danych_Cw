# Lab7
# Zadanie 1
# a)
DELETE FROM kreatura;
INSERT INTO kreatura SELECT * FROM wikingowie.kreatura;
SELECT * FROM kreatura;

CREATE TABLE uczestnicy AS SELECT * FROM wikingowie.uczestnicy;
CREATE TABLE etapy_wyprawy AS SELECT * FROM wikingowie.etapy_wyprawy;
CREATE TABLE sektor AS SELECT * FROM wikingowie.sektor;
CREATE TABLE wyprawa AS SELECT * FROM wikingowie.wyprawa;

# b)
SELECT nazwa FROM kreatura
LEFT JOIN uczestnicy ON kreatura.idKreatury=uczestnicy.id_uczestnika
WHERE id_wyprawy IS NULL;

# c)

SELECT nazwa, SUM(ilosc) FROM wyprawa
JOIN uczestnicy ON wyprawa.id_wyprawy=uczestnicy.id_wyprawy
JOIN ekwipunek ON uczestnicy.id_uczestnika=ekwipunek.idKreatury
GROUP BY nazwa;

# Zadanie 2
# a)
SELECT wyprawa.nazwa, COUNT(id_uczestnika), GROUP_CONCAT(kreatura.nazwa) FROM wyprawa
JOIN uczestnicy ON wyprawa.id_wyprawy=uczestnicy.id_wyprawy
JOIN kreatura ON uczestnicy.id_uczestnika=kreatura.idKreatury
GROUP BY wyprawa.nazwa;
SELECT * FROM wyprawa;
# b)
SELECT wyprawa.nazwa AS "nazwa wyprawy" ,sektor.nazwa AS "nazwa sektora", idEtapu, data_rozpoczecia, kreatura.nazwa FROM sektor
JOIN etapy_wyprawy ON sektor.id_sektora=etapy_wyprawy.sektor
JOIN wyprawa ON wyprawa.id_wyprawy=etapy_wyprawy.idWyprawy
JOIN kreatura ON kreatura.idKreatury=wyprawa.kierownik
ORDER BY data_rozpoczecia,wyprawa.id_wyprawy, kolejnosc;

# Zadanie 3
# a)
SELECT sektor.nazwa, ifnull(count(sektor),0)
FROM sektor
LEFT JOIN etapy_wyprawy ON sektor.id_sektora=etapy_wyprawy.sektor
GROUP BY id_sektora
ORDER BY id_sektora;		

# b)
SELECT kreatura.nazwa, IF(COUNT(uczestnicy.id_wyprawy)>0,"bral udzial w wyprawie","nie bral udzialu w wyprawie") AS CzyBralUdzial
FROM kreatura
LEFT JOIN uczestnicy 
ON kreatura.idKreatury = uczestnicy.id_uczestnika
GROUP BY kreatura.nazwa;

# Zadanie 4
# a)
SELECT wyprawa.nazwa, sum(length(dziennik)) dlugosc
FROM wyprawa
JOIN etapy_wyprawy ON wyprawa.id_wyprawy=etapy_wyprawy.idWyprawy 
GROUP BY wyprawa.nazwa 
HAVING dlugosc<400;

# b)
SELECT w.nazwa, sum(e.ilosc * z.waga) / COUNT(DISTINCT u.id_uczestnika) AS srednio
FROM wyprawa w
JOIN uczestnicy u ON w.id_wyprawy=u.id_wyprawy
JOIN ekwipunek e ON u.id_uczestnika=e.idKreatury
JOIN zasob z ON e.idZasobu=z.idZasobu
GROUP BY w.id_wyprawy;

# Zadanie 5
SELECT kreatura.nazwa, wyprawa.nazwa,
DATEDIFF(wyprawa.data_rozpoczecia, kreatura.dataUr) as 'Wiek w dniach'
FROM kreatura, etapy_wyprawy, wyprawa, sektor, uczestnicy
WHERE etapy_wyprawy.sektor = sektor.id_sektora
AND etapy_wyprawy.idWyprawy = wyprawa.id_wyprawy
AND kreatura.idKreatury = uczestnicy.id_uczestnika
AND uczestnicy.id_wyprawy = wyprawa.id_wyprawy
AND sektor.nazwa = "Chatka dziadka";