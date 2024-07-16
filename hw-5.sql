use world;
select database();
-- Посмотреть на таблицы city, country из базы world. 
-- В каждой таблице есть поле название (Name) и население (Population). 
-- Поле Name в одной таблице означает название города, а в другой - название страны. 

select name, Population from city;
select name, population from country;

-- Написать запрос с помощью UNION, который выводит список названий всех городов и 
-- стран с их населением. Итоговая выборка должна содержать два столбца: Name, Population. 
select 
	name,
    population
from city
union all
select
	name,
    population
from country;

-- 3 Посмотреть на таблицы в базе world и объяснить ограничения нескольких 
-- столбцов - ответить 1 предложением.
show create table city;
-- ID - NOT NULL

-- 4. Далее работаем на локальном сервере. 
-- Создать новую таблицу citizen, которая содержит следующие поля: 
-- уникальное автоинкрементное, номер соц страхования, имя, фамилию и емейл. 
use 310524ptm_volodymyr;
select database();
-- drop table citizen;
create table citizen (
	`id` int NOT NULL AUTO_INCREMENT,
	`number_se` int,
	`name` varchar(30),
    `sername` varchar(30),
	`email` varchar(100),
    PRIMARY KEY (`id`)
    )
    ;
    
-- 5 На вашем локальном сервере в любой базе создать таблицу 
-- без ограничений (любую, можно взять с урока). 
create table citizen (
	`id` int NOT NULL AUTO_INCREMENT,
	`number_se` int,
	`name` varchar(30),
    `sername` varchar(30),
	`email` varchar(100),
    PRIMARY KEY (`id`)
    )
    ;


-- 6 Добавить в таблицу 5 значений. 
-- Добавить 3 человека с одинаковыми именами и 2 человека без lastname
insert into citizen (
	number_se,
    name,
    sername,
    email) value 
    (123, 'John',   'Brown', 'mail@mail.com'),
    (130, 'Melani', 'Brown', 'mail@mail.com'),
    (230, 'Andreas','Green', 'mail@mail.com'),
    (320, 'John',   '', 'mail@mail.com'),
    (600, 'John',   '', 'mail@mail.com')
;
-- select * from citizen;

-- 7 Использовать оператор alter table … modify , 
-- чтобы добавить ограничение not null на поле firstname и lastname. 
alter table citizen
modify sername varchar(30) not null;
alter table citizen
modify name varchar(30) not null;

-- 8 Добавить ограничение unique для пары firstname\lastname. 
alter table citizen
add constraint uniq_name_sername unique (name, sername);
-- error this

-- 9 Удалить таблицу из базы и пересоздать ее, 
-- модифицировав запрос add table так, чтобы он учитывал 
-- ограничения (см примеры из класса).
drop table citizen;

create table citizen (
	`id` int NOT NULL AUTO_INCREMENT primary key,
	`number_se` int,
	`name` varchar(30) NOT NULL,
    `sername` varchar(30) NOT NULL,
	`email` varchar(100) default null,
    unique (name, sername)
    )
    ;

-- 10 Добавить правильные и неправильные данные (нарушающие 
-- и не нарушающие ограничения). 

-- error data
insert into citizen (
	number_se,
    name,
    sername,
    email) value 
    (123, 'John',   'Brown', 'mail@mail.com'),
    (130, 'Melani', 'Brown', 'mail@mail.com'),
    (230, 'Andreas','Green', 'mail@mail.com'),
    (320, 'John',   '', 'mail@mail.com'),
    (600, 'John',   '', 'mail@mail.com')
;

-- correct data
insert into citizen (
	number_se,
    name,
    sername,
    email) value 
    (123, 'John',   'Brown',  'mail@mail.com'),
    (130, 'Melani', 'Brown',  'mai1@mail.com'),
    (230, 'Andreas','Green',  'ma345@mail.com'),
    (320, 'John',   'Blues',  'ma@mail.org'),
    (600, 'John',   'Yelowing', 'john@mail.biz')
;
select * from citizen;