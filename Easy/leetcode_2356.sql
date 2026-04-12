-- 🔗 Problem Link:
-- https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/

-- 🧾 Problem Summary:
-- For each teacher, count how many unique subjects they teach.

-- 🧠 Approach:
-- - Step 1: Group by teacher_id
-- - Step 2: Count distinct subject_id to avoid duplicates

-- 💡 Key Idea:
-- GROUP BY + COUNT(DISTINCT column)

-- ❗ SQL Solution:
SELECT 
    teacher_id, 
    COUNT(DISTINCT subject_id) AS cnt
FROM teacher
GROUP BY teacher_id;

-- ✅ Notes:
-- - COUNT(DISTINCT subject_id) ensures duplicate subjects are not counted
-- - GROUP BY aggregates results per teacher
-- - Simple aggregation pattern, very common in interviews