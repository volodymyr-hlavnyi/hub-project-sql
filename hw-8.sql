-- 1
use Students;

-- 2 Найдите самого старшего студента
select 
	first_name,
    age
from Students
order by age desc limit 1;

-- 3 Найдите самого старшего 
-- преподавателя
select
	name,
    age
from Teachers
order by age desc limit 1;
;
 
-- 4 Выведите список 
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
	from
		Teachers as t
	left join Teachers2Competencies as tc
	on
		t.id = tc.teacher_id
) as tab1
group by
	t_name
order by
	count_comp desc
;

-- 5 Выведите список курсов с 
-- количеством студентов в каждом
select 
	c.title as material,
	count(s.id) as count_students
from Students2Courses sc
left join Students s 
	on sc.student_id = s.id 
LEFT join Courses c 
	on sc.course_id = c.id
GROUP by c.title 
;



-- 6 Выведите список студентов, 
-- с количеством курсов, 
-- посещаемых каждым студентом.
SELECT 
	s.first_name as student,
	count(sc.student_id) as count_subject
from Students2Courses sc
right join Students s 
	on sc.student_id = s.id 
group by sc.student_id
order by count_subject 
;