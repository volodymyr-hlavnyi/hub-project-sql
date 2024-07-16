-- 1. Используя 
-- https://github.com/it-career-hub/MySQL_databases/blob/main/hr_data.sql, 
-- вывести список всех сотрудников. 
select last_name, first_name from hr.employees order by last_name; 
-- а так красивее вывод в одну клонку
select CONCAT(last_name, ' ', first_name) from hr.employees order by last_name; 

-- 2. Найти поле с зарплатой сотрудника. 
select salary from hr.employees order by salary DESC;

-- 3. Используя операторы case/when/end, 
-- изменить запрос так, чтобы результатом был только один столбец, 
-- назовите его SALARY_GROUP и оно будет принимать 
-- значение 1 если зп сотрудника больше 10000 и 
-- значение 0, если меньше.
select 
case
	when salary > 10000 then 1
    else 0
end as group_salary
from hr.employees order by group_salary;

-- 4. Ответить одним предложением: 
-- почему выводится только один столбец? 
-- потому что мы его только и выводим в select, 
-- больше нет других полей для вывода

-- 5. Изменить запрос, так, чтобы вывелось два столбца: 
-- имя сотрудника и 
-- новое поле SALARY_GROUP.
select 
	first_name,
    case
		when salary > 10000 then 1
        else 0
end group_salary
from hr.employees;


-- 6. Вывести среднюю зарплату для департаментов 
-- с номерами 60, 90 и 100 используя составное условие.
-- SELECT 
-- avg(CASE WHEN department_id = 60 
-- or department_id = 90 
-- or department_id = 100 THEN 
-- salary ELSE null END) as avg_dp60_90_100
-- FROM hr.employees;
select 
avg(case
 when department_id = 60 then salary
 else null
end) dep_avg_60,
avg(case
 when department_id = 90 then salary 
 else null
end) dep_avg_90,
avg(case
 when department_id = 100 then salary
 else null
end) dep_avg_100
from hr.employees
where department_id in (60, 90, 100);

-- 7. Разделить уровни (level) сотрудников 
-- на junior < 10000,
-- 10000<mid<15000, 
-- senior>15000 
-- в зависимости от их зарплаты. 
-- Вывести список сотрудников (first_name, last_name, level).
select 
	first_name, 
	last_name,
    case 
		when salary < 10000 then 'junior'
        when salary > 10000 and salary < 15000 then 'mid'
        when salary > 15000 then 'senior'
    end as level
from hr.employees;
-- lost rows with = 10000 and = 15000, 
-- but we have this task

-- 8. Посмотреть содержимое таблицы jobs. 
-- Написать запрос c использованием оператора 
-- case/when/end, который возвращает 2 столбца: 
-- job_id, payer_rank, где столбец payer_rank 
-- формируется по правилу: если максимальная 
-- зарплата больше 10000, то “high_payer”, 
-- если меньше, то “low payer”. 
select 
	job_id,
	case
		when max_salary > 10000 then 'high_payer'
        else 'low player'
	end 'payer_rank'
from hr.jobs order by job_id;

-- 9. Переписать этот запрос с и
-- спользованием оператора IF.
select 
	job_id,
	if(max_salary > 10000, 'high_player', 'low_plaer')
from hr.jobs order by job_id;

-- 10. Поменять предыдущий запрос так, 
-- чтобы выводилось 3 столбца, 
-- к двум существующим добавьте max_salary 
-- и отсортировать результат по убыванию. 
select 
	job_id,
	if(max_salary > 10000, 'high_player', 'low_plaer'),
    max_salary
from hr.jobs order by max_salary DESC;