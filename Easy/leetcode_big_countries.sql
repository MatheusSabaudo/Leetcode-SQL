-- https://leetcode.com/problems/big-countries/

/*
LeetCode 595 — Big Countries

Table: World
+-------------+---------+
| name        | varchar |
| continent   | varchar |
| area        | int     |
| population  | int     |
| gdp         | bigint  |
+-------------+---------+

A country is considered big if:
- it has an area of at least 3,000,000, OR
- it has a population of at least 25,000,000

Return the name, population, and area of the big countries.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS World (
    name VARCHAR(50),
    continent VARCHAR(50),
    area INT,
    population INT,
    gdp BIGINT
);

-- ❗ Your SQL Solution Below
SELECT name, population, area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;
