-- 🔗 Problem Link:
-- https://leetcode.com/problems/customers-who-bought-all-products/

-- 🧾 Problem Summary:
-- Find customers who bought all the products available in the Product table.

-- 🧠 Approach:
-- - Step 1: Group purchases by customer_id
-- - Step 2: Count distinct product_key bought by each customer
-- - Step 3: Compare with total number of products
-- - Step 4: Keep only customers where counts match

-- 💡 Key Idea:
-- COUNT(DISTINCT ...) compared with total count (division pattern)

-- ❗ SQL Solution:
SELECT
    customer_id
FROM customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM product);

-- ✅ Notes:
-- - COUNT(DISTINCT product_key) ensures duplicates don’t inflate counts
-- - Subquery returns total number of unique products
-- - This is a classic "relational division" problem
-- - Alternative approach: NOT EXISTS with anti-join