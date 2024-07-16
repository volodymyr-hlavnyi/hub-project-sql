-- Data and Databases: домашние задание 6 morning(Python)

-- Подключитесь к базе данных world (которая находится на удаленном сервере). 
use world;
select database();

-- 1 Выведите список стран с языками, на которых в них говорят. 
select
	cout.Name,
    conl.Language
from country cout
join countrylanguage conl
	on conl.CountryCode = cout.Code
order by cout.Name
;
    

-- 2 Выведите список городов с их населением и названием стран
select 
	city.Name as City,
    city.Population,
    cout.Name as Country
from city as city
join country as cout
	on city.CountryCode = cout.Code
order by Population desc
;

-- 3 Выведите список городов в South Africa
select 
 	city.Name as City,
    city.Population,
    cout.Name as Country
from city as city
join country as cout
	on city.CountryCode = cout.Code
	and cout.Name in ('South Africa')
order by Population desc
;

-- 5 Выведите список стран с названиями столиц. 
-- Подсказка: в таблице country есть поле Capital, 
-- которое содержит номер города из таблицы City. 
select 
	count.Name as Country,
    city.Name as Capital
from country as count
left join city
	on count.Capital = city.ID
order by Country
;

-- 6 Измените запрос 4 таким образом, чтобы выводилось 
-- население в столице. 
select 
	count.Name as Country,
    city.Name as Capital,
    city.Population as Population_in_Capital
from country as count
left join city
	on count.Capital = city.ID
order by Country
;

-- 7 Напишите запрос, который возвращает название 
-- столицы United States
select 
	count.Name as Country,
    city.Name as Capital
from country as count
left join city
	on count.Capital = city.ID
where count.Name in ('United States')
order by Country
;

-- 8 Используя базу hr_data.sql, 
-- вывести имя, фамилию и город сотрудника.
use hr;
select database();
select
	emp.last_name,
    emp.first_name,
    loc.city
from employees as emp
left join departments as dep
	on emp.department_id = dep.department_id
left join locations as loc
	on dep.location_id = loc.location_id
order by emp.last_name
;
    

-- 9. Используя базу hr_data.sql, 
-- вывести города и соответствующие городам страны.
select
	loc.city as City,
    count.country_name as Country
from locations as loc
left join countries as count
	on count.country_id = loc.country_id
order by City
;