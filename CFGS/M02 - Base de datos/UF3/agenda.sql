DROP DATABASE IF EXISTS agenda;

CREATE DATABASE agenda;

USE agenda;

#Crea un procediment anomenat taula faci el següent: - Si passem el paràmetre 'T', crei l'estructura de la taula diari. - Si passem el paràmetre 'E', elimini la taula diari si existeix
DELIMITER //
CREATE PROCEDURE taula(IN parametre CHAR)
BEGIN
	IF (parametre = 'T') THEN
		CREATE TABLE IF NOT EXISTS diari
		(codi INT PRIMARY KEY AUTO_INCREMENT,
		data DATE,
		hora TIME,
		event VARCHAR(40)
		);
	ELSE IF (parametre = 'E') THEN
		DROP TABLE IF EXISTS diari;
	END IF ;
    END IF ;
END //
DELIMITER ;

CALL taula('T');
SELECT * FROM diari;

#Exercici 24: Crea un procediment anomenat inser que faci insercions a la taula anterior.
DELIMITER //
CREATE PROCEDURE inser(IN fecha DATE, IN hora TIME, IN evento VARCHAR(40))
BEGIN
    INSERT INTO diari VALUES(NULL, fecha, hora, evento);
END //
DELIMITER ;

CALL inser('2023/04/17','12:00:00','Reunió de direcció');
CALL inser('2023/04/18','12:00:00','Reunió de Laporta');
CALL inser('2023/04/24','12:00:00','Reunió de Florentino');

SELECT * FROM diari;

#Exercici 25: Crea un procediment anomenat elim que elimini tots els registres entre dues dates. Si deixem la primera data en blanc esborrarà tots els registres anteriors a la segona data, i si deixem la segona data en blanc esborrarà tots els registres posteriors a la primera data. Sempre les dates que indiquem estan incloses.
/*DELIMITER //
CREATE PROCEDURE elim(IN fecha1 DATE, IN fecha2 DATE)
BEGIN
	IF (fecha1 < fecha2) THEN
		DELETE FROM diari WHERE data BETWEEN fecha1 AND fecha2;
	ELSE IF (fecha1 > fecha2) THEN
		DELETE FROM diari WHERE data BETWEEN fecha2 AND fecha1;
	ELSE IF (fecha1 IS NULL AND fecha2 IS NOT NULL) THEN
		DELETE FROM diari WHERE data < fecha2;
	ELSE IF (fecha2 IS NULL AND fecha1 IS NOT NULL) THEN
		DELETE FROM diari WHERE data > fecha1;
	END IF ;
	END IF ;
	END IF ;
    END IF ;
END //
DELIMITER ;

CALL elim(NULL, '2011/05/26');
SELECT * FROM diari;*/

#Exercici 26: Crea un procediment anomenat posposar que, donada una data, endarrereixi l'esdeveniment un mes. Exemple d'execució: CALL postposar('2011/04/25');
/*DELIMITER //
CREATE PROCEDURE postposar(IN data2 DATE)
BEGIN
    UPDATE diari SET data = CONCAT(YEAR(data),'-',(MONTH(data)+1),'-',DAY(data)) WHERE data = data2;
END //
DELIMITER ;

CALL postposar('2011/05/26');
SELECT * FROM diari;*/

#Exercici 27: Crea un procediment anomenat dietari que donada una data ens digui i una opció ens apareguin tots els esdeveniment de: - si l'opció és A els esdeveniments del mateix dia de la data.- si l'opció és B els esdeveniments de la setmana a que pertany la data.- si l'opció és C els esdeveniments del mes a que pertany la data.
DELIMITER //
CREATE PROCEDURE dietari(IN data2 DATE, IN letra CHAR)
BEGIN
    IF (letra = 'A') THEN
		SELECT event FROM diari WHERE data = data2;
    ELSE IF (letra = 'B') THEN
		SELECT event FROM diari WHERE YEARWEEK(data) = YEARWEEK(data2) AND YEAR(data) = YEAR(data2);
    ELSE IF (letra = 'C') THEN
		SELECT event FROM diari WHERE MONTH(data) = MONTH(data2);
	END IF;
    END IF;
    END IF;
END //
DELIMITER ;

CALL dietari('2023/04/17', 'C');

#Exercici 28: Crea un procediment anomenat inser_rep que faci insercions a la taula diari, de manera que inserirà un esdeveniment repetit cada cert temps. Els paràmetres que li donarem seran els següents: − Data d'inici de les insercions − Data final de les insercions− Hora de l'esdeveniment− Esdeveniment− Freqüència: D (diària), S (setmanal) i M (mensual) 
DELIMITER //
CREATE PROCEDURE inser_rep(IN data2 DATE, IN data3 DATE, IN hora2 TIME, IN event2 VARCHAR(20), IN letra CHAR)
BEGIN
	IF (letra = 'D') THEN
		WHILE(data2 < data3) DO
			INSERT INTO diari VALUES(NULL, data2, hora2, event2);
            SET data2 = DATE_ADD(data2 ,INTERVAL 1 DAY);
		END WHILE;
	ELSE IF (letra = 'S') THEN
		WHILE(data2 < data3) DO
			INSERT INTO diari VALUES(NULL, data2, hora2, event2);
            SET data2 = DATE_ADD(data2 ,INTERVAL 1 WEEK);
		END WHILE;
	ELSE IF (letra = 'M') THEN
		WHILE(data2 < data3) DO
			INSERT INTO diari VALUES(NULL, data2, hora2, event2);
            SET data2 = DATE_ADD(data2 ,INTERVAL 1 MONTH);
		END WHILE;
    END IF ;
    END IF ;
    END IF ;
END //
DELIMITER ;

CALL inser_rep('2023/04/17','2023/04/25','12:00','Cena','S');
SELECT * FROM diari;