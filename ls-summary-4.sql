SELECT 
	e.first_name,
	e.last_name, 
	e.salary 
from employees e 
where salary > 
(
select 
	avg(salary)
from employees e2 
)
order by e.salary DESC 
;

SELECT 
-- 	e.first_name as f,
-- 	e.last_name as n,
-- 	e.department_id id_dep 
	count(e.department_id) as count_dep
from employees e 
group by e.department_id 
order by count_dep desc
;

SELECT 
	e.first_name as fn,
	e.last_name as ln, 
	tab.department_id as dep,
	tab.max_salary as max_salary
FROM hr.employees e 
join
(
select
	department_id,
	max(salary) as max_salary
from hr.employees e2 
group by department_id 
) as tab
on e.department_id = tab.department_id

use Students;
-- Вывести имена всех преподавателей 
-- с их компетенциями. 
-- Подсказка: сначала выведите имена 
-- преподавателей с id компетенции. 
-- А потом поменяйте запрос так 
-- (добавив еще один джойн), 
-- чтобы выводились имена преподавателей 
-- и названия компетенций. 
SELECT 
	t.name,
-- 	tc.competencies_id,
	c.title
from Teachers t
join Teachers2Competencies tc 
	on t.id = tc.teacher_id
join Courses c
	on t.id = c.teacher_id 
;

-- 4
SELECT 
	t.name,
-- 	tc.competencies_id,
	c.title
from Teachers t
left join Teachers2Competencies tc 
	on t.id = tc.teacher_id
left join Courses c
	on t.id = c.teacher_id 
where c.title is NULL
;

-- 5
SELECT 
	s.first_name,
	sc.course_id 
from Students s
left join Students2Courses sc 
	on s.id = sc.student_id 
where sc.student_id is NULL 
	;

-- 6
SELECT 
	c.title,
	sc.course_id 
from Courses c 
left join Students2Courses sc 
	on c.id = sc.student_id 
where sc.course_id is NULL 
;

-- 7
select 
 	t.name,
 	c.title 
from Teachers2Competencies tc 
left join Courses c 
	on tc.teacher_id = c.teacher_id 
left join Teachers t 
	on tc.teacher_id = t.id 
-- where c.teacher_id is null
	;

-- 7 (class)
select 
	t.name 
from Teachers as t
left join Teachers2Competencies as tc
	on t.id= tc.teacher_id
where tc.competencies_id is null;


-- 8
use Students;
SELECT 
 	s.first_name, 
-- 	c.headman_id,
	c.title,
	s2.first_name as hm
from Students2Courses sc 
left join Students s 
	on sc.student_id = s.id 
left join Courses c 
	on sc.course_id = c.id 
left join Students s2 
	on s2.id = c.headman_id 
;

-- 8 (class)
SELECT 
	c.title,
	s.first_name 
from Courses c 
join Students s 
	on c.headman_id = s.id 
;

-- Отобразить имена студента и старост, и название курса, на котором они обучаются
use Students;
SELECT s.first_name as stud_name, c.title as course_name, st.first_name as headman_name
FROM Students as s
JOIN Students2Courses as sc
	ON s.id = sc.student_id
JOIN Courses as c
	ON sc.course_id = c.id
JOIN Students st
	ON c.headman_id = st.id;


-- 1 
use hr;
SELECT 
	e.department_id,
	count(*) as num_dep
from employees e 
group by department_id 
order by num_dep desc
;

-- HAVING
use hr;
SELECT 
	e.department_id,
	count(*) as num_dep
from employees e 
group by department_id 
HAVING num_dep >= 6
order by num_dep desc
;