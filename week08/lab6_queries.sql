-- ============================================
-- VUA-SEN307 Lab 6: Aggregates and Subqueries
-- Name: OLADEJO PHILIP PAUL
-- Matric: VUG/SEN/24/11986
-- ============================================

USE sen307_vugsen2411986;

-- ============================================
-- TASK 1: Count students per course
-- Explanation: Counts the students enrolled in
-- each course, including courses with zero
-- students, and sorts from highest to lowest.
-- ============================================

SELECT
    c.course_title,
    COUNT(e.student_id) AS total_students
FROM course c
LEFT JOIN enrolment e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
ORDER BY total_students DESC;

-- ============================================
-- TASK 2: Courses with more than 3 students
-- Explanation: GROUP BY groups enrolments by
-- course, while HAVING filters courses to
-- keep only those with more than 3 students.
-- ============================================

SELECT
    c.course_title,
    COUNT(e.student_id) AS total_students
FROM course c
LEFT JOIN enrolment e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 3
ORDER BY total_students DESC;

-- TASK 2: Courses with more than 5 students

SELECT
    c.course_title,
    COUNT(e.student_id) AS total_students
FROM course c
LEFT JOIN enrolment e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 5
ORDER BY total_students DESC;

-- TASK 2: Courses with more than 7 students

SELECT
    c.course_title,
    COUNT(e.student_id) AS total_students
FROM course c
LEFT JOIN enrolment e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 7
ORDER BY total_students DESC;

-- ============================================
-- TASK 3: Average courses per student
-- Explanation: First counts courses for each
-- student, including those with zero courses.
-- Then calculates the average of those counts.
-- ============================================

SELECT ROUND(AVG(course_count), 2) AS average_courses_per_student
FROM (
    SELECT
        s.student_id,
        COUNT(e.course_id) AS course_count
    FROM student s
    LEFT JOIN enrolment e
        ON s.student_id = e.student_id
    GROUP BY s.student_id
) AS per_student;

-- ============================================
-- TASK 4: Students not enrolled in any course
-- Explanation: The subquery finds student IDs
-- in the enrolment table. NOT IN returns students
-- whose IDs are not in that list.
-- ============================================

SELECT
    s.student_id,
    s.matric_no,
    s.full_name
FROM student s
WHERE s.student_id NOT IN (
    SELECT student_id
    FROM enrolment
)
ORDER BY s.full_name ASC;

-- ============================================
-- TASK 5: Students with highest enrolments
-- in each department
-- Explanation: Finds students whose enrolment
-- count is equal to the highest count in their
-- department. Ties are included.
-- ============================================

SELECT
    d.dept_name,
    s.full_name,
    COUNT(e.enrolment_id) AS total_enrolments
FROM student s
JOIN department d
    ON s.dept_id = d.dept_id
LEFT JOIN enrolment e
    ON s.student_id = e.student_id
GROUP BY
    s.student_id,
    s.full_name,
    d.dept_id,
    d.dept_name
HAVING COUNT(e.enrolment_id) = (
    SELECT MAX(student_totals.total_enrolments)
    FROM (
        SELECT
            s2.student_id,
            COUNT(e2.enrolment_id) AS total_enrolments
        FROM student s2
        LEFT JOIN enrolment e2
            ON s2.student_id = e2.student_id
        GROUP BY s2.student_id
    ) AS student_totals
    WHERE student_totals.student_id IN (
        SELECT s3.student_id
        FROM student s3
        WHERE s3.dept_id = d.dept_id
    )
)
ORDER BY d.dept_name ASC;