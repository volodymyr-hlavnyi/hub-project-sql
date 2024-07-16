use 310524ptm_volodymyr;
select database();

describe customers;
show create table customers;
show create table goods;

drop table goods2;

CREATE TABLE `goods2` (
`id` int PRIMARY KEY auto_increment,
`title` varchar(30) DEFAULT NULL,
`quantity` int check (quantity > 0),
`in_stock` char(1) check (in_stock in ('Y', 'N'))
)
;

describe goods2;

insert into goods2 (
title,
quantity,
in_stock) values 
('bike_blue', 15, 'Y'),
('bike_red', 10, 'Y'),
('bike_green_small', 4, 'Y')
;

select * from goods2;

alter table goods
modify column in_stock char(1)
;

alter table goods
modify column in_stock char(1) 
check (in_stock in ('Y','N','P'))
; -- dont working !!!

alter table goods
modify column quantity int
;

-- alter table goods
-- modify column quantity int check (quantity > 10)
-- ; 

show create table goods2;

alter table goods2
drop constraint `goods2_chk_1`;

alter table goods2
add constraint check_quantity check (quantity > 0)
;

alter table goods2
drop constraint `goods2_chk_2`;

alter table goods2
add constraint check_in_stock check (in_stock in ('Y','N','P'))
;

alter table goods2
drop constraint check_in_stock
;

alter table goods2
drop constraint check_quantity
;
