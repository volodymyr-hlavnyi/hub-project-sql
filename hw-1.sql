-- 1 Написать запрос, возвращающий всех сотрудников, 
-- c job_id = IT_PROG.
select * from hr.employees where job_id = 'IT_PROG';

-- 2 Изменить запрос так, чтобы вывести всех сотрудников 
-- с job_id равной AD_VP
select * from hr.employees where job_id = 'AD_VP';

-- 3 Выполнить эти два запроса: 
-- SELECT * from hr.employees where job_id = 'IT_PROG';
SELECT * from hr.employees where job_id = 'AD_VP';

-- 4 Воспроизвести самостоятельно следующие запросы:
--   1 Найдите сотрудников, с зп от 10 000 до 20 000 (включая концы)
select * from hr.employees where (salary between 10000 and 20000);

--   2 Найдите сотрудников не из 60, 30 и 100 департамента
select * from hr.employees where not department_id in (60,30,100);

--  3 Найдите сотрудников у которых есть две буквы ll подряд в середине имени
select * from hr.employees where first_name like '%_ll_%';

--  4 Найдите сотрудников, у которых фамилия кончается на a
select * from hr.employees where last_name like '%a';

-- 5 Найти всех сотрудников с зарплатой выше 10000
select * from hr.employees where salary > 10000;

-- 6 Найти всех сотрудников, с зарплатой выше 10000 и 
-- чья фамилия начинается на букву L
select * from hr.employees where salary > 10000 and last_name like 'L%';

-- 7 Не выполняя запрос к базе данных, предсказать его результат:
-- select *  from hr.employees where salary > 10000 or salary <= 10000;
-- будет выборка где зп больше 10 000, от 10 001 или зп меньше или равна 10 000
-- т.е.это по сути вся выборка

-- 8 Ответить в 1 предложении: чем он будет отличаться 
-- от результата этого запроса?
-- select *  from hr.employees where salary > 10000 or salary < 10000;
-- исключаеться из выборки результат зп с = 10 000

-- Не выполняя запрос к базе, предсказать результат. 
-- select *  from hr.employees where salary > 10000 and salary < 5000;
-- будет пустая выборка т.к. "и" условие до 5000 и больше 10000 невозможное условие 
