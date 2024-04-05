Exercícios

Crie um programa PL/SQL que exiba se o primeiro nome do funcionário (employees) tem mais ou menos de 6 caracteres, exibindo o nome também.

set serveroutput on;

DECLARE
  CURSOR cur_nome IS
    SELECT First_name, length(first_name) FROM employees;
  v_nome employees.First_name%TYPE;
  v_qtd number;
BEGIN
  OPEN cur_nome;
  LOOP
    FETCH cur_nome INTO v_nome, v_qtd;
    EXIT WHEN cur_nome%NOTFOUND;
    
    IF v_qtd >= 6 THEN
      DBMS_OUTPUT.PUT_LINE('O nome ' || v_nome || ', tem 6 ou mais caracteres');
    ELSE
      DBMS_OUTPUT.PUT_LINE('O nome ' || v_nome || ', tem menos de 6 caracteres');
    END IF;
  END LOOP;
  CLOSE cur_nome;
END;
/



OU 


set serveroutput on;

DECLARE
  CURSOR cur_nome IS
     SELECT First_name, length(first_name) FROM employees;
  v_nome employees.First_name%TYPE;
  v_qtd number;
BEGIN
  OPEN cur_nome;
  FETCH cur_nome INTO v_nome, v_qtd;
  WHILE cur_nome%FOUND LOOP
    
	IF v_qtd >= 6 THEN
      DBMS_OUTPUT.PUT_LINE('O nome ' || v_nome || ', tem 6 ou mais caracteres');
    ELSE
      DBMS_OUTPUT.PUT_LINE('O nome ' || v_nome || ', tem menos de 6 caracteres');
    END IF;
	
    FETCH cur_nome INTO v_nome, v_qtd;
  END LOOP;
  CLOSE cur_nome;
END;
/