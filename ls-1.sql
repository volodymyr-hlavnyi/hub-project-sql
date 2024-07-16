-- select * from hr.employees where job_id='IT_PROG';
-- select * from hr.employees where salary > 10000;
select * from 
hr.employees 
where (salary >= 10000 and salary>=20000);
-- select * from hr.employees where department_id not in (60,30,100);
-- select * from hr.employees where first_name like '%ll%';
-- select * from hr.employees where first_name like '%_ll_%';
-- select * from hr.employees where last_name like '%_a'
-- select * from hr.employees where last_name like 'L%';
-- select * from hr.countries where country_id='US';
-- select city from hr.locations where country_id='US';
-- Вывести зарплату сотрудника с именем ‘Lex’ и 
-- фамилией ‘De Haan'
-- select salary 
-- from hr.employees 
-- where first_name like 'Lex' 
-- and last_name like 'De Haan';

-- Вывести всех сотрудников с job_id ‘FI_ACCOUNT’ 
-- и зарабатывающих меньше 8000
-- select * from hr.employees where job_id='FI_ACCOUNT'
-- and salary < 8000;

-- Вывести сотрудников, у которых 
-- в фамилии в середине слова 
-- встречаются сочетания ‘kk’ или ‘ll
-- select * from hr.employees 
-- where (last_name like '%_kk_%' or '%_ll_%');

-- select *
-- from hr.departments 
-- where manager_id is null;