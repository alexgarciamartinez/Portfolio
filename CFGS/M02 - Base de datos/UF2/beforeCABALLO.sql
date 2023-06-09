DROP DATABASE IF EXISTS beforeCABALLO;
CREATE DATABASE beforeCABALLO;
USE beforeCABALLO;

CREATE TABLE CARRERAS
	(COD_CARRERA		VARCHAR(4)		PRIMARY KEY,
	FECHA_Y_HORA		DATETIME,
    NOMBRE				VARCHAR(20),
    IMPORTE_PREMIO		NUMERIC(6),
    APUESTA_LIMITE		NUMERIC(7,2)
	)ENGINE = InnoDB
	;
    
CREATE TABLE PARTICIPACIONES
	(COD_CABALLO		VARCHAR(4)		PRIMARY KEY,
	COD_CARRERA			VARCHAR(4),
    DORSAL				NUMERIC(2),
    JOCKEY				VARCHAR(10),
    POSICION_FINAL		NUMERIC(2),
    FOREIGN KEY (COD_CARRERA) REFERENCES CARRERAS(COD_CARRERA)
	)ENGINE = InnoDB
	;    

CREATE TABLE APUESTAS
	(DNI_CLIENTE		VARCHAR(10)		PRIMARY KEY,
	COD_CABALLO			VARCHAR(4),
    COD_CARRERA			VARCHAR(4),
    IMPORTE				NUMERIC(6),
    TANTOPORUNO			NUMERIC(6,2),
    FOREIGN KEY (COD_CARRERA) REFERENCES CARRERAS(COD_CARRERA),
    FOREIGN KEY (COD_CABALLO) REFERENCES PARTICIPACIONES(COD_CABALLO)
	)ENGINE = InnoDB
	;    
    
DELIMITER //
	CREATE TRIGGER CARRERAS_INSERT BEFORE INSERT ON APUESTAS FOR EACH ROW
	BEGIN 
		IF (NEW.COD_CABALLO NOT IN (SELECT COD_CABALLO FROM PARTICIPACIONES WHERE COD_CARRERA = NEW.COD_CARRERA) OR (NEW.IMPORTE > (SELECT APUESTA_LIMITE FROM CARRERAS WHERE COD_CARRERA = NEW.COD_CARRERA))) THEN
				CALL RAISE_ERROR_APPLICATION("...");
		END IF;
	END // 
DELIMITER ; 

DELIMITER //
	CREATE TRIGGER PREMIO_ACTUALIZADO AFTER INSERT ON APUESTAS FOR EACH ROW
	BEGIN 
		IF (NEW.COD_CARRERA = (SELECT COD_CARRERA FROM CARRERAS WHERE COD_CARRERA = NEW.COD_CARRERA)) THEN
				UPDATE CARRERAS SET IMPORTE_PREMIO = IMPORTE_PREMIO + NEW.IMPORTE WHERE COD_CARRERA = NEW.COD_CARRERA;
		END IF;
	END // 
DELIMITER ; 

DELIMITER //
	CREATE TRIGGER IMPEDIR_JOCKEY BEFORE INSERT ON PARTICIPACIONES FOR EACH ROW
	BEGIN 
		IF (NEW.JOCKEY IN (SELECT p.JOCKEY FROM PARTICIPACIONES p, CARRERAS c 
			WHERE p.COD_CARRERA = c.COD_CARRERA)) AND
           (DATE(NEW.FECHA_Y_HORA)=DATE(FECHA_Y_HORA)) AND 
           (TIME(FECHA_Y_HORA) >= ADDTIME(TIME(NEW.FECHA_Y_HORA),'02:00:00')) AND
           (TIME(FECHA_Y_HORA)<= ADDTIME(TIME(NEW.FECHA_Y_HORA)))THEN
				CALL RAISE_ERROR_APPLICATION("...");
		END IF;
	END // 
DELIMITER ; 

INSERT INTO CARRERAS (COD_CARRERA, FECHA_Y_HORA, NOMBRE, IMPORTE_PREMIO, APUESTA_LIMITE) VALUES (01, "2023-03-15 09:00:00", "CIRCUITO 1", 100000, 1000.00);
INSERT INTO PARTICIPACIONES (COD_CABALLO, COD_CARRERA, DORSAL, JOCKEY, POSICION_FINAL) VALUES (01, 01, 10, "PEPITO", 01);
INSERT INTO PARTICIPACIONES (COD_CABALLO, COD_CARRERA, DORSAL, JOCKEY, POSICION_FINAL) VALUES (02, 01, 10, "PEPITO", 01);
INSERT INTO APUESTAS (DNI_CLIENTE, COD_CABALLO, COD_CARRERA, IMPORTE, TANTOPORUNO) VALUES ("994509628R", 01, 01, 500.0, 10.0);
INSERT INTO APUESTAS (DNI_CLIENTE, COD_CABALLO, COD_CARRERA, IMPORTE, TANTOPORUNO) VALUES ("994609628R", 02, 01, 800.0, 10.0);

INSERT INTO CARRERAS (COD_CARRERA, FECHA_Y_HORA, NOMBRE, IMPORTE_PREMIO, APUESTA_LIMITE) VALUES (02, "2023-03-15 10:00:00", "CIRCUITO 2", 1000, 1000.00);
INSERT INTO PARTICIPACIONES (COD_CABALLO, COD_CARRERA, DORSAL, JOCKEY, POSICION_FINAL) VALUES (03, 02, 03, "PEPITO", 01);
INSERT INTO PARTICIPACIONES (COD_CABALLO, COD_CARRERA, DORSAL, JOCKEY, POSICION_FINAL) VALUES (04, 02, 01, "PEPITO", 01);
INSERT INTO APUESTAS (DNI_CLIENTE, COD_CABALLO, COD_CARRERA, IMPORTE, TANTOPORUNO) VALUES ("300000000R", 03, 02, 500.0, 10.0);
INSERT INTO APUESTAS (DNI_CLIENTE, COD_CABALLO, COD_CARRERA, IMPORTE, TANTOPORUNO) VALUES ("400000000R", 04, 02, 800.0, 10.0);

INSERT INTO APUESTAS (DNI_CLIENTE, COD_CABALLO, COD_CARRERA, IMPORTE, TANTOPORUNO) VALUES ("994509628R", 01, 01, 500.0, 10.0);
INSERT INTO APUESTAS (DNI_CLIENTE, COD_CABALLO, COD_CARRERA, IMPORTE, TANTOPORUNO) VALUES ("994609628R", 02, 01, 800.0, 10.0);
INSERT INTO APUESTAS (DNI_CLIENTE, COD_CABALLO, COD_CARRERA, IMPORTE, TANTOPORUNO) VALUES ("100000000L", 02, 02, 500.0, 10.0);
INSERT INTO APUESTAS (DNI_CLIENTE, COD_CABALLO, COD_CARRERA, IMPORTE, TANTOPORUNO) VALUES ("200000000L", 01, 01, 2000.0, 10.0);

SELECT * FROM CARRERAS;


SELECT * FROM CARRERAS;
SELECT * FROM PARTICIPACIONES;

/*DELIMITER //
	CREATE TRIGGER CARRERAS_INSERT BEFORE INSERT ON APUESTAS FOR EACH ROW
	BEGIN 
		IF ((SELECT c.COD_CARRERA FROM PARTICIPACIONES p, CARRERAS c) <> NEW.COD_CARRERA) THEN 
			CALL RAISE_ERROR_APPLICATION("...");
		END IF;
        IF (SELECT NEW.a.IMPORTE FROM APUESTAS a, CARRERAS c WHERE NEW.a.COD_CARRERA = c.COD_CARRERA AND NEW.a.IMPORTE > c.APUESTA_LIMITE) THEN
			CALL RAISE_ERROR_APPLICATION("...");
        END IF;
	END // 
DELIMITER ; */