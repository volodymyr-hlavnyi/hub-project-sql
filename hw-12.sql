-- Data and Databases: домашние задание 
-- 12 morning (Python)
-- 
-- 
-- Работаем с базой world:
use world;
select database();
-- 
-- 
-- 1. Вывести количество городов для каждой страны. 
-- Результат должен содержать CountryCode, CityCount 
-- (количество городов в стране). 
-- Поменяйте запрос с использованием джойнов так, 
-- чтобы выводилось название страны вместо CountryCode. 
SELECT
	-- 	c2.CountryCode,
	c.Name, 
	sum(count(c2.ID)) over (PARTITION by c.Code) as CityCount
from
	country c
join city c2 
	on
	c.Code = c2.CountryCode
GROUP BY
	c2.CountryCode
order BY
	CityCount desc
;


-- 2. Используя оконные функции, вывести список стран 
-- с продолжительностью жизнью и средней продолжительностью 
-- жизни. 
select
	Name,
	LifeExpectancy, 
	avg(LifeExpectancy) over () as a_l
FROM
	country c 
;

-- 3. Используя ранжирующие функции, вывести страны 
-- по убыванию продолжительности жизни.
SELECT
	*,
	DENSE_RANK() over(
ORDER BY
	le desc) as rnk
FROM
	(
	select
		Name,
		LifeExpectancy as le,
		avg(LifeExpectancy) over () as a_l
	FROM
		country c 
) as tb1
;


-- 4. Используя ранжирующие функции, вывести третью 
-- страну с самой высокой продолжительностью жизни.
SELECT
	*
FROM
	(
	SELECT
		*,
		DENSE_RANK() over(
	ORDER BY
		le desc) as rnk
	FROM
		(
		select
			Name,
			LifeExpectancy as le,
			avg(LifeExpectancy) over () as a_l
		FROM
			country c 
) as tb1
) as tb2
where
	rnk = 3
;