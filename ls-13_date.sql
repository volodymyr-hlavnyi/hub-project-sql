use hr;

SELECT
	*
from
	hr.employees;

select
	STR_TO_DATE('25,07,2020',
	'%d,%m,%Y') 
	as dttm;

select
	STR_TO_DATE('25-07-2020',
	'%d-%m-%Y') 
	as dttm;
	
select
	STR_TO_DATE('2013-03-17T14:25:39.123',
	'%Y-%m-%dT%H:%i:%s.%f') 
	as dttm;
	
select
	DATE_FORMAT(now(),
	'%Y-%m-%d %H:%i:%s.%f')
	as dttm;

select
	DATE_FORMAT(now(),
	'%Y_%m_%d | %H - %i - %s')
	as dttm;

select
	Datediff('2023-02-01', '2023-01-01') 
	as datediff;

select 
	timestampdiff(Month, '2023-01-01', '2024-01-01');

select 
	timestampdiff(DAY, '2023-01-01', '2024-01-01');

select
	timestampdiff(YEAR,
	'1974-02-24',
	now())

-- Staff hired 2005 year
SELECT 
	*
FROM 
	(
	SELECT
		*,
		DATE_FORMAT(hire_date, '%Y') as year
	FROM
		hr.employees e
	) as tb1
WHERE
	tb1.year = '2005';

-- Staff hired 2005 year
select
	*
from
	hr.employees e
where
	hire_date between date '2005-01-01' and date '2005-12-31';


-- Shop
select
		*,
		DATE_FORMAT(ODATE, '%Y') as year
	from
		ORDERS as o

use shop;
select database();


SELECT
    AVG(tb1.AMT) as avg_amt    
FROM
    (
        SELECT
            *,
            DATE_FORMAT(ODATE, '%Y') as year
        FROM
            ORDERS as o
    ) as tb1
WHERE tb1.year = '2022';

-- INTERVAL
select now() + INTERVAL 5 DAY;
select now() - INTERVAL 1 HOUR;

select 
	DATE_ADD('2011-01-01', 
			INTERVAL 6 MONTH) 
	as dttm;

select
	date_ADD(now(), INTERVAL -1 MONTH)
	as dttm;

select
	subdate(now(),
	interval - 1 month)
	as dttm;

select tb1.* from (
select
	date_ADD(now(), INTERVAL -1 MONTH)
	as dttm1,
	subdate(now(), interval - 1 month)
	as dttm2,
	date_sub(now(), interval - 1 month)
	as dttm3
) as tb1

-- WEEKDAY
select WEEKDAY(now()) as num_day;

-- LAST_DAY
SELECT last_day(now()) as last_day;

-- EXTRACT
SELECT EXTRACT(MONTH FROM now())

use hr;
select 
	EXTRACT(MONTH from hire_date) as month1,
	count(*) as cnt
from
	employees e
group by month1
ORDER by cnt desc
limit 1;

-- Выведите количество заказов по месяцам 
-- (номер месяца - количество заказов 
-- в этом месяце)

use shop;
select
	EXTRACT(MONTH FROM odate) as month1,
	count(*) as cnt
from
	ORDERS
group by month1
order by cnt DESC;

select
	EXTRACT(MONTH FROM odate) as month1,
	count(ORDER_ID) as cnt
from
	ORDERS
group by month1
order by cnt DESC;

-- Orders in month March
select
--  	EXTRACT(MONTH FROM odate) as month1,
--  	MONTHNAME(odate) as month_name,
-- 	odate
	*
from
	ORDERS
where EXTRACT(MONTH FROM odate) = 3;

SELECT 
	ORDER_ID,
-- 	ODATE,
	EXTRACT(YEAR FROM ODATE) as year_order,
	DATE_FORMAT(odate, '%Y') as year_order_txt
FROM ORDERS
;

-- Определить какие из покупок были 
-- совершены в интервале 
-- от 10 апреля 2022 до 10 мая 2022 года
select 
	order_id,
	ODATE
FROM 
	ORDERS o
where odate between '2022-04-10' and '2022-05-10'
;

-- Напишите SQL-запрос для анализа покупок, 
-- совершенных в июне, и определите 
-- количество покупок для каждого продавца. 
-- Результат запроса должен содержать 
-- идентификатор продавца и количество покупок, 
-- сделанных им в июне.

SELECT 
	o.order_id,
	o.odate,
	s.sell_id,
	s.sname,
	EXTRACT(MONTH FROM o.ODATE) as m_ordr,
	monthname(o.odate)
FROM ORDERS o
left join
	SELLERS s 
	on o.sell_id = s.sell_id
where EXTRACT(MONTH FROM o.ODATE) = 6
;

-- Напишите SQL-запрос для анализа 
-- средней стоимости покупок, 
-- совершенных в марте, и определите, 
-- какие продавцы имеют самую высокую и 
-- самую низкую среднюю стоимость покупок 
-- в этом месяце. 
-- Обязательно выведите имя продавца. 
-- 	
select
	s.sname,
	round(avg(o.amt), 2) as avg_amt,
	min(o.amt) as min_amt,
	max(o.amt) as max_amt
from
	ORDERS as o
join SELLERS as s
on
	o.sell_id = s.sell_id
where
	month(o.odate) = 3
group by
	s.sname;

SELECT 
	s.sname,	
	round(avg(o.amt),2),
	round(min(o.amt),2),
	round(max(o.amt),2),
	o.order_id,
	o.odate,
	s.sell_id,
	EXTRACT(MONTH FROM o.ODATE) as m_ordr,
	monthname(o.odate)
	FROM ORDERS o
join
	SELLERS s 
	on o.sell_id = s.sell_id
where EXTRACT(MONTH FROM o.ODATE) = 3
group by s.sell_id
;

-- Напишите SQL-запрос для анализа покупок, 
-- совершенных во вторник, и предоставьте 
-- информацию о каждом заказе, 
-- включая сумму, дату, имя покупателя и имя продавца. 
SELECT 
	o.order_id,
	o.amt,
	s.SNAME,
	c.CNAME 
from ORDERS o 
join
	SELLERS s 
	on s.SELL_ID = o.SELL_ID 
left JOIN 
	CUSTOMERS c 
	on c.CUST_ID = o.CUST_ID 
;

--
select
	O.ODATE,
	O.AMT ,
	S.SNAME ,
	C.CNAME
from
	ORDERS as O
join SELLERS as S
on
	S.SELL_ID = O.SELL_ID
join CUSTOMERS as C
on
	C.CUST_ID = O.CUST_ID
where
	weekday(O.ODATE)= 1
;


-- Определить, сколько покупок было совершено 
-- в каждый месяц. 
-- Отсортировать строки в порядке возрастания 
-- количества покупок. 
-- Вывести два поля - номер месяца 
-- и количество покупок
select 
	EXTRACT(MONTH FROM ODATE) as m_name,
	MONTHNAME(ODATE) as name_mon,
	count(order_id) as cnt_buy
from 
	ORDERS o
group by EXTRACT(MONTH FROM ODATE)
order by cnt_buy asc
;




