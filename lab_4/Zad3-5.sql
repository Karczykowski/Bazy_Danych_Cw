# Zadanie 3
# a)
-- SELECT * FROM postac;
-- SELECT * FROM postac WHERE nazwa LIKE "%a%";
-- SELECT statek FROM postac WHERE nazwa LIKE "Bjorn";
UPDATE postac SET statek = "Martwy krab" WHERE nazwa LIKE "%a%";

# b)
-- SELECT * FROM statek;
-- INSERT INTO statek VALUES ("Gruby lis", "galeon", "1909-05-13", 20);
UPDATE statek SET maz_ladownosc = maz_ladownosc * 0.7 WHERE data_wodowania BETWEEN "1900-01-01" AND "2000-12-31";

# c)

-- SELECT * FROM postac;
-- UPDATE postac SET wiek=923 WHERE id_postaci = 6;
ALTER TABLE postac ADD CHECK (wiek<=1000);

# Zadanie 4
# a)

-- SELECT * FROM postac;
-- DESC postac;
-- ALTER TABLE postac MODIFY rodzaj ENUM('wiking', 'ptak', 'kobieta', 'syrena', 'waz');
INSERT INTO postac VALUES (9, "Loko", "waz", "1212-03-02", 500, "Potwor", NULL, 58363450634);

# b)

-- SELECT * FROM postac;
CREATE TABLE Marynarz AS SELECT * FROM postac WHERE statek IS NOT NULL;
-- SELECT * FROM Marynarz;

# c)

-- SELECT * FROM Marynarz;
-- SELECT * FROM statek;
-- ALTER TABLE Marynarz ADD PRIMARY KEY (pesel);
ALTER TABLE Marynarz ADD FOREIGN KEY (statek) REFERENCES statek(nazwa_statku);

# Zadanie 5
# a)

-- SELECT * FROM postac;
UPDATE postac SET statek = NULL WHERE statek = "Martwy krab";
UPDATE Marynarz SET statek = NULL WHERE statek = "Martwy krab";

# b)

-- SELECT * FROM postac;
DELETE FROM postac WHERE id_postaci = 8;
DELETE FROM Marynarz WHERE id_postaci = 8;

# c)

DELETE FROM statek;

# d)

-- SHOW CREATE TABLE Marynarz;
ALTER TABLE Marynarz DROP FOREIGN KEY Marynarz_ibfk_1;
DROP TABLE statek;

# e)

CREATE TABLE zwierz (
id INT AUTO_INCREMENT PRIMARY KEY,
nazwa VARCHAR(50),
wiek int);

# f)

-- SELECT * FROM postac;
INSERT INTO zwierz 
	SELECT id_postaci, nazwa, wiek FROM postac WHERE rodzaj="ptak" OR rodzaj="waz";
    
-- SELECT * FROM zwierz;