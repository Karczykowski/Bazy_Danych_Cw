SELECT imie, nazwisko, nazwa
FROM pracownik
JOIN dzial ON pracownik.dzial=dzial.id_dzialu;

SELECT towar.nazwa_towaru, kategoria.nazwa_kategori, stan_magazynowy.ilosc
FROM towar
JOIN kategoria ON towar.kategoria=kategoria.id_kategori
JOIN stan_magazynowy ON towar.id_towaru=stan_magazynowy.towar
ORDER BY ilosc DESC;

SELECT zamowienie.* FROM zamowienie
JOIN status_zamowienia ON zamowienie.status_zamowienia=status_zamowienia.id_statusu_zamowienia
WHERE nazwa_statusu_zamowienia="anulowane";

SELECT * FROM klient
JOIN adres_klienta ON klient.id_klienta=adres_klienta.klient
JOIN typ_adresu ON adres_klienta.typ_adresu=typ_adresu.id_typu
WHERE nazwa="podstawowy" AND miejscowosc="Olsztyn";

#--

SELECT numer_zamowienia, nazwa_towaru, ilosc, cena 
FROM zamowienie 
JOIN pozycja_zamowienia ON zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie
JOIN towar ON pozycja_zamowienia.towar=towar.id_towaru
WHERE YEAR(data_zamowienia)=2018;

CREATE TABLE karczykowskim.towary_full_info AS 
(
SELECT nazwa_towaru, cena_zakupu, nazwa_kategori, ilosc, jednostka_miary.nazwa
FROM towar
JOIN kategoria ON towar.kategoria=kategoria.id_kategori
JOIN stan_magazynowy ON towar.id_towaru=stan_magazynowy.towar
JOIN jednostka_miary ON stan_magazynowy.jm=jednostka_miary.id_jednostki
);

SELECT pozycja_zamowienia.*
FROM pozycja_zamowienia
JOIN
(
SELECT * 
FROM zamowienie
ORDER BY data_zamowienia
LIMIT 5
) AS t
ON pozycja_zamowienia.zamowienie = t.id_zamowienia;

SELECT * FROM zamowienie
JOIN status_zamowienia ON zamowienie.status_zamowienia=status_zamowienia.id_statusu_zamowienia
WHERE nazwa_statusu_zamowienia NOT LIKE "zrealizowane";

SELECT * 
FROM adres_klienta
WHERE kod NOT REGEXP "[0-9]{2}-[0-9]{3}";