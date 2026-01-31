-- https://leetcode.com/problems/recyclable-and-low-fat-products/description/?envType=study-plan-v2&envId=top-sql-50

/*
Find products that are both low fat and recyclable.

Table: Products
+-------------+----------+------------+
| product_id  | low_fats | recyclable |
+-------------+----------+------------+

Return all product_id values where
- low_fats = 'Y'
- recyclable = 'Y'
*/

-- Table Creation (optional)
CREATE TABLE IF NOT EXISTS Products (
    product_id INT PRIMARY KEY,
    low_fats ENUM('Y','N'),
    recyclable ENUM('Y','N')
);

-- ❗ Your SQL Solution Below
SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';


SELECT product_id
FROM Products
WHERE (low_fats = 'Y' AND recyclable = 'Y')
   OR (low_fats = 'N' AND recyclable = 'N');