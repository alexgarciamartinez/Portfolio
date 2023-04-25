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