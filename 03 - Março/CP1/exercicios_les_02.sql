1) Crie um bloco anomino que liste quantos funcionários trabalham na cidade de Toronto.

set SERVEROUTPUT on;

declare
v_qtd integer;

begin
select count(e.last_name)  into v_qtd
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where l.city='Toronto';

dbms_output.put_line('Trabalham em Toronto '||v_qtd||' funcionários.');

end;
/


select * from countries
where region_id=2

2) Crie um bloco com as variaveis para realizar o insert na tabela Countries ( country_id=CL , country_name=Chile e Region_id=2 )

declare
v_id countries.country_id%type;
v_name countries.country_name%type;
v_region countries.region_id%type;
begin
v_id:='CL';
v_name:='Chile';
V_region:=2;

insert into countries
(country_id, country_name, region_id)
values
(v_id,v_name,v_region);

commit;
end;
/


3) Crie um bloco que liste o nome e sobrenome do funcionário que tem o maior salário

declare
v_nome employees.first_name%type;
v_sobrenome employees.last_name%type;

begin
select first_name, last_name into v_nome, v_sobrenome
from employees 
where salary in (select max(salary) from employees);

dbms_output.put_line('O nome dele é '||v_nome||' '||v_sobrenome||'.');

end;
/



4) Crie um bloco que de um aumento salarial de 15% para os funcionários que trabalham na região 'Europe';

declare
v_perc number:= 1.15;

begin
update employees em
set em.salary = salary * v_perc
where em.employee_id in
(
select e.employee_id
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on l.location_id = d.location_id
join countries c
on l.country_id = c.country_id
join regions r
on r.region_id = c.region_id
where r.region_name='Europe'
);
commit;
end;
/