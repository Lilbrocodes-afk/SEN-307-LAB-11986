USE sen307_vugsen2411986;

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');


INSERT INTO Course
(course_code, course_title, credit_units, description, dept_id)
VALUES
('SEN307', 'Database Systems', 3,
'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),

('SEN301', 'Software Architecture', 3,
'Architectural styles, design patterns, microservices and how to structure large software systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),

('COS301', 'Operating Systems', 3,
'Processes, threads, CPU scheduling, memory management and file systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),

('COS305', 'Computer Networks', 3,
'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),

('AIN301', 'Introduction to Artificial Intelligence', 3,
'Intelligent agents, search algorithms, knowledge representation and reasoning.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),

('AIN305', 'Machine Learning', 3,
'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),

('AIN307', 'Natural Language Processing', 3,
'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),

('DTS301', 'Data Visualization and Analytics', 2,
'Exploratory data analysis, charts, dashboards and telling stories with data.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),

('DTS305', 'Big Data Technologies', 3,
'Distributed storage and processing of very large datasets with Hadoop and Spark.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),

('CYB301', 'Network Security', 3,
'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));


SELECT dept_id, dept_name FROM Department;

SELECT course_id, course_code FROM Course;

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', 1),
('VUA/ST/103', 'Dr Chinedu Eze', 'c.eze@vua.edu.ng', 2),
('VUA/ST/104', 'Dr Fatima Ibrahim', 'f.ibrahim@vua.edu.ng', 2),
('VUA/ST/105', 'Dr Ngozi Adeyemi', 'n.adeyemi@vua.edu.ng', 3),
('VUA/ST/106', 'Dr Tunde Bakare', 't.bakare@vua.edu.ng', 3),
('VUA/ST/107', 'Dr Grace Nwosu', 'g.nwosu@vua.edu.ng', 4),
('VUA/ST/108', 'Dr Emeka Okoro', 'e.okoro@vua.edu.ng', 4),
('VUA/ST/109', 'Dr Aisha Mohammed', 'a.mohammed@vua.edu.ng', 5),
('VUA/ST/110', 'Dr Samuel James', 's.james@vua.edu.ng', 5);

SELECT * FROM Lecturer;

INSERT INTO Student
(matric_no, full_name, gender, date_of_birth, dept_id)
VALUES
('VUG/SEN/24/11986', 'PHILLIP PAUL OLADEJO', 'M', '2005-01-16', 1),
('VUG/SEN/24/12001', 'Ada Obi', 'F', '2005-03-14', 1),
('VUG/SEN/24/12002', 'John Musa', 'M', '2004-11-02', 2),
('VUG/SEN/24/12003', 'Chidinma Eze', 'F', '2006-05-21', 3),
('VUG/SEN/24/12004', 'Ibrahim Yusuf', 'M', '2003-08-10', 4),
('VUG/SEN/24/12005', 'Blessing Okafor', 'F', '2007-02-18', 5),
('VUG/SEN/24/12006', 'Daniel Adewale', 'M', '2005-09-12', 1),
('VUG/SEN/24/12007', 'Fatima Bello', 'F', '2004-06-25', 2),
('VUG/SEN/24/12008', 'Emeka Nwosu', 'M', '2006-12-03', 3),
('VUG/SEN/24/12009', 'Grace Adebayo', 'F', '2003-04-17', 4),
('VUG/SEN/24/12010', 'Samuel Okoro', 'M', '2007-07-09', 5),
('VUG/SEN/24/12011', 'Aisha Mohammed', 'F', '2005-01-29', 1),
('VUG/SEN/24/12012', 'Tunde Bakare', 'M', '2004-10-15', 2),
('VUG/SEN/24/12013', 'Ngozi James', 'F', '2006-03-08', 3),
('VUG/SEN/24/12014', 'Peter Uche', 'M', '2003-11-20', 4),
('VUG/SEN/24/12015', 'Maryam Sule', 'F', '2007-05-11', 5),
('VUG/SEN/24/12016', 'David Chukwu', 'M', '2005-08-22', 1),
('VUG/SEN/24/12017', 'Esther Danjuma', 'F', '2004-02-06', 2),
('VUG/SEN/24/12018', 'Michael Ojo', 'M', '2006-09-19', 3),
('VUG/SEN/24/12019', 'Ruth Onyekachi', 'F', '2007-12-14', 4);

SELECT * FROM Student;

SELECT student_id, matric_no, full_name
FROM Student;

SELECT lecturer_id, full_name
FROM Lecturer;

INSERT INTO Enrolment (student_id, course_id) VALUES
(1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),
(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),
(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),
(8,4),(9,4),(10,4),(11,4),(12,4),(13,4),(14,4),
(15,5),(16,5),(17,5),(18,5),(19,5),(20,5),
(15,6),(16,6),(17,6),(18,6),(19,6),(20,6);

INSERT INTO Enrolment (student_id, course_id) VALUES
(1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),
(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),
(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),
(8,4),(9,4),(10,4),(11,4),(12,4),(13,4),(14,4),
(15,5),(16,5),(17,5),(18,5),(15,6),(16,6),(17,6),(18,6),
(1,7),(2,7),(3,7),(4,7);

INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1,1),
(1,2),
(2,3),
(3,4),
(4,5),
(5,6),
(6,7),
(7,8),
(8,9),
(9,10),
(10,1);

SELECT * FROM CourseAllocation;

SELECT matric_no, full_name, dept_id
FROM Student
WHERE matric_no = 'VUG/SEN/24/12001';

UPDATE Student
SET dept_id = 2
WHERE matric_no = 'VUG/SEN/24/12001';

UPDATE Student
SET dept_id = 2
WHERE matric_no = 'VUG/SEN/24/12001';

SELECT matric_no, full_name, dept_id
FROM Student
WHERE matric_no = 'VUG/SEN/24/12001';

INSERT INTO Department (dept_name)
VALUES ('Library and Information Science');

INSERT INTO Student (matric_no, full_name, dept_id)
VALUES (
'20239999',
'Transfer Student',
(SELECT dept_id FROM Department
WHERE dept_name = 'Library and Information Science')
);

SELECT * FROM Student
WHERE matric_no = '20239999';

DELETE FROM Department
WHERE dept_name = 'Library and Information Science';

UPDATE Student
SET dept_id = (
    SELECT dept_id
    FROM Department
    WHERE dept_name = 'Software Engineering'
)
WHERE matric_no = '20239999';

SELECT * FROM Department;

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL
SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL
SELECT 'Students', COUNT(*) FROM Student
UNION ALL
SELECT 'Courses', COUNT(*) FROM Course
UNION ALL
SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL
SELECT 'Allocations', COUNT(*) FROM CourseAllocation;