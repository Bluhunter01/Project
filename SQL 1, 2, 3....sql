


/*1*/ 

DELIMITER >
CREATE PROCEDURE novoAlun (
	mat_aluno INTEGER,
    cod_curso INTEGER,
    dat_nasc DATE, 
    tot_cred INTEGER,
    mgp DOUBLE,
    nom_alun VARCHAR (60), 
    email VARCHAR (30))
    
DETERMINISTIC
    
BEGIN
    
    INSERT INTO Aluno
    VALUES (mat_aluno, cod_curso, dat_nasc, tot_cred, mgp, nom_alun, email);
    
    SELECT nom_alun
    AS Nome
    FROM Aluno
    ORDER BY mat_aluno
    DESC LIMIT 1;
    
END
>

CALL novoAlun('', 5, '2001-01-31', 100, 6.0, 'Marconis Julionis', 'marcaojuli@gmail.com');
SELECT * FROM Aluno;


/*2*/

DELIMITER *
CREATE PROCEDURE c_while(limite TINYINT UNSIGNED)
  
BEGIN
	DECLARE contador INTEGER;
	DECLARE resultado VARCHAR(50);
	SET contador = 1;
	SET resultado = '';
	WHILE contador <=5
      DO
	  SET resultado = CONCAT(resultado, contador,',');
	  SET contador = contador + 1;
	END WHILE;
	SELECT resultado;
END
*
  
CALL c_while(1);


/*3*/


DELIMITER ~
CREATE PROCEDURE c_repetir(limitar TINYINT UNSIGNED)
BEGIN
	DECLARE resultado VARCHAR(50);
    DECLARE contador INTEGER;
    SET contador = 1;
    SET resultado = '';
    REPEAT 
	SET resultado = CONCAT(resultado, contador, ', ');
    SET contador = contador + 1;
    UNTIL contador = 10
    END REPEAT;
    SELECT resultado;
END
~
CALL c_repetir(1);

