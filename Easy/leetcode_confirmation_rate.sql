-- https://leetcode.com/problems/confirmation-rate/

/*
LeetCode 1934 — Confirmation Rate

Tables:
Signups
+---------+---------------------+
| user_id | time_stamp          |
+---------+---------------------+

Confirmations
+---------+---------------------+-----------+
| user_id | time_stamp          | action    |
+---------+---------------------+-----------+

Find the confirmation rate of each user.
Confirmation rate = number of 'confirmed' messages / total confirmation messages.
If no confirmation messages requested, rate is 0.
Round to two decimal places.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Signups (
    user_id INT PRIMARY KEY,
    time_stamp DATETIME
);

CREATE TABLE IF NOT EXISTS Confirmations (
    user_id INT,
    time_stamp DATETIME,
    action ENUM('confirmed', 'timeout'),
    PRIMARY KEY (user_id, time_stamp)
);

-- ❗ Your SQL Solution Below
SELECT 
    s.user_id,
    ROUND(
        IFNULL(
            SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(c.action),
            0
        ),
        2
    ) AS confirmation_rate
FROM 
    Signups s
LEFT JOIN 
    Confirmations c
    ON s.user_id = c.user_id
GROUP BY 
    s.user_id;