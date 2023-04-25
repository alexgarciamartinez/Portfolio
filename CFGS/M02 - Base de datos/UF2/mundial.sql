/*Esta es una base de datos, que guarda los datos de las selecciones sobre que partidos jugaron, en que competicion se jugaron esos partidos, los estadios donde se disputaron y asi tambien como los jugadores
que componen la seleccion*/
DROP DATABASE IF EXISTS MUNDIAL;
CREATE DATABASE MUNDIAL;
USE MUNDIAL;
CREATE TABLE competicion (
codComp				TINYINT(2) PRIMARY KEY,
sede				VARCHAR(45) NOT NULL,
año					INT NOT NULL,
fechaInaguracion	DATE,
fechaClausura		DATE,
mascota				VARCHAR(45)
);

CREATE TABLE seleccion (
codSel					TINYINT(2) PRIMARY KEY,
presidente				VARCHAR(45),
pais					VARCHAR(45) NOT NULL,
primeraParticipacion	DATE,
entrenador				VARCHAR(45) NOT NULL,
titulos					VARCHAR(45),
codComp					TINYINT(2),
FOREIGN KEY (codComp) REFERENCES competicion (codComp)
);
CREATE TABLE posicion (
pos CHAR(20) PRIMARY KEY
);
CREATE TABLE jugador (
codJugador		TINYINT(2) PRIMARY KEY,
nombre			VARCHAR(45) NOT NULL,
apellidos		VARCHAR(45) NOT NULL,
años			INT(2) NOT NULL,
valorMercado	INT(8),
codSel			TINYINT(2),
pos CHAR(20),
FOREIGN KEY (codSel) REFERENCES seleccion (codSel),
FOREIGN KEY (pos) REFERENCES posicion (pos)
);

CREATE TABLE estadio (
codEst			TINYINT(2) PRIMARY KEY,
nombre			VARCHAR(45) NOT NULL,
propietario		VARCHAR(45) NOT NULL,
capacidad		INT,
localizacion	VARCHAR(45) NOT NULL,
coste			INT,
codComp			TINYINT(2),
FOREIGN KEY (codComp) REFERENCES competicion (codComp)
);

CREATE TABLE partido (
codPar	TINYINT(2) PRIMARY KEY,
codSelLocal TINYINT(2),
codSelVisitant TINYINT(2),
codEst TINYINT (2),
golLocal INT,
golVisitant INT,
fecha	DATE	NOT NULL,
FOREIGN KEY (codSelLocal) REFERENCES seleccion (codSel),
FOREIGN KEY (codSelVisitant) REFERENCES seleccion (codSel),
FOREIGN KEY (codEst) REFERENCES estadio (codEst)
);

/*CREATE TABLE diadepartido (
codPart	TINYINT(2),
codSel	TINYINT(2),
PRIMARY KEY (codPart, codSel),
FOREIGN KEY (codPart) REFERENCES partido (codPar),
FOREIGN KEY (codSel) REFERENCES seleccion (codSel)
);*/
CREATE TABLE clasificacion (
	seleccion VARCHAR(20) PRIMARY KEY,
	PG INT DEFAULT 0,
	PE INT DEFAULT 0,
	PP INT DEFAULT 0,
	GF INT DEFAULT 0,
	GC INT DEFAULT 0,
    PT INT DEFAULT 0
    )ENGINE = InnoDB
    ;
    
DELIMITER //
CREATE TRIGGER mundial_insert AFTER INSERT ON partido FOR EACH ROW
BEGIN
	/*DECLARE seleccion_local DOUBLE;
    DECLARE seleccion_visitant DOUBLE;
    SET seleccion_local = (SELECT pais FROM seleccion, partido WHERE codSel = NEW.codSelLocal);
    SET seleccion_visitant = (SELECT pais FROM seleccion, partido WHERE codSel = NEW.codSelVisitant);*/ #Estas variables me dan error, son para mostrar el nombre y no el numero
	IF ((SELECT COUNT(*) FROM clasificacion WHERE seleccion = NEW.codSelLocal)= 0) THEN
		INSERT INTO clasificacion VALUES (NEW.codSelLocal,(0),(0),(0),(0),(0),(0));
	END IF;
    IF ((SELECT COUNT(*) FROM clasificacion WHERE seleccion = NEW.codSelVisitant)= 0) THEN
		INSERT INTO clasificacion VALUES (NEW.codSelVisitant,(0),(0),(0),(0),(0),(0));
	END IF;
    IF (NEW.golLocal > NEW.golVisitant) THEN
		UPDATE clasificacion SET PG = PG + 1, GF = GF + NEW.golLocal, GC = GC + NEW.golVisitant WHERE seleccion = NEW.codSelLocal;
        UPDATE clasificacion SET PP = PP + 1, GF = GF + NEW.golVisitant, GC = GC + NEW.golLocal WHERE seleccion = NEW.codSelVisitant;
    ELSE IF (NEW.golVisitant > NEW.golLocal) THEN 
		UPDATE clasificacion SET PG = PG + 1, GF = GF + NEW.golVisitant, GC = GC + NEW.golLocal WHERE seleccion = NEW.codSelVisitant;
        UPDATE clasificacion SET PP = PP + 1, GF = GF + NEW.golLocal, GC = GC + NEW.golVisitant WHERE seleccion = NEW.codSelLocal;
    ELSE 
		UPDATE clasificacion SET PE = PE + 1, GF = GF + NEW.golLocal, GC = GC + NEW.golVisitant WHERE seleccion = NEW.codSelLocal;
        UPDATE clasificacion SET PE = PE + 1, GF = GF + NEW.golVisitant, GC = GC + NEW.golLocal WHERE seleccion = NEW.codSelVisitant;
    END IF;  
    END IF;
    UPDATE clasificacion SET PT = (3*PG+PE);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER mundial_delete AFTER DELETE ON partido FOR EACH ROW
BEGIN
	IF ((SELECT SUM(PG + PE + PP) FROM clasificacion WHERE equip = OLD.codSelLocal)= 0) THEN
		DELETE FROM clasificacion WHERE seleccion = OLD.codSelLocal;
	END IF;
    IF ((SELECT SUM(PG + PE + PP) FROM clasificacion WHERE equip = OLD.codSelVisitant)= 0) THEN
		DELETE FROM clasificacion WHERE seleccion = OLD.codSelVisitant;
	END IF;
    
	IF (OLD.golLocal > OLD.golVisitant) THEN
		UPDATE clasificacion SET PG = PG - 1, GF = GF - OLD.golLocal, GC = GC - OLD.golVisitant WHERE seleccion = OLD.codSelLocal;
        UPDATE clasificacion SET PP = PP - 1, GF = GF - OLD.golVisitant, GC = GC - OLD.golLocal WHERE seleccion = OLD.codSelVisitant;
    ELSE IF (OLD.golVisitant > OLD.golLocal) THEN 
		UPDATE clasificacion SET PG = PG - 1, GF = GF - OLD.golVisitant, GC = GC - OLD.golLocal WHERE seleccion = OLD.codSelVisitant;
        UPDATE clasificacion SET PP = PP - 1, GF = GF - OLD.golLocal, GC = GC - OLD.golVisitant WHERE seleccion = OLD.codSelLocal;
    ELSE 
		UPDATE clasificacion SET PE = PE - 1, GF = GF - OLD.golLocal, GC = GC - OLD.golVisitant WHERE seleccion = OLD.codSelLocal;
        UPDATE clasificacion SET PE = PE - 1, GF = GF - OLD.golVisitant, GC = GC - OLD.golLocal WHERE seleccion = OLD.codSelVisitant;
    END IF;  
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER mundial_update AFTER UPDATE ON partido FOR EACH ROW
BEGIN
	DECLARE punts_favor_local INT;
    DECLARE punts_favor_visitant INT;
    DECLARE punts_contra_local INT;
    DECLARE punts_contra_visitant INT;
    
    SET punts_favor_local = (SELECT SUM(golLocal) FROM partido WHERE codSelLocal = NEW.codSelLocal) + 
							(SELECT SUM(golVisitant) FROM partido WHERE codSelVisitant = NEW.codSelLocal);
    SET punts_favor_visitant = (SELECT SUM(golLocal) FROM partido WHERE codSelLocal = NEW.codSelVisitant) + 
							   (SELECT SUM(golVisitant) FROM partido WHERE codSelVisitant = NEW.codSelVisitant);
    SET punts_contra_local = (SELECT SUM(golVisitant) FROM partido WHERE codSelLocal = NEW.codSelLocal) + 
							 (SELECT SUM(golLocal) FROM partido WHERE codSelVisitant = NEW.codSelLocal);
    SET punts_contra_visitant = (SELECT SUM(golVisitant) FROM partido WHERE codSelLocal = NEW.codSelVisitant) + 
								(SELECT SUM(golLocal) FROM partido WHERE codSelVisitant = NEW.codSelVisitant);
                                
    IF ((OLD.golLocal <> NEW.golLocal) OR (OLD.golVisitant <> NEW.golVisitant)) THEN
		UPDATE clasificacion SET GF = punts_favor_local WHERE seleccion = NEW.codSelLocal;
        UPDATE clasificacion SET GF = punts_favor_visitant WHERE seleccion = NEW.codSelVisitant;
        UPDATE clasificacion SET GC = punts_contra_local WHERE seleccion = NEW.codSelLocal;
        UPDATE clasificacion SET GC = punts_contra_visitant WHERE seleccion = NEW.codSelVisitant;
    END IF;
END //
DELIMITER ;

ALTER TABLE seleccion DROP presidente;
INSERT INTO seleccion (codSel, pais, entrenador) VALUES (01, 'España', 'Luis Enrique');
INSERT INTO seleccion (codSel, pais, entrenador) VALUES (02, 'Argentina', 'Scaloni');
INSERT INTO seleccion (codSel, pais, entrenador) VALUES (03, 'Alemania', 'Flick');
INSERT INTO seleccion (codSel, pais, entrenador) VALUES (04, 'Francia', 'Deschamps');
INSERT INTO seleccion (codSel, pais, entrenador) VALUES (05, 'Brasil', 'Tite');
ALTER TABLE seleccion DROP FOREIGN KEY seleccion_ibfk_1 ;

UPDATE seleccion SET codComp = 01 WHERE codSel = 01;
UPDATE seleccion SET codComp = 01 WHERE codSel = 02;
UPDATE seleccion SET codComp = 01 WHERE codSel = 03;
UPDATE seleccion SET codComp = 01 WHERE codSel = 04;
UPDATE seleccion SET codComp = 01 WHERE codSel = 05;

INSERT INTO posicion (pos) VALUES ('delantero');
INSERT INTO posicion (pos) VALUES ('centrocampista');
INSERT INTO posicion (pos) VALUES ('defensa');
INSERT INTO posicion (pos) VALUES ('portero');

ALTER TABLE jugador DROP valorMercado;
#ALTER TABLE jugador MODIFY codJugador INT AUTO_INCREMENT;
#ALTER TABLE jugador MODIFY codJugador INT;
INSERT INTO jugador (codJugador,nombre, apellidos, años, codSel, pos) VALUES (01, 'Pedri', 'Gonzalez', 19, 01, 'centrocampista');
INSERT INTO jugador (codJugador,nombre, apellidos, años, codSel, pos) VALUES (02, 'Leo', 'Messi', 35, 02, 'delantero');
INSERT INTO jugador (codJugador,nombre, apellidos, años, codSel, pos) VALUES (03, 'Jamal', 'Musiala', 20, 03, 'centrocampista');
INSERT INTO jugador (codJugador,nombre, apellidos, años, codSel, pos) VALUES (04, 'Kylian', 'Mbappe', 24, 04, 'delantero');
INSERT INTO jugador (codJugador,nombre, apellidos, años, codSel, pos) VALUES (05, 'Raphinha', 'Belolli', 25, 05, 'delantero');
INSERT INTO jugador (codJugador,nombre, apellidos, años, codSel, pos) VALUES (06, 'Pablo', 'Gavi', 18, 01, 'centrocampista');
INSERT INTO jugador (codJugador,nombre, apellidos, años, codSel, pos) VALUES (07, 'Antonio', 'Rüdiger', 28, 03, 'defensa');
INSERT INTO jugador (codJugador,nombre, apellidos, años, codSel, pos) VALUES (08, 'Jules', 'Koundé', 23, 04, 'defensa');
INSERT INTO jugador (codJugador,nombre, apellidos, años, codSel, pos) VALUES (09, 'Aymerich', 'Laporte', 27, 01, 'defensa');

#ALTER TABLE competicion MODIFY codComp INT AUTO_INCREMENT;
INSERT INTO competicion (codComp, sede, año, fechaInaguracion, fechaClausura) VALUES (01, 'Qatar', 2022, '2022/11/20', '2022/12/18');
INSERT INTO competicion (codComp,sede, año, fechaInaguracion, fechaClausura) VALUES (02, 'Rusia', 2018, '2018/06/20', '2018/05/18');
INSERT INTO competicion (codComp,sede, año, fechaInaguracion, fechaClausura) VALUES (03, 'Brasil', 2014, '2014/06/20', '2014/05/18');
INSERT INTO competicion (codComp,sede, año, fechaInaguracion, fechaClausura) VALUES (04, 'Sudafrica', 2010, '2010/06/20', '2010/07/11');
INSERT INTO competicion (codComp,sede, año, fechaInaguracion, fechaClausura) VALUES (05, 'Alemania', 2006, '2006/06/20', '2006/07/18');

#ALTER TABLE estadio MODIFY codEst INT AUTO_INCREMENT;
ALTER TABLE estadio DROP localizacion;
INSERT INTO estadio (codEst, nombre, propietario, capacidad, codComp) VALUES (01, 'Estadio Al Bayt', 'Al Khor', 60000, 01);
INSERT INTO estadio (codEst,nombre, propietario, capacidad, codComp) VALUES (02, 'Estadio Al Janoub', 'Al Wakra', 40000, 01);
INSERT INTO estadio (codEst,nombre, propietario, capacidad, codComp) VALUES (03, 'Estadio 974', 'Cap', 40000, 01);
INSERT INTO estadio (codEst,nombre, propietario, capacidad, codComp) VALUES (04, 'Estadio Internacional Khalifa', 'Seleccion de Qatar', 45416, 01);
INSERT INTO estadio (codEst,nombre, propietario, capacidad, codComp) VALUES (05, 'Estadio de Lusail', 'Asociacion de Qatar', 80000, 01);
INSERT INTO estadio (codEst,nombre, propietario, capacidad, codComp) VALUES (06, 'Ekaterimburgo Arena', 'Rusia', 35000, 02);
INSERT INTO estadio (codEst,nombre, propietario, capacidad, codComp) VALUES (07, 'Rostov Arena', 'Rusia', 45000, 02);
INSERT INTO estadio (codEst,nombre, propietario, capacidad, codComp) VALUES (08, 'Maracana', 'Brasil', 78000, 03);
INSERT INTO estadio (codEst,nombre, propietario, capacidad, codComp) VALUES (09, 'Sao Paulo', 'Brasil', 66800, 03);


#ALTER TABLE partido MODIFY codPar INT auto_increment;
INSERT INTO partido (codPar, codSelLocal, codSelVisitant, codEst, golLocal, golVisitant, fecha) VALUES (01, 01, 02, 01,3,0, '2022/11/20');
INSERT INTO partido (codPar, codSelLocal, codSelVisitant, codEst, golLocal, golVisitant,fecha) VALUES (02, 03, 04, 02,2,3, '2022/11/21');
INSERT INTO partido (codPar, codSelLocal, codSelVisitant, codEst, golLocal, golVisitant,fecha) VALUES (03, 02, 03, 03,1,0, '2022/11/22');
INSERT INTO partido (codPar, codSelLocal, codSelVisitant, codEst, golLocal, golVisitant,fecha) VALUES (04, 03, 01, 01,1,2, '2022/11/23');
INSERT INTO partido (codPar, codSelLocal, codSelVisitant, codEst, golLocal, golVisitant,fecha) VALUES (05, 02, 04, 05,0,2, '2022/11/24');
INSERT INTO partido (codPar, codSelLocal, codSelVisitant, codEst, golLocal, golVisitant,fecha) VALUES (06, 01, 03, 06,2,2, '2018/06/23');
INSERT INTO partido (codPar, codSelLocal, codSelVisitant, codEst, golLocal, golVisitant,fecha) VALUES (07, 04, 02, 06,1,3, '2018/06/24');
INSERT INTO partido (codPar, codSelLocal, codSelVisitant, codEst, golLocal, golVisitant,fecha) VALUES (08, 02, 01, 07,2,4, '2018/06/24');
INSERT INTO partido (codPar, codSelLocal, codSelVisitant, codEst, golLocal, golVisitant,fecha) VALUES (09, 04, 03, 08,5,1, '2014/06/24');
INSERT INTO partido (codPar, codSelLocal, codSelVisitant, codEst, golLocal, golVisitant,fecha) VALUES (10, 03, 01, 09,1,0, '2014/06/24');

SELECT * FROM clasificacion; 

DELETE FROM partido WHERE codSelLocal = 01 AND codSelVisitant = 02;

/*ALTER TABLE diadepartido DROP FOREIGN KEY diadepartido_ibfk_2 ;
#UPDATE diadepartido SET codPar = 01 WHERE diadepartido = 01;
ALTER TABLE estadio DROP FOREIGN KEY estadio_ibfk_1 ;
INSERT INTO diadepartido (codPart, codSel) VALUES (03, 01);
INSERT INTO diadepartido (codPart, codSel) VALUES (01, 02);
INSERT INTO diadepartido (codPart, codSel) VALUES (01, 03);
INSERT INTO diadepartido (codPart, codSel) VALUES (02, 04);
INSERT INTO diadepartido (codPart, codSel) VALUES (01, 05);
#ALTER TABLE diadepartido ADD FOREIGN KEY (codEst) REFERENCES estadio(codEst);*/

#Mostra les seleccions que han jugat a l'estadi Estadio Al Bayt V
SELECT s.pais FROM seleccion s, partido p WHERE s.codSel = p.codSelLocal AND codEst = 01;
#Mostra els equips que han guanyat més com a visitant V
SELECT s.pais, COUNT(*) FROM seleccion s, partido p WHERE s.codSel = p.codSelVisitant AND p.golVisitant > p.golLocal GROUP BY p.codSelVisitant HAVING COUNT(*) = (SELECT COUNT(*) FROM partido p WHERE p.golVisitant > p.golLocal GROUP BY p.codSelVisitant ORDER BY COUNT(*) DESC LIMIT 1);
#Mostra l'estadi amb el partit amb més gols V
SELECT SUM(p.golLocal) + SUM(p.golVisitant), e.nombre FROM partido p, estadio e, competicion c WHERE p.codEst = e.codEst AND e.codComp = c.codComp GROUP BY p.codPar ORDER BY SUM(p.golLocal) + SUM(p.golVisitant) DESC LIMIT 1;
#Mostra la competició amb més gols V
SELECT SUM(p.golLocal) + SUM(p.golVisitant), c.sede FROM partido p, estadio e, competicion c WHERE p.codEst = e.codEst AND e.codComp = c.codComp GROUP BY e.codComp ORDER BY SUM(p.golLocal) + SUM(p.golVisitant) DESC LIMIT 1;
#Mostra els delanters que la seva seleccio hagi guanyat menys partits com a local V
SELECT j.nombre FROM jugador j, seleccion s, partido p WHERE j.codSel = s.codSel AND s.codSel = p.codSelLocal AND p.golLocal > p.golVisitant AND j.pos = 'delantero' GROUP BY p.codSelLocal HAVING COUNT(*) = (SELECT COUNT(*) FROM partido p WHERE p.golLocal > p.golVisitant GROUP BY p.codSelLocal ORDER BY COUNT(*) ASC LIMIT 1);
#Mostra la seleccio amb la mitjana més alta d'edat
SELECT s.pais, AVG(j.años) FROM jugador j, seleccion s WHERE j.codSel = s.codSel GROUP BY s.codSel ORDER BY AVG(j.años) DESC LIMIT 1;
#Mostra la seleccio amb més migcampistes V
SELECT s.pais, COUNT(j.nombre) FROM seleccion s, jugador j WHERE j.codSel = s.codSel AND j.pos = 'centrocampista' GROUP BY s.codSel ORDER BY COUNT(*) DESC LIMIT 1;
#Mostra la competició que més capacitat de espectadors V
SELECT c.sede, e.capacidad FROM estadio e, competicion c WHERE e.codComp = c.codComp ORDER BY e.capacidad DESC LIMIT 1;
#Mostra la diferencia minima de gols i les seves respectives seleccions V
SELECT p.codSelLocal, p.golLocal, p.golVisitant, p.codSelVisitant FROM partido p ORDER BY (p.golLocal - p.golVisitant) ASC LIMIT 1; 
#Mostra tots els estadis visitats per la seleccio argentina V
SELECT e.nombre FROM estadio e, partido p, seleccion s WHERE s.codSel = p.codSelLocal AND p.codEst = e.codEst AND p.codSelLocal = '02' GROUP BY e.codEst UNION SELECT e.nombre FROM estadio e, partido p, seleccion s WHERE s.codSel = p.codSelVisitant AND p.codEst = e.codEst AND p.codSelVisitant = '02' GROUP BY e.codEst;









