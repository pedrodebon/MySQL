DROP DATABASE IF EXISTS EJERCICIOS;
CREATE DATABASE IF NOT EXISTS EJERCICIOS;
USE EJERCICIOS;

CREATE TABLE IF NOT EXISTS GENRE (
	idGenre INTEGER, 
	Genre VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS ALBUM (
	idAlbum INTEGER, 
    albumName VARCHAR(255),
    dateReleased DATETIME
);

CREATE TABLE IF NOT EXISTS ARTIST (
	artistID INTEGER,
	artistName VARCHAR(255)
);

INSERT INTO GENRE(idGenre, Genre) VALUES (0, 'Rock'), (1, 'Heavy Metal'), (2, 'Acustico'), 
(3, 'Flamenco'), (4, 'Pop'), (5, 'Rock Psicodelico'), (6, 'Pop Español'), (7, 'Regeton'), 
(8, 'Regge'), (9, 'Rap');

INSERT INTO ALBUM(idAlbum, albumName, dateReleased) VALUES (0, 'Album de enero', '2022-01-01'), 
(1, 'Album de Melendi', '2019-03-10'), (2, 'Californication', '2021-10-01'), (3, 'X Aniversarium', '2015-07-18'), 
(4, 'Corazon de Mimbre', '2005-01-05'), (5, 'Angie', '2001-04-04'), (6, 'Efectos Vocales', '2020-12-25'), 
(7, 'Camela Special Berbena', '0001-01-01'), (8, 'Malaga', '2007-06-17'), (9, 'Thunderstruck', '1991-04-05');

INSERT INTO ARTIST(artistId, artistName) VALUES (0, 'Red Hot Chilli Peppers'), (1, 'King Africa'), 
(2, 'Camela'), (3, 'Estopa'), (4, 'Violadores del Verso'), (5, 'Nach'), (6, 'Rolling Stones'), 
(7, 'Marea'), (8, 'ACDC'), (9, 'Melendi');

SELECT * FROM ALBUM;
SELECT * FROM ARTIST;
SELECT * FROM GENRE;