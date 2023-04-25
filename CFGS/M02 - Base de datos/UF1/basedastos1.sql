CREATE DATABASE prova;
USE prova;
CREATE TABLE treball(
nom	CHAR(20),
edat INT,
carrec CHAR(50),
PRIMARY KEY (nom));

CREATE TABLE ciutat (
nom	        CHAR(25)	NOT NULL,
comarca	    CHAR(25)	NOT NULL,
provincia	CHAR(25)	NOT NULL,	
habitants	INT,
PRIMARY KEY (nom)
);

CREATE TABLE client (
idclient 		INTEGER AUTO_INCREMENT,
nom				CHAR UNIQUE,
cognoms 		CHAR UNIQUE,
data_naixement	DATE,
tipus			CHAR DEFAULT ('Habitual'),
PRIMARY KEY (idclient)
);

CREATE TABLE DEPARTAMENT (
numero			INT(2),
nom				CHAR(9) UNIQUE,
localitzacio	CHAR(10),
PRIMARY KEY (nom)
);
DROP TABLE DEPARTAMENT;

CREATE TABLE DEPARTAMENT2 (
numero			INT(2),
nom				CHAR(9) UNIQUE,
localitzacio	CHAR(10),
PRIMARY KEY (numero)
);

CREATE DATABASE BOTIGA;
USE BOTIGA;
CREATE TABLE PRODUCTE (
codi		INT PRIMARY KEY,
nom			VARCHAR(20),
descripcio	VARCHAR(20),
categoria	VARCHAR(20),
preu		DECIMAL(6,2),
fabricant INT,
FOREIGN KEY (fabricant) REFERENCES FABRICANT (codi)
);

CREATE TABLE FABRICANT (
codi 	INT PRIMARY KEY,
nom		VARCHAR(20),
web 	VARCHAR(20),
telefon INT
);

CREATE DATABASE INSTITUT;
USE INSTITUT;
CREATE TABLE ASSIGNATURA (
codi_assignatura	VARCHAR(3) PRIMARY KEY,
nom					VARCHAR(20),
cicle				VARCHAR(20),
curs				SMALLINT(1)
);

CREATE TABLE PROFESSOR (
codi_professor 			SMALLINT PRIMARY KEY,
nom						VARCHAR(20),
cognoms					VARCHAR(20),
dataNaixement			DATE,
telefon					INT(9),
adreça					VARCHAR(20)
);

CREATE TABLE ALUMNE (
codi_alumne			SMALLINT UNIQUE PRIMARY KEY,
nom					VARCHAR(20),
cognoms				VARCHAR(20),
dataNaixement		DATE,
telefon				INT(9),
adreça				VARCHAR(20)
);

CREATE TABLE IMPARTIR (
codi_professor SMALLINT,
codi_assignatura VARCHAR(3),
PRIMARY KEY (codi_professor, codi_assignatura),
FOREIGN KEY (codi_professor) REFERENCES PROFESSOR (codi_professor),
FOREIGN KEY (codi_assignatura) REFERENCES ASSIGNATURA (codi_assignatura)
);

CREATE TABLE REALITZAR (
codi_alumne			SMALLINT UNIQUE,
codi_assignatura 	VARCHAR(3),
PRIMARY KEY (codi_alumne, codi_assignatura),
FOREIGN KEY (codi_alumne) REFERENCES ALUMNE (codi_alumne),
FOREIGN KEY (codi_assignatura) REFERENCES ASSIGNATURA (codi_assignatura)
);

CREATE DATABASE BOTIGADVD;
USE BOTIGADVD;

CREATE TABLE USUARI (
codi_usuari		INT AUTO_INCREMENT PRIMARY KEY,
DNI 			VARCHAR(9),
nom				VARCHAR(20),
cognoms 		VARCHAR(20),
adreça 			VARCHAR(20),
ciutat 			VARCHAR(20),
sexe 			ENUM('H' , 'D'),
telefon 		INT(9),
mobil			INT(9),
correu			VARCHAR(20),
dataNaixement	DATE
);

CREATE TABLE PELICULA (
codi_pelicula	INT AUTO_INCREMENT PRIMARY KEY,
titol		VARCHAR(30),
director	VARCHAR(30),
actors		VARCHAR(50),
productora	VARCHAR(30),
anyRodacio	INT(4),
argument	TEXT,
duracio		INT(3),
dataAlta	DATE,
nacionalitat	VARCHAR(30),
baixa ENUM('S' , 'N'),
codi_categoria INT,
FOREIGN KEY (codi_categoria) REFERENCES CATEGORIA (codi_categoria)
);

CREATE TABLE CATEGORIA (
codi_categoria 	INT AUTO_INCREMENT PRIMARY KEY,
categoria		VARCHAR(30)
);

CREATE TABLE COPIA (
codi_copia	INT,
codi_pelicula INT,
PRIMARY KEY (codi_copia, codi_pelicula),
FOREIGN KEY (codi_pelicula) REFERENCES PELICULA (codi_pelicula)
);

CREATE TABLE LLOGA (
codi_usuari	INT,
codi_copia	INT,
codi_pelicula	INT,
data_lloguer DATE,
data_retorn DATE,
PRIMARY KEY (codi_usuari, codi_copia),
FOREIGN KEY (codi_copia) REFERENCES COPIA (codi_copia),
FOREIGN KEY (codi_pelicula) REFERENCES PELICULA (codi_pelicula),
FOREIGN KEY (codi_usuari) REFERENCES USUARI (codi_usuari)
);

CREATE DATABASE EMPRESA;
USE EMPRESA;
DROP DATABASE EMPRESA;
CREATE TABLE EMPLEAT (
codi			INT(4) PRIMARY KEY,
nom				VARCHAR(15),
cognoms			VARCHAR(30),
treball			VARCHAR(10),
codi_carrec		INT(4),
data_contracte	DATE,
salari			INT(7),
comissio		INT(7),
departament		INT(2)
);
ALTER TABLE EMPLEAT	MODIFY salari DECIMAL(7,2) NOT NULL;

CREATE TABLE DEPARTAMENT (
numero_dep		INT(2),
nom_dep			CHAR(9) PRIMARY KEY,
localitzacio	CHAR(10)
);
DROP TABLE DEPARTAMENT;

CREATE TABLE DEPARTAMENT2 (
numero_dep		INT(2) PRIMARY KEY,
nom_dep			CHAR(9),
localitzacio	CHAR(10)
);
DROP TABLE DEPARTAMENT2;

CREATE TABLE EMPLEAT2 (
codi			INT(4) PRIMARY KEY,
nom				VARCHAR(15),
cognoms			VARCHAR(30),
treball			VARCHAR(10),
codi_carrec		INT(4),
data_contracte	DATE,
salari			INT(7),
comissio		INT(7),
departament		INT(2),
FOREIGN KEY (departament) REFERENCES DEPARTAMENT2 (numero_dep)
);
ALTER TABLE EMPLEAT2 ADD UNIQUE  unic_sal_comm (salari, comissio);
CREATE INDEX index1 ON EMPLEAT2 (codi);
ALTER TABLE EMPLEAT2 ADD INDEX (index1);

ALTER TABLE DEPARTAMENT DROP PRIMARY KEY;

INSERT INTO USUARI (dni, nom, cognoms, adreça) values (1,2,3,4);
INSERT INTO USUARI (dni, nom, cognoms, adreça) values ('45990962R', 'Alex', 'Garcia' 'Martinez', 'AvBarcelona');


