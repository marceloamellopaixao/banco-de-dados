/*

1) Crie um bloco PL/SQL que pegue o nome do departamento, 
na tabela DEPARTMENTS, referente ao department_id = 999,
realizando o tratamento de erro, caso não tenha este departamento.

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
        DBMS_OUTPUT.PUT_LINE ('Não foi encontrado o departamento com o id.');
END;
/

/*

2) Crie um bloco que insira dados na tabela DEPARTMENTS e
trate os erros de DUP_VAL_ON_INDEX ou OTHERS,
realizando commit quando válido e rollback quando inválido,
mostrando também a mensagem de erro.

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
            DBMS_OUTPUT.PUT_LINE('Erro: O ID do departamento já está existente na tabela.');
        WHEN OTHERS THEN
            ROLLBACK; 
            DBMS_OUTPUT.PUT_LINE('Não foi possível reconhecer o erro: ' || SQLERRM);
    END;
END;
/

SELECT * FROM DEPARTMENTS ORDER BY department_id DESC;

/*

3) Crie um bloco PL/SQL que verifique o salário dos
empregados com código (101,100,105,106) na Tabela
EMPLOYEES e adicione um bônus de R$ 500 para os
mesmos, após isso deve ser verificado se o salário está maior
de R$ 10.000, se sim deve ter um tratamento de erro dizendo
que o 'Salário excede o limite' e caso negativo realize o update
na tabela, devendo tratar também algum erro no update.

*/

DECLARE
    v_bonus_amount NUMBER := 500; 
    v_max_salary NUMBER := 10000;
BEGIN
    FOR emp_rec IN (SELECT * FROM EMPLOYEES WHERE employee_id IN (101, 100, 105, 106)) LOOP
        emp_rec.SALARY := emp_rec.SALARY + v_bonus_amount;

        IF emp_rec.SALARY > v_max_salary THEN
            DBMS_OUTPUT.PUT_LINE('Ocorreu um erro: Salário Excedente!');
        ELSE
            UPDATE EMPLOYEES
            SET SALARY = emp_rec.SALARY
            WHERE EMPLOYEE_ID = emp_rec.EMPLOYEE_ID;
            COMMIT; 
            DBMS_OUTPUT.PUT_LINE('Atualização efetuada com sucesso para o empregado com id: ' || emp_rec.EMPLOYEE_ID);
        END IF;
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Não foi possível reconhecer o erro: ' || SQLERRM);
END;
/

/*

4) Crie um bloco que faça a verificação de um numero se ele é
maior que 100 ou menor que 50, mas se ele for menor que 50
force a saída da mensagem ‘Número menor que 50' utilizando
o raise, a mesma coisa pra maior que 100, forçando a
mensagem ‘Número maior que 100' e se entre 50 e 100
mensagem de 'OK'.

*/

DECLARE
    v_numero NUMBER := 75;

BEGIN
    IF v_numero < 50 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Este número é menor que 50');
    ELSIF v_numero > 100 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Este número é maior que 100');
    ELSE
        DBMS_OUTPUT.PUT_LINE('OK');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Não foi possível reconhecer o erro: ' || SQLERRM);
END;
