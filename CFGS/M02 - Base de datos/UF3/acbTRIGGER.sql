DROP DATABASE IF EXISTS ACB;
CREATE DATABASE ACB;
USE ACB;

CREATE TABLE jornada
	(codi		INT(2)		PRIMARY KEY,
	data		DATE
	)ENGINE = InnoDB
	;

CREATE TABLE estadi
	(nom		CHAR(40)	PRIMARY KEY,
	aforament	INT
	)ENGINE = InnoDB
	;

CREATE TABLE equip
	(nom		CHAR(20)	PRIMARY KEY,
	data_creacio	DATE,
	pressupost	INT,
	estadi		CHAR(40)	NOT NULL,
	filial_de	CHAR(20)	REFERENCES equip,
	FOREIGN KEY (estadi) REFERENCES estadi(nom)
	)ENGINE = InnoDB
	;

CREATE TABLE posicio
	(nom_posicio	CHAR(7)		PRIMARY KEY
	)ENGINE = InnoDB
	;

CREATE TABLE membre_equip
	(nom		CHAR(20)	PRIMARY KEY,
	equip		CHAR(20)	NOT NULL,
	FOREIGN KEY (equip) REFERENCES equip(nom)
	)ENGINE = InnoDB
	;

CREATE TABLE jugador
	(nom		CHAR(20)	PRIMARY KEY,
	dorsal		INT(2)		CHECK (dorsal BETWEEN 4 AND 99),
	fitxa		INT,
	posicio		CHAR(7)		NOT NULL,
	FOREIGN KEY (nom) REFERENCES membre_equip(nom),
	FOREIGN KEY (posicio) REFERENCES posicio(nom_posicio)
	)ENGINE = InnoDB
	;

CREATE TABLE entrenador
	(nom		CHAR(20)	PRIMARY KEY,
	any_titol	INT(4),
	FOREIGN KEY (nom) REFERENCES membre_equip(nom)		
	)ENGINE = InnoDB
	;

CREATE TABLE directiu
	(nom		CHAR(20)	PRIMARY KEY,
	carrec		CHAR(20),
	FOREIGN KEY (nom) REFERENCES membre_equip(nom)		
	)ENGINE = InnoDB
	;

CREATE TABLE arbitre
	(nom			CHAR(20)	PRIMARY KEY,
	ciutat_naixement	CHAR(20),
	antiguitat		INT(4)
	)ENGINE = InnoDB
	;

CREATE TABLE partit
	(jornada		INT(2),
	equip_local		CHAR(20),
	equip_visitant		CHAR(20)	NOT NULL,
	hora			TIME,
	punts_local		INT(3),
	punts_visitant	INT(3),
	PRIMARY KEY(jornada,equip_local),
	FOREIGN KEY (jornada) REFERENCES jornada(codi),
	FOREIGN KEY (equip_local) REFERENCES equip(nom),
	FOREIGN KEY (equip_visitant) REFERENCES equip(nom)
	)ENGINE = InnoDB
	;

CREATE TABLE arbitra
	(jornada	INT(2)		REFERENCES partit,
	equip_local	CHAR(20)	REFERENCES partit,
	arbitre		CHAR(20)	REFERENCES arbitre,
	PRIMARY KEY(jornada,equip_local,arbitre),
	FOREIGN KEY (jornada) REFERENCES partit(jornada),
	FOREIGN KEY (equip_local) REFERENCES partit(equip_local),
	FOREIGN KEY (arbitre) REFERENCES arbitre(nom)
	)ENGINE = InnoDB
	;
    
CREATE TABLE classificacio (
	equip VARCHAR(20) PRIMARY KEY,
	partits_guanyats INT DEFAULT 0,
	partits_empatats INT DEFAULT 0,
	partits_perduts INT DEFAULT 0,
	gols_favor INT DEFAULT 0,
	gols_contra INT DEFAULT 0 ,
    pj	INT	DEFAULT 0,
    punts	INT	DEFAULT 0
    )ENGINE = InnoDB
    ;
DELIMITER //
CREATE TRIGGER exACB_insert AFTER INSERT ON partit FOR EACH ROW
BEGIN
	IF ((SELECT COUNT(*) FROM classificacio WHERE equip = NEW.equip_local)= 0) THEN
		INSERT INTO classificacio VALUES (NEW.equip_local,(0),(0),(0),(0),(0) );
	END IF;
    IF ((SELECT COUNT(*) FROM classificacio WHERE equip = NEW.equip_visitant)= 0) THEN
		INSERT INTO classificacio VALUES (NEW.equip_visitant,(0),(0),(0),(0),(0) );
	END IF;
    IF (NEW.punts_local > NEW.punts_visitant) THEN
		UPDATE classificacio SET partits_guanyats = partits_guanyats + 1, gols_favor = gols_favor + NEW.punts_local, gols_contra = gols_contra + NEW.punts_visitant WHERE equip = NEW.equip_local;
        UPDATE classificacio SET partits_perduts = partits_perduts + 1, gols_favor = gols_favor + NEW.punts_visitant, gols_contra = gols_contra + NEW.punts_local WHERE equip = NEW.equip_visitant;
    ELSE IF (NEW.punts_visitant > NEW.punts_local) THEN 
		UPDATE classificacio SET partits_guanyats = partits_guanyats + 1, gols_favor = gols_favor + NEW.punts_visitant, gols_contra = gols_contra + NEW.punts_local WHERE equip = NEW.equip_visitant;
        UPDATE classificacio SET partits_perduts = partits_perduts + 1, gols_favor = gols_favor + NEW.punts_local, gols_contra = gols_contra + NEW.punts_visitant WHERE equip = NEW.equip_local;
    ELSE 
		UPDATE classificacio SET partits_empatats = partits_empatats + 1, gols_favor = gols_favor + NEW.punts_local, gols_contra = gols_contra + NEW.punts_visitant WHERE equip = NEW.equip_local;
        UPDATE classificacio SET partits_empatats = partits_empatats + 1, gols_favor = gols_favor + NEW.punts_visitant, gols_contra = gols_contra + NEW.punts_local WHERE equip = NEW.equip_visitant;
    END IF;  
    END IF;
    UPDATE classificacio SET pj = (partits_guanyats + partits_empatats + partits_perduts) AND punts =(3*partits_guanyats+partits_empatats);

END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER exACB_delete AFTER DELETE ON partit FOR EACH ROW
BEGIN
	IF ((SELECT SUM(partits_guanyats + partits_empatats + partits_perduts) FROM classificacio WHERE equip = OLD.equip_local)= 0) THEN
		DELETE FROM classificacio WHERE equip = OLD.equip_local;
	END IF;
    IF ((SELECT SUM(partits_guanyats+ partits_empatats + partits_perduts) FROM classificacio WHERE equip = OLD.equip_visitant)= 0) THEN
		DELETE FROM classificacio WHERE equip = OLD.equip_visitant;
	END IF;
	IF (OLD.punts_local > OLD.punts_visitant) THEN
		UPDATE classificacio SET partits_guanyats = partits_guanyats - 1, gols_favor = gols_favor - OLD.punts_local, gols_contra = gols_contra - OLD.punts_visitant WHERE equip = OLD.equip_local;
        UPDATE classificacio SET partits_perduts = partits_perduts - 1, gols_favor = gols_favor - OLD.punts_visitant, gols_contra = gols_contra - OLD.punts_local WHERE equip = OLD.equip_visitant;
    ELSE IF (OLD.punts_visitant > OLD.punts_local) THEN 
		UPDATE classificacio SET partits_guanyats = partits_guanyats - 1, gols_favor = gols_favor - OLD.punts_visitant, gols_contra = gols_contra - OLD.punts_local WHERE equip = OLD.equip_visitant;
        UPDATE classificacio SET partits_perduts = partits_perduts - 1, gols_favor = gols_favor - OLD.punts_local, gols_contra = gols_contra - OLD.punts_visitant WHERE equip = OLD.equip_local;
    ELSE 
		UPDATE classificacio SET partits_empatats = partits_empatats - 1, gols_favor = gols_favor - OLD.punts_local, gols_contra = gols_contra - OLD.punts_visitant WHERE equip = OLD.equip_local;
        UPDATE classificacio SET partits_empatats = partits_empatats - 1, gols_favor = gols_favor - OLD.punts_visitant, gols_contra = gols_contra - OLD.punts_local WHERE equip = OLD.equip_visitant;
    END IF;  
    END IF;
	UPDATE classificacio SET pj = (partits_guanyats + partits_empatats + partits_perduts) AND punts =(3*partits_guanyats+partits_empatats);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER exACB_update AFTER UPDATE ON partit FOR EACH ROW
BEGIN
	DECLARE punts_favor_local INT;
    DECLARE punts_favor_visitant INT;
    DECLARE punts_contra_local INT;
    DECLARE punts_contra_visitant INT;
    
    SET punts_favor_local = (SELECT SUM(punts_local) FROM partit WHERE equip_local = NEW.equip_local) + 
							(SELECT SUM(punts_visitant) FROM partit WHERE equip_visitant = NEW.equip_local);
    SET punts_favor_visitant = (SELECT SUM(punts_local) FROM partit WHERE equip_local = NEW.equip_visitant) + 
							   (SELECT SUM(punts_visitant) FROM partit WHERE equip_visitant = NEW.equip_visitant);
    SET punts_contra_local = (SELECT SUM(punts_visitant) FROM partit WHERE equip_local = NEW.equip_local) + 
							 (SELECT SUM(punts_local) FROM partit WHERE equip_visitant = NEW.equip_local);
    SET punts_contra_visitant = (SELECT SUM(punts_visitant) FROM partit WHERE equip_local = NEW.equip_visitant) + 
								(SELECT SUM(punts_local) FROM partit WHERE equip_visitant = NEW.equip_visitant);
                                
    IF ((OLD.punts_local <> NEW.punts_local) OR (OLD.punts_visitant <> NEW.punts_visitant)) THEN
		UPDATE classificacio SET gols_favor = punts_favor_local WHERE equip = NEW.equip_local;
        UPDATE classificacio SET gols_favor = punts_favor_visitant WHERE equip = NEW.equip_visitant;
        UPDATE classificacio SET gols_contra = punts_contra_local WHERE equip = NEW.equip_local;
        UPDATE classificacio SET gols_contra = punts_contra_visitant WHERE equip = NEW.equip_visitant;
    END IF;
    UPDATE classificacio SET pj = (partits_guanyats + partits_empatats + partits_perduts) AND punts =(3*partits_guanyats+partits_empatats);
END //
DELIMITER ;

SELECT * FROM classificacio;

INSERT INTO jornada VALUES (1,'05/2/13');
INSERT INTO jornada VALUES (2,'05/2/20');
INSERT INTO jornada VALUES (3,'05/2/27');

INSERT INTO estadi VALUES ('Pavelló 11 de setembre',2500);
INSERT INTO estadi VALUES ('Pavelló Municipal de Girona',6500);
INSERT INTO estadi VALUES ('Pavelló Josep Tort',2000);

INSERT INTO equip VALUES ('Basquet Olot','73/9/11',10000,'Pavelló 11 de setembre',NULL);
INSERT INTO equip VALUES ('Girona BC','78/6/1',12000,'Pavelló Municipal de Girona',NULL);
INSERT INTO equip VALUES ('Anglès Club','82/6/19',18000,'Pavelló Josep Tort',NULL);
INSERT INTO equip VALUES ('Gironès BC','78/6/1',7000,'Pavelló Municipal de Girona','Girona BC');

INSERT INTO posicio VALUES ('base');
INSERT INTO posicio VALUES ('escorta');
INSERT INTO posicio VALUES ('aler');
INSERT INTO posicio VALUES ('pivot');

INSERT INTO membre_equip VALUES ('Miquel Brunet','Basquet Olot');
INSERT INTO membre_equip VALUES ('Blai Marquès','Basquet Olot');
INSERT INTO membre_equip VALUES ('Pol Ruiz','Basquet Olot');
INSERT INTO membre_equip VALUES ('Albert Vidal','Basquet Olot');
INSERT INTO membre_equip VALUES ('Marc Comas','Basquet Olot');
INSERT INTO membre_equip VALUES ('Josep Comes','Girona BC');
INSERT INTO membre_equip VALUES ('Pep Homet','Girona BC');
INSERT INTO membre_equip VALUES ('Joan Blanquer','Girona BC');
INSERT INTO membre_equip VALUES ('Joan Miquel Pi','Girona BC');
INSERT INTO membre_equip VALUES ('Ernest Rodríguez','Girona BC');
INSERT INTO membre_equip VALUES ('Marc Sanllehí','Anglès Club');
INSERT INTO membre_equip VALUES ('Miquel Domingo','Anglès Club');
INSERT INTO membre_equip VALUES ('Jaume Brossa','Anglès Club');
INSERT INTO membre_equip VALUES ('Ramon Freixes','Anglès Club');
INSERT INTO membre_equip VALUES ('Marc Freixes','Anglès Club');
INSERT INTO membre_equip VALUES ('Joan Brunet','Gironès BC');
INSERT INTO membre_equip VALUES ('Francesc Marsal','Gironès BC');
INSERT INTO membre_equip VALUES ('Marc Carnicé','Gironès BC');
INSERT INTO membre_equip VALUES ('Dídac Serrano','Gironès BC');

INSERT INTO jugador VALUES ('Pol Ruiz',5,124,'Pivot');
INSERT INTO jugador VALUES ('Albert Vidal',8,456,'Aler');
INSERT INTO jugador VALUES ('Marc Comas',10,765,'Base');
INSERT INTO jugador VALUES ('Joan Blanquer',7,678,'Aler');
INSERT INTO jugador VALUES ('Joan Miquel Pi',9,896,'Pivot');
INSERT INTO jugador VALUES ('Ernest Rodríguez',10,234,'Escorta');
INSERT INTO jugador VALUES ('Jaume Brossa',7,457,'Base');
INSERT INTO jugador VALUES ('Ramon Freixes',9,566,'Aler');
INSERT INTO jugador VALUES ('Marc Freixes',11,239,'Pivot');
INSERT INTO jugador VALUES ('Francesc Marsal',4,56,'Pivot');
INSERT INTO jugador VALUES ('Marc Carnicé',10,895,'Pivot');
INSERT INTO jugador VALUES ('Dídac Serrano',15,346,'Base');

INSERT INTO entrenador VALUES ('Blai Marquès',1987);
INSERT INTO entrenador VALUES ('Pep Homet',1999);
INSERT INTO entrenador VALUES ('Miquel Domingo',1979);
INSERT INTO entrenador VALUES ('Francesc Marsal',2001);

INSERT INTO directiu VALUES ('Miquel Brunet','President');
INSERT INTO directiu VALUES ('Josep Comes','President');
INSERT INTO directiu VALUES ('Pep Homet','Secretari');
INSERT INTO directiu VALUES ('Marc Sanllehí','President');
INSERT INTO directiu VALUES ('Joan Brunet','President');

INSERT INTO arbitre VALUES ('Pere Just','Girona',2001);
INSERT INTO arbitre VALUES ('Marc Vidal','Blanes',2002);
INSERT INTO arbitre VALUES ('Josep Camí','Olot',2002);
INSERT INTO arbitre VALUES ('Esteve Esteve','Girona',1998);
INSERT INTO arbitre VALUES ('Pere Pinyol','Girona',1998);

INSERT INTO partit VALUES (1,'Girona BC','Basquet Olot','12:00',69,70);
INSERT INTO partit VALUES (1,'Anglès Club','Gironès BC','11:30',82,55);
INSERT INTO partit VALUES (2,'Anglès Club','Girona BC','11:30',99,75);
INSERT INTO partit VALUES (2,'Basquet Olot','Gironès BC','17:00',87,76);
INSERT INTO partit VALUES (3,'Girona BC','Anglès Club','12:00',66,70);
INSERT INTO partit VALUES (3,'Gironès BC','Basquet Olot','10:00',80,83);
INSERT INTO partit VALUES (3,'Anglès Club','Basquet Olot','12:00',80,70);
INSERT INTO partit VALUES (3,'Basquet Olot','Anglès Club','12:00',0,0);

DELETE FROM partit WHERE equip_local = 'Basquet Olot' AND equip_visitant = 'Anglès Club';
DELETE FROM partit WHERE equip_local = 'Anglès Club' AND equip_visitant = 'Basquet Olot';
DELETE FROM partit WHERE equip_local = 'Anglès Club';
DELETE FROM partit WHERE equip_visitant = 'Anglès Club';
DELETE FROM partit;
UPDATE partit SET punts_local = 10 WHERE equip_local = 'Anglès Club' AND jornada = 1;
SELECT * FROM classificacio;
SELECT * FROM partit;

/*INSERT INTO arbitra VALUES (1,'Girona BC','Pere Just');
INSERT INTO arbitra VALUES (1,'Girona BC','Josep Camí');
INSERT INTO arbitra VALUES (1,'Anglès Club','Marc Vidal');
INSERT INTO arbitra VALUES (1,'Anglès Club','Esteve Esteve');
INSERT INTO arbitra VALUES (2,'Anglès Club','Pere Just');
INSERT INTO arbitra VALUES (2,'Anglès Club','Marc Vidal');
INSERT INTO arbitra VALUES (2,'Basquet Olot','Josep Camí');
INSERT INTO arbitra VALUES (2,'Basquet Olot','Pere Pinyol');
INSERT INTO arbitra VALUES (3,'Girona BC','Pere Just');
INSERT INTO arbitra VALUES (3,'Girona BC','Pere Pinyol');
INSERT INTO arbitra VALUES (3,'Gironès BC','Esteve Esteve');
INSERT INTO arbitra VALUES (3,'Gironès BC','Josep Camí');   */ 

/*DELIMITER //
CREATE TRIGGER exACB_insert AFTER INSERT ON partit FOR EACH ROW
BEGIN
	IF ((SELECT COUNT(*) FROM classificacio WHERE equip = NEW.equip_local OR equip = NEW.equip_visitant)= 0) THEN
		INSERT INTO classificacio VALUES (NEW.equip_local, (SELECT COUNT(*) FROM partit WHERE punts_local > punts_visitant), 
        (SELECT COUNT(*) FROM partit WHERE equip = NEW.equip_local AND punts_local = punts_visitant), 
        (SELECT COUNT(*) FROM partit WHERE equip = NEW.equip_local AND punts_local < punts_visitant), 
        (SELECT SUM(punts_local) FROM partit, classificacio WHERE equip = NEW.equip_local),
        (SELECT SUM(punts_visitant) FROM partit, classificacio WHERE equip = NEW.equip_local)
        );
	ELSE 
		UPDATE classificacio SET partits_guanyats = (SELECT COUNT(*) FROM partit WHERE equip = NEW.equip_local AND punts_local > punts_visitant) WHERE equip = NEW.equip_local;
        UPDATE classificacio SET partits_empatats = (SELECT COUNT(*) FROM partit WHERE equip = NEW.equip_local AND punts_local = punts_visitant) WHERE equip = NEW.equip_local;
        UPDATE classificacio SET partits_perduts = (SELECT COUNT(*) FROM partit WHERE equip = NEW.equip_local AND punts_local < punts_visitant) WHERE equip = NEW.equip_local;
        UPDATE classiwficacio SET gols_favor = (SELECT COUNT(punts_local) FROM partit WHERE equip = NEW.equip_local) WHERE equip = NEW.equip_local;
        UPDATE classificacio SET gols_contra = (SELECT COUNT(punts_visitant) FROM partit WHERE equip = NEW.equip_local) WHERE equip = NEW.equip_local;
	END IF;
END //
DELIMITER ;*/
 