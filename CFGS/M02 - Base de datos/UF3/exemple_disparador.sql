DROP DATABASE exemple_disparador;
CREATE DATABASE exemple_disparador;
USE exemple_disparador;
CREATE TABLE prova (codi INT);
CREATE TABLE suma (suma INT);
CREATE TABLE suma_text (suma VARCHAR(200));
CREATE TABLE prova_log (hora_data DATETIME, usuari VARCHAR(200) , accio VARCHAR(200));
CREATE TABLE suma_valors (codi INT, vegades INT);
CREATE TABLE prova_puntuacio (lletra ENUM('A','B','C','D','E'), puntuacio INT(10));
CREATE TABLE prova_puntuacio_seg (lletra CHAR, puntuacio INT);

#Exercici 52: Crea un disparador que quan fem una inserció a la taula prova deixi només l'últim registre introduït a la taula suma.
DELIMITER //
CREATE TRIGGER disparador52 AFTER INSERT ON prova FOR EACH ROW
BEGIN
	DELETE FROM suma;
    INSERT INTO suma VALUES(NEW.codi);
END //
DELIMITER ;

#Exercici 53: Crea els disparadors que compti els registres de la taula prova, tant si inserim com si esborrem
DROP TRIGGER IF EXISTS disparador53;
DELIMITER //
CREATE TRIGGER disparador53 AFTER INSERT ON prova FOR EACH ROW
BEGIN
    DELETE FROM suma;
    INSERT INTO suma VALUES ((SELECT COUNT(*) FROM prova));
END //
DELIMITER ;
DELIMITER //
CREATE TRIGGER disparador53_1 AFTER INSERT ON prova FOR EACH ROW
BEGIN
    IF ((SELECT COUNT(*) FROM suma) = 0) THEN
		INSERT INTO suma VALUES ((SELECT COUNT(*) FROM prova));
	ELSE 
		UPDATE suma SET suma = (SELECT COUNT(*) FROM prova);
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER disparador53_2 AFTER DELETE ON prova FOR EACH ROW
BEGIN
	
    IF ((SELECT COUNT(*) FROM prova) = 0) THEN
		DELETE FROM suma;
	ELSE 
		UPDATE suma SET suma = (SELECT COUNT(*) FROM prova);
	END IF;
END //
DELIMITER ;

#54 Crea un disparador que cada vegada que inserim un registre a la taula prova, introdueixi el valor a la taula suma_text amb el signe + davant. Així si ha la taula prova tenim els valors 1, 2 i 3, a la taula suma hi haurà un camp que serà 1+2+3.
DELIMITER //
CREATE TRIGGER disparador54 BEFORE INSERT ON prova FOR EACH ROW
BEGIN
	IF ((SELECT COUNT(*) FROM prova) = 0) THEN
		INSERT INTO suma_text VALUES(NEW.codi);
    ELSE 
		UPDATE suma_text SET suma = CONCAT(suma, '+', NEW.codi);
	END IF;
END //
DELIMITER ;

#55 Creem una taula anomenada prova_log que té tres camps (hora i data, usuari, acció). Crea un disparador que faci un registre de tots els canvis que fem a la taula prova, tant sigui inserir, esborrar o modificar.
DELIMITER //
CREATE TRIGGER ex55_insert AFTER INSERT ON prova FOR EACH ROW 
BEGIN
	INSERT INTO prova_log VALUES (NOW(), USER(), CONCAT('Inserció: ', NEW.codi));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER ex55_delete AFTER DELETE ON prova FOR EACH ROW 
BEGIN
	INSERT INTO prova_log VALUES (NOW(), USER(), CONCAT('Eliminació: ', OLD.codi));
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER ex55_update AFTER UPDATE ON prova FOR EACH ROW 
BEGIN
	INSERT INTO prova_log VALUES (NOW(), USER(), CONCAT('Canvi: ', OLD.codi, '->', NEW.codi));
END //
DELIMITER ;

#56
DELIMITER // 
CREATE TRIGGER ex56_insert AFTER INSERT ON prova FOR EACH ROW
BEGIN
	IF ((SELECT COUNT(*) FROM suma_valors WHERE codi=NEW.codi) = 0) THEN 
		INSERT INTO suma_valors VALUES(NEW.codi, (SELECT COUNT(*) FROM prova WHERE codi = NEW.codi));
	ELSE
		UPDATE suma_valors SET vegades = (SELECT COUNT(codi) FROM prova WHERE codi = NEW.codi) WHERE codi = NEW.codi;
	END IF;
END //
DELIMITER ;
INSERT INTO prova VALUES (10);
DELIMITER // 
CREATE TRIGGER ex56_delete AFTER DELETE ON prova FOR EACH ROW
BEGIN
	IF ((SELECT COUNT(*) FROM suma_valors WHERE codi=OLD.codi) = 0) THEN 
		DELETE FROM suma_valors WHERE codi = OLD.codi;
	ELSE
		UPDATE suma_valors SET vegades = (SELECT COUNT(codi) FROM prova WHERE codi = OLD.codi) WHERE codi = OLD.codi;
	END IF;
END //
DELIMITER ;
DELIMITER // 
CREATE TRIGGER ex56_update AFTER UPDATE ON prova FOR EACH ROW
BEGIN
	IF ((SELECT COUNT(*) FROM suma_valors WHERE codi=NEW.codi) = 0) THEN 
		INSERT INTO suma_valors VALUES(NEW.codi, (SELECT COUNT(*) FROM prova WHERE codi = NEW.codi));
	ELSE
		UPDATE suma_valors SET vegades = (SELECT COUNT(codi) FROM prova WHERE codi = NEW.codi) WHERE codi = NEW.codi;
	END IF;
	IF ((SELECT COUNT(*) FROM prova WHERE codi=OLD.codi) = 0) THEN 
		DELETE FROM suma_valors WHERE codi = OLD.codi;
	ELSE
		UPDATE suma_valors SET vegades = (SELECT COUNT(codi) FROM prova WHERE codi = OLD.codi) WHERE codi = OLD.codi;
	END IF;
END //
DELIMITER ;

SHOW TRIGGERS;
DROP TRIGGER disparador52;
DROP TRIGGER disparador53;
DROP TRIGGER ex56_update;
SELECT * FROM suma_valors;
INSERT INTO prova VALUES (10);
INSERT INTO prova VALUES (1);
INSERT INTO prova VALUES (1);
INSERT INTO prova VALUES (2);
INSERT INTO prova VALUES (2);
INSERT INTO prova VALUES (2);
INSERT INTO prova VALUES (3);
UPDATE prova SET codi = 2 WHERE codi = 1;
UPDATE prova SET codi = 1 WHERE codi = 10;

#Exercici 57: Crea un disparador que només mantingui a la taula suma els 10 últims registres de la taula prova.
DELIMITER // 
CREATE TRIGGER ex57_update AFTER INSERT ON prova FOR EACH ROW
BEGIN
	IF ((SELECT COUNT(*) FROM prova) <= 10) THEN
		INSERT INTO suma VALUES (NEW.codi);
	ELSE
		INSERT INTO suma VALUES (NEW.codi);
		DELETE FROM suma LIMIT 1;
	END IF;
END //
DELIMITER ;
DROP TRIGGER ex57_update;
DELETE FROM prova;
DELETE FROM suma;
SELECT * FROM prova;
SELECT * FROM suma;
INSERT INTO prova VALUES (1);
INSERT INTO prova VALUES (2);
INSERT INTO prova VALUES (3);
INSERT INTO prova VALUES (4);
INSERT INTO prova VALUES (5);
INSERT INTO prova VALUES (6);
INSERT INTO prova VALUES (7);
INSERT INTO prova VALUES (8);
INSERT INTO prova VALUES (9);
INSERT INTO prova VALUES (10);
INSERT INTO prova VALUES (11);

#58
DELIMITER //
CREATE TRIGGER ex58_insert AFTER INSERT ON prova_puntuacio FOR EACH ROW
BEGIN
	IF ((SELECT COUNT(*) FROM prova_puntuacio_seg WHERE lletra = NEW.lletra)= 0) THEN
		INSERT INTO prova_puntuacio_seg VALUES (NEW.lletra, NEW.puntuacio);
	ELSE IF (NEW.puntuacio <> (SELECT puntuacio FROM prova_puntuacio_seg WHERE lletra = NEW.lletra)) THEN
		UPDATE prova_puntuacio_seg SET puntuacio = NEW.puntuacio WHERE lletra = NEW.lletra;
        END IF;
	END IF;
END //
DELIMITER ;

INSERT INTO prova_puntuacio VALUES ('A', 7);
INSERT INTO prova_puntuacio VALUES ('A', 10);
INSERT INTO prova_puntuacio VALUES ('B', 8);
INSERT INTO prova_puntuacio VALUES ('C', 6);
INSERT INTO prova_puntuacio VALUES ('D', 5);
INSERT INTO prova_puntuacio VALUES ('E', 9);


SELECT * FROM prova_puntuacio;
SELECT * FROM prova_puntuacio_seg;

#59 Crea un disparador de manera que a prova_puntuacio_seg compti les puntuacions total per cada lletra (hi haurà 5 registres amb la puntuació total de cadascuna).
DELIMITER //
CREATE TRIGGER ex59_insert AFTER INSERT ON prova_puntuacio FOR EACH ROW
BEGIN
	IF ((SELECT COUNT(*) FROM prova_puntuacio_seg WHERE lletra = NEW.lletra)= 0) THEN
		INSERT INTO prova_puntuacio_seg VALUES (NEW.lletra, (SELECT COUNT(*) FROM prova_puntuacio WHERE lletra = NEW.lletra));
	ELSE 
		UPDATE prova_puntuacio_seg SET puntuacio = (SELECT COUNT(*) FROM prova_puntuacio WHERE lletra = NEW.lletra) WHERE lletra = NEW.lletra;
	END IF;
END //
DELIMITER ;
INSERT INTO prova_puntuacio VALUES ('A', 7);
INSERT INTO prova_puntuacio VALUES ('A', 10);
INSERT INTO prova_puntuacio VALUES ('B', 8);
INSERT INTO prova_puntuacio VALUES ('C', 6);
INSERT INTO prova_puntuacio VALUES ('D', 5);
INSERT INTO prova_puntuacio VALUES ('E', 9);
SELECT * FROM prova_puntuacio;
SELECT * FROM prova_puntuacio_seg;


