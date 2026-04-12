-- 🔗 Problem Link:
-- https://leetcode.com/problems/user-activity-for-the-past-30-days-i/

-- 🧾 Problem Summary:
-- Count the number of unique active users per day in the last 30 days ending on 2019-07-27.

-- 🧠 Approach:
-- - Step 1: Filter rows within the required 30-day date range
-- - Step 2: Group by activity_date
-- - Step 3: Count distinct user_id per day

-- 💡 Key Idea:
-- Date filtering + GROUP BY + COUNT(DISTINCT ...)

-- ❗ SQL Solution:
SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;

-- ✅ Notes:
-- - COUNT(DISTINCT user_id) ensures each user is counted once per day
-- - BETWEEN is inclusive, covering the full 30-day window
-- - GROUP BY activity_date aggregates results per day
-- - Alias "day" matches expected output format