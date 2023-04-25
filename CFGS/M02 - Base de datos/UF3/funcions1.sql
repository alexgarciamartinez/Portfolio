DROP DATABASE IF EXISTS funcions;

CREATE DATABASE funcions;

USE funcions;
SET GLOBAL log_bin_trust_function_creators=1;
DELIMITER //
CREATE FUNCTION apte (qualificacio INT) RETURNS VARCHAR(20)
BEGIN
    IF (qualificacio < 5) THEN
        RETURN 'no apte';
    ELSEIF (qualificacio >= 5) THEN
        RETURN 'apte';
    END IF;
END //
DELIMITER ;

SELECT apte(5);

DELIMITER //
CREATE FUNCTION torn (hora TIME) RETURNS VARCHAR(5)
BEGIN
    IF (hora >= '08:00' AND hora <= '15:00') THEN
        RETURN 'mati';
    ELSEIF (hora >= '15:00' AND hora <= '22:00') THEN
        RETURN 'tarda';
    ELSE
        RETURN '-';
    END IF;
END //
DELIMITER ;

SELECT torn('10:00');

DELIMITER //
CREATE FUNCTION alumne (nom VARCHAR(20), cognom VARCHAR(20)) RETURNS VARCHAR(20)
BEGIN
    RETURN CONCAT(nom,' ',cognom);
END //
DELIMITER ;

SELECT alumne('Pere','Plaza');

#Crea una funció anomenada matricula de manera que retorni el valor de la matrícula en euros si nosaltres li donem en dòlars. 
DELIMITER //
CREATE FUNCTION matricula(dolars DOUBLE) RETURNS DOUBLE
BEGIN
    RETURN dolars / 1.10;
END //
DELIMITER ;

SELECT matricula(100.23);

#Crea una funció anomenada absolut de manera que sumi dos valors en valor absolut. 
DELIMITER //
CREATE FUNCTION absolut(n1 INT, n2 INT) RETURNS INT
BEGIN
    RETURN ABS(n1 + n2);
END //
DELIMITER ;

SELECT absolut(100,-150);

#Crea una funció anomenada iva de manera que calculi el preu amb IVA de la matrícula si nosaltres li donem sense IVA. 
DELIMITER //
CREATE FUNCTION iva(n1 DOUBLE) RETURNS DOUBLE
BEGIN
    RETURN n1*1.21;
END //
DELIMITER ;

SELECT iva(100.23);

#Crea una funció anomenada edat de manera que calculi l'edat d'un individu. La data de naixement la donarem en 3 paràmetres: dia, mes i any. 
DELIMITER //
CREATE FUNCTION edat(dia INT, mes INT, any INT) RETURNS INT
BEGIN
    RETURN ((DATE(DAY(dia), MONTH(mes), YEAR(any))) - (DATE(NOW)));
END //
DELIMITER ;

SELECT edat(06, 11, 2004);