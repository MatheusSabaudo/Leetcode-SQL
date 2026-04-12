-- 🔗 Problem Link:
-- https://leetcode.com/problems/biggest-single-number/

-- 🧾 Problem Summary:
-- Find the largest number that appears exactly once in the table.

-- 🧠 Approach:
-- - Step 1: Group numbers and keep only those with COUNT(*) = 1
-- - Step 2: From these unique numbers, take the maximum

-- 💡 Key Idea:
-- GROUP BY + HAVING to filter uniques, then MAX() to get the largest

-- ❗ SQL Solution:
SELECT 
    MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) t;

-- ✅ Notes:
-- - HAVING COUNT(*) = 1 filters numbers that appear only once
-- - Subquery isolates valid candidates before applying MAX()
-- - If no number appears once, result will be NULL (expected behavior)
-- - Classic pattern: filter group → then aggregate result