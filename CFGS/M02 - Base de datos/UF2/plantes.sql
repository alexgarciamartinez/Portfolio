DROP DATABASE IF EXISTS plantes;
CREATE DATABASE plantes;
USE plantes;

CREATE TABLE estacio
      	(nom_estacio     	CHAR(9) 	PRIMARY KEY       
      	)ENGINE = InnoDB
	;

CREATE TABLE metode_reproduccio
	(nom_metode		CHAR(20)	PRIMARY KEY
	)ENGINE = InnoDB
	;	

CREATE TABLE firma_comercial
	(nom_firma		CHAR(20)	PRIMARY KEY
	)ENGINE = InnoDB
	;

CREATE TABLE adob
	(nom_adob		CHAR(20)		PRIMARY KEY,
	nom_firma		CHAR(20)		NOT NULL,
	tipus_adob		ENUM('LLD','AI')        NOT NULL,
	FOREIGN KEY (nom_firma) REFERENCES firma_comercial(nom_firma)
	)ENGINE = InnoDB
	;

CREATE TABLE planta
	(nom_cientific		CHAR(20)	PRIMARY KEY,
	nom_popular		CHAR(20),
	floracio		CHAR(9),
	FOREIGN KEY (floracio) REFERENCES estacio(nom_estacio)
      	)ENGINE = InnoDB
	;

CREATE TABLE planta_interior
	(nom_planta		CHAR(20)	PRIMARY KEY,
	ubicacio		CHAR(20),
	temperatura		INTEGER,
	FOREIGN KEY (nom_planta) REFERENCES planta(nom_cientific)
	)ENGINE = InnoDB
	;

CREATE TABLE planta_exterior
	(nom_planta		CHAR(20)	PRIMARY KEY,
	tipus_planta		ENUM('T','P'),
	FOREIGN KEY (nom_planta) REFERENCES planta(nom_cientific)
	)ENGINE = InnoDB
	;

CREATE TABLE exemplar_planta 
	(nom_planta		CHAR(20)	NOT NULL,
	num_exemplar		INTEGER		NOT NULL,
	PRIMARY KEY(nom_planta,num_exemplar),
	FOREIGN KEY (nom_planta) REFERENCES planta(nom_cientific)
	)ENGINE = InnoDB
	;

CREATE TABLE dosi_adob
	(nom_planta		CHAR(20)	NOT NULL,
	nom_estacio		CHAR(9)		NOT NULL,
	nom_adob		CHAR(20)	NOT NULL,
	quantitat_adob		INTEGER		CHECK ((quantitat_adob>=20) AND (quantitat_adob<=100)),
	PRIMARY KEY(nom_planta,nom_estacio,nom_adob),
	FOREIGN KEY (nom_planta) REFERENCES planta(nom_cientific),
	FOREIGN KEY (nom_estacio) REFERENCES estacio(nom_estacio),
	FOREIGN KEY (nom_adob) REFERENCES adob(nom_adob)
	)ENGINE = InnoDB
	;	

CREATE TABLE reproduccio
	(nom_planta		CHAR(20)	NOT NULL REFERENCES planta,
	metode_reproduccio	CHAR(20)	NOT NULL REFERENCES metode_reproduccio,
	grau_exit		ENUM('Mitjà','Alt','Baix'),
	FOREIGN KEY (nom_planta) REFERENCES planta(nom_cientific),
	FOREIGN KEY (metode_reproduccio) REFERENCES metode_reproduccio(nom_metode)
	)ENGINE = InnoDB
	;

INSERT INTO estacio VALUES ('Estiu');
INSERT INTO estacio VALUES ('Hivern');
INSERT INTO estacio VALUES ('Primavera');
INSERT INTO estacio VALUES ('Tardor');

INSERT INTO metode_reproduccio VALUES ('Bulbs');
INSERT INTO metode_reproduccio VALUES ('Capficats');
INSERT INTO metode_reproduccio VALUES ('Esqueix');
INSERT INTO metode_reproduccio VALUES ('Estaques');
INSERT INTO metode_reproduccio VALUES ('Estolons');
INSERT INTO metode_reproduccio VALUES ('Llavors');
	
INSERT INTO firma_comercial VALUES ('CIRSADOB');
INSERT INTO firma_comercial VALUES ('PRISADOB');
INSERT INTO firma_comercial VALUES ('TIRSADOB');
INSERT INTO firma_comercial VALUES ('UOCADOB');
	
INSERT INTO adob VALUES ('Plantavit','UOCADOB','LLD');
INSERT INTO adob VALUES ('Vitaplant','TIRSADOB','AI');
INSERT INTO adob VALUES ('Nutreplant','CIRSADOB','LLD');
INSERT INTO adob VALUES ('Creixplant','PRISADOB','AI');
INSERT INTO adob VALUES ('Casadob','TIRSADOB','AI');
INSERT INTO adob VALUES ('Plantadob','PRISADOB','LLD');
INSERT INTO adob VALUES ('Superplant','CIRSADOB','AI');
INSERT INTO adob VALUES ('Sanexplant','UOCADOB','LLD');

INSERT INTO planta VALUES ('Geranium','Gerani','Primavera');
INSERT INTO planta VALUES ('Begonia rex','Begònia','Estiu');
INSERT INTO planta VALUES ('Camellia','Camèlia','Primavera');
INSERT INTO planta VALUES ('Cyclamen','Ciclamen','Hivern');
INSERT INTO planta VALUES ('Rosa','Roser','Primavera');
INSERT INTO planta VALUES ('Polystichum','Falguera',null);
INSERT INTO planta VALUES ('Tulipa','Tulipa','Primavera');
INSERT INTO planta VALUES ('Chrysanthemum','Crisantem','Estiu');
INSERT INTO planta VALUES ('Philodendron','Potus',null);
INSERT INTO planta VALUES ('Chlorophytum','Cintes',null);
INSERT INTO planta VALUES ('Euphorbia','Poinsetia','Hivern');
INSERT INTO planta VALUES ('Hedera','Heura',null);
INSERT INTO planta VALUES ('Ficus','Ficus Benjamina',null);
INSERT INTO planta VALUES ('Codiaeum','Croton',null);

INSERT INTO planta_interior VALUES ('Philodendron','Llum directa',15);
INSERT INTO planta_interior VALUES ('Euphorbia','Llum indirecta',18);
INSERT INTO planta_interior VALUES ('Ficus','Llum indirecta',19);
INSERT INTO planta_interior VALUES ('Codiaeum','No corrents',17);

INSERT INTO planta_exterior VALUES ('Geranium','P');
INSERT INTO planta_exterior VALUES ('Begonia rex','P');
INSERT INTO planta_exterior VALUES ('Camellia','P');
INSERT INTO planta_exterior VALUES ('Cyclamen','P');
INSERT INTO planta_exterior VALUES ('Rosa','P');
INSERT INTO planta_exterior VALUES ('Polystichum','P');
INSERT INTO planta_exterior VALUES ('Tulipa','T');
INSERT INTO planta_exterior VALUES ('Chrysanthemum','T');
INSERT INTO planta_exterior VALUES ('Chlorophytum','P');
INSERT INTO planta_exterior VALUES ('Hedera','P');

INSERT INTO exemplar_planta VALUES ('Geranium',1);
INSERT INTO exemplar_planta VALUES ('Geranium',2);
INSERT INTO exemplar_planta VALUES ('Geranium',3);
INSERT INTO exemplar_planta VALUES ('Geranium',4);
INSERT INTO exemplar_planta VALUES ('Geranium',5);
INSERT INTO exemplar_planta VALUES ('Geranium',6);
INSERT INTO exemplar_planta VALUES ('Begonia rex',1);
INSERT INTO exemplar_planta VALUES ('Begonia rex',2);
INSERT INTO exemplar_planta VALUES ('Begonia rex',3);
INSERT INTO exemplar_planta VALUES ('Begonia rex',4);
INSERT INTO exemplar_planta VALUES ('Rosa',1);
INSERT INTO exemplar_planta VALUES ('Rosa',2);
INSERT INTO exemplar_planta VALUES ('Rosa',3);
INSERT INTO exemplar_planta VALUES ('Hedera',1);
INSERT INTO exemplar_planta VALUES ('Hedera',2);
INSERT INTO exemplar_planta VALUES ('Hedera',3);
INSERT INTO exemplar_planta VALUES ('Hedera',4);
INSERT INTO exemplar_planta VALUES ('Ficus',1);
INSERT INTO exemplar_planta VALUES ('Ficus',2);
INSERT INTO exemplar_planta VALUES ('Codiaeum',1);
INSERT INTO exemplar_planta VALUES ('Codiaeum',2);
INSERT INTO exemplar_planta VALUES ('Codiaeum',3);
INSERT INTO exemplar_planta VALUES ('Euphorbia',1);
INSERT INTO exemplar_planta VALUES ('Euphorbia',2);
INSERT INTO exemplar_planta VALUES ('Cyclamen',1);
INSERT INTO exemplar_planta VALUES ('Cyclamen',2);

INSERT INTO dosi_adob VALUES ('Geranium','Primavera','Casadob',30);
INSERT INTO dosi_adob VALUES ('Geranium','Hivern','Vitaplant',20);
INSERT INTO dosi_adob VALUES ('Begonia rex','Estiu','Casadob',25);
INSERT INTO dosi_adob VALUES ('Camellia','Hivern','Plantavit',50);
INSERT INTO dosi_adob VALUES ('Camellia','Primavera','Casadob',75);
INSERT INTO dosi_adob VALUES ('Cyclamen','Tardor','Casadob',30);
INSERT INTO dosi_adob VALUES ('Chrysanthemum','Primavera','Casadob',45);
INSERT INTO dosi_adob VALUES ('Begonia rex','Primavera','Nutreplant',50);
INSERT INTO dosi_adob VALUES ('Rosa','Primavera','Casadob',30);
INSERT INTO dosi_adob VALUES ('Rosa','Primavera','Creixplant',50);
INSERT INTO dosi_adob VALUES ('Polystichum','Primavera','Casadob',40);
INSERT INTO dosi_adob VALUES ('Polystichum','Tardor','Plantadob',20);
INSERT INTO dosi_adob VALUES ('Tulipa','Hivern','Casadob',40);
INSERT INTO dosi_adob VALUES ('Philodendron','Primavera','Casadob',40);
INSERT INTO dosi_adob VALUES ('Chlorophytum','Tardor','Casadob',30);
INSERT INTO dosi_adob VALUES ('Chlorophytum','Hivern','Superplant',40);
INSERT INTO dosi_adob VALUES ('Euphorbia','Hivern','Casadob',50);
INSERT INTO dosi_adob VALUES ('Euphorbia','Hivern','Sanexplant',40);
INSERT INTO dosi_adob VALUES ('Hedera','Primavera','Casadob',45);
INSERT INTO dosi_adob VALUES ('Codiaeum','Primavera','Casadob',50);
INSERT INTO dosi_adob VALUES ('Codiaeum','Estiu','Casadob',60);
INSERT INTO dosi_adob VALUES ('Geranium','Estiu','Sanexplant',40);
INSERT INTO dosi_adob VALUES ('Ficus','Primavera','Casadob',50);

INSERT INTO reproduccio VALUES ('Geranium','Esqueix','Alt');
INSERT INTO reproduccio VALUES ('Begonia rex','Esqueix','Alt');
INSERT INTO reproduccio VALUES ('Begonia rex','Capficats','Alt');
INSERT INTO reproduccio VALUES ('Begonia rex','Llavors','Baix');
INSERT INTO reproduccio VALUES ('Rosa','Estaques','Mitjà');
INSERT INTO reproduccio VALUES ('Rosa','Bulbs','Alt');
INSERT INTO reproduccio VALUES ('Chlorophytum','Estolons','Alt');
INSERT INTO reproduccio VALUES ('Cyclamen','Esqueix','Alt');
INSERT INTO reproduccio VALUES ('Cyclamen','Capficats','Mitjà');
INSERT INTO reproduccio VALUES ('Philodendron','Capficats','Alt');
INSERT INTO reproduccio VALUES ('Philodendron','Esqueix','Alt');
INSERT INTO reproduccio VALUES ('Tulipa','Bulbs','Alt');
INSERT INTO reproduccio VALUES ('Ficus','Estaques','Baix');
INSERT INTO reproduccio VALUES ('Ficus','Capficats','Baix');
INSERT INTO reproduccio VALUES ('Ficus','Esqueix','Alt');
INSERT INTO reproduccio VALUES ('Codiaeum','Esqueix','Baix');
INSERT INTO reproduccio VALUES ('Codiaeum','Capficats','Mitjà');
INSERT INTO reproduccio VALUES ('Codiaeum','Bulbs','Alt');
INSERT INTO reproduccio VALUES ('Polystichum','Esqueix','Alt');
INSERT INTO reproduccio VALUES ('Hedera','Esqueix','Mitjà');
INSERT INTO reproduccio VALUES ('Chrysanthemum','Bulbs','Alt');
INSERT INTO reproduccio VALUES ('Camellia','Estaques','Alt');
INSERT INTO reproduccio VALUES ('Hedera','Capficats','Alt');
INSERT INTO reproduccio VALUES ('Euphorbia','Llavors','Baix');
INSERT INTO reproduccio VALUES ('Euphorbia','Esqueix','Baix');
INSERT INTO reproduccio VALUES ('Euphorbia','Estaques','Alt');

/*Exercici 23*/
SELECT nom_cientific, nom_popular FROM planta WHERE floracio = 'Estiu';
/*Exercici 24*/
SELECT nom_planta FROM dosi_adob WHERE nom_adob = 'Casadob';
/*Exercici 25*/
SELECT nom_adob, tipus_adob FROM adob WHERE nom_firma = 'PRISADOB';
/*Exercici 26*/
SELECT nom_planta FROM planta_interior WHERE temperatura > 16;
/*Exercici 27*/
SELECT SUM(quantitat_adob) FROM dosi_adob;
/*Exercici 28*/
SELECT nom_planta FROM dosi_adob WHERE (quantitat_adob>=40) AND (quantitat_adob<=50);
/*Exercici 29*/
SELECT nom_planta FROM dosi_adob WHERE (nom_estacio = 'Tardor') OR (nom_estacio = 'Hivern');
/*Exercici 30*/
SELECT AVG(quantitat_adob) FROM dosi_adob WHERE nom_adob = 'Casadob';
/*Exercici 31*/
SELECT nom_cientific, nom_popular FROM planta WHERE nom_popular LIKE '%I%';
/*Exercici 32*/
SELECT AVG(temperatura) FROM planta_interior;
/*Exercici 33*/
SELECT nom_adob FROM adob WHERE (nom_firma = 'CIRSADOB') OR (nom_firma = 'TIRSADOB');
/*Exercici 34*/
SELECT SUM(num_exemplar) FROM exemplar_planta;
/*Exercici 35*/
SELECT MIN(quantitat_adob), MAX(quantitat_adob) FROM dosi_adob;
/*Exercici 36*/
SELECT MAX(temperatura) FROM planta_interior;
/*Exercici 37*/
SELECT DISTINCT nom_planta FROM dosi_adob WHERE (nom_adob = 'Casadob') AND (quantitat_adob > 40);
/*Exercici 38*/
SELECT nom_planta FROM exemplar_planta WHERE num_exemplar > 4;
/*Exerici 39*/
SELECT SUM(quantitat_adob) FROM dosi_adob WHERE nom_planta = 'Euphorbia';
/*Exercici 40*/
SELECT DISTINCT nom_planta FROM dosi_adob WHERE nom_estacio = 'Primavera' OR nom_adob = 'Sanexplant';
/*Exercici 41*/
SELECT nom_planta FROM reproduccio WHERE metode_reproduccio = 'Esqueix' AND grau_exit = 'Alt';
/*Exercici 42*/
SELECT COUNT(*) total FROM reproduccio WHERE grau_exit = 'Mitjà';
/*Exercici 43*/
SELECT DISTINCT nom_popular FROM planta, exemplar_planta WHERE floracio = 'Estiu' AND nom_planta = nom_cientific;
/*Exercici 44*/
SELECT DISTINCT nom_cientific, tipus_planta FROM planta, planta_exterior WHERE floracio = 'Primavera' AND nom_planta = nom_cientific;
#45
SELECT DISTINCT p.nom_cientific, da.nom_adob FROM planta p, planta_exterior pe, dosi_adob da, adob a WHERE a.nom_firma = 'CIRSADOB' AND  a.nom_adob = da.nom_adob AND da.nom_planta = p.nom_cientific AND p.nom_cientific = pe.nom_planta;
#46
SELECT DISTINCT r.metode_reproduccio FROM reproduccio r, exemplar_planta ep, planta p WHERE r.nom_planta = p.nom_cientific AND p.nom_cientific = ep.nom_planta;
#47
SELECT DISTINCT CONCAT(p.nom_popular,' (',da.quantitat_adob,')') FROM planta p, dosi_adob da, adob a WHERE a.nom_firma = 'UOCADOB' AND a.nom_adob = da.nom_adob AND da.nom_planta = p.nom_cientific;
#48
SELECT DISTINCT p.nom_popular, r.metode_reproduccio FROM planta p, reproduccio r WHERE p.floracio = 'Hivern' AND r.nom_planta = p.nom_cientific;
#49 
SELECT DISTINCT p.nom_cientific, LEFT (p.nom_popular, 5) FROM planta p, planta_exterior pe, planta_interior pi2, reproduccio r WHERE pe.nom_planta = p.nom_cientific AND p.nom_cientific = r.nom_planta AND r.metode_reproduccio = 'Esqueix' OR pi2.nom_planta = p.nom_cientific AND p.nom_cientific = r.nom_planta AND r.grau_exit = 'Baix';
#50
SELECT DISTINCT p.nom_popular, e.nom_estacio FROM planta p, estacio e, dosi_adob da WHERE da.quantitat_adob > 40 AND da.nom_estacio = e.nom_estacio AND da.nom_planta = p.nom_cientific;
#51
SELECT DISTINCT p.nom_popular FROM planta p, planta_interior py, planta_exterior pe WHERE py.ubicacio = 'Llum indirecta' AND py.nom_planta = p.nom_cientific OR pe.tipus_planta = 'T' AND pe.nom_planta = p.nom_cientific;
#52
SELECT DISTINCT p.nom_cientific, p.floracio FROM planta p, exemplar_planta ex, dosi_adob da WHERE ex.nom_planta = p.nom_cientific;
#53
SELECT DISTINCT da.nom_adob, a.nom_firma FROM adob a, dosi_adob da WHERE da.quantitat_adob BETWEEN 20 AND 40 AND da.nom_adob = a.nom_adob;
#54
SELECT DISTINCT UPPER (p.nom_popular) FROM planta p, exemplar_planta ep, dosi_adob da, adob a WHERE p.nom_cientific = ep.nom_planta AND p.nom_cientific = da.nom_planta AND da.nom_adob = a.nom_adob AND a.tipus_adob = 'AI';
#55
SELECT DISTINCT p.nom_popular, pi.ubicacio FROM planta p, planta_interior pi, exemplar_planta ep WHERE p.nom_cientific = ep.nom_planta AND p.nom_cientific = pi.nom_planta;
#56
SELECT p.nom_popular, da.nom_adob, (da.quantitat_adob) + 10 FROM planta p, dosi_adob da, adob a WHERE p.nom_cientific = da.nom_planta AND da.nom_adob = a.nom_adob AND (a.nom_firma = 'PRISADOB' OR da.quantitat_adob <= 30);
#57
SELECT DISTINCT p.nom_popular FROM planta p, dosi_adob da, adob a WHERE p.nom_cientific = da.nom_planta AND da.nom_adob = a.nom_adob AND a.tipus_adob = 'AI' AND p.floracio = 'Primavera';
#58
SELECT DISTINCT p.nom_cientific, r.metode_reproduccio FROM planta p, reproduccio r, dosi_adob da WHERE p.nom_cientific = r.nom_planta AND p.nom_cientific = da.nom_planta AND da.nom_adob <> 'Casadob';
#59
SELECT DISTINCT p.floracio FROM planta p, exemplar_planta ep WHERE p.nom_cientific = ep.nom_planta;
#60
SELECT p.nom_popular, r.metode_reproduccio, LEFT (r.grau_exit, 1) FROM planta p, reproduccio r WHERE p.nom_cientific = r.nom_planta AND r.grau_exit <> 'Alt';
#61
SELECT DISTINCT da.nom_planta FROM dosi_adob da, estacio e, planta p WHERE p.nom_cientific = da.nom_planta AND da.nom_estacio = e.nom_estacio AND p.floracio = e.nom_estacio;
#62
SELECT DISTINCT LOWER(pe.nom_planta), LOWER(pi.nom_planta) FROM planta_exterior pe, planta_interior pi, planta p, dosi_adob da, adob a, reproduccio r WHERE pe.nom_planta = p.nom_cientific AND p.nom_cientific = da.nom_planta AND da.nom_adob = a.nom_adob AND a.nom_firma = 'CIRSADOB' OR pi.nom_planta = p.nom_cientific AND p.nom_cientific = r.nom_planta AND r.metode_reproduccio = 'Capficats';
#PROVA
SELECT p.nom_cientific FROM planta p, dosi_adob da WHERE da.quantitat_adob = (SELECT MAX(quantitat_adob) FROM dosi_adob);
#63
SELECT p.nom_cientific, UPPER(p.nom_popular) FROM planta p, planta_exterior pe, reproduccio r WHERE pe.nom_planta = p.nom_cientific AND p.nom_cientific = r.nom_planta AND r.metode_reproduccio = 'Esqueix' UNION SELECT p.nom_cientific, UPPER(p.nom_popular) FROM planta p, planta_interior pi, reproduccio r WHERE pi.nom_planta = p.nom_cientific AND p.nom_cientific = r.nom_planta AND r.grau_exit = 'Baix';
#64
SELECT p.nom_cientific, pi.temperatura FROM planta p, planta_interior pi WHERE p.nom_cientific = pi.nom_planta AND pi.temperatura >= (SELECT MAX(pi.temperatura) FROM planta_interior pi) - 1 ORDER BY pi.temperatura DESC;
#68
SELECT p.nom_popular, da.quantitat_adob FROM planta p, dosi_adob da WHERE p.nom_cientific = da.nom_planta AND da.quantitat_adob < (SELECT MAX(da.quantitat_adob) FROM dosi_adob da) AND da.quantitat_adob > (SELECT MIN(da.quantitat_adob) FROM dosi_adob da) ORDER BY da.quantitat_adob;
#69
SELECT p.nom_cientific FROM planta p, dosi_adob da WHERE p.nom_cientific = da.nom_planta AND p.nom_popular LIKE 'C%' AND da.nom_estacio = 'Primavera';
#70
SELECT ep.nom_planta FROM exemplar_planta ep WHERE ep.nom_planta NOT IN (SELECT DISTINCT da.nom_planta FROM dosi_adob da WHERE da.nom_adob = 'Casadob');
#SUBCONSULTES
#1
SELECT da.nom_planta FROM dosi_adob da WHERE da.nom_planta NOT IN (SELECT DISTINCT da.nom_planta FROM dosi_adob da WHERE da.nom_estacio = 'Primavera');
#2
SELECT p.nom_popular FROM planta p, dosi_adob da WHERE p.nom_cientific = da.nom_planta AND da.nom_planta NOT IN (SELECT DISTINCT da.nom_planta FROM dosi_adob da WHERE da.nom_estacio = 'Primavera');
#3
SELECT da.nom_planta FROM dosi_adob da WHERE da.quantitat_adob > (SELECT AVG(da.quantitat_adob) FROM dosi_adob da);
#4
SELECT p.nom_popular FROM planta p, dosi_adob da WHERE p.nom_cientific = da.nom_planta AND da.quantitat_adob = (SELECT AVG(da.quantitat_adob) FROM dosi_adob da);
#5
SELECT p.nom_popular FROM planta p, exemplar_planta ep WHERE p.nom_cientific = ep.nom_planta AND ep.num_exemplar = (SELECT MAX(ep.num_exemplar) FROM exemplar_planta ep);

#planta y cantidad total de abono de cada planta
SELECT da.nom_planta, SUM(da.quantitat_adob) FROM dosi_adob da WHERE da.nom_estacio = 'Primavera' GROUP BY da.nom_planta;
SELECT da.nom_planta, SUM(da.quantitat_adob) FROM dosi_adob da WHERE da.quantitat_adob > 20 GROUP BY da.nom_planta;
SELECT da.nom_planta, SUM(da.quantitat_adob) FROM dosi_adob da GROUP BY da.nom_planta HAVING SUM(da.quantitat_adob) > 50;

#72
SELECT a.nom_firma, COUNT(da.nom_planta) FROM dosi_adob da, adob a WHERE da.nom_adob = a.nom_adob GROUP BY a.nom_firma;
#77
SELECT p.nom_popular, COUNT(ep.num_exemplar) FROM planta p, exemplar_planta ep, planta_interior pi, planta_exterior pe WHERE ep.nom_planta = p.nom_cientific AND p.nom_cientific = pi.nom_planta AND pi.temperatura = 17 GROUP BY ep.nom_planta UNION SELECT p.nom_popular, COUNT(ep.num_exemplar) FROM planta p, exemplar_planta ep, planta_exterior pe WHERE ep.nom_planta = p.nom_cientific AND p.nom_cientific = pe.nom_planta GROUP BY ep.nom_planta;
#78
SELECT da.nom_estacio, COUNT(da.quantitat_adob) FROM dosi_adob da GROUP BY da.nom_estacio;

#ENTREGABLE
#1
SELECT p.nom_popular FROM planta p, exemplar_planta ep WHERE p.nom_cientific = ep.nom_planta AND ep.num_exemplar = (SELECT COUNT(ep.num_exemplar) FROM exemplar_planta ep WHERE ep.num_exemplar = 1);
#2
SELECT p.nom_popular FROM planta p, exemplar_planta ep WHERE p.nom_cientific = ep.nom_planta AND ep.num_exemplar NOT IN (SELECT ep.num_exemplar FROM exemplar_planta ep WHERE ep.num_exemplar >= 1);
#3
SELECT da.nom_estacio, COUNT(da.quantitat_adob) FROM dosi_adob da GROUP BY da.nom_estacio;
#4
SELECT p.nom_popular FROM planta p, dosi_adob da WHERE p.nom_cientific = da.nom_planta AND da.nom_planta NOT IN (SELECT DISTINCT da.nom_planta FROM dosi_adob da WHERE da.nom_estacio = 'Primavera');
#5
SELECT COUNT(r.metode_reproduccio) FROM reproduccio r GROUP BY r.nom_planta;
#6
SELECT r.nom_planta, COUNT(r.metode_reproduccio) FROM reproduccio r WHERE r.grau_exit = 'Alt' GROUP BY r.nom_planta;
#7
SELECT DISTINCT r.nom_planta FROM reproduccio r WHERE r.metode_reproduccio NOT IN (SELECT r.metode_reproduccio FROM reproduccio r WHERE r.metode_reproduccio = 'Esqueix');
#8
SELECT pi.nom_planta FROM planta p, planta_interior pi WHERE p.nom_cientific = pi.nom_planta AND p.floracio = 'Primavera';
#9
SELECT COUNT(a.nom_adob) FROM adob a GROUP BY a.nom_firma;