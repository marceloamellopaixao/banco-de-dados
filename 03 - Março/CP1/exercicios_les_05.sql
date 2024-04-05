set serveroutput on

1) Escreva um bloco PL/SQL que faça a verificação de um numero se é positivo, negativo ou ele é O.

DECLARE
  v_numero INTEGER := -10;
BEGIN
  IF v_numero > 0 THEN
    DBMS_OUTPUT.PUT_LINE('O número é positivo.');
  ELSIF v_numero < 0 THEN
    DBMS_OUTPUT.PUT_LINE('O número é negativo.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('O número é zero.');
  END IF;
END;
/



2) Crie um bloco PL/SQL que faça a verificação das notas de 1 a 5 respondendo para (A, B, C, D, E).

DECLARE
  v_nota NUMBER := 85;
BEGIN
  CASE
    WHEN v_nota >= 90 THEN
      DBMS_OUTPUT.PUT_LINE('Classificação: A');
    WHEN v_nota >= 80 AND v_nota < 90 THEN
      DBMS_OUTPUT.PUT_LINE('Classificação: B');
    WHEN v_nota >= 70 AND v_nota < 80 THEN
      DBMS_OUTPUT.PUT_LINE('Classificação: C');
    WHEN v_nota >= 60 AND v_nota < 70 THEN
      DBMS_OUTPUT.PUT_LINE('Classificação: D');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Classificação: F');
  END CASE;
END;
/



3) Crie um bloco PL/SQL que imprima os numeros de 1 a 10 utilizando Loop Simples.

DECLARE
  contador NUMBER := 1;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE('Número: ' || contador);
    contador := contador + 1;
    EXIT WHEN contador > 10;
  END LOOP;
END;
/


4) Faça um bloco pl/sql que utilize for e imprima um contador até 10 dizendo se é par ou impar.

DECLARE
BEGIN
  FOR i IN 1..10 LOOP
    IF MOD(i, 2) = 0 THEN
      DBMS_OUTPUT.PUT_LINE('Número ' || i || ' é par.');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Número ' || i || ' é ímpar.');
    END IF;
  END LOOP;
END;
/



5) Faça um bloco pl/sql que imprima o campo HIRE_DATE de um select na tabela EMPLOYEES utilizando while.

set serveroutput on;

DECLARE
  v_data DATE;
BEGIN
  -- Abre o cursor para selecionar as datas
  FOR c IN (SELECT HIRE_DATE FROM employees) LOOP
    v_data := c.HIRE_DATE;
    -- Imprime a data
    DBMS_OUTPUT.PUT_LINE('Data: ' || TO_CHAR(v_data, 'DD/MM/YYYY'));
  END LOOP;
END;
/



DECLARE
  CURSOR meu_cursor IS
    SELECT HIRE_DATE FROM employees;
  v_data employees.HIRE_DATE%TYPE;
BEGIN
  OPEN meu_cursor;
  FETCH meu_cursor INTO v_data;
  WHILE meu_cursor%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE('Data: ' || TO_CHAR(v_data, 'DD/MM/YYYY'));
    FETCH meu_cursor INTO v_data;
  END LOOP;
  CLOSE meu_cursor;
END;
/