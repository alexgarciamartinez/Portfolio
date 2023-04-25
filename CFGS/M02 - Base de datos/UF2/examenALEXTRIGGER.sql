DROP DATABASE IF EXISTS examenALEXGARCIA;
CREATE DATABASE examenALEXGARCIA;
USE examenALEXGARCIA;

CREATE TABLE Alumne(
CodiAlum INT PRIMARY KEY,
Nom VARCHAR(30)
);
CREATE TABLE Assignatura(
CodiAssig VARCHAR(3) PRIMARY KEY,
Nom VARCHAR(20)
);
CREATE TABLE Examen(
CodiExam INT PRIMARY KEY,
CodiAssig VARCHAR(3),
CodiAlum INT,
Nota INT,
FOREIGN KEY (CodiAlum) REFERENCES Alumne (CodiAlum),
FOREIGN KEY (CodiAssig) REFERENCES Assignatura (CodiAssig)
);
CREATE TABLE Expedient(
CodiAssig VARCHAR(3),
CodiAlum INT,
Convocatories INT,
PRIMARY KEY (CodiAssig, CodiAlum),
FOREIGN KEY (CodiAlum) REFERENCES Alumne (CodiAlum),
FOREIGN KEY (CodiAssig) REFERENCES Assignatura (CodiAssig)
);

DELIMITER //
	CREATE TRIGGER exercici1 BEFORE INSERT ON Examen FOR EACH ROW
	BEGIN 
		DECLARE numconv INT;
        SET numconv = (SELECT COUNT(*) FROM Examen WHERE CodiAssig = NEW.CodiAssig AND CodiAlum = NEW.CodiAlum);
		IF ((SELECT COUNT(*) FROM Examen WHERE CodiAlum = NEW.CodiAlum AND CodiAssig = NEW.CodiAssig) >= 4) OR ((SELECT COUNT(*) FROM Expedient WHERE CodiAlum = NEW.CodiAlum AND CodiAssig = NEW.CodiAssig) <> 0)THEN
            CALL RAISE_ERROR_APPLICATION("...");
        END IF; 
	END // 
DELIMITER ; 

DELIMITER //
	CREATE TRIGGER exercici2 AFTER INSERT ON Examen FOR EACH ROW
	BEGIN 
    	DECLARE numconv INT;
        SET numconv = (SELECT COUNT(*) FROM Examen WHERE CodiAssig = NEW.CodiAssig AND CodiAlum = NEW.CodiAlum);

		IF ((SELECT Nota FROM Examen WHERE CodiAlum = NEW.CodiAlum AND CodiAssig = NEW.CodiAssig AND CodiExam = NEW.CodiExam) >= 5)THEN
			IF ((SELECT COUNT(*) FROM Expedient WHERE CodiAlum = NEW.CodiAlum AND CodiAssig = NEW.CodiAssig)= 0)THEN
				INSERT INTO Expedient VALUES (NEW.CodiAssig, NEW.CodiAlum, numconv);
			END IF;
            /*ELSE
				UPDATE Expedient SET CodiAssig = NEW.CodiAssig, CodiAlum = NEW.CodiAlum, Convocatories = numconv;*/
        END IF;
	END // 
DELIMITER ;

DELIMITER //
	CREATE TRIGGER exercici2_1 AFTER DELETE ON Examen FOR EACH ROW
	BEGIN 
        DELETE FROM Expedient WHERE CodiAlum = OLD.CodiAlum AND CodiAssig = OLD.CodiAssig; 
	END // 
DELIMITER ;

#Instruccions del disparador de l'exericici 1 (BEFORE)
INSERT INTO Alumne VALUES (02, 'Oriol'); #Afegim a l'alumne Oriol
INSERT INTO Assignatura VALUES (01, 'SistemesInformatics'); #Afegim una assignatura
INSERT INTO Examen VALUES (05, 01, 02, 5); #L'alumne Oriol aprova el primer examen
INSERT INTO Examen VALUES (06, 01, 02, 2); #Al fer un segon examen de la mateixa assignatura, sigui qualsigui la nota, salta l'error del RAISE_ERROR_APPLICATION
INSERT INTO Assignatura VALUES (02, 'BBDD'); #Afegirem un altre assignatura
INSERT INTO Examen VALUES (07, 02, 02, 2); #Suspen el primer examen de l'assignatura 02
INSERT INTO Examen VALUES (08, 02, 02, 2); #Suspen el segon examen de l'assignatura 02
INSERT INTO Examen VALUES (09, 02, 02, 2); #Suspen el tercer examen de l'assignatura 02
INSERT INTO Examen VALUES (10, 02, 02, 2); #Suspen el quart examen de l'assignatura 02
INSERT INTO Examen VALUES (11, 02, 02, 2); #Suspen el 5e examen de l'assignatura 02 i per tant ja te totes les convocatories i salta l'error RAISE_ERROR_APPLICATION

#Instruccions del disparador de l'exercici 2 (INSERT)
INSERT INTO Alumne VALUES (01, 'Alex'); #Afegim a l'alumne Alex
INSERT INTO Assignatura VALUES (03, 'Programacio'); #Afegim una assignatura
INSERT INTO Examen VALUES (01, 02, 01, 4); #L'alumne suspèn el primer examen, i per tant, no és afegit a l'expedient
SELECT * FROM Expedient;
INSERT INTO Examen VALUES (02, 02, 01, 5); #L'alumne aprova el segon examen i s'afegeix a expedient
SELECT * FROM Expedient;
INSERT INTO Examen VALUES (03, 02, 01, 7); #L'alumne aprova amb més nota el tercer examen, pero com ja està aprovat, no s'actualitza i salta l'error del primer trigger

#Instruccions del disparador de l'exercici 2 (DELETE)
DELETE FROM Examen WHERE CodiAlum = 01 AND CodiExam = 02; #Esborrem l'examen anterior
SELECT * FROM Expedient; #Podem veure que l'alumne Alex (01) ja no és a l'expedient de la seva assignatura eliminada
