DROP DATABASE IF EXISTS practica3;

CREATE DATABASE practica3;

USE practica3;

CREATE TABLE alumne

(codi INT PRIMARY KEY AUTO_INCREMENT,

nom VARCHAR(20) NOT NULL,

cognom VARCHAR(20) NOT NULL,

data_naixement DATE,

edat INT

);

INSERT INTO alumne VALUES (NULL,'Guillem','Homet','1992/12/20',NULL);

INSERT INTO alumne VALUES (NULL,'Marta','Ros','1993/01/21',NULL);

INSERT INTO alumne VALUES (NULL,'Miquel','Rodríguez','1990/10/11',NULL);

CREATE TABLE professor

(codi INT PRIMARY KEY AUTO_INCREMENT,

nom VARCHAR(20) NOT NULL,

cognom VARCHAR(20) NOT NULL,

data_naixement DATE,

edat INT

);

INSERT INTO professor VALUES (NULL,'Núria','Ribas','1985/10/06',NULL);

INSERT INTO professor VALUES (NULL,'Carles','Pujol','1978/06/14',NULL);

#Crea un procediment anomenat cerca que busqui tots els alumnes que el seu cognom la cadena que indiquem.
DELIMITER //
CREATE PROCEDURE cerca(IN cadena VARCHAR(20))
BEGIN
    SELECT cognom FROM alumne WHERE cognom LIKE cadena;
END //
DELIMITER ;

CALL cerca('%I%');

#Crea un procediment que busqui els professors per nom i cognom. Tingueu en compte que si deixem algun dels dos paràmetres buits cerqui pels altres.
DELIMITER //
CREATE PROCEDURE cerca2(IN nom2 VARCHAR(20), IN cognom2 VARCHAR(20))
BEGIN
	IF(nom2 IS NULL AND cognom2 IS NULL) THEN
		SELECT * FROM professor;
	ELSE IF (nom2 IS NOT NULL AND cognom2 IS NULL) THEN
		SELECT * FROM professor p WHERE p.nom = nom2;
	ELSE IF (nom2 IS NULL AND cognom2 IS NOT NULL) THEN
		SELECT * FROM professor p WHERE p.cognom = cognom2;
	ELSE 
		SELECT * FROM professor p WHERE p.nom LIKE nom2 AND p.cognom LIKE cognom2;
	END IF ;
    END IF ;
    END IF ;
END //
DELIMITER ;

#Crea un procediment que incrementi el valor del codi de la taula professor en un valor que nosaltres li indiquem.
DELIMITER //
CREATE PROCEDURE actualitza(IN valor INT)
BEGIN
    UPDATE professor SET codi = codi + valor;
END //
DELIMITER ;

CALL actualitza(20);
CALL actualitza(30);

#Crea un procediment que donat un nom, un cognom, la data de naixement i si és professor o alumne, l'afegeixi a la taula corresponent. Si no, que no faci res.
DELIMITER //
CREATE PROCEDURE inserir(IN nom2 VARCHAR(20), IN cognom2 VARCHAR(20), IN data2 DATE, IN tipus VARCHAR(20))
BEGIN
    IF (LOWER(tipus) = 'professor') THEN
		INSERT INTO professor VALUES(NULL, nom2, cognom2, data2, (YEAR(NOW())-YEAR(data2)));
	ELSE IF (LOWER(tipus) = 'alumne') THEN
		INSERT INTO alumne VALUES(NULL, nom2, cognom2, data2, (YEAR(NOW())-YEAR(data2)));
	END IF ; 
    END IF ;
END //
DELIMITER ;

CALL inserir('Alex', 'García', '2004-11-06', 'alumne');
CALL inserir('Alberto', 'Gómez', '2001-12-19', 'professor');
CALL inserir('Oriol', 'Jové', '2003-04-10', 'entrenador pokemon');

SELECT * FROM alumne;
SELECT * FROM professor;

#Crea un procediment que afegeixi la data de naixement als alumnes que no la tenen assignada o la tinguin malament. Per això li indicarem el codi de l'alumne i la data de naixement.
DELIMITER //
CREATE PROCEDURE data_naixement(IN codi2 INT, IN data2 DATE)
BEGIN
    IF ((SELECT data_naixement FROM alumne WHERE codi = codi2) = NULL) THEN
		UPDATE alumne SET data_naixement = data2;
    END IF ;
END //
DELIMITER ;

#Crea un procediment per elimini els registres de la taula alumnes que tenen el codi entre els dos que l'indicarem (inclosos).
DELIMITER //
CREATE PROCEDURE elimina(IN codi2 INT, IN codi3 INT)
BEGIN
    IF (codi2 < codi3) THEN
		WHILE(codi2 <= codi3) DO
			DELETE FROM alumne WHERE codi = codi2;
            SET codi2 = codi2+1;
		END WHILE;
	ELSE IF (codi2 > codi3) THEN
		WHILE(codi2 >= codi3) DO
			DELETE FROM alumne WHERE codi = codi2;
            SET codi2 = codi2-1;
		END WHILE;
    END IF ;
    END IF ;
END //
DELIMITER ;

CALL elimina(1,3);
CALL elimina(3,1);
SELECT * FROM alumne;




