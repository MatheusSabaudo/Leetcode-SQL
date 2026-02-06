-- https://leetcode.com/problems/students-and-examinations/

/*
LeetCode 1280 — Students and Examinations

Tables:
Students
+------------+--------------+
| student_id | student_name |
+------------+--------------+

Subjects
+--------------+
| subject_name |
+--------------+

Examinations
+------------+--------------+
| student_id | subject_name |
+------------+--------------+

Find the number of times each student attended each exam.
Return the result table ordered by student_id and subject_name.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Subjects (
    subject_name VARCHAR(50) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Examinations (
    student_id INT,
    subject_name VARCHAR(50)
);

-- ❗ Your SQL Solution Below
SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM 
    Students s
CROSS JOIN 
    Subjects sub
LEFT JOIN 
    Examinations e 
    ON s.student_id = e.student_id 
    AND sub.subject_name = e.subject_name
GROUP BY 
    s.student_id, 
    s.student_name, 
    sub.subject_name
ORDER BY 
    s.student_id, 
    sub.subject_name;