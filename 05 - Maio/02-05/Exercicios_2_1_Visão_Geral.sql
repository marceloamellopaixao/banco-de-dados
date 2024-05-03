/*
1) Crie uma função calculadora, que receba dois números e o símbolo da operação
*/

CREATE OR REPLACE FUNCTION CALCULADORA
(p_num1 in number, p_num2 in number, p_operacao in varchar) 
RETURN NUMBER IS v_resultado number;

BEGIN
    CASE p_operacao
        WHEN '+' THEN v_resultado := p_num1 + p_num2;
        WHEN '-' THEN v_resultado := p_num1 - p_num2;
        WHEN '*' THEN v_resultado := p_num1 * p_num2;
        WHEN '/' THEN v_resultado := p_num1 / p_num2;
    END CASE;
    RETURN v_resultado;
    
END CALCULADORA;
/

SET SERVEROUTPUT ON;
EXECUTE dbms_output.put_line(CALCULADORA(2,-2,'/'))