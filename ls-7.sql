use 310524ptm_volodymyr;
select database();

select * from customers;

select * from goods;
select * from goods2;

select * from (
	select 
		gd1.name, 
		-- gd2.title, 
		gd1.quantity as q_gd1, 
		gd2.quantity as q_gd2
    
	from goods gd1
	join goods2 gd2
	on gd1.name = gd2.title
) as table_toatal_goods
;

use hr;
select database();
select * from employees;
select * from departments;

select 
	em.first_name,
    em.last_name,
    dep.department_name
from employees em
inner join departments dep
on em.department_id = dep.department_id
;

select 
	em.first_name,
    em.last_name,
    dep.department_name
from employees em
inner join departments dep
on em.department_id = .department_id
and department_name in ('IT', 'Treasure', 'IT Support')
;


select 
	em.first_name,
    em.last_name,
    em2.last_name as manager_last_name,
    em2.first_name as manager_first_name
from employees em
inner join employees em2
on em.manager_id = em2.employee_id
;

select distinct
	em.job_id
from employees em
join employees em2
	on em.manager_id = em2.employee_id
	and em.salary > em2.salary
;

select 
	em.last_name,
    em.first_name,
    loc.city,
    loc.state_province
from employees em
join departments dep
	on em.department_id = dep.department_id
join locations loc
	on dep.location_id = loc.location_id
    and loc.city in ('Seattle', 'Toronto');
    
select 
	dep.department_name
from departments dep
left join employees em
	on dep.department_id = em.department_id
where dep.department_id is null
;

select 
	dep.department_name
from employees em
join departments dep
	on em.department_id = dep.department_id
    and em.salary > 10000
;

select 
	em.last_name,
    em.first_name,
    dep.department_name,
    job.job_title
from employees em
join departments dep
	on em.department_id = dep.department_id
join jobs job
	on em.job_id = job.job_id
;

select 
	em.last_name,
    em.first_name,
    em.salary,
    loc.city
from employees em
join departments dep
	on em.department_id = dep.department_id
join locations loc
	on loc.location_id = dep.location_id
--     and loc.city in ('Oxford','San Francisco')
and loc.city in ('Oxford', 'South San Francisco')
order by em.salary desc
;

