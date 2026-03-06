-- https://leetcode.com/problems/average-selling-price/
/*
LeetCode 1251 — Average Selling Price

Table: Prices
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| start_date    | date    |
| end_date      | date    |
| price         | int     |
+---------------+---------+

Table: UnitsSold
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| purchase_date | date    |
| units         | int     |
+---------------+---------+

Write a solution to find the average selling price for each product. 
average_price should be rounded to 2 decimal places. If a product does 
not have any sold units, its average_price should be 0.
Return the result table in any order.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Prices (
    product_id INT,
    start_date DATE,
    end_date DATE,
    price INT
);

CREATE TABLE IF NOT EXISTS UnitsSold (
    product_id INT,
    purchase_date DATE,
    units INT
);

-- ❗ Your SQL Solution Below
SELECT
    p.product_id,
    CASE
        WHEN SUM(u.units) = 0 OR SUM(u.units) IS NULL THEN 0
        ELSE ROUND(SUM(p.price * u.units) / SUM(u.units), 2)
    END AS average_price
FROM Prices p
LEFT JOIN UnitsSold u 
    ON p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;