-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/

/*
LeetCode 570 — Managers with at Least 5 Direct Reports

Tables:
Employee
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+

Find managers with at least five direct reports.
Return the result table in any order.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    managerId INT
);

-- ❗ Your SQL Solution Below
SELECT e.name
FROM Employee e
JOIN Employee m
ON e.id = m.managerId
GROUP BY e.id, e.name
HAVING COUNT(m.id) >= 5;