use hr;
select database();

-- 1
select 
	em.last_name,
    em.first_name,
    dep.department_name
from employees em
left join departments dep
	on em.department_id = dep.department_id
;

-- 2
select 
	em.last_name,
    em.first_name,
    em.salary,
    dep.department_name
from employees em 	
left join departments dep 
	on em.department_id = dep.department_id
where em.salary > 15000
order by em.salary
;

-- 3
select 
	em.last_name,
    em.first_name,
    em.salary as s_em,
    em2.last_name,
    em2.first_name,
    em2.salary as s_manager
from employees em
left join employees em2
	on em.employee_id = em2.manager_id
 where em.salary > em2.salary
 order by em.salary DESC
 ;

use shop;
select database();
 -- 4
 -- Напишите запрос, который вернет 
 -- выборку full join, используя таблицы 
 -- CUSTOMERS и ORDERS (по ключу CUST_ID). 
 -- В выборке должно присутствовать два 
 -- атрибута — cname, order_id.
 select
	cus.cname,
    ord.order_id
from CUSTOMERS cus
left join ORDERS ord
	on cus.cust_id = ord.cust_id
union
select 
	cus.cname,
    ord.order_id
from CUSTOMERS cus
right join ORDERS ord
	on cus.cust_id = ord.cust_id
;

-- Для каждого сотрудника выведите разницу 
-- между комиссионными его босса 
-- и его собственными. 
-- Если у сотрудника босса нет, 
-- выведите NULL.
-- Вывести : sname, difference.

select 
	sel.sname as Staff,
    -- sel2.sname as Boss,
    sel2.comm - sel.comm as difference
from SELLERS as sel
left join SELLERS as sel2
	on sel.boss_id = sel2.sell_id
;

-- select sp.sname,
-- sb.comm - sp.comm as difference
-- from SELLERS as sp
-- left join SELLERS as sb
-- on sp.BOSS_ID=sb.SELL_ID;

/*	
Выведите пары покупателей и обслуживших 
их продавцов из одного города.
Вывести: sname, cname, city 
*/
select 
	cust.cname,
    cust.city,
    sel.city
from CUSTOMERS as cust
join ORDERS as ord
	on cust.cust_id = ord.cust_id
join SELLERS as sel
	on sel.sell_id = ord.sell_id
where cust.city = sel.city
;

-- ----------------------------------------------------- extra

-- 1 Выведите список стран со столицами.
use world;
-- 239
select
	cont.name as country,
    city.name as capital
from country as cont
left join city as city
	on cont.Capital = city.id
order by country
;

-- 2 Выведите список стран с языками, на которых в них говорят.
-- 990
select
	cont.name,
    lang.language
from country as cont
left join countrylanguage as lang
	on cont.code = lang.CountryCode
;

-- 3 Выведите список стран с официальными языками.
-- 287
select
	cont.name,
    lang.language
from country as cont
left join countrylanguage as lang
	on cont.code = lang.CountryCode
	and isOfficial in ('T')
order by cont.name
;	

-- 4 Сравните результаты (количество записей в результате) 
-- предыдущих запросов. Где в результате больше записей?

-- 5 Поменяйте последний запрос (3) так, чтобы результат выглядел 
-- так (например, для Samoa): Samoa | {English, Samoan}, 
-- то есть на каждую страну была только одна запись, 
-- а соответствующие официальные языки бы отображались 
-- в одно строчку списком.
select
	concat(cont.name, ' | ',
		'{', 
        group_concat(
			lang.language order by lang.language separator 
            ', '), 
            '}') as languages
from country as cont
left join countrylanguage as lang
	on cont.code = lang.CountryCode
	and isOfficial in ('T')
group by cont.name
order by cont.name
;
