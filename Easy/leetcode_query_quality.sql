-- https://leetcode.com/problems/queries-quality-and-percentage/

/*
LeetCode 1211 — Queries Quality and Percentage

Table:

Queries
+-------------+---------+
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |
+-------------+---------+

For each query_name, calculate:
1. quality = average of (rating / position)
2. poor_query_percentage = percentage of queries with rating < 3

Return the result table with:
- query_name
- quality (rounded to 2 decimal places)
- poor_query_percentage (rounded to 2 decimal places)
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Queries (
    query_name VARCHAR(50),
    result VARCHAR(50),
    position INT,
    rating INT
);

-- ❗ Your SQL Solution Below
WITH quality AS (
    SELECT
        query_name,
        ROUND(AVG(rating / position), 2) AS quality
    FROM Queries
    GROUP BY query_name
),
poor_query_percentage AS (
    SELECT
        query_name,
        ROUND(
            SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
            2
        ) AS poor_query_percentage
    FROM Queries
    GROUP BY query_name
)

SELECT 
    q.query_name,
    q.quality,
    p.poor_query_percentage
FROM quality q
JOIN poor_query_percentage p
ON q.query_name = p.query_name;