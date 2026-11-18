
-- ============================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: OLADEJO PHILIP PAUL
-- Matric: VUG/SEN/24/11986
-- ============================================

USE sen307_vugsen2411986;


-- TASK 1: Students in Software Engineering

-- This query retrieves students in the Software
-- Engineering department and sorts their names A-Z.

SELECT
    s.student_id,
    s.matric_no,
    s.full_name,
    d.dept_name
FROM student s
INNER JOIN department d
    ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;

DESCRIBE course;

DESCRIBE courseallocation;

DESCRIBE lecturer;


-- ============================================
-- TASK 2: Courses with their lecturers
-- Explanation: This query displays every course
-- alongside the name of its assigned lecturer.
-- INNER JOIN connects the three tables.
-- ============================================

SELECT
    c.course_id,
    c.course_code,
    c.course_title,
    l.full_name AS lecturer_name
FROM course c
INNER JOIN courseallocation ca
    ON c.course_id = ca.course_id
INNER JOIN lecturer l
    ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_title ASC;

DESCRIBE enrolment;


-- ============================================
-- TASK 3: Students and their courses (LEFT JOIN)
-- Explanation: This query displays every student
-- and their enrolled courses. Students without
-- enrolments are also displayed with NULL values.
-- ============================================

SELECT
    s.student_id,
    s.full_name,
    c.course_title
FROM student s
LEFT JOIN enrolment e
    ON s.student_id = e.student_id
LEFT JOIN course c
    ON e.course_id = c.course_id
ORDER BY s.full_name ASC;

SELECT
    s.student_id,
    s.full_name,
    c.course_title
FROM student s
LEFT JOIN enrolment e
    ON s.student_id = e.student_id
LEFT JOIN course c
    ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name ASC;

SELECT COUNT(*) AS total_students
FROM student;

DESCRIBE enrolment;


-- TASK 3: Check all students and their courses

SELECT
    s.student_id,
    s.full_name,
    e.enrolment_id,
    c.course_title
FROM student s
LEFT JOIN enrolment e
    ON s.student_id = e.student_id
LEFT JOIN course c
    ON e.course_id = c.course_id
ORDER BY s.full_name ASC;

-- Task 3: Students without enrolments

SELECT
    s.student_id,
    s.full_name,
    c.course_title
FROM student s
LEFT JOIN enrolment e
    ON s.student_id = e.student_id
LEFT JOIN course c
    ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name ASC;



-- ============================================
-- TASK 4: Filtering with AND, IN and BETWEEN
-- Explanation: Retrieves female students in
-- selected departments born between 2004 and 2005.
-- ============================================

SELECT
    s.student_id,
    s.full_name,
    s.gender,
    s.date_of_birth,
    d.dept_name
FROM student s
INNER JOIN department d
    ON s.dept_id = d.dept_id
WHERE s.gender = 'F'
AND d.dept_name IN ('Software Engineering', 'Artificial Intelligence')
AND s.date_of_birth BETWEEN '2004-01-01' AND '2005-12-31'
ORDER BY s.full_name ASC;


-- ============================================
-- TASK 5: Paginating enrolments
-- Explanation: LIMIT displays 10 records at a time.
-- OFFSET determines where the records begin.
-- ============================================

-- PAGE 1: Rows 1-10

SELECT *
FROM enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 0;


-- PAGE 2: Rows 11-20

SELECT *
FROM enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 10;



-- ============================================
-- OPTIONAL CHALLENGE: RIGHT JOIN
-- Explanation: This query uses RIGHT JOIN to
-- display every student and their courses,
-- including students without enrolments.
-- LEFT JOIN is easier to read in this example.
-- ============================================

SELECT
    s.student_id,
    s.full_name,
    c.course_title
FROM enrolment e
RIGHT JOIN student s
    ON e.student_id = s.student_id
LEFT JOIN course c
    ON e.course_id = c.course_id
ORDER BY s.full_name ASC;


