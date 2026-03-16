-- https://leetcode.com/problems/project-employees-i/

/*
LeetCode 1075 — Project Employees I

Tables:

Project
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+

Employee
+------------------+---------+
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |
+------------------+---------+

For each project_id, calculate the average experience_years of the employees working on that project.
Return the result table with project_id and average_years rounded to 2 decimal places.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Project (
    project_id INT,
    employee_id INT
);

CREATE TABLE IF NOT EXISTS Employee (
    employee_id INT,
    name VARCHAR(50),
    experience_years INT
);

-- ❗ Your SQL Solution Below
SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY p.project_id;