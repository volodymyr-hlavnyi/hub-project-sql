select 
	distinct job_id 
from hr.employees 
order by job_id;

select job_id, commission_pct from hr.employees;

select 
	distinct job_id 
from hr.employees
-- where salary < 3000;
where commission_pct is Null and salary < 3000
order by job_id;

select 
	last_name,
    first_name
from hr.employees
order by last_name;

select * 
from hr.employees
where department_id in (60,90,110)
order by last_name, first_name;

select last_name, first_name, job_id, salary 
from hr.employees
where job_id = 'ST_CLERK'
order by salary DESC;

select * 
from hr.employees
where first_name like 'D%'
order by last_name;

select 
	job_id, 
    salary AS max_salary
from hr.employees
order by salary DESC
LIMIT 1;

select 
	job_id,
    MAX(salary)
from hr.employees;

select 
	job_id, 
    salary,
    case
		when salary > 10000 then 'high'
        when salary <= 10000 then 'low'
	end as rank_salary
from hr.employees
order by rank_salary;

select side_number,
	case
		when production_year < 2000 then 'Old'
        when production_year between 2000 and 2010 then 'Mid'
        else 'New'
	end as age
from airport.airliners
where not (`range` > 10000)
order by production_year;