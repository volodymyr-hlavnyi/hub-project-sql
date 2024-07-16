-- Data and Databases: домашние задание 11 morning (Python)
-- 
-- 
-- Подключиться к базе данных hr
use hr;
select database();

-- Вывести список region_id, total_countries, 
-- где total_countries - количество стран в таблице. 
-- Подсказка: работаем с таблицей countries, 
-- использовать оконную функцию over() и 
-- суммировать count(country_id).
select
	region_id ,
	sum(count(country_id)) over(PARTITION BY region_id) as total_countries
FROM
	countries c
group by 
	region_id 
	;

-- 4 check
-- SELECT region_id ,count(region_id) FROM countries c where region_id = 1; 


-- Изменить запрос 2 таким образом, чтобы для каждого 
-- region_id выводилось количество стран в этом регионе. 
-- Подсказка: добавить partition by region_id в over().
select
	region_id ,
	sum(count(country_id)) over(PARTITION BY region_id) as total_countries
FROM
	countries c
group by
	region_id 
;


-- Работа с таблицей departments. 
-- Написать запрос, который выводит location_id, 
-- department_name, dept_total, 
-- где dept_total - количество департаментов в location_id.
SELECT 
	location_id ,
	department_name ,
	sum(count(location_id)) over(PARTITION BY location_id) as dept_total 
from departments d
group by
department_id 
;

-- 4 check
-- select count(*) FROM departments d where location_id = 1700; 


-- Изменить запрос 3 таким образом, чтобы выводились 
-- названия городов соответствующих location_id. 
SELECT 
-- 	d.location_id ,
	l.city ,
	d.department_name ,
	sum(count(d.location_id)) over(PARTITION BY d.location_id) as dept_total 
from departments d
join locations l 
	on d.location_id = l.location_id 
group by
d.department_id 
;


-- Работа с таблицей employees. 
-- Вывести manager_id, last_name, total_manager_salary, 
-- где total_manager_salary - общая зарплата 
-- подчиненных каждого менеджера (manager_id). 

-- Это как в задачи с колонкой last_name 
SELECT 
	manager_id ,
	last_name, 
 	sum(salary) over(PARTITION BY manager_id) as total_manager_salary
from employees e 
;

-- а так мне кажется более логичнее свернуть 
SELECT 
	manager_id ,
-- 	last_name, 
 	max(sum(salary)) over(PARTITION BY manager_id) as total_manager_salary
from employees e 
group by manager_id 
;




-- select 
-- *
-- from 
-- (
-- SELECT 
-- 	manager_id ,
-- 	last_name, 
--  	sum(salary) over(PARTITION BY manager_id) as total_manager_salary
-- from employees e 
-- group by manager_id 
-- ) as tb1
-- join 
-- (
-- -- 4check
-- SELECT 
--  manager_id ,
--  sum(salary) 
--  from employees e 
--  WHERE manager_id = 100
--  order by manager_id 
-- ) as tb2
-- on tb1.manager_id = tb2.manager_id