-- https://leetcode.com/problems/product-sales-analysis-i/

/*
LeetCode 1068 — Product Sales Analysis I

Tables:
Sales
+------------+---------+
| sale_id    | int     |
| product_id | int     |
| year       | int     |
| quantity   | int     |
| price      | int     |
+------------+---------+

Product
+------------+---------+
| product_id | int     |
| product_name | varchar |
+------------+---------+

Return the product name, year, and price for each sale.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Sales (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT
);

CREATE TABLE IF NOT EXISTS Product (
    product_id INT,
    product_name VARCHAR(50)
);

-- ❗ Your SQL Solution Below
SELECT p.product_name, s.year, s.price
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id;
