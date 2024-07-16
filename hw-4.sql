use 310524ptm_volodymyr;
select database();

select * from goods;

-- 1
select * from orders order by cost desc;

-- 2 'mail.com' - do not  have 'gmail.com'
select * 
from customers
where email like '%mail.com'
;

select * 
from orders;

-- 3
select 
	*,
	case
	when cost between 0 and 150 then 'low'
    when cost between 151 and 1000 then 'mid'
    else 'high'
	end as status
from orders;

-- 4
select 
	*,
	case
	when cost between 0 and 150 then 'low'
    when cost between 151 and 1000 then 'mid'
    else 'high'
	end as status
from orders order by cost desc;

-- 5
select * from customers;
select 
	* 
from customers
where city = 'Rostok'
;

-- 6
select 
	count(name_order) as count_orders
from orders
group by name_order
order by count_orders desc
limit 1;

update orders
set discounter_price = cost * 0.9;

update orders
set discounter_price = cost * 0.8
where cost > 5000;

-- 7
select 
	*,
    (discounter_price / cost) as discount_percent
from orders
where (discounter_price / cost) < 0.85
order by discount_percent desc;

-- 8
-- расчитал как коэффициент и обреза те, что меньше 0,85 (для примера)

-- 9
-- да, можно было взять разницу

-- 10
select 
	*,
    (discounter_price / cost) as discount_percent
from orders
order by discount_percent desc;