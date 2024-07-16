use hr;
select database();

#2024/07/11
select 
	location_id,
	count(*) as dep_count
from
	hr.departments d
group by
	location_id
HAVING
	dep_count = 1
	and
	(location_id  BETWEEN 1400 and 1700)
order by
	dep_count DESC
;

-- выведите номера отделов и количество 
-- сотрудников в каждом отделе, 
-- где сотрудников больше 10
select 
	d.department_id,
	count(*) as cnt_emp
from
	departments d 
left join
	employees e 
	on d.department_id = e.department_id 
GROUP BY d.department_id 
HAVING cnt_emp > 10
;

-- name department
select 
	d.department_name,
	count(*) as cnt_emp
from
	departments d 
left join
	employees e 
	on d.department_id = e.department_id 
GROUP BY d.department_id 
HAVING cnt_emp > 10
;

-- найти максимальную зарплату в каждом 
-- департаменте. 
-- Вывести department_id и max_salary.
SELECT 
	d.department_name as d_n,
	d.department_id as d_id,
	max(salary) as max_salary
from
	employees e
join departments d 
on
	e.department_id = d.department_id
GROUP BY
	d.department_id
order by
	max_salary desc
;

-- Найти сотрудников, у которых наибольшая 
-- зарплата в их департаменте.
SELECT
	e2.first_name,
	e2.last_name,
	tb1.d_id,
	-- 	tb1.max_salary,
	tb1.job_id,
	e2.salary,
	tb1.d_n
from
	(
	SELECT
		d.department_name as d_n,
		d.department_id as d_id,
		e.job_id,
		e.salary
	from
		employees e
	left join departments d 
on
		d.department_id = e.department_id
	GROUP BY
		d.department_id
) as tb1
left join employees e2 
on
	e2.department_id = tb1.d_id

	-- where
	-- 	tb1.max_salary = e2.salary
	-- order by
	-- 	max_salary DESC 
;


-- class
select
	e.first_name,
	e.last_name,
	e.job_id,
	e.salary,
	dep_salary.max_salary as by_dep,
	e.hire_date
from
	employees as e
inner join (
	select
		department_id,
		max(salary) as max_salary
	from
		employees
	group by
		department_id
) as dep_salary
on
	e.department_id = dep_salary.department_id
where
	e.salary = dep_salary.max_salary
order by
	e.salary DESC
;


select 
	d.department_name,
	e.first_name,
	e.last_name,
	e.job_id, 
	max(e.salary),
	e.hire_date 
from
	employees e
join departments d 
on
	d.department_id = e.department_id
group by
	d.department_name 
;


-- Найти департамент с наибольшим кол-вом сотрудников.
SELECT
	*
FROM
	departments d
WHERE
	department_id in 
(
	-- 3 query
	SELECT
		e.department_id
	from
		employees e
	group by
		department_id
	having
		COUNT(department_id) = 
(
		-- 2 query
		SELECT
			max(cnt_emp)
		FROM
			(
			-- 1 query
			SELECT
				department_id,
				count(employee_id) as cnt_emp
			from
				employees e
			group by
				department_id
			order by
				cnt_emp desc
		) as tb1
 )
)
;

-- 1 query
SELECT
	department_id,
	count(employee_id) as cnt_emp
from
	employees e
group by
	department_id
order by
	cnt_emp desc
;


-- 2 query
SELECT
	max(cnt_emp)
FROM
			(
	-- 1 query
	SELECT
		department_id,
		count(employee_id) as cnt_emp
	from
		employees e
	group by
		department_id
	order by
		cnt_emp desc
) as tb1
;

	-- 3 query
	SELECT
		e.department_id
	from
		employees e
	group by
		department_id
	having
		COUNT(department_id) = 
(
		-- 2 query
		SELECT
			max(cnt_emp)
		FROM
			(
			-- 1 query
			SELECT
				department_id,
				count(employee_id) as cnt_emp
			from
				employees e
			group by
				department_id
			order by
				cnt_emp desc
		) as tb1
)
;

-- Найти департамент с наибольшим кол-вом сотрудников.
SELECT 
	d.department_id,
	d.department_name,
	COUNT(e.employee_id) as cnt_emp,
	d.manager_id
FROM
	departments d
join employees e 
on
	d.department_id = e.department_id
group by
	department_id
order by
	cnt_emp desc
limit 1
;

-- Найти департаменты, в которых больше 10 сотрудников
SELECT
	d.department_name,
	d.department_id,
	count(e.employee_id) as cnt_emp
from
	departments d
left join employees e 
on
	d.department_id = e.department_id
group by
	d.department_id
having
	cnt_emp > 10
order by
	cnt_emp desc
;

-- class
-- Найти департаменты, в которых больше 10 сотрудников

select
	t1.department_name,
	t1.manager_id,
	t2.count_of_emp
from
	departments as t1
join (
	select
		department_id,
		count(employee_id) as count_of_emp
	from
		employees
	group by
		department_id
	having
		count_of_emp >10

) as t2 
on
	t1.department_id = t2.department_id
;