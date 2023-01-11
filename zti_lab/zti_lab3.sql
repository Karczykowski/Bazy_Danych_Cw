# 3)
SELECT nazwa, COUNT(pracownik.id_pracownika)
FROM dzial
JOIN pracownik ON dzial.id_dzialu=pracownik.dzial
GROUP BY nazwa;

# 4)
SELECT nazwa_kategori, SUM(ilosc) 
FROM towar t
JOIN kategoria k ON t.kategoria=k.id_kategori
JOIN stan_magazynowy s ON s.towar=t.id_towaru
GROUP BY nazwa_kategori;

# 5)
SELECT nazwa_kategori, GROUP_CONCAT(nazwa_towaru) 
FROM kategoria
JOIN towar ON kategoria.id_kategori=towar.kategoria
GROUP BY nazwa_kategori;

# 6)
SELECT ROUND(AVG(pensja),2) FROM pracownik;

# 7)
SELECT AVG(pensja) 
FROM pracownik
WHERE 2023-YEAR(data_zatrudnienia)>=5;

# 8)
SELECT nazwa_towaru, COUNT(id_pozycji)
FROM pozycja_zamowienia
JOIN towar ON towar.id_towaru=pozycja_zamowienia.towar
GROUP BY nazwa_towaru
ORDER BY COUNT(id_pozycji) DESC LIMIT 10;

# 9)
SELECT numer_zamowienia, cena
FROM zamowienie
JOIN pozycja_zamowienia ON zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie
WHERE (MONTH(data_zamowienia) BETWEEN 1 AND 3)
AND YEAR(data_zamowienia) = 2017;

# 10)
SELECT imie, nazwisko, SUM(cena)
FROM pracownik
JOIN zamowienie ON pracownik.id_pracownika=zamowienie.pracownik_id_pracownika
JOIN pozycja_zamowienia ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia
GROUP BY id_pracownika ORDER BY SUM(cena) DESC;