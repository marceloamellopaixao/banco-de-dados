/*

1) Crie um bloco PL/SQL que pegue o nome do departamento, 
na tabela DEPARTMENTS, referente ao department_id = 999,
realizando o tratamento de erro, caso n�o tenha este departamento.

*/

set SERVEROUTPUT on;

DECLARE
    v_id DEPARTMENTS.department_id%type := 999;
    v_name_department DEPARTMENTS.department_name%type;
    
BEGIN
    SELECT department_name INTO v_name_department FROM DEPARTMENTS
    WHERE department_id = v_id;
    
    DBMS_OUTPUT.PUT_LINE ('Nome do departamento: ' || v_name_department);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('N�o foi encontrado o departamento com o id.');
END;
/

/*

2) Crie um bloco que insira dados na tabela DEPARTMENTS e
trate os erros de DUP_VAL_ON_INDEX ou OTHERS,
realizando commit quando v�lido e rollback quando inv�lido,
mostrando tamb�m a mensagem de erro.

*/

DECLARE
    v_department_id DEPARTMENTS.department_id%type := 100;
    v_department_name DEPARTMENTS.department_name%type := 'Sales'; 
BEGIN
    BEGIN
        INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME)
        VALUES (v_department_id, v_department_name);
        COMMIT; 
        DBMS_OUTPUT.PUT_LINE('Dado inserido com sucesso!');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            ROLLBACK; 
            DBMS_OUTPUT.PUT_LINE('Erro: O ID do departamento j� est� existente na tabela.');
        WHEN OTHERS THEN
            ROLLBACK; 
            DBMS_OUTPUT.PUT_LINE('N�o foi poss�vel reconhecer o erro: ' || SQLERRM);
    END;
END;
/

SELECT * FROM DEPARTMENTS ORDER BY department_id DESC;

/*

3) Crie um bloco PL/SQL que verifique o sal�rio dos
empregados com c�digo (101,100,105,106) na Tabela
EMPLOYEES e adicione um b�nus de R$ 500 para os
mesmos, ap�s isso deve ser verificado se o sal�rio est� maior
de R$ 10.000, se sim deve ter um tratamento de erro dizendo
que o 'Sal�rio excede o limite' e caso negativo realize o update
na tabela, devendo tratar tamb�m algum erro no update.

*/

DECLARE
    v_bonus_amount NUMBER := 500; 
    v_max_salary NUMBER := 10000;
BEGIN
    FOR emp_rec IN (SELECT * FROM EMPLOYEES WHERE employee_id IN (101, 100, 105, 106)) LOOP
        emp_rec.SALARY := emp_rec.SALARY + v_bonus_amount;

        IF emp_rec.SALARY > v_max_salary THEN
            DBMS_OUTPUT.PUT_LINE('Ocorreu um erro: Sal�rio Excedente!');
        ELSE
            UPDATE EMPLOYEES
            SET SALARY = emp_rec.SALARY
            WHERE EMPLOYEE_ID = emp_rec.EMPLOYEE_ID;
            COMMIT; 
            DBMS_OUTPUT.PUT_LINE('Atualiza��o efetuada com sucesso para o empregado com id: ' || emp_rec.EMPLOYEE_ID);
        END IF;
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('N�o foi poss�vel reconhecer o erro: ' || SQLERRM);
END;
/

/*

4) Crie um bloco que fa�a a verifica��o de um numero se ele �
maior que 100 ou menor que 50, mas se ele for menor que 50
force a sa�da da mensagem �N�mero menor que 50' utilizando
o raise, a mesma coisa pra maior que 100, for�ando a
mensagem �N�mero maior que 100' e se entre 50 e 100
mensagem de 'OK'.

*/

DECLARE
    v_numero NUMBER := 75;

BEGIN
    IF v_numero < 50 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Este n�mero � menor que 50');
    ELSIF v_numero > 100 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Este n�mero � maior que 100');
    ELSE
        DBMS_OUTPUT.PUT_LINE('OK');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('N�o foi poss�vel reconhecer o erro: ' || SQLERRM);
END;
