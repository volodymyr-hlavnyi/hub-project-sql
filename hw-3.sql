use 310524ptm_volodymyr;
select database();

create table weather(
city varchar(20),
forecast_date date,
temperature int
);

select * from weather;

insert into weather (
city,
forecast_date,
temperature
)values(
'Berlin',
'2023-08-29',
30
);

insert into weather (
city,
forecast_date,
temperature
)values
('Kiew', '2023-09-10', 25),
('Wermelskirchen', '2023-09-10', 17),
('Munchen', '2023-09-11', 16)
;

select * from weather;

update weather
set temperature=26 
where city = 'Berlin';

update weather
set city='Paris'
where temperature > 25;

alter table weather
add column min_temp int;

update weather
set min_temp = 0;