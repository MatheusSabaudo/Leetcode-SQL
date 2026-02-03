-- https://leetcode.com/problems/rising-temperature/

/*
LeetCode 197 — Rising Temperature

Table: Weather
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the primary key.
There are no duplicate recordDate values.

Find all dates' id with higher temperatures compared to the previous day.
Return the result table in any order.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Weather (
    id INT PRIMARY KEY,
    recordDate DATE,
    temperature INT
);

-- ❗ Your SQL Solution Below
SELECT w1.id
FROM Weather w1
JOIN Weather w2
    ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;