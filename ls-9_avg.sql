use hr;
select database();

select *
from hr.employees, hr.departments
limit 5000;

select 
	count(*) 
from employees;

select 
	sum(salary)
from employees;

select 
	count(salary),
	sum(salary),
    sum(salary) / count(salary) as avg_calc
from employees;

select 
	max(salary),
    min(salary),
    avg(salary)
from employees;

select 
	first_name,
	last_name,
    salary,
    max(salary)
from employees
where 
	salary = 
    (select max(salary) from employees)
;

select
	first_name,
    last_name,
    salary
from employees
where salary < 
	(select avg(salary) from employees)
order by salary
;

select 
	count(*)
from departments;

select
	count(*) as depart_cnt
from departments t1
left join departments t2
	on t1.department_id = t2.department_id
    where t2.department_id is null
;  

select 
	avg(salary) as avg_salary_90
from employees
where department_id = 90
;

select 
	max(salary) as max_salary
from employees
where department_id in (70,80)
;

select 
	count(salary) as cnt_salary
from employees
where department_id in (100)
	and salary > 5000
;

select 
	count(salary) as cnt_salary
from employees
where department_id in (60)
	and salary > 
		(
        select 
			avg(salary) 
            from employees)
;
