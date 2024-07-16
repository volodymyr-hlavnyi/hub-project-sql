use Students;

-- Найдите самого старшего студента
select 
	first_name,
    age
from Students
order by age desc limit 1;

-- Найдите самого старшего 
-- преподавателя
select
	name,
    age
from Teachers
order by age desc limit 1;
;
 
-- Выведите список 
-- преподавателей с количеством 
-- компетенций у каждого
select 
	t_name,
    count(tc_c) as count_comp
from
(
select
	t.name as t_name,
    tc.competencies_id as tc_c
from Teachers as t
left join Teachers2Competencies as tc
	on t.id = tc.teacher_id
) as tab1
group by t_name
order by count_comp desc
;

-- Выведите список курсов с 
-- количеством студентов в каждом
