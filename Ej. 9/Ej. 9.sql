-- INICIALIZACION DDBB
DROP DATABASE IF EXISTS db_peliculas; 
CREATE DATABASE IF NOT EXISTS db_peliculas; 
USE db_peliculas; 

-- TABLAS PRINCIPALES
CREATE TABLE IF NOT EXISTS movies ( 
	id INTEGER PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(100), 
    year INT, 
    image_url VARCHAR(255), 
    certificate VARCHAR(45), 
    runtime INT, 
    imdb_rating FLOAT, 
    description TEXT, 
    metascore INT, 
    votes INT, 
    gross INT 
);

CREATE TABLE IF NOT EXISTS directors ( 
	id INTEGER PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(45) UNIQUE, 
    about TEXT 
);

CREATE TABLE IF NOT EXISTS stars ( 
	id INTEGER PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(45) UNIQUE, 
    about TEXT 
);

CREATE TABLE IF NOT EXISTS genres ( 
	id INTEGER PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(45) UNIQUE
);

-- TABLAS RELACIONALES
CREATE TABLE IF NOT EXISTS movies_directors ( 
	movies_id INTEGER, 
    directors_id INTEGER, 
    PRIMARY KEY (movies_id, directors_id),
    FOREIGN KEY (movies_id) REFERENCES movies(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (directors_id) REFERENCES directors(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS movies_stars ( 
	movies_id INTEGER, 
    stars_id INTEGER, 
    PRIMARY KEY (movies_id, stars_id),
    FOREIGN KEY (movies_id) REFERENCES movies(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (stars_id) REFERENCES stars(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS movies_genres ( 
	movies_id INTEGER, 
    genres_id INTEGER, 
    PRIMARY KEY (movies_id, genres_id),
    FOREIGN KEY (movies_id) REFERENCES movies(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (genres_id) REFERENCES genres(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- INSERT REGISTROS TABLAS PRINCIPALES
INSERT INTO movies VALUES 
(NULL, 'Maquia: Una Historia De Amor Inmortal', 2018, 'https://www.imdb.com/title/tt7339826/mediaviewer/rm2762501888/?ref_=tt_ov_i', 'NO', 1, 7.4, 'Una chica inmortal y un chico normal se conocen y se hacen amigos y establecen un vínculo que perdura a lo largo de los años.', 72, 6300, 0),
(NULL, 'Yojimbo', 1961, 'https://www.imdb.com/title/tt0055630/mediaviewer/rm1707082240/?ref_=tt_ov_i', 'NO', 1, 8.2, 'Un astuto samurái ronin llega a un pueblo dividido por dos bandas criminales y decide enfrentar a una contra otra para liberar el pueblo.', 93, 121000, 0),
(NULL, 'Moulin Rouge', 2001, 'https://www.imdb.com/title/tt0203009/mediaviewer/rm1647134976/?ref_=tt_ov_i', 'NO', 1, 7.6, 'Un pobre poeta bohemio en el París de 1890 se enamora de una bella cortesana y estrella de club nocturno a la que un duque celoso codicia.', 66, 281000, 0),
(NULL, 'Malditos Bastardos', 2009, 'https://www.imdb.com/title/tt0361748/mediaviewer/rm605189888/?ref_=tt_ov_i', 'NO', 1, 8.3, 'En la Francia ocupada por los nazis durante la Segunda Guerra Mundial, un plan para asesinar a los líderes nazis por parte de un grupo de soldados judíos estadounidenses coincide con los planes vengativos de la dueña de un cine.', 69, 1400000, 0),
(NULL, 'Gladiator', 2000, 'https://www.imdb.com/title/tt0172495/mediaviewer/rm3895686144/?ref_=tt_ov_i', 'NO', 1, 8.5, 'Un exgeneral romano se propone vengarse del emperador corrupto que asesinó a su familia y lo envió a la esclavitud.', 67, 1500000, 0),
(NULL, 'Big Fish', 2003, 'https://www.imdb.com/title/tt0319061/mediaviewer/rm344332545/?ref_=tt_ov_i', 'NO', 1, 8.0, 'Un hijo frustrado intenta distinguir la verdad de la ficción en la vida de su padre moribundo.', 58, 437000, 0),
(NULL, 'Star Wars: El Imperio Contrataca', 1980, 'https://www.imdb.com/title/tt0080684/mediaviewer/rm3097064448/?ref_=tt_ov_i', 'NO', 1, 8.7, 'Tras ser brutalmente dominados los rebeldes por el Imperio en el planeta helado Hoth, Luke Skywalker comienza su entrenamiento jedi con Yoda, mientras sus amigos son perseguidos por Darth Vader y el cazarrecompensas Boba Fett.', 82, 1300000, 0),
(NULL, 'La Princesa Mononoke', 1997, 'https://www.imdb.com/title/tt0119698/mediaviewer/rm97356801/?ref_=tt_ov_i', 'NO', 1, 8.4, 'En un viaje para descubrir la cura de la maldición de Tatarigami, Ashitaka se encuentra en medio de una guerra entre los dioses del bosque y Tatara, una colonia minera. En esta búsqueda también conoce a San, el Mononoke Hime.', 76, 384000, 0),
(NULL, 'El Señor De Los Anillos: El Retorno Del Rey', 2003, 'https://www.imdb.com/title/tt0167260/mediaviewer/rm622753536/?ref_=tt_ov_i', 'NO', 1, 9.0, 'Gandalf y Aragorn lideran el mundo de los hombres contra la armada de Sauron para distraer su atención de Frodo y Sam, quienes se aproximan al Monte del Destino con el Anillo Único.', 94, 1800000, 0),
(NULL, 'Jurassic Park', 1993, 'https://www.imdb.com/title/tt0107290/mediaviewer/rm3913805824/?ref_=tt_ov_i', 'NO', 1, 8.2, 'Gracias al ADN fosilizado en ámbar, John Hammond da vida a varias especies de dinosaurios y crea Jurassic Park, un parque temático en una isla de Costa Rica. Pero lo que parecía un sueño se convierte rápidamente en pesadilla.', 68, 953000, 0)
;

INSERT INTO directors VALUES 
(NULL, 'Mari Okada', ' Is a Japanese screenwriter, director and manga artist. She is one of the most prolific writers currently working in the anime industry. She won the 16th Animation Kobe Award.[2]'),
(NULL, 'Akira Kurosawa', 'After training as a painter (he storyboards his films as full-scale paintings), Kurosawa entered the film industry in 1936 as an assistant director, eventually making his directorial debut with La leyenda del gran judo (1943). '),
(NULL, 'Baz Luhrmann', 'Baz Luhrmann is an Australian writer, director, and producer with projects spanning film, television, opera, theatre, music, and recording industries. '),
(NULL, 'Quentin Tarantino', 'Quentin Jerome Tarantino was born in Knoxville, Tennessee. His father, Tony Tarantino, is an Italian-American actor and musician from New York, and his mother, Connie (McHugh), is a nurse from Tennessee. Quentin moved with his mother to Torrance, California, when he was four years old.'),
(NULL, 'Ridley Scott', 'Described by film producer Michael Deeley as "the very best eye in the business", director Ridley Scott was born on November 30, 1937 in South Shields, Tyne and Wear (then County Durham). His father was an officer in the Royal Engineers and the family followed him as his career posted him throughout the United Kingdom and Europe before they eventually returned to Teesside. '),
(NULL, 'Tim Burton', 'Timothy Walter Burton was born in Burbank, California, to Jean Rae (Erickson), who owned a cat-themed gift shop, and William Reed Burton, who worked for the Burbank Park and Recreation Department. He spent most of his childhood as a recluse, drawing cartoons, and watching old movies (he was especially fond of films with Vincent Price).'),
(NULL, 'Irvin Kershner ', 'Irvin Kershner was born on April 29, 1923 in Philadelphia, Pennsylvania. A graduate of the University of Southern California film school, Kershner began his career in 1950, producing documentaries for the United States Information Service in the Middle East.'),
(NULL, 'Hayao Miyazaki', 'Hayao Miyazaki is one of Japans greatest animation directors. The entertaining plots, compelling characters, and breathtaking animation in his films have earned him international renown from critics as well as public recognition within Japan.'),
(NULL, 'Peter Jackson', 'Sir Peter Jackson made history with The Lord of the Rings trilogy, becoming the first person to direct three major feature films simultaneously. The Fellowship of the Ring, The Two Towers and The Return of the King were nominated for and collected a slew of awards from around the globe, with The Return of the King receiving his most impressive collection of awards. '),
(NULL, 'Steven Spielberg', 'One of the most influential personalities in the history of cinema, Steven Spielberg is Hollywoods best known director and one of the wealthiest filmmakers in the world. He has an extraordinary number of commercially successful and critically acclaimed credits to his name, either as a director, producer or writer since launching the summer blockbuster with Tiburón (1975). ')
;

INSERT INTO stars VALUES
(NULL, 'Manaka Iwami', 'Manaka Iwami is known for Maquia. Una historia de amor inmortal (2018), Shûmatsu nani shitemasu ka? Isogashii desu ka? Sukutte moratte ii desu ka? (2017) and Spy x Family (2022).'),
(NULL, 'Miyu Irino', 'Miyu Irino was born on February 19, 1988 in Tokyo, Japan. He is an actor, known for El viaje de Chihiro (2001), El jardín de las palabras (2013) and A Silent Voice (2016).'),
(NULL, 'Yôko Hikasa', 'Yôko Hikasa was born on July 16, 1985 in Kanagawa, Japan. She is known for Infinite Stratos (2011), K-On! (2009) and High School DxD (2012).'), 
(NULL, 'Tishirô Mifune', 'Toshiro Mifune achieved more worldwide fame than any other Japanese actor of his century. He was born in Tsingtao, China, to Japanese parents and grew up in Dalian. He did not set foot in Japan until he was 21.'),
(NULL, 'Eijirô Tôno', 'Eijirô Tôno was born on September 17, 1907 in Gunma, Japan. He was an actor, known for Tora! Tora! Tora! (1970), Yojimbo (1961) and Cuentos de Tokio (1953). He died on September 8, 1994.'),
(NULL, 'Tatsuya Nakdai', 'Japanese leading man, an important star and one of the handful of Japanese actors well known outside Japan. Nakadai was a tall handsome clerk in a Tokyo shop when director Masaki Kobayashi encountered him and cast him in Kabe atsuki heya (1956).'), 
(NULL, 'Nicole Kidman', 'Elegant Nicole Kidman, known as one of Hollywoods top Australian imports, was actually born in Honolulu, Hawaii, while her Australian parents were there on educational visas. Kidman is the daughter of Janelle Ann (Glenny), a nursing instructor, and Antony David Kidman, a biochemist and clinical psychologist.'),
(NULL, 'Ewan McGregor', 'Ewan Gordon McGregor was born on March 31, 1971 in Perth, Perthshire, Scotland, to Carol Diane (Lawson) and James Charles McGregor, both teachers. His uncle is actor Denis Lawson. He was raised in Crieff. At age 16, he left Morrison Academy to join the Perth Repertory Theatre.'),
(NULL, 'John Leguizamo', 'Fast-talking and feisty-looking John Leguizamo has continued to impress movie audiences with his versatility: he can play sensitive and naïve young men, such as Johnny in Colegas (1991); cold-blooded killers like Benny Blanco in Atrapado por su pasado (1993);'), 
(NULL, 'Brad Pitt', 'An actor and producer known as much for his versatility as he is for his handsome face, Golden Globe-winner Brad Pitts most widely recognized role may be Tyler Durden in El club de la lucha (1999).'),
(NULL, 'Diane Kruger', 'Diane Kruger was born Diane Heidkrüger in Algermissen, near Hildesheim, Germany, to Maria-Theresa, a bank employee, and Hans-Heinrich Heidkrüger, a computer specialist. She studied ballet with the Royal Ballet in London before an injury ended her career.'),
(NULL, 'Eli Roth', 'Eli Raphael Roth was born in Newton, Massachusetts, to Cora (Bialis), a painter, and Sheldon H. Roth, a psychoanalyst, psychiatrist, and clinical professor. His family is Jewish (from Austria, Hungary, Russia, and Poland). He began shooting Super 8 films at the age of eight;'), 
(NULL, 'Russell Crowe', 'Russell Ira Crowe was born in Wellington, New Zealand, to Jocelyn Yvonne (Wemyss) and John Alexander Crowe, both of whom catered movie sets. His maternal grandfather, Stanley Wemyss, was a cinematographer.'),
(NULL, 'Joaquin Phoenix', 'Joaquin Phoenix was born Joaquin Rafael Bottom in San Juan, Puerto Rico, to Arlyn (Dunetz) and John Bottom, and is the middle child in a brood of five. His parents, from the continental United States, were then serving as Children of God missionaries.'),
(NULL, 'Connie Nielsen', 'Danish beauty Connie Nielsen consistently lights up the screen with an eclectic bevy of film roles. She was born in Frederikshavn, Denmark, to a mother who worked as an insurance clerk, and a father, Bent Nielsen, who was a bus driver. Nielsen began her acting career working alongside her mother on the local revue and variety scene.'), 
(NULL, 'Albert Finney', 'The son of a Lancashire bookmaker, Albert Finney came to motion pictures via the theatre. In 1956, he won a scholarship to RADA where his fellow alumni included Peter OToole and Alan Bates.'), 
(NULL, 'Billy Crudup', 'Known as much for his rigorous career choices as for his talent and chiseled good looks, Billy Crudup has been straddling the line between serious actor and "it" leading man for several years.'), 
(NULL, 'Mark Hamill', 'Mark Hamill is best known for his portrayal of Luke Skywalker in the original Star Wars trilogy - La guerra de las galaxias (1977), El Imperio contraataca (1980), and El retorno del jedi (1983) - a role he reprised in Star Wars: El despertar de la Fuerza (2015), Star Wars: Los últimos jedi (2017) and Star Wars: El ascenso de Skywalker (2019).'),
(NULL, 'Harrison Ford', 'Harrison Ford was born on July 13, 1942 in Chicago, Illinois, to Dorothy (Nidelman), a radio actress, and Christopher Ford (born John William Ford), an actor turned advertising executive. His father was of Irish and German ancestry, while his maternal grandparents were Jewish emigrants from Minsk, Belarus.'),
(NULL, 'Carrie Fisher', 'Carrie Frances Fisher was born on October 21, 1956 in Burbank, California, to singers/actors Eddie Fisher and Debbie Reynolds. She was an actress and writer known for La guerra de las galaxias (1977), El Imperio contraataca (1980) and El retorno del jedi (1983).'), 
(NULL, 'Yôji Matsuda', 'Yôji Matsuda was born on October 19, 1967 in Fukuoka, Japan. He is an actor, known for Nausicaä del Valle del Viento (1984), La princesa Mononoke (1997) and La chica que saltaba a través del tiempo (2006).'),
(NULL, 'Yuriko Ishida', 'Ishida Yuriko was born in Nagoya, Aichi Prefecture. Her family moved to Tokyo soon after. She travelled to and lived in Hyogo Prefecture, Kanagawa Prefecture and Taiwan as a child due to her fathers work. During elementary school she participated in the Junior Olympics as a swimmer. She returned to Tokyo at age fifteen.'), 
(NULL, 'Yûko Tanaka', 'Yûko Tanaka was born on April 29, 1955 in Osaka, Japan. She is known for Amagi goe (1983), Itsuka dokusho suruhi (2005) and Hibi (2005). She has been married to Kenji Sawada since 1989.'), 
(NULL, 'Elijah Wood', 'Elijah Wood is an American actor best known for portraying Frodo Baggins in Peter Jacksons blockbuster Lord of the Rings film trilogy. In addition to reprising the role in The Hobbit series, Wood also played Ryan in the FX television comedy Wilfred (2011) and voiced Beck in the Disney XD animated television series TRON: La resistencia (2012).'),
(NULL, 'Viggo Mortensen', 'Since his screen debut as a young Amish farmer in Peter Weirs Único testigo (1985), Viggo Mortensens career has been marked by a steady string of well-rounded performances.'),
(NULL, 'Sir Ian McKellen', 'Widely regarded as one of greatest stage and screen actors both in his native Great Britain and internationally, twice nominated for the Oscar and recipient of every major theatrical award in the UK and US, Ian Murray McKellen was born on May 25, 1939 in Burnley, Lancashire, England, to Margery Lois (Sutcliffe) and Denis Murray McKellen. '), 
(NULL, 'Sam Neil', 'Sam Neill was born in Omagh, Co. Tyrone, Northern Ireland, to army parents, an English-born mother, Priscilla Beatrice (Ingham), and a New Zealand-born father, Dermot Neill. His family moved to the South Island of New Zealand in 1954.'),
(NULL, 'Laura Dern', 'Laura Dern was born on February 10, 1967 in Los Angeles, the daughter of actors Bruce Dern and Diane Ladd. Dern was exposed to movie sets and the movie industry from infancy, and obtained several bit parts as a child.'), 
(NULL, 'Jeff Goldblum', 'Jeffrey Lynn Goldblum was born October 22, 1952 in Pittsburgh, Pennsylvania, one of four children of Shirley (Temeles), a radio broadcaster who also ran an appliances firm, and Harold L. Goldblum, a doctor.')
;

INSERT INTO GENRES VALUES 
(NULL, 'Animación'), (NULL, 'Aventura'), 
(NULL, 'Drama'), (NULL, 'Acción'), 
(NULL, 'Suspense'), (NULL, 'Musical'), 
(NULL, 'Romance'), (NULL, 'Bélico'), 
(NULL, 'Fantasia'), (NULL, 'Ciencia Ficción')
;

-- INSERT TABLAS RELACIONALES
INSERT INTO movies_directors VALUES 
(1,1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

INSERT INTO movies_stars VALUES 
(1, 1), (1, 2), (1, 3), (2, 4), (2, 5), (2, 6), (3, 7), (3, 8), (3, 9),
(4, 10), (4, 11), (4, 12), (5, 13), (5, 14), (5, 15), (6, 8), (6, 16), (6, 17),
(7, 18), (7, 19), (7, 20), (8, 21), (8, 22), (8, 23), (9, 24), (9, 25), (9, 26),
(10, 27), (10,28), (10, 29);

INSERT INTO movies_genres VALUES 
(1, 1), (1, 2), (1, 3), (2, 4), (2,3), (2, 5), 
(3, 3), (3, 6), (3, 7),(4, 2), (4, 3), (4, 8), 
(5, 4), (5, 2), (5, 3), (6, 2), (6, 3), (6, 9),
(7, 4), (7, 2), (7, 9), (8, 1), (8, 2), (8, 9), 
(9, 4), (9, 2), (9,3),(10, 4), (10, 2), (10, 10);

-- DELETES
DELETE FROM movies_genres;
DELETE FROM movies_stars;
DELETE FROM movies_directors;
DELETE FROM genres;
DELETE FROM stars;
DELETE FROM directors;
DELETE FROM movies;

-- SELECTS
SELECT * FROM movies;
SELECT * FROM directors;
SELECT * FROM stars;
SELECT * FROM genres;
SELECT * FROM movies_directors;
SELECT * FROM movies_stars;
SELECT * FROM movies_genres;