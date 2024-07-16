create database 310524ptm_volodymyr;
use 310524ptm_volodymyr;
select database();
-- use information_schema;
-- create table 
-- insert
create table goods (
 id int not null auto_increment primary key,
 name varchar(20),
 quantity int,
 in_stock char(1) -- Y or N
);

describe goods;

drop table if exists goods;

insert into goods (
 name,
 quantity,
 in_stock) values 
 ('bike', 10, 'Y'),
 ('motobike', 5, 'Y'),
 ('auto', 2, 'N');
 
select * from goods
where name like 'bike_new';
 
 update goods
 set 
	quantity = 25
where name like 'bike_new';
-- where id = 1;

set SQL_SAFE_UPDATE=0;

create view in_stock as 
select name, quantity
from goods
where in_stock = 'Y';

select * from goods
where in_stock = 'Y';

select * from in_stock;