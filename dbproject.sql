CREATE DATABASE MprojektM;
use MprojektM;
CREATE TABLE klasa(
	id int AUTO_INCREMENT not null PRIMARY key,
    nazwa varchar(50)
);
CREATE TABLE kategoria(
	id int AUTO_INCREMENT not null PRIMARY key,
    nazwa varchar(50)
);
CREATE table users(
	id int AUTO_INCREMENT not null PRIMARY key,
    imie varchar(50),
    nazwisko varchar(50),
    email varchar(50),
    haslo varchar(50),
    id_klasy int null,
    rola varchar(50),
    pakiet varchar(50),
    FOREIGN KEY (id_klasy) REFERENCES klasa(id)
);
CREATE TABLE pytania(
	id int AUTO_INCREMENT not null PRIMARY key,
	tresc varchar(50),
    typ varchar(50),
    dzial varchar(50),
    max_punkty int,
    kategoria_id int,
    FOREIGN KEY (kategoria_id) REFERENCES kategoria(id)
);

CREATE TABLE odpowiedzi(
	id int AUTO_INCREMENT not null PRIMARY key,
	id_pytania int,
    poprawna int,
    tresc varchar(50),
    FOREIGN KEY (id_pytania) REFERENCES pytania(id)
);
CREATE TABLE materialy(
	id int AUTO_INCREMENT not null PRIMARY key,
    kategoria_id int,
	tytul varchar(50),
    tresc text, 
    FOREIGN KEY (kategoria_id) REFERENCES kategoria(id)
);
CREATE TABLE nauczyciel_klasa(
	id int AUTO_INCREMENT not null PRIMARY key,
    id_nauczyciela int,
    id_klasy int,
    FOREIGN KEY (id_nauczyciela) REFERENCES users(id),
    FOREIGN KEY (id_klasy) REFERENCES klasa(id)
);
CREATE TABLE progress(
	id int AUTO_INCREMENT not null PRIMARY key,
    id_ucznia int,
    id_pytania int,
    id_odpowiedzi int,
    punkty int,
    FOREIGN KEY (id_ucznia) REFERENCES users(id),
    FOREIGN KEY (id_pytania) REFERENCES pytania(id),
    FOREIGN KEY (id_odpowiedzi) REFERENCES odpowiedzi(id)
);









