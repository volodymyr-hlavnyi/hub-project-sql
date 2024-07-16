-- SELECT * FROM hr.employees;
-- select *,
-- case
-- when salary > 10000 then 1 
-- else 0
-- end as salary_group from hr.employees;

-- select  
-- sum(
-- case 
-- when salary > 10000 then salary
-- else 0
-- end )
-- as sum_salary from hr.employees;

-- select SUM(salary) from hr.employees where salary > 10000;

-- select 
-- sum(
-- if (salary > 10000, salary, 0)) as sum_salary
-- from hr.employees;

-- select 
-- avg(salary) from hr.employees where salary < 10000;

-- select 
-- department_id,
-- case
--  when salary > 10000 then 1 
--  else 0
--  end as salary_case
-- from hr.employees;

-- select 
-- sum(
-- case when salary > 10000 then 1 else 0 end) as sum_of_dep
-- from hr.employees;

SELECT
model_name,
CASE
WHEN `range` > 1000 AND `range` <= 2500 THEN 'short-haul'
WHEN `range` > 2500 AND `range` <= 6000 THEN 'medium-haul'
WHEN `range` > 6000 THEN 'long-haul'
END category
FROM airport.airliners;

SELECT
id,
service_class,
price
FROM airport.tickets
where
CASE service_class
  WHEN 'Business' then price > 100000
  WHEN 'PremiumEconomy' then price between 20000 AND 30000
  WHEN 'Economy' then price between 10000 and 11000
END
order by price
;

select * from airport.tickets;
select distinct service_class from airport.tickets;


-- select if("Yes"="NO", 'YES', 'NO') AS colAnswer;
-- select count(distinct (first_name)) from hr.employees;

select 
id,
trip_id,
case
	when service_class = 'Business' then (price - (price*0.1))
    when service_class = 'PremiumEconomy' then (price - (price*0.20))
    when service_class = 'Economy' then (price - (price * 0.15))
end new_price,
price as old_price
from airport.tickets
;

