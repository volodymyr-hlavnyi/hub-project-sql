select str_to_date('21,07,2024', '%d,%m,%Y')
;
select date_format(now(), '%Y-%d-%m')
;
select DATEDIFF(now(), LAST_DAY('2024-05-01'))
;
select timestampdiff(YEAR, '1974-02-24', now())
;
select timestampdiff(MONTH, '1974-02-24', now())
;
select timestampdiff(DAY, '1974-02-24', now())
;
select timestampdiff(MINUTE , '1974-02-24', now())
;
select timestampdiff(MINUTE , '1974-02-24', now())
;

SELECT now() - INTERVAL 24 HOUR
; 
SELECT now() + INTERVAL 24 HOUR
;
SELECT now() - INTERVAL 18401 DAY
;
use hr;
select *
from employees e 
where hire_date > now() - INTERVAL 1 YEAR
;
select date_add('2024-07-12', INTERVAL 6 MONTH)
;
select date_sub('2024-07-12', INTERVAL 3 DAY)
;
select 
	WEEKDAY(hire_date)	 
FROM
	employees e
;
select 
last_day('2024-07-12'),
WEEKDAY(last_day('2024-07-12'))
;
SELECT 
EXTRACT(YEAR from hire_date) as y,
EXTRACT(MONTH from hire_date) as m,
EXTRACT(DAY from hire_date) as d,
e.*
from employees e
order by y, m , d
;
select 
hire_date + INTERVAL 1 DAY,
hire_date,
last_day(hire_date),
e.*
from employees e
where hire_date > now() - INTERVAL 1 YEAR 
;
select floor(datediff(now(), '2003-04-25 14:15:38')
/ 365)
;

select timestampdiff(YEAR, '2003-04-24 14:15:38', now())
;

select	
	count(employee_id)
from
	employees e
group by
	department_id 
having
	count(employee_id) >1
;

select
	department_id,
	count(employee_id) as cnt_emp
from
	employees e
group by department_id 
HAVING cnt_emp > 10
;


select
	e.department_id,
	count(e.employee_id) as cnt_emp,
	d.department_name 
from
	employees e
join departments d 
	on e.department_id = d.department_id 
group by department_id 
HAVING cnt_emp > 10
;


