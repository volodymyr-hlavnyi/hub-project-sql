use 310524ptm_volodymyr;
select database();

select * from goods;

insert into goods (
id,
name,
quantity,
in_stock) values 
(3, 'bike_green', 9, 'P'),
(4, 'bike_red', 30, 'N')
;

select 
	name,
    quantity,
    in_stock
from goods
union all
select 
	title,
    quantity,
    in_stock
from goods2
;

select 
	name,
    quantity,
    in_stock
from goods
union
select 
	title,
    quantity,
    in_stock
from goods2
;

select * from goods;
select * from goods2;

alter table goods2
add column price int default 0
;

insert into goods2 (
title,
quantity,
in_stock,
price) values 
('bike_green', 150, 'N', 620.56),
('bike_red', 201, 'Y', 580.60),
('bike_new', 163, 'Y', 480.40),
('motobike_blue', 10, 'N', 6420.56),
('motobike_green_green', 21, 'Y', 2280.60),
('auto_new', 12, 'Y', 19998.98)
;

select name from goods
union
select title from goods2

;

select count(*) as total_count_union_all
from (
select name from goods
union all
select title from goods2
) as combined
;

select count(*) as total_count_union
from (
select name from goods
union
select title from goods2
) as combined
;

select (
	select count(*) as total_count_union_all
	from (
	select name from goods
	union all
	select title from goods2
	) as combined) as tb_un_all,
    
    (select count(*) as total_count_union
	from (
	select name from goods
	union
	select title from goods2
	) as combined) as tb_un
;

describe goods;

select 
	name as title,
	null as price
from goods
union all
select
	title,
	price
from goods2
order by title, price
;