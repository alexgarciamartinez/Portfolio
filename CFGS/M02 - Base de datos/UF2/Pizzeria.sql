DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;
CREATE TABLE client
	(telefon			VARCHAR(9)		PRIMARY KEY,
	nom					VARCHAR(20)		NOT NULL,
	adreca				VARCHAR(50)		NOT NULL,
	poblacio			VARCHAR(20)		NOT NULL DEFAULT 'Terrassa'
	)ENGINE=InnoDB
	;
INSERT INTO client VALUE ('937853354','Josep Vila','C. del Pi, 23',DEFAULT);
INSERT INTO client VALUE ('937883402','Carme Garcia','Plaça Nova 3',DEFAULT);
INSERT INTO client VALUE ('606989866','Enric Miralles','Carrer Romaní 6','Matadepera');
INSERT INTO client VALUE ('937753222','Miquel Bover','Carrer Can Boada 78', DEFAULT);
INSERT INTO client VALUE ('937862655','Marta Ribas','Carrer Aviació 3',DEFAULT);
INSERT INTO client VALUE ('937858555','Guillem Jam','Carrer de Dalt, 4', DEFAULT);
INSERT INTO client VALUE ('626895456','Júlia Guillén','C. Robert 8',DEFAULT);

CREATE TABLE empleat
	(codi				SMALLINT(3)		PRIMARY KEY AUTO_INCREMENT,
	nom					VARCHAR(20)		NOT NULL,
	cognoms				VARCHAR(40)		NOT NULL
	)ENGINE=InnoDB
	;
INSERT INTO empleat VALUE (NULL,'Jordi','Casas');
INSERT INTO empleat VALUE (NULL,'Marta','Pou');

CREATE TABLE comanda
	(numero				SMALLINT		PRIMARY KEY AUTO_INCREMENT,
	data_hora			TIMESTAMP		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	domicili_local		ENUM('L','D')	NOT NULL,
	telefon_client		VARCHAR(9)		NOT NULL,
	empleat				SMALLINT(3)		NOT NULL,
	CONSTRAINT fk_client FOREIGN KEY (telefon_client) REFERENCES client (telefon),
	CONSTRAINT fk_empleat FOREIGN KEY (empleat) REFERENCES empleat (codi)
	)ENGINE=InnoDB,
	AUTO_INCREMENT=10000
	;
INSERT INTO comanda VALUE (NULL,'20170109204500','L','937853354',1);
INSERT INTO comanda VALUE (NULL,'20170109205100','D','937883402',1);
INSERT INTO comanda VALUE (NULL,'20170109212000','D','606989866',1);
INSERT INTO comanda VALUE (NULL,'20170109213300','D','937753222',2);
INSERT INTO comanda VALUE (NULL,'20170110210000','D','937862655',1);
INSERT INTO comanda VALUE (NULL,'20170110213500','L','937858555',2);
INSERT INTO comanda VALUE (NULL,'20170110215000','D','937853354',2);
INSERT INTO comanda VALUE (NULL,'20170111203200','D','937883402',1);
INSERT INTO comanda VALUE (NULL,'20170111211000','D','626895456',1);
INSERT INTO comanda VALUE (NULL,'20170111212400','D','937853354',2);

CREATE TABLE producte
	(codi				SMALLINT(3)		PRIMARY KEY AUTO_INCREMENT,
	nom					VARCHAR(50)		NOT NULL UNIQUE,
	preu				DECIMAL(4,2)	NOT NULL CHECK (preu BETWEEN 0.01 AND 99.99)
	)ENGINE=InnoDB
	;
INSERT INTO producte VALUE (NULL,'Ampolla Coca-Cola',1.95);
INSERT INTO producte VALUE (NULL,'Ampolla Fanta Llimona',1.95);
INSERT INTO producte VALUE (NULL,'Llauna Nestea',1.50);
INSERT INTO producte VALUE (NULL,'Llauna Cervesa Damm',1.55);
INSERT INTO producte VALUE (NULL,'Llauna Cervesa sense alcohol',1.55);
INSERT INTO producte VALUE (NULL,'Pizza Barbacoa',19.95);
INSERT INTO producte VALUE (NULL,'Pizza Carbonara',18.95);
INSERT INTO producte VALUE (NULL,'Pizza Hawaiana',16.95);
INSERT INTO producte VALUE (NULL,'Pizza 4 estacions',18.95);
INSERT INTO producte VALUE (NULL,'Pizza Ibèrica',21.95);
INSERT INTO producte VALUE (NULL,'Pizza De la casa',19.95);
INSERT INTO producte VALUE (NULL,'Gelat Cornetto Classic',1.00);
INSERT INTO producte VALUE (NULL,'Paquet de trufes de xocolata',2.25);
INSERT INTO producte VALUE (NULL,'Gelat Magnum',1.95);

CREATE TABLE beguda
	(codi				SMALLINT		PRIMARY KEY,
	capacitat			SMALLINT(3)		NOT NULL CHECK (capacitat BETWEEN 1 AND 150),
	beguda_alcoholica	ENUM('N','S')	NOT NULL,
	CONSTRAINT fk_producte_beg FOREIGN KEY (codi) REFERENCES producte (codi)
	)ENGINE=InnoDB
	;
INSERT INTO beguda VALUE (1,50,'N');
INSERT INTO beguda VALUE (2,50,'N');
INSERT INTO beguda VALUE (3,33,'N');
INSERT INTO beguda VALUE (4,33,'S');
INSERT INTO beguda VALUE (5,33,'N');

CREATE TABLE pizza
	(codi				SMALLINT		PRIMARY KEY,
	CONSTRAINT fk_producte_piz FOREIGN KEY (codi) REFERENCES producte (codi)
	)ENGINE=InnoDB
	;
INSERT INTO pizza VALUE (6);
INSERT INTO pizza VALUE (7);
INSERT INTO pizza VALUE (8);
INSERT INTO pizza VALUE (9);
INSERT INTO pizza VALUE (10);
INSERT INTO pizza VALUE (11);

CREATE TABLE postre
	(codi				SMALLINT		PRIMARY KEY,
	CONSTRAINT fk_producte_pos FOREIGN KEY (codi) REFERENCES producte (codi)
	)ENGINE=InnoDB
	;
INSERT INTO postre VALUE (12);
INSERT INTO postre VALUE (13);
INSERT INTO postre VALUE (14);

CREATE TABLE ingredient
	(codi				VARCHAR(3)		PRIMARY KEY,
	nom					VARCHAR(20)		NOT NULL UNIQUE
	)ENGINE=InnoDB
	;
INSERT INTO ingredient VALUE ('MOZ','Mozzarella');
INSERT INTO ingredient VALUE ('TOM','Salsa de tomàquet');
INSERT INTO ingredient VALUE ('BAC','Bacon');
INSERT INTO ingredient VALUE ('POL','Pollastre');
INSERT INTO ingredient VALUE ('CAR','Carn');
INSERT INTO ingredient VALUE ('BAR','Salsa barbacoa');
INSERT INTO ingredient VALUE ('XAM','Xampinyons');
INSERT INTO ingredient VALUE ('CAB','Salsa carbonara');
INSERT INTO ingredient VALUE ('PIN','Pinya');
INSERT INTO ingredient VALUE ('PER','Pernil york');
INSERT INTO ingredient VALUE ('TON','Tonyina');
INSERT INTO ingredient VALUE ('OLI','Olives negres');
INSERT INTO ingredient VALUE ('NAT','Tomàquet natural');
INSERT INTO ingredient VALUE ('IBE','Pernil ibèric');

CREATE TABLE forma
	(pizza				SMALLINT,
	ingredient			VARCHAR(3),	
	PRIMARY KEY (pizza,ingredient),
	CONSTRAINT fk_pizza FOREIGN KEY (pizza) REFERENCES pizza (codi),
	CONSTRAINT fk_ingredient FOREIGN KEY (ingredient) REFERENCES ingredient (codi)
	)ENGINE=InnoDB
	;
INSERT INTO forma VALUE (6,'MOZ');
INSERT INTO forma VALUE (6,'TOM');
INSERT INTO forma VALUE (6,'BAC');
INSERT INTO forma VALUE (6,'POL');
INSERT INTO forma VALUE (6,'CAR');
INSERT INTO forma VALUE (6,'BAR');
INSERT INTO forma VALUE (7,'MOZ');
INSERT INTO forma VALUE (7,'TOM');
INSERT INTO forma VALUE (7,'BAC');
INSERT INTO forma VALUE (7,'XAM');
INSERT INTO forma VALUE (7,'CAB');
INSERT INTO forma VALUE (8,'MOZ');
INSERT INTO forma VALUE (8,'TOM');
INSERT INTO forma VALUE (8,'PIN');
INSERT INTO forma VALUE (8,'PER');
INSERT INTO forma VALUE (9,'MOZ');
INSERT INTO forma VALUE (9,'TOM');
INSERT INTO forma VALUE (9,'TON');
INSERT INTO forma VALUE (9,'OLI');
INSERT INTO forma VALUE (9,'XAM');
INSERT INTO forma VALUE (10,'MOZ');
INSERT INTO forma VALUE (10,'NAT');
INSERT INTO forma VALUE (10,'IBE');
INSERT INTO forma VALUE (11,'MOZ');
INSERT INTO forma VALUE (11,'TOM');
INSERT INTO forma VALUE (11,'BAC');
INSERT INTO forma VALUE (11,'PER');
INSERT INTO forma VALUE (11,'CAR');

CREATE TABLE conte
	(comanda			SMALLINT,
	producte			SMALLINT,
	quantitat			SMALLINT(2)		NOT NULL CHECK (quantitat BETWEEN 1 AND 99),
	PRIMARY KEY (comanda, producte),
	CONSTRAINT fk_comanda FOREIGN KEY (comanda) REFERENCES comanda (numero),
	CONSTRAINT fk_producte FOREIGN KEY (producte) REFERENCES producte (codi)
	)ENGINE=InnoDB
	;
INSERT INTO conte VALUE (10000,6,2);
INSERT INTO conte VALUE (10000,1,2);
INSERT INTO conte VALUE (10000,2,1);
INSERT INTO conte VALUE (10000,12,2);
INSERT INTO conte VALUE (10001,10,1);
INSERT INTO conte VALUE (10002,11,2);
INSERT INTO conte VALUE (10002,1,1);
INSERT INTO conte VALUE (10002,4,3);
INSERT INTO conte VALUE (10002,14,4);
INSERT INTO conte VALUE (10003,7,1);
INSERT INTO conte VALUE (10003,8,1);
INSERT INTO conte VALUE (10003,4,2);
INSERT INTO conte VALUE (10003,5,2);
INSERT INTO conte VALUE (10004,7,1);
INSERT INTO conte VALUE (10004,9,2);
INSERT INTO conte VALUE (10004,1,6);
INSERT INTO conte VALUE (10005,5,1);
INSERT INTO conte VALUE (10005,1,2);
INSERT INTO conte VALUE (10005,12,1);
INSERT INTO conte VALUE (10005,13,1);
INSERT INTO conte VALUE (10006,6,1);
INSERT INTO conte VALUE (10006,10,1);
INSERT INTO conte VALUE (10006,11,2);
INSERT INTO conte VALUE (10007,6,1);
INSERT INTO conte VALUE (10007,1,1);
INSERT INTO conte VALUE (10007,2,1);
INSERT INTO conte VALUE (10008,6,1);
INSERT INTO conte VALUE (10008,4,2);
INSERT INTO conte VALUE (10008,14,1);
INSERT INTO conte VALUE (10009,7,1);
INSERT INTO conte VALUE (10009,9,1);

#1El nom dels clients que han fet més comandes:
SELECT cli.nom, COUNT(com.numero) FROM client cli, comanda com WHERE cli.telefon = com.telefon_client GROUP BY cli.nom ORDER BY COUNT(com.numero) DESC LIMIT 1;
#2 Quins ingredients porta la pizza que menys ingredients té:
SELECT p.codi, pr.nom, COUNT(i.codi), i.nom FROM producte pr, pizza p, forma f, ingredient i WHERE pr.codi = p.codi AND p.codi = f.pizza AND f.ingredient = i.codi GROUP BY p.codi ORDER BY COUNT(i.codi) ASC LIMIT 1;
SELECT COUNT(i.codi), i.nom FROM producte pr, pizza p, forma f, ingredient i WHERE pr.codi = p.codi AND p.codi = f.pizza AND f.ingredient = i.codi GROUP BY p.codi ORDER BY COUNT(i.codi) DESC;
SELECT pro.codi, pro.nom, f.ingredient, COUNT(pro.nom) FROM producte pro, forma f, pizza p WHERE pro.codi = p.codi AND p.codi = f.pizza GROUP BY pro.nom ORDER BY COUNT(f.ingredient);
#3 Quantes comandes s'han fet a domicili i quantes de recollida en local:
SELECT com.domicili_local, COUNT(com.numero) FROM comanda com WHERE com.domicili_local = 'D' UNION SELECT com.domicili_local, COUNT(com.numero) FROM comanda com WHERE com.domicili_local = 'L'; 
#Mostra-ho a la mateixa linea REVISAR
SELECT COUNT(com.domicili_local), COUNT(com.numero) FROM comanda com WHERE com.numero = (SELECT COUNT(com.numero) FROM comanda com GROUP BY com.domicili_local ORDER BY com.numero DESC)GROUP BY com.domicili_local;
SELECT COUNT(com.numero) FROM comanda com GROUP BY com.domicili_local ORDER BY com.numero DESC;
#4 Digues el nom dels clients que han fet alguna comanda a domicili i cap de recollida en local:
SELECT cli.nom, com.domicili_local FROM client cli, comanda com WHERE cli.telefon = com.telefon_client AND cli.nom NOT IN (SELECT cli.nom FROM client cli, comanda com WHERE cli.telefon = com.telefon_client AND com.domicili_local = 'L');
#5 Quins postres no s'han demanat mai a cap comanda:
SELECT pos.codi, pro.nom FROM postre pos, producte pro, conte con WHERE pos.codi = pro.codi AND pro.codi = con.producte AND pos.codi NOT IN (SELECT pos.codi FROM postre pos, producte pro, conte con WHERE pos.codi = pro.codi AND pro.codi = con.producte); 
#6 En quines comandes s'ha demanat alguna beguda alcohòlica:
SELECT con.comanda, pro.nom FROM conte con, producte pro, beguda b WHERE con.producte = pro.codi AND pro.codi = b.codi AND b.beguda_alcoholica = 'S';
#7 En quines comandes s'han demanat més de 3 pizzes:
SELECT con.comanda FROM conte con, producte pro, pizza p WHERE con.producte = pro.codi AND pro.codi = p.codi AND p.codi HAVING SUM(p.codi) > 3;
SELECT con.comanda, SUM(con.quantitat) FROM conte con, producte pro, pizza p WHERE con.producte = pro.codi AND pro.codi = p.codi GROUP BY con.comanda ORDER BY SUM(con.quantitat) DESC;
SELECT con.comanda, SUM(con.quantitat) FROM conte con, producte pro, pizza p WHERE con.producte = pro.codi AND pro.codi = p.codi GROUP BY con.comanda HAVING SUM(con.quantitat) > 3;
#8 En quantes poblacions s'han fet comandes a domicili:
SELECT  COUNT(cli.poblacio) FROM client cli, comanda com WHERE cli.telefon = com.telefon_client AND com.domicili_local = 'D';
SELECT cli.poblacio FROM client cli, comanda com WHERE cli.telefon = com.telefon_client AND com.domicili_local = 'D' GROUP BY cli.poblacio HAVING COUNT(*);

SELECT p.nom FROM producte p, pizza pi, forma f

WHERE (f.pizza=pi.codi) AND (pi.codi=p.codi)

GROUP BY f.pizza

HAVING COUNT(*)=(SELECT COUNT(*) FROM forma

				GROUP BY pizza


				ORDER BY COUNT(*) LIMIT 1);
