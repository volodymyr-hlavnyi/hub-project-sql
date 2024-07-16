-- Data and Databases: домашние задание 10 morning (Python)

-- 1 Подключиться к базе данных world
use world;
select database();

-- 2 Вывести население в каждой стране. 
-- Результат содержит два поля: 
-- CountryCode, sum(Population). 
-- Запрос по таблице city.
SELECT
	CountryCode,
	sum(Population) as s_p
from
	city c 
group by CountryCode 
order by s_p DESC 
;


-- 3 Изменить запрос выше так, 
-- чтобы выводились только страны с населением 
-- более 3 млн человек.
SELECT
	CountryCode,
	sum(Population) as s_p
from
	city c 
group by CountryCode 
HAVING s_p > 3000000
order by s_p DESC 
;


-- 4 Сколько всего записей в результате?
-- 59
SELECT
	count(*)
from
	(
	SELECT
		CountryCode,
		sum(Population) as s_p
	from
		city c
	group by
		CountryCode
	HAVING
		s_p > 3000000
	order by
		s_p DESC 
) as tb1
;


-- 5 Поменять запрос выше так, 
-- чтобы в результате вместо кода страны 
-- выводилось ее название. 
-- (Подсказка: нужен join таблиц city и country 
-- по полю CountryCode)
SELECT
-- 	c.CountryCode,
	c2.Name, 
	sum(c.Population) as sum_pop
from
	city c 
join country c2
	on c.CountryCode = c2.Code
group by c.CountryCode
order by sum_pop desc
;

-- 6 Вывести количество городов в каждой стране 
-- (CountryCode, amount of cities). 
-- (Подсказка: запрос по таблице city 
-- и группировка по CountryCode)
SELECT
	CountryCode,
	count(ID) as cnt_city
FROM
	city c
group by
	c.CountryCode
order by cnt_city DESC 
;


-- 7 Поменять запрос так, чтобы вместо кодов стран, 
-- было названия стран. 
SELECT 
	c2.Name, 
	count(c.ID) as cnt_city
from
	city c
join country c2 
	on
	c.CountryCode = c2.Code
group by 
	c.CountryCode
order by
	cnt_city desc
;


-- 8 Поменять запрос так, чтобы выводилось 
-- среднее количество городов в стране. 

-- Подсказка: разделите задачу на несколько подзадач. 
-- Например, сначала вывести код страны и 
-- количество городов в каждой стране.  
-- Затем сделать join получившегося результата 
-- с запросом, где высчитывается среднее от количества 
-- городов. 
-- Потом добавить join, который добавит имена стран, 
-- вместо кода. 

select
	c.CountryCode,
	c2.Name,
	count(c.id) as cnt_city
from
	city c
join country c2 
on
	c.CountryCode = c2.Code
group by
	CountryCode
order by
	cnt_city desc
;

SELECT
-- 	tb1.CountryCode,
	c.Name,
	avg(tb1.cnt_city) as avg_cnt_city
FROM 
(select 
	CountryCode,
	count(*) as cnt_city
from city
group by CountryCode
) as tb1
join country c 
	on tb1.Countrycode = c.Code 
GROUP by tb1.CountryCode
order by avg_cnt_city desc 
;

select 
	c.CountryCode,
	AVG(Population) 
from city c 
group by c.CountryCode 
;

select 
	CountryCode,
	count(Name) as cnt_city
from city as c
group by CountryCode 
;

SELECT
	c.Name,	
 	avg(tb1.cnt_city) as avg_city
from country c2 
join 
	(
	select
		CountryCode,
		count(Name) as cnt_city
	from
		city as c
	group by
		CountryCode
) as tb1
JOIN country c 
	on tb1.CountryCode = c. Code
GROUP by c.Name
order by avg_city desc
;

