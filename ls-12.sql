use Students;
-- Выведите имена студентов 
-- и id курса, которые они проходят
select
	st.first_name,
    st.last_name,
    st2c.course_id
from Students as st
join Students2Courses as st2c
	on st.id = st2c.student_id
;

-- with names and course name
select
	st.first_name,
--     st.last_name,
--     st2c.course_id,
    cr.title
from Students as st
join Students2Courses as st2c
	on st.id = st2c.student_id
join Courses as cr
	on st2c.course_id = cr.id
;

-- teachers with competences
select
	t.name,
--     comp.title,
    tc.competencies_id
from Teachers as t
left join Teachers2Competencies as tc
	on t.id = tc.teacher_id
left join Competencies as comp
	on tc.id = comp.id
;

-- teacher with Null
select
	t.name,
--     comp.title,
    tc.competencies_id
from Teachers as t
left join Teachers2Competencies as tc
	on t.id = tc.teacher_id
left join Competencies as comp
	on tc.id = comp.id
where tc.competencies_id is NULL
;

-- null course
select
	st.first_name,
    st2c.student_id,
    st2c.course_id
from Students as st
left join Students2Courses as st2c
	on st.id = st2c.student_id
where course_id is NULL
;

select 
	cr.title,
    st2c.course_id
from Courses as cr
left join Students2Courses as st2c
	on cr.id = st2c.id
;
    




