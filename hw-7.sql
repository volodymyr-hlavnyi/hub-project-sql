use hr;
select database();

-- Data and Databases: 
-- домашние задание 7 morning(Python)
-- Подключитесь к базе данных hr (которая находится на удаленном сервере). 
-- USE hr;

-- Выведите количество сотрудников в базе
select 
	count(employee_id) as count_employee
from employees
;

-- Выведите количество департаментов 
-- (отделов) в базе
select 
	department_id,
    count(department_id) as count_dep
from employees
group by department_id
order by department_id
;

-- Подключитесь к базе данных World 
-- (которая находится на удаленном сервере). 
use world;
select database();

-- Выведите среднее население 
-- в городах Индии 
-- (таблица City, код Индии - IND)
select 
	avg(population)
from city
where CountryCode = 'IND'
;


-- Выведите минимальное население 
-- в индийском городе и максимальное.
select 
	min(population),
    max(population)
from city
;


-- Выведите самую большую 
-- площадь территории. 
select 
    max(SurfaceArea)
from country
;

-- check 
select name, surfacearea
from country
order by surfacearea desc
limit 1;

-- Выведите среднюю продолжительность 
-- жизни по странам. 
select 
	Name,
    avg(LifeExpectancy) as avg_le
from country
group by Name
order by avg_le desc
;


-- Найдите самый населенный город 
-- (подсказка: использовать подзапросы)
select
 Name,
 max(population) 
 from city
 where population = 
 (
	select 
		max(population)
	from city
)
;

-- check
select 
	name,
    population
from city
order by population desc
limit 1
;
