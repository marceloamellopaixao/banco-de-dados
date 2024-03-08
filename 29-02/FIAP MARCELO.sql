set SERVEROUTPUT on;

/* EXERCICIO 1
DECLARE
 v_num number := 0;
 
BEGIN
 IF v_num < 0 THEN
 DBMS_OUTPUT.PUT_LINE(' Sou um valor negativo ');
 
 ELSIF v_num = 0 THEN
 DBMS_OUTPUT.PUT_LINE('Sou um número zerado: ');
 
 ELSE
 DBMS_OUTPUT.PUT_LINE(' Sou um valor positivo ');
 END IF;
END;
/

*/

/* EXERCICIO 2 
SET VERIFY OFF
DECLARE
 v_nota number := 5;
 v_resposta varchar2(20);
BEGIN
 v_resposta := CASE v_nota
 WHEN 5 THEN 'A'
 WHEN 4 THEN 'B'
 WHEN 3 THEN 'C'
 WHEN 2 THEN 'D'
 WHEN 1 THEN 'E'
 ELSE 'Não tem disponivel'
 END;
DBMS_OUTPUT.PUT_LINE ('Numero: '|| v_nota || ' Resposta: ' || v_resposta);
END;
/
*/

