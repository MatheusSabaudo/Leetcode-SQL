-- 🔗 Problem Link:
-- https://leetcode.com/problems/classes-more-than-5-students/

-- 🧾 Problem Summary:
-- Find all classes that have at least 5 students enrolled.

-- 🧠 Approach:
-- - Step 1: Group rows by class
-- - Step 2: Count number of students per class
-- - Step 3: Filter classes with count >= 5 using HAVING

-- 💡 Key Idea:
-- GROUP BY + HAVING for filtering aggregated results

-- ❗ SQL Solution:
SELECT
    class
FROM courses
GROUP BY class
HAVING COUNT(student) >= 5;

-- ✅ Notes:
-- - GROUP BY class aggregates students per class
-- - HAVING is required (not WHERE) because we filter on an aggregate
-- - COUNT(student) counts non-null student entries
-- - Common interview pattern: aggregation + filtering