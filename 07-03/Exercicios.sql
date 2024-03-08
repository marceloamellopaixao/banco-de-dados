set SERVEROUTPUT on;
/*

2) Crie um programa PL/SQL que exiba o primeiro nome do funcionário (employees)
se tem mais ou menos de 6 Caracteres, exibindo o nome no mesmo.

*/

DECLARE
    CURSOR meu_cursor IS
        SELECT FIRST_NAME, length(FIRST_NAME) FROM EMPLOYEES;
        
    v_nome employees.FIRST_NAME%type;
    v_qtd number;
BEGIN
    OPEN meu_cursor;
    LOOP
        FETCH meu_cursor INTO v_nome, v_qtd;
        EXIT WHEN meu_cursor%NOTFOUND;
        
        IF v_qtd >= 6 THEN
            dbms_output.put_line('O nome ' || v_nome || ', tem 6 ou mais caracteres.');
        ELSE
            dbms_output.put_line('O nome ' || v_nome || ', tem menos de 6 caracteres.');
        END IF;
    END LOOP;
    CLOSE meu_cursor;
END;