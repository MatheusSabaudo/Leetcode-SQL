-- https://leetcode.com/problems/not-boring-movies/
/*
LeetCode 620 — Not Boring Movies

Table: Cinema
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| id             | int     |
| movie          | varchar |
| description    | varchar |
| rating         | float   |
+----------------+---------+

Write a solution to report the movies with an odd-numbered ID and 
a description that is not "boring". Return the result table ordered 
by rating in descending order.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Cinema (
    id INT,
    movie VARCHAR(255),
    description VARCHAR(255),
    rating FLOAT
);

-- ❗ Your SQL Solution Below
SELECT id, movie, description, rating
FROM cinema
WHERE id % 2 != 0 AND description != 'boring'
ORDER BY rating DESC;