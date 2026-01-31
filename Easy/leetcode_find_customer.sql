-- https://leetcode.com/problems/find-customer-referee/description/?envType=study-plan-v2&envId=top-sql-50

/*
LeetCode 584 — Find Customer Referee

Table: Customer
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| ...                             

Find the names of the customers who are either:
- not referred by anyone (referee_id IS NULL), or
- referred by any customer whose id != 2.

Return result in any order.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Customer (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    referee_id INT
);

-- Sample Data
-- INSERT INTO Customer VALUES (...);

-- ❗ Your SQL Solution Below
SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id != 2;

SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id != 2;