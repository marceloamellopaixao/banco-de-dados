/*
FUNÇÃO DE SOMAR com um valor já existente, sendo +100
*/
CREATE OR REPLACE FUNCTION SOMA
(p_soma NUMBER) RETURN NUMBER IS 
v_somaTotal number;

BEGIN
v_somaTotal := p_soma + 100;
return v_somaTotal;
END SOMA;

SET SERVEROUTPUT ON;

EXECUTE dbms_output.put_line(soma(156))