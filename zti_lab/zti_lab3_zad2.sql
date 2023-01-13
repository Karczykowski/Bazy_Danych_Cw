# zti_bazy -- lab 3 zad 2
# 1)
SELECT d.nazwa, MAX(p.pensja), MIN(p.pensja), AVG(p.pensja)
FROM dzial d
JOIN pracownik p ON d.id_dzialu = p.dzial
GROUP by d.nazwa;

# 2)
SELECT k.pelna_nazwa, SUM(p.ilosc*p.cena)
FROM klient k
JOIN zamowienie z ON k.id_klienta=z.klient
JOIN pozycja_zamowienia p ON z.id_zamowienia=p.zamowienie
GROUP BY k.id_klienta
ORDER BY SUM(p.ilosc*p.cena) DESC LIMIT 10;

# 3)
SELECT *
FROM status_zamowienia;
SELECT YEAR(data_zamowienia), SUM(ilosc*cena) FROM pozycja_zamowienia p
JOIN zamowienie z ON p.zamowienie=z.id_zamowienia
WHERE z.status_zamowienia=5
GROUP BY YEAR(data_zamowienia)
ORDER BY SUM(ilosc*cena) DESC;

# 4)
SELECT SUM(p.cena*p.ilosc)
FROM pozycja_zamowienia p
JOIN zamowienie z ON p.zamowienie=z.id_zamowienia
WHERE z.status_zamowienia=6;

# 5)
SELECT miejscowosc, COUNT(*), SUM(p.ilosc*p.cena)
FROM adres_klienta a
JOIN zamowienie z ON z.klient=a.klient
JOIN pozycja_zamowienia p ON p.zamowienie=z.id_zamowienia
WHERE a.typ_adresu=1
GROUP BY miejscowosc;

# 6)
SELECT SUM(p.ilosc*p.cena) - SUM(p.ilosc*t.cena_zakupu)
FROM zamowienie z
JOIN pozycja_zamowienia p ON p.zamowienie=z.id_zamowienia
JOIN  towar t ON t.id_towaru=p.towar
WHERE z.status_zamowienia = 5;

# 7)
SELECT YEAR(z.data_zamowienia), SUM(p.ilosc*p.cena) - SUM(p.ilosc*t.cena_zakupu)
FROM zamowienie z
JOIN pozycja_zamowienia p ON p.zamowienie=z.id_zamowienia
JOIN  towar t ON t.id_towaru=p.towar
WHERE z.status_zamowienia = 5
GROUP BY YEAR(z.data_zamowienia);

# 8)
SELECT nazwa_kategori, SUM(s.ilosc*t.cena_zakupu)
FROM stan_magazynowy s
JOIN towar t ON s.towar=t.id_towaru 
JOIN kategoria k ON t.kategoria=k.id_kategori 
GROUP BY k.id_kategori;

# 9)
SELECT MONTHNAME(data_urodzenia), COUNT(id_pracownika)
FROM pracownik
GROUP BY MONTHNAME(data_urodzenia)
ORDER BY MONTH(data_urodzenia);

# 10)
SELECT p.imie, p.nazwisko, TIMESTAMPDIFF(MONTH,data_zatrudnienia,CURDATE()) * p.pensja
FROM pracownik AS p