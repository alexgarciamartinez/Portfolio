DROP DATABASE IF EXISTS tauler; 
CREATE DATABASE tauler;
USE tauler;

# Creeu la taula
CREATE TABLE situacio (
idFigura INT PRIMARY KEY,
xCoord INT,
yCoord INT
) ENGINE=INNODB;

CREATE TABLE empresa (
id INT PRIMARY KEY AUTO_INCREMENT,
ciutat VARCHAR(6)
) ENGINE=INNODB;
 # Inseriu les dades
 INSERT INTO situacio VALUES (1, 3, 5);
 INSERT INTO situacio VALUES (2, 3, 7);
 INSERT INTO situacio VALUES (3, 5, 4);
 
DELIMITER //
CREATE FUNCTION funcio_moure(fitxa1 INT, fitxa2 INT) RETURNS VARCHAR(20)
BEGIN
	DECLARE paseX INT;
    DECLARE paseY INT;
    DECLARE direccioX VARCHAR(20);
    DECLARE direccioY VARCHAR(20);
	SET paseX = ABS((SELECT xCoord FROM situacio WHERE idFigura = fitxa1) - (SELECT xCoord FROM situacio WHERE idFigura = fitxa2));
    SET paseY = ABS((SELECT yCoord FROM situacio WHERE idFigura = fitxa1) - (SELECT yCoord FROM situacio WHERE idFigura = fitxa2));
    SET direccioX = " ";
    SET direccioY = " ";
    IF ((SELECT xCoord FROM situacio WHERE idFigura = fitxa1) > (SELECT xCoord FROM situacio WHERE idFigura = fitxa2)) THEN
		SET direccioX = "esquerra";
		IF ((SELECT yCoord FROM situacio WHERE idFigura = fitxa1) > (SELECT yCoord FROM situacio WHERE idFigura = fitxa2)) THEN
			SET direccioY = "pujar";
            RETURN CONCAT(paseX, " ",direccioX, " ",paseY, " ",direccioY);
		ELSE IF((SELECT yCoord FROM situacio WHERE idFigura = fitxa1) < (SELECT yCoord FROM situacio WHERE idFigura = fitxa2)) THEN
			SET direccioY = "baixar";
            RETURN CONCAT(paseX, " ",direccioX, " ",paseY, " ",direccioY);
		ELSE 
			SET direccioY = "";
			RETURN CONCAT(paseX, " ",direccioX, " ",paseY, " ",direccioY);
		END IF;
        END IF; 
    ELSE IF ((SELECT xCoord FROM situacio WHERE idFigura = fitxa1) < (SELECT xCoord FROM situacio WHERE idFigura = fitxa2)) THEN
		SET direccioX = "dreta";
		IF ((SELECT yCoord FROM situacio WHERE idFigura = fitxa1) > (SELECT yCoord FROM situacio WHERE idFigura = fitxa2)) THEN
			SET direccioY = "pujar";
            RETURN CONCAT(paseX, " ",direccioX, " ",paseY, " ",direccioY);
		ELSE IF((SELECT yCoord FROM situacio WHERE idFigura = fitxa1) < (SELECT yCoord FROM situacio WHERE idFigura = fitxa2)) THEN
			SET direccioY = "baixar";
            RETURN CONCAT(paseX, " ",direccioX, " ",paseY, " ",direccioY);
		ELSE
			SET direccioY = "";
			RETURN CONCAT(paseX, " ",direccioX, " ",paseY, " ",direccioY);
		END IF;
        END IF; 
	ELSE
		SET direccioX = "";
		IF ((SELECT yCoord FROM situacio WHERE idFigura = fitxa1) > (SELECT yCoord FROM situacio WHERE idFigura = fitxa2)) THEN
			SET direccioY = "pujar";
            RETURN CONCAT(paseX, " ",direccioX, " ",paseY, " ",direccioY);
		ELSE IF((SELECT yCoord FROM situacio WHERE idFigura = fitxa1) < (SELECT yCoord FROM situacio WHERE idFigura = fitxa2)) THEN
			SET direccioY = "baixar";
            RETURN CONCAT(paseX, " ",direccioX, " ",paseY, " ",direccioY);
		ELSE
			SET direccioY = "";
			RETURN CONCAT(paseX, " ",direccioX, " ",paseY, " ",direccioY);
		END IF;
        END IF; 
	END IF;
    END IF;
END //
DELIMITER ;

SELECT funcio_moure(1,2);

########

DELIMITER //
CREATE FUNCTION codi(ciutat VARCHAR(20)) RETURNS VARCHAR(6)
BEGIN
	DECLARE codificat VARCHAR(3);
    DECLARE codiCiutat INT(3);
    SET codiCiutat = 000;
    SET codificat = (SELECT UPPER(LEFT(ciutat,3)));
    IF (codiCiutat NOT IN (SELECT RIGHT(ciutat,3) FROM empresa)) THEN
		INSERT INTO empresa VALUES(NULL, CONCAT(codificat,codiCiutat+1));
        RETURN CONCAT(codificat,codiCiutat);
	END IF;
END //
DELIMITER ;

SELECT codi('Barcelona');
SELECT * FROM empresa;