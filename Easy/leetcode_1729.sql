-- 🔗 Problem Link:
-- https://leetcode.com/problems/find-followers-count/

-- 🧾 Problem Summary:
-- For each user, count how many followers they have.

-- 🧠 Approach:
-- - Step 1: Group rows by user_id
-- - Step 2: Count follower_id per user
-- - Step 3: Sort results by user_id

-- 💡 Key Idea:
-- GROUP BY + COUNT() for aggregation + ORDER BY for sorting

-- ❗ SQL Solution:
SELECT
    user_id,
    COUNT(follower_id) AS followers_count
FROM followers
GROUP BY user_id
ORDER BY user_id ASC;

-- ✅ Notes:
-- - COUNT(follower_id) counts number of followers per user
-- - GROUP BY aggregates rows per user_id
-- - ORDER BY ensures output is sorted as required
-- - If follower_id could be NULL, COUNT(*) might be safer