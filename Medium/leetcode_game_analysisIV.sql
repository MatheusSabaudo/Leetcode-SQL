-- https://leetcode.com/problems/game-play-analysis-iv/

/*
LeetCode — Game Play Analysis IV (Problem 550)

Table: Activity
+------------+---------+
| Column Name| Type    |
+------------+---------+
| player_id  | int     |
| device_id  | int     |
| event_date | date    |
| games_played | int   |
+------------+---------+

Return:
- fraction: the fraction of players who logged in the day after their first login, rounded to 2 decimals
*/

-- ❗ SQL Solution
SELECT
    ROUND(
        COUNT(player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM (
    SELECT
        player_id,
        event_date,
        LEAD(event_date) OVER(PARTITION BY player_id ORDER BY event_date) AS next_login,
        MIN(event_date) OVER(PARTITION BY player_id) AS first_login
    FROM Activity
) t
WHERE DATEDIFF(next_login, event_date) = 1
AND event_date = first_login;