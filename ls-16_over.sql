use hr;
select
	d.department_name,
	count(e.employee_id) as emp_count
from
	employees as e
inner join departments as d
on
	e.department_id = d.department_id
where
	d.department_name not in ('Shipping', 'Sales')
group by
	d.department_name
having
	emp_count > 2;
--------------------------------

use shop;
select database();

select
	ORDER_ID ,
	ODATE ,
	AMT ,
	sum(o.AMT) OVER() as amt2,
	round(((amt / sum(o.AMT) OVER())) * 100,3) as per	
from
	ORDERS o
order by per desc
;

SELECT 
	*,
	avg(RATING) OVER()  as avg
from CUSTOMERS c;

SELECT 
	CITY ,
	avg(RATING) OVER(PARTITION BY CITY)  as avg
from CUSTOMERS c;

SELECT 
	CITY,
	avg(RATING) as av
FROM CUSTOMERS c 
group by CITY;

use shop;
-- Вывести средний рейтинг клиентов по городам: 
-- для каждого города вывести средний рейтинг 
-- клиентов.
SELECT
	CITY ,
	avg(RATING) OVER(PARTITION BY CITY) as avg
from CUSTOMERS c ;

-- Вывести информацию о каждом заказе и 
-- максимальную сумму заказа в том же месяце 
-- для каждой строки.
select 
  	ORDER_ID,
	amt,
	ODATE,
  	EXTRACT(MONTH FROM ODATE) as mn, 
	max(AMT) OVER(PARTITION BY EXTRACT(MONTH FROM ODATE)) as max_sum 
from ORDERS o;
;

select 
  	ORDER_ID,
	amt,
	ODATE,
  	DATE_FORMAT(ODATE, '%Y-%m') as my,
	max(AMT) OVER(PARTITION BY DATE_FORMAT(ODATE, '%Y-%m')) as max_sum 
from ORDERS o
order by max_sum DESC;
;

-- Для более полного понимания практической 
-- значимости прошлого запроса, 
-- добавим подсчет относительного вклада 
-- каждого заказа в общий объем продаж месяца.
select 
  	ORDER_ID,
	amt,
	ODATE,
  	DATE_FORMAT(ODATE, '%Y-%m') as my,
	max(AMT) OVER(PARTITION BY DATE_FORMAT(ODATE, '%Y-%m')) as max_sum,
	ROUND( (AMT / sum(AMT) OVER(PARTITION BY DATE_FORMAT(ODATE, '%Y-%m'))*100 ),3) as per
from ORDERS o
order by per DESC;
;


-- Вывести список продавцов 
-- с указанием общей суммы их продаж. 
-- Отсортировать продавцов по убыванию суммы продаж.
select 
s.SNAME ,
s.SELL_ID,
IF(o.AMT is NULL, 0, o.AMT) as amt,
IF(
	sum(o.AMT) OVER (PARTITION BY s.SELL_ID) is NULL,
	0,
	sum(o.AMT) OVER (PARTITION BY s.SELL_ID)
	) as sm
from SELLERS s 
left join ORDERS o 
on s.SELL_ID = o.SELL_ID 
order by sm desc
;

-- 2 --
select 
	ORDER_ID ,
	ODATE ,
	AMT ,
	sum(AMT) OVER (
		ORDER BY ODATE) AS r_tot,
	sum(AMT) OVER (
		ORDER BY ODATE DESC,
	ORDER_ID) as r_tot_desc
From
	ORDERS o 
;


select 
*,
rank() OVER (ORDER BY CUST_ID DESC) as r_cust
from ORDERS o 
;

use shop;
select
	*,
	rank() OVER (
		ORDER BY CUST_ID DESC) as r_cust,
	DENSE_RANK() OVER (
		ORDER BY CUST_ID DESC) as r_cust_d
from
	ORDERS o 
;

select
	*,
	rank() OVER (
ORDER BY
	CUST_ID DESC) as r_cust,
	DENSE_RANK() OVER (
ORDER BY
	CUST_ID DESC) as r_cust_d,
	NTILE(2) over (
ORDER BY
	cust_id DESC) as ntl
from
	ORDERS o 
;


use hr;
select database();
-- произведите ранжирование департаментов 
-- по средней зарплате.
SELECT 
*
from 
(
SELECT
	d.department_name ,
	avg(e.salary) as avg_sl,
	DENSE_RANK() over (ORDER BY avg(e.salary) desc) 
		as dep_rank	
from departments d
join employees e 
	on d.department_id = e.department_id
GROUP BY d.department_id
) as tb1
where dep_rank < 5
; 

-- Выведите топ-3 сотрудников с наивысшей 
-- зарплатой в каждом департаменте.
SELECT 
 *
FROM (
SELECT
	d.department_id as dep_c,
	d.department_name as dep_n,
	e.first_name as fn,
	e.last_name as ln,
	e.salary,	
	DENSE_RANK() OVER 
		(PARTITION BY d.department_id 
			ORDER BY e.salary DESC) as mrank
FROM departments d 
join employees e 
	on d.department_id = e.department_id 
) as tb1
where mrank < 4
;



