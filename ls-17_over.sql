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


