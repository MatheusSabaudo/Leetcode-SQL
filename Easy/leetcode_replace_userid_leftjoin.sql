-- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/

/*
LeetCode 1378 — Replace Employee ID With The Unique Identifier

Tables:
Employees
+----+------+
| id | name |
+----+------+

EmployeeUNI
+----+-----------+
| id | unique_id |
+----+-----------+

Show the unique ID of each user.
If a user does not have a unique ID, show null.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Employees (
    id INT,
    name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS EmployeeUNI (
    id INT,
    unique_id INT
);

-- ❗ Your SQL Solution Below
SELECT eu.unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu
ON e.id = eu.id;
