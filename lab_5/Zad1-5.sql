# 1. Zadanie
# a)

# CREATE TABLE kreatura LIKE wikingowie.kreatura - TABELA BEZ DANYCH
CREATE TABLE kreatura SELECT * FROM wikingowie.kreatura; # 1 do 1
CREATE TABLE zasob SELECT * FROM wikingowie.zasob;
CREATE TABLE ekwipunek SELECT * FROM wikingowie.ekwipunek;

# b)

SELECT * FROM zasob;

# c)

SELECT * FROM zasob WHERE rodzaj="jedzenie";

# d)

SELECT idZasobu, ilosc FROM ekwipunek WHERE idKreatury IN (1,3,5);

# 2 Zadanie
# a)

SELECT * FROM kreatura WHERE rodzaj NOT LIKE 'wiedzma' AND udzwig >= 50;

# b)

SELECT * FROM zasob WHERE waga BETWEEN 30 AND 70;

# c)

SELECT * FROM kreatura WHERE nazwa LIKE '%or%' AND waga BETWEEN 30 AND 70;

# 3 Zadanie
# a)

SELECT * FROM zasob WHERE MONTH(dataPozyskania) IN (7,8);

# b)

SELECT * FROM zasob WHERE rodzaj IS NOT NULL ORDER BY waga ;

# c)

SELECT * FROM kreatura ORDER BY dataUr LIMIT 5;

# 4 Zadanie
# a)

SELECT DISTINCT rodzaj FROM zasob WHERE rodzaj IS NOT NULL;

# b)

SELECT CONCAT(nazwa, ' - ', rodzaj) AS nazwa FROM kreatura WHERE rodzaj LIKE 'wi%';

# c)

SELECT nazwa, waga*ilosc FROM zasob WHERE YEAR(dataPozyskania) BETWEEN 2000 AND 2007;

# 5)
# a)

SELECT nazwa, 0.7*waga AS wlasciwe, 0.3*waga AS odpady FROM zasob WHERE rodzaj="jedzenie";

# b)

SELECT * FROM zasob WHERE rodzaj IS NULL;

# c)

SELECT DISTINCT rodzaj FROM zasob WHERE nazwa LIKE 'Ba%' OR nazwa LIKE '%os' ORDER BY nazwa;