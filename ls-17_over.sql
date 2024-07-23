use hr;
select database();

-- <agregate_func(column) OVER (logic group partition <column> order by <column> (asc \ desc))>

-- 1 
-- Найти количество сотрудников у каждого менеджера. 
-- Вывести manager_id и employees_cnt

SELECT 
 manager_id,
 count(employee_id) as employee_cnt
from employees e 
group by manager_id 
;


SELECT 
	manager_id,
	COUNT(employee_id) over (PARTITION by manager_id) as employee_cnt 
From employees e
;


-- Работаем с базой World. 
-- Выведите седьмой по густонаселенности город. 
-- Подсказка: использовать функцию rank() и 
-- оконные функции.
use world;
SELECT
*
FROM 
(
SELECT 
 CountryCode ,
 Name ,
 Population,
 dense_rank() over (order by Population DESC) as pr
FROM city c
limit 10
) as tb1
where pr = 7
;


-- Напишите запрос для определения разницы в 
-- продолжительности жизни между текущей страной и 
-- страной с самой высокой продолжительностью жизни.
SELECT
	*,
	dense_rank() over (order by diff desc) as r_diff
FROM
	(
	select
		Name,
		LifeExpectancy,
		max(LifeExpectancy) over() as ml,
		max(LifeExpectancy) over() - LifeExpectancy as diff,
		round(LifeExpectancy / max(LifeExpectancy) over() * 100,2) as rp		
	from
		country c 
) as tb1
;


-- Выполните ранжирование стран по средней 
-- численности населения
SELECT
	c.Name,
	c.Population,
	sum(c2.Population) over (PARTITION by c2.CountryCode) as sum_city_p
from
	country c
join city c2
	on
	c.Code = c2.CountryCode
GROUP by Name 
;

-- Написать SQL-запрос для выбора городов, 
-- занимающих первое место по населению в своих странах и 
-- превышающих среднее население по всем городам.
SELECT 
*
FROM 
(
SELECT 
	c.Name as n_country,
	c2.Name as n_city,
	c2.Population as population,
	c.LifeExpectancy as le,
	max(c2.Population) over(PARTITION by c.Name ) as m_p_c,
	ROUND(avg(c.LifeExpectancy) over(),1) as a_lf
FROM country c 
join city c2 
	on c.Code = c2.CountryCode
order by n_country , n_city 
) as tb1
where population = m_p_c
and le > a_lf
;

-- Выведите список форм правления (GovernmentForm) 
-- c количеством стран, где есть эта форма правления.
SELECT 
	Name,
	GovernmentForm,
	count(GovernmentForm) over (PARTITION BY GovernmentForm) as cnt,
	COUNT(Name) over (PARTITION BY Name) as cnt_c
FROM country c
order by GovernmentForm 
;

-- Выведите второго по зарплате сотрудника 
-- в каждом департаменте.
use hr;
select	database();
	
SELECT
	*
FROM
	(
select
	d.department_id,
	e.last_name,
	e.salary,
	dense_rank() over( PARTITION BY d.department_id
ORDER BY
	e.salary DESC) as rnk
from
	departments d
left join employees e 
	on
	d.department_id = e.department_id
) as tb1
-- where rnk in (1,2)
where rnk in (2)
;




