use hr;

-- GROUP BY

select
	department_id,
    count(employee_id)
from employees
group by department_id
order by department_id
;

select
	em.department_id,
    dep.department_name,
    count(em.employee_id)
from employees em
left join departments dep
	on em.department_id = 
			dep.department_id
group by department_id
order by department_id
;

select
	em1.first_name,
    em1.last_name,
    em2.department_id,
    em2.max_salary
from employees as em1
join (
	select 
		department_id, 
        max(salary) as max_salary
        from employees
        group by department_id
        ) as em2
on em1.department_id = em2.department_id
and em1.salary = em2.max_salary
order by max_salary
;

-- job_id count
select 
	job_id,
    count(*) as cont_job_id
from employees
group by job_id
order by cont_job_id desc
;
use hr;

select 
	em.job_id,
    dep.department_name,
    count(em.job_id) as cnt_job_id,
    max(em.salary) as max_salary,
    min(em.salary) as min_salary
from employees as em
left join departments as dep
	on em.department_id = dep.department_id
group by em.job_id
order by min_salary desc
;

select 
	manager_f,
    manager_l,
    count(staff_l) as cnt_staff
from 
(
select 
	em1.first_name as staff_f,
    em1.last_name as staff_l,
 --    count(em1.last_name) as cnt_staff,
    em2.first_name as manager_f,
    em2.last_name as manager_l
from employees as em2
left join employees as em1
	on em1.manager_id = em2.employee_id
) as tb1
group by manager_f, manager_l
order by cnt_staff desc
;

