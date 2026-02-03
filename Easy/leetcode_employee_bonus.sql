-- https://leetcode.com/problems/employee-bonus/

/*
LeetCode 577 — Employee Bonus

Table: Employee
+------------+---------+
| Column Name| Type    |
+------------+---------+
| empId      | int     |
| name       | varchar |
| supervisor | int     |
| salary     | int     |
+------------+---------+
empId is the primary key.

Table: Bonus
+------------+---------+
| Column Name| Type    |
+------------+---------+
| empId      | int     |
| bonus      | int     |
+------------+---------+
empId is the primary key.

Find the name and bonus of each employee whose bonus is less than 1000.
Include employees who did not receive a bonus.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Employee (
    empId INT PRIMARY KEY,
    name VARCHAR(255),
    supervisor INT,
    salary INT
);

CREATE TABLE IF NOT EXISTS Bonus (
    empId INT PRIMARY KEY,
    bonus INT
);

-- ❗ Your SQL Solution Below
SELECT
    e.name,
    b.bonus
FROM Employee e
LEFT JOIN Bonus b
    ON b.empId = e.empId
WHERE b.bonus < 1000
   OR b.bonus IS NULL;
