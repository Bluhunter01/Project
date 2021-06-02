
/*4*/



DELIMITER ++
CREATE TRIGGER tri_vendas_ai
AFTER INSERT ON comivenda
FOR EACH ROW
BEGIN
    ## declaro as variáveis que utilizarei
    declare vtotal_itens float(10,2) DEFAULT 0;
    declare vtotal_item float(10,2) DEFAULT 0;
    declare total_item float(10,2);
    DECLARE quantidade INTEGER DEFAULT 0;
    DECLARE fimLoop INTEGER DEFAULT 0;

    ## cursor para buscar os itens já registrados da venda
    DECLARE buscar cursor for
        SELECT n_valoivenda, n_qtdeivenda
        FROM comivenda
        WHERE n_numevenda = new.n_numevenda;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02500' SET fimLoop = 1;

    ## abro o cursor
    OPEN buscar;
        ## declaro e inicio o loop
        itens : LOOP

            IF fimLoop = 1 THEN
                LEAVE itens;
            END IF;

            FETCH buscar INTO total_item, quantidade;

            ## somo o valor total dos itens (produtos)
            SET vtotal_item = total_item * quantidade;
            set vtotal_itens = vtotal_itens + vtotal_item;

        END LOOP itens;
    CLOSE buscar;

    SET vtotal_item = NEW.n_valoivenda * NEW.n_qtdeivenda;

    UPDATE comvenda SET n_totavenda = vtotal_itens - vtotal_item
    WHERE n_numevenda = new.n_numevenda;
END
++

