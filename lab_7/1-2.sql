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