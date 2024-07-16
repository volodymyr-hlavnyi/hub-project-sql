-- 1 Вывести текущую дату и время.
select NOW() as dt;

-- 2 Вывести текущий год и месяц
select DATE_FORMAT(NOW(),'%Y %m') as dt;

-- 3 Вывести текущее время
select DATE_FORMAT(NOW(), '%H:%i') as dt;

-- 4 Вывести название текущего дня недели
select dayname(NOW()) as dt;

-- 5 Вывести номер текущего месяца
select EXTRACT(MONTH FROM NOW()) as dt;

-- 6 Вывести номер дня в дате “2020-03-18”
select EXTRACT(DAY FROM '2020-03-18') as dt;

-- Подключиться к базе данных shop (которая находится на удаленном сервере).
use shop;
SELECT database(); 

-- 7 Определить какие из покупок были совершены апреле (4-й месяц)
select 
	* 
from ORDERS o 
where EXTRACT(MONTH FROM o.ODATE) = 4
;

-- 8 Определить количество покупок в 2022-м году
select 
	*
from ORDERS o
where EXTRACT(YEAR FROM o.ODATE) = 2022
;

-- 10 Определить, сколько покупок было совершено в каждый день. 
-- Отсортировать строки в порядке возрастания количества покупок. 
-- Вывести два поля - дату и количество покупок
SELECT
	o.ODATE,	
	count(o.ODATE) as cnt	 
FROM ORDERS o 
group by o.ODATE
order by cnt
;

-- 11 Определить среднюю стоимость покупок в апреле
SELECT 
	avg(o.AMT)
from ORDERS o
where EXTRACT(MONTH FROM o.ODATE) = 4 
;