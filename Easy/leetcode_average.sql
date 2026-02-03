-- https://leetcode.com/problems/average-time-of-process-per-machine/

/*
LeetCode 1661 — Average Time of Process per Machine

Table: Activity
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| machine_id     | int     |
| process_id     | int     |
| activity_type  | enum    | ('start', 'end')
| timestamp      | int     |
+----------------+---------+
(machine_id, process_id, activity_type) is the primary key.

Each process has a 'start' and an 'end' activity.
Find the average time each machine takes to complete a process.
Return the result table rounded to 3 decimal places.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Activity (
    machine_id INT,
    process_id INT,
    activity_type ENUM('start', 'end'),
    timestamp INT,
    PRIMARY KEY (machine_id, process_id, activity_type)
);

-- ❗ Your SQL Solution Below
SELECT
    a.machine_id,
    ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
FROM Activity a
JOIN Activity b
    ON a.machine_id = b.machine_id
   AND a.process_id = b.process_id
   AND a.activity_type = 'start'
   AND b.activity_type = 'end'
GROUP BY a.machine_id;
