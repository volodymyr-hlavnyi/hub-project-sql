-- Создайте SQL запрос, который позволяет 
-- вывести информацию о населении стран 
-- в двух столбцах: 
-- 'CountryCode' и 'Население', 
-- где 'Население' представляет 
-- собой суммарное количество жителей 
-- всех городов в каждой стране.
use world;
select
	cn.Name,
    sum(ct.Population)
from city as ct
left join country as cn
	on ct.CountryCode = cn.Code
group by cn.Name
order by cn.Name
;

-- 2
select
	CountryCode,
	sum(Population)
from city
group by CountryCode
order by CountryCode
;

-- Предоставьте список стран, указав количество 
-- используемых языков в каждой из них, 
-- выводя отчёт в формате (CountryCode, COUNT(Language)). 
select *
from country;

select *
from countrylanguage;

select
 CountryCode,
 count(Language) as count_lng
from countrylanguage
group by CountryCode
order by count_lng desc;

select
  cn.Name,
  cl.CountryCode,
  count(cl.Language) as count_lng
from countrylanguage as cl
join country as cn
  on cl.CountryCode = cn.Code
group by CountryCode
order by count_lng desc;

select
  cn.Name,
  cl.CountryCode,
  count(cl.Language) as count_lng,
  cl.IsOfficial
from countrylanguage as cl
join country as cn
  on cl.CountryCode = cn.Code
where cl.IsOfficial=True
group by CountryCode
union
select
  cn.Name,
  cl.CountryCode,
  count(cl.Language) as count_lng,
  cl.IsOfficial
from countrylanguage as cl
join country as cn
  on cl.CountryCode = cn.Code
where cl.IsOfficial=False
group by CountryCode
order by count_lng desc
;

-- Выведите количество сотрудников, 
-- работающих в отделах Marketing и IT, 
-- используя операцию JOIN между таблицами 
-- "employees" и "departments" по полю "department_id"
use hr;
select
	count(em.employee_id)
from employees as em
join departments as dep
	on em.department_id = dep.department_id
where department_name in ('Marketing', 'IT')
;

-- Посчитайте сумму зарплат 
-- сотрудников, работающих в IT
select 
	dep.department_name,
    em.department_id,
    sum(em.salary)
from employees as em
join departments as dep
	on em.department_id = dep.department_id
where dep.department_name = 'IT'
group by department_id
;

