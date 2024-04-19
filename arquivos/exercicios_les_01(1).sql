-- 1) Faça um programa que escreva o seu nome.
set SERVEROUTPUT on;
declare
    v_NOME VARCHAR2(100) := 'Marcelo Augusto';
begin
    dbms_output.put_line(v_NOME);
end;


-- 2) Faça um programa que calcula a soma dois números inteiros (5 e 8) e imprime o resultado.

set SERVEROUTPUT on;
declare
    v_num1 number := 5;
    v_num2 number := 8;
    v_resultado number;
begin
    v_resultado := v_num1 + v_num2;
    dbms_output.put_line(v_resultado);
end;


-- 3) Faça um programa que imprima de ainda sem loop os números 1, 2, 3, 4, 5, sendo um por linha.
set SERVEROUTPUT on;
declare
    v_num1 number := 1;
    v_num2 number := 2;
    v_num3 number := 3;
    v_num4 number := 4;
    v_num5 number := 5;
begin
    dbms_output.put_line(v_num1);
    dbms_output.put_line(v_num2);
    dbms_output.put_line(v_num3);
    dbms_output.put_line(v_num4);
    dbms_output.put_line(v_num5);
end;


-- 4) Faça um programa que imprima a data de hoje.
set SERVEROUTPUT on;
declare
    v_data date;
begin
    v_data := sysdate;
    dbms_output.put_line(v_data);
end;



-- 5) Faça um programa que imprima a data de 5 dias atrás.

set SERVEROUTPUT on;
declare
    v_data date;
begin
    v_data := sysdate-5;
    dbms_output.put_line(v_data);
end;


-- Neste caso traz a data de hoje buscando pela tabela imaginária.
set SERVEROUTPUT on;
declare
    v_data date;
begin
    select sysdate into v_data from dual;
    dbms_output.put_line('A data de hoje é '||v_data);
end;


