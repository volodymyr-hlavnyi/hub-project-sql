use 310524ptm_volodymyr;
select database();
SHOW VARIABLES LIKE 'autocommit';

select * from goods;

delete from goods
where in_stock = 'N';

commit;

alter table goods 
add price int;

select Price from goods;
select price from goods;

update goods
set price=0;

update goods
set price=null;

alter table goods
modify price numeric(10,2); -- 10.2 ? diff?

alter table goods 
add price_numeric numeric(10.2);

select * from goods;

update goods
set price=1153.234;

update goods
set price_numeric=1153.234;

describe goods;

alter table goods
modify price_numeric numeric(10,2);

alter table goods
drop column price_numeric;

set SQL_SAFE_UPDATES = 0;
SHOW VARIABLES LIKE 'sql_safe_updates';

alter table goods
modify price int;

alter table goods
modify price varchar(15);

alter table goods
change price item_price varchar(15);

alter table goods
modify item_price numeric(10,2);

alter table goods
drop column item_price;

select * from goods;

create table customers (
 id int not null auto_increment primary key,
 firstname varchar(30) not null,
 sername varchar(30) not null,
 lastname varchar(30),
 street varchar(50),
 postcode varchar(10),
 city varchar(20),
 country varchar(30),
 email varchar(100) not null,
 date_registration datetime
);

-- drop table customers;
drop table orders;

create table orders (
 id int not null auto_increment primary key,
 date_creation datetime,
 name_order varchar(20),
 description_goods varchar(20),
 photo_ref blob,
 cost decimal(10,2),
 customer_id int,
 foreign key (customer_id) 
	references customers(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

describe customers;
describe orders;

insert into customers (
firstname, sername, lastname, 
street, postcode, city, country,
email,date_registration
)values
('Jhon', 'Black', '',
'Lenina', '15456', 'Munchen', 'DE',
'email@mail.com', '2024-06-20 11:57:00'),
('Stefany', 'Morgan', 'II',
'oberhausen', '89524', 'Rostok', 'DE',
'stefany@mail.com', '2024-06-20 11:58:00'),
('Mark', 'Crystalinger', 'III',
'keiptown', 'en-4578', 'London', 'ENG',
'mark.crys@mailsupper.com', '2024-06-20 11:59:00');

select * from customers;

select * from orders;

describe orders;

alter table orders
modify description_goods varchar(100);

insert into orders (
date_creation, name_order, 
description_goods, 
cost, customer_id ) 
values 
('2024-06-20 12:04', 'bike',
'small bike for kinders (blue) size 5"',
158.70, 1),
('2024-06-20 12:07', 'motobike',
'supper motobike honda crf 600 rr',
7250.00, 1),
('2024-06-21 10:56', 'bike',
'small bike for kinders (blue) size 5"',
150.0, 2)
;

select * from customers;

select * from orders;

select 
	customers.firstname, 
    customers.sername,
    customers.lastname,
    orders.name_order,
    orders.cost
from customers
left join orders
	on customers.id = orders.customer_id;
    
select 
	customers.firstname, 
    customers.sername,
    customers.lastname,
    orders.cost,
    orders.description_goods
from customers
cross join orders
	on customers.id = orders.customer_id;
    
alter table customers
add last_modified datetime default now();

alter table orders
add column discounter_price numeric(10,2);

set SQL_SAFE_UPDATES = 0;
    
update orders
set discounter_price = discounter_price * 0.9;