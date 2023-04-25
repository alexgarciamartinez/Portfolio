CREATE DATABASE IF NOT EXISTS entitatbancaria;

USE entitatbancaria;

CREATE TABLE IF NOT EXISTS entitatbancaria.centralsindical 
   ( codCen  TINYINT(2) PRIMARY KEY,
     nomCen VARCHAR(45) NOT NULL UNIQUE,
     quota DECIMAL(8,2)
   ) engine=InnoDB;
INSERT INTO entitatbancaria.centralsindical (codCen, nomCen) VALUES (4, 'Associacio Internacional dels Treballadors');

CREATE TABLE IF NOT EXISTS entitatbancaria.categoria
   ( codCat TINYINT(2) PRIMARY KEY,
     nomCat VARCHAR(45),
     souBase DECIMAL(8,2) NOT NULL,
     horaExtra DECIMAL(8,2)
   ) engine=InnoDB;

CREATE TABLE IF NOT EXISTS entitatbancaria.ciutat
   ( codCiu TINYINT(2) PRIMARY KEY,
     nomCiu VARCHAR(30) NOT NULL
   ) engine=InnoDB;

CREATE TABLE IF NOT EXISTS entitatbancaria.agencia
   ( codAg TINYINT(2) PRIMARY KEY,
     nom VARCHAR(45) NOT NULL,
     adreca VARCHAR(30),
     telefon CHAR(9),
     codCiu TINYINT(2),
     FOREIGN KEY (codCiu) REFERENCES entitatbancaria.ciutat (codCiu) ON DELETE SET NULL ON UPDATE CASCADE
   ) engine=InnoDB;


CREATE TABLE IF NOT EXISTS entitatbancaria.empleat
   ( codemp SMALLINT(3) PRIMARY KEY, 
     dni CHAR(9) UNIQUE NOT NULL,
     nom VARCHAR(45) NOT NULL,
     cognom VARCHAR(45) NOT NULL,
     codCiu TINYINT(2),
     codCen TINYINT(2),
     codCat TINYINT(2),
     codAg TINYINT(2),
     FOREIGN KEY (codCiu) REFERENCES entitatbancaria.ciutat (codCiu),
     FOREIGN KEY (codCen) REFERENCES entitatbancaria.centralsindical (codCen),
     FOREIGN KEY (codCat) REFERENCES entitatbancaria.categoria (codCat),
     FOREIGN KEY (codAg) REFERENCES entitatbancaria.agencia (codAg)
   ) engine=InnoDB;

CREATE TABLE IF NOT EXISTS entitatbancaria.titol
   ( codTit TINYINT(2) PRIMARY KEY,
     nomTit CHAR(45) NOT NULL
   ) engine=InnoDB;


CREATE TABLE IF NOT EXISTS entitatbancaria.titulacions
   (  codEmp SMALLINT(3),
      codTit TINYINT(2), 
      dataObt DATE,
      PRIMARY KEY (codEmp, codTit),
      FOREIGN KEY (codEmp) REFERENCES entitatbancaria.empleat (codEmp) ON DELETE CASCADE ON UPDATE CASCADE,
      FOREIGN KEY (codTit) REFERENCES entitatbancaria.titol (codTit) ON DELETE CASCADE ON UPDATE CASCADE
    ) engine=InnoDB;
    
INSERT INTO entitatbancaria.centralsindical (codCen, nomCen) VALUES (4, 'Associacio Internacional dels Treballadors');    
INSERT INTO entitatbancaria.empleat (codemp, dni, nom, cognom) VALUES (12, '22222222A', 'Marta', 'Casillas');
INSERT INTO ciutat (codCiu, nomCiu) VALUE ('01', 'Barcelona');
INSERT INTO categoria (codCat, nomCat, souBase) VALUE (01,'caixer',0);
INSERT INTO agencia (codAg, nom) VALUE (1, 'agencia01');
UPDATE empleat SET codCiu = 01 WHERE codemp = 12;
UPDATE empleat SET codCat = 01 WHERE codemp = 12;
UPDATE empleat SET codAg = 1 WHERE codemp = 12;
SELECT *FROM ciutat;
SELECT *FROM empleat;
SELECT *FROM categoria;

/*EJERCICIO 3*/
INSERT INTO centralsindical (codCen, nomCen) VALUES (01, 'Comissions Obreres');
INSERT INTO empleat (codemp, dni, nom, cognom, codCen) VALUES (01, '11111111A', 'David', 'Garcia', 01);

/*EJERCICIO 4*/
UPDATE categoria SET souBase = souBase * 1.03;
UPDATE categoria SET horaExtra = horaExtra * 1.05;

/*EJERCICIO 5*/
UPDATE titol SET nomTit = UPPER(nomTit);

/*EJERCICIO 6*/
DELETE FROM titulacions;

/*EJERCICIO 7*/
DELETE FROM ciutat WHERE codCiu = 01;
DELETE FROM empleat WHERE codCiu = '01';

/*EJERCICIO 8*/
INSERT INTO titol (codTit, nomTit) VALUES (01, 'Llicenciat en Economiques');
UPDATE titol SET nomTit = 6 WHERE codTit = 01;

/*EJERCICO 1.2*/
/*DROP TABLE titulacions;*/

/*EJERCICIO 2.2*/
ALTER TABLE empleat ADD souAnual DECIMAL(8,2) DEFAULT (0);

/*EJERCICIO 3.2*/
/*ALTER TABLE empleat DROP souAnual;*/

/*EJERCICIO 4.2*/
ALTER TABLE centralsindical ADD quantitatEmpleats INT DEFAULT(0) AFTER nomCen;

/*EJERCICIO 5.2*/
ALTER TABLE categoria MODIFY nomCat VARCHAR (45) NOT NULL UNIQUE;

/*EJERCICIO 6.2*/
ALTER TABLE categoria MODIFY horaExtra DECIMAL(8,2) DEFAULT(30.00);
SELECT *FROM categoria;
INSERT INTO categoria (codCat, nomCat, souBase) VALUES (04, 'Prueba', 1000.00);