set SERVEROUTPUT on;

1) Faça um programa que escreva o seu nome.
--declare
begin
dbms_output.put_line('Alan Reis');
end;

declare
v_nome varchar2(100);
-- v_nome varchar2(100) := 'Alan Reis';
begin
v_nome := 'Alan Reis';
dbms_output.put_line('Meu nome é: '|| v_nome);
end;

select 'A data de hoje é '|| sysdate from dual;



2) Faça um programa que calcula a soma dois números inteiros (5 e 8) e imprime o resultado.
begin
dbms_output.put_line(5 + 8);
end;

declare
v_num1 int;
v_num2 int;
v_resultado int;
begin
v_num1:=5;
v_num2:=8;
v_resultado := v_num1 + v_num2;
dbms_output.put_line('O resultado da soma dos numeros '||v_num1||' e '
||v_num2||' é '||v_resultado );
end;



3) Faça um programa que imprima de ainda sem loop 
os números 1, 2, 3, 4, 5, sendo um por linha.
begin
dbms_output.put_line(1);
dbms_output.put_line(2);
dbms_output.put_line(3);
dbms_output.put_line(4);
dbms_output.put_line(5);
end;

declare
v_num integer:=1;
begin
dbms_output.put_line(v_num);
v_num := 2;
dbms_output.put_line(v_num);
v_num := 3;
dbms_output.put_line(v_num);
v_num := 4;
dbms_output.put_line(v_num);
v_num := 5;
dbms_output.put_line(v_num);
end;






4) Faça um programa que imprima a data de hoje.
begin
dbms_output.put_line(sysdate);
end;

declare
v_data date;
begin
v_data := sysdate ;
dbms_output.put_line('A data de hoje é '||v_data);
end;



declare
v_data date;
begin
v_data := sysdate-5 ;
dbms_output.put_line('A data de 5 dias atras é '||v_data);
end;

declare
v_data date;
begin
select sysdate into v_data from dual;
dbms_output.put_line('A data de hoje é '||v_data);
end;


