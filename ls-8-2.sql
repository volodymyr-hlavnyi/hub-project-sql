use shops;
select database();

-- 2
select 
	se.sname,
    se2.sname as boss_name
from SELLERS se
left join SELLERS se2 
	on se.BOSS_ID = se2.SELL_ID
;

-- 3
select distinct
	cus.cname,
    ord.order_id,
    ord.amt
from CUSTOMERS cus
join ORDERS ord
	on cus.CUST_ID = ord.CUST_ID
where ord.AMT > 1000
order by ord.AMT desc
;

-- 4
select
	cus.cname,
    ord.amt
from orders ord
join customers cus
	on ord.CUST_ID = cus.cust_id

