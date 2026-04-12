-- 🔗 Problem Link:
-- https://leetcode.com/problems/product-sales-analysis-iii/

-- 🧾 Problem Summary:
-- For each product, return the first year it was sold along with its quantity and price in that year.

-- 🧠 Approach:
-- - Step 1: Find the earliest (MIN) year for each product_id
-- - Step 2: Join this result back to the Sales table
-- - Step 3: Retrieve the full row (quantity, price) for that first year

-- 💡 Key Idea:
-- Subquery + JOIN to recover full row after aggregation

-- ❗ SQL Solution:
SELECT
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM sales s
JOIN (
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM sales
    GROUP BY product_id
) t
ON s.product_id = t.product_id
AND s.year = t.first_year;

-- ✅ Notes:
-- - MIN(year) finds the first occurrence per product
-- - We need a JOIN because aggregation loses other columns (quantity, price)
-- - This is a classic "find first row per group" pattern
-- - Alternative solution: use ROW_NUMBER() window function