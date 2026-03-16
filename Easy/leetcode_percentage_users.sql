-- https://leetcode.com/problems/percentage-of-users-attended-a-contest/

/*
LeetCode 1633 — Percentage of Users Attended a Contest

Tables:
Users
+---------+---------+
| user_id | int     |
| user_name | varchar |
+---------+---------+

Register
+-------------+---------+
| contest_id  | int     |
| user_id     | int     |
+-------------+---------+

Find the percentage of users registered in each contest rounded to two decimals.
Return the result ordered by percentage in descending order.
In case of a tie, order it by contest_id in ascending order.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Users (
    user_id INT,
    user_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Register (
    contest_id INT,
    user_id INT
);

-- ❗ Your SQL Solution Below
SELECT 
    r.contest_id,
    ROUND(COUNT(r.user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;