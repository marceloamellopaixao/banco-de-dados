/*
1) Crie um bloco PL/SQL que imprima a tabuada do 10, utilizando a estrutura de loop,
devendo exibir a tabuada estruturada. (vale 1,5 pontos)

Feito com Sucesso.
*/

set SERVEROUTPUT on;
DECLARE
    v_Num number(2) := 10;
    v_counter number(2) := 0;
    v_tabuadaResultado number;
BEGIN
    LOOP
    v_tabuadaResultado := v_Num * v_counter;
    dbms_output.put_line('A tabuada de ' || v_Num || 'x' || v_counter || ' = ' || v_tabuadaresultado);
    v_counter := v_counter + 1;
    EXIT WHEN v_counter > 10;
    END LOOP;
END;

/*
2) Crie um bloco PL/SQL que exiba a soma de todos os salários da tabela EMPLOYEES.
(vale 1 ponto)

Feito com sucesso.
*/

set SERVEROUTPUT on;
DECLARE
    v_Salario employees.salary%type;
    v_Resultado number(10);
BEGIN
    SELECT SUM(SALARY) INTO v_Salario FROM EMPLOYEES;
    v_Resultado := v_Salario;
    dbms_output.put_line(v_Resultado);
END;


/*
3) Rode o comando abaixo e crie a tabela manager_100

create table manager_100
(
 EMPLOYEE_ID NUMBER(6,0),
FIRST_NAME VARCHAR2(20 BYTE),
HIRE_DATE DATE ,
JOB_ID VARCHAR2(10 BYTE) ,
SALARY NUMBER(8,2)
);

Crie um bloco PL/SQL que carregue os campos correspondestes da tabela EMPLOYEES
somente empregados com o MANAGER_ID=100. (vale 3 pontos)

Perguntar
*/

create table manager_100
(
 EMPLOYEE_ID NUMBER(6,0),
 FIRST_NAME VARCHAR2(20 BYTE),
 HIRE_DATE DATE ,
 JOB_ID VARCHAR2(10 BYTE) ,
 SALARY NUMBER(8,2)
);

set SERVEROUTPUT on;
DECLARE
  CURSOR cur_nome IS
    SELECT FIRST_NAME FROM EMPLOYEES WHERE MANAGER_ID = 100;
    v_employeeID manager_100.employee_id%TYPE;
    v_nome employees.First_name%TYPE;
    v_hireDate manager_100.HIRE_DATE%type;
    v_jobID manager_100.JOB_ID%type;
    v_salary manager_100.salary%type;
BEGIN
  OPEN cur_nome;
  LOOP
    FETCH cur_nome INTO v_employeeID, v_nome, v_hireDate, v_jobID, v_salary;
    EXIT WHEN cur_nome%NOTFOUND;
    INSERT INTO MANAGER_100 ()
    DBMS_OUTPUT.PUT_LINE('O nome ' || v_nome || ' Tem o ID = 100');
  END LOOP;
  CLOSE cur_nome;
END;

SELECT * FROM EMPLOYEES WHERE MANAGER_ID = 100;

/*
4) Crie um bloco anônimo que pergunte a sua idade via variável bind e imprima na tela
se você é maior ou menor de idade. (vale 1 ponto).
*/

VARIABLE b_Idade number
set autoprint on
DECLARE
 v_Idade number:&idade;
BEGIN
     v_Idade := CASE v_Idade
 		WHEN <= 14 THEN 'Criança'
 		WHEN >= 15 THEN 'Adolescente'
 		WHEN >= 18 THEN 'Jovem'
        WHEN >= 21 THEN 'Adulto'
 		ELSE 'Mais velho'
		END;
    PRINT b_Idade;
END;


/*
5) Crie um bloco PL/SQL que utilize bloco aninhado e no bloco interno faça a conta de
10 * 5 imprimindo o resultado do bloco interno e no bloco externo faça a conta 10 + 5
imprimindo o resultado do bloco externo. (vale 1,5 pontos)

Feito com sucesso.
*/

set SERVEROUTPUT on;
DECLARE
    v_num number := 10;
    v_num2 number := 5;
    v_Resultado number;
BEGIN
    DECLARE
 	v_num number := 10;
    v_num2 number := 5;
    BEGIN
    v_Resultado := v_num * v_num2;
 	dbms_output.put_line('A multiplicação é ' || v_Resultado);
    END;
    v_Resultado := v_num + v_num2;
    dbms_output.put_line('A soma é ' || v_Resultado);
END;


/*
6) Crie um bloco PL/SQL que utilize a tabela EMPLOYEES e DEPARTMENTS crie
uma consulta que mostra quanto que cada DEPARTAMENTO GASTA com SALÁRIOS, 
imprimindo o valor, o código do departamento e o nome do departamento, 
ordenado pelo maior valor, caso o valor seja maior que 100000, 
deve imprimir também a frase 'Custo elevado do departamento!' (vale 2 pontos)*/

DECLARE
    v_
BEGIN

END;