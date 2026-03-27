-- https://leetcode.com/problems/monthly-transactions-i/

/*
LeetCode — Monthly Transactions I

Table: Transactions
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| id             | int     |
| country        | varchar |
| state          | enum    |
| amount         | int     |
| trans_date     | date    |
+----------------+---------+

Return:
- month
- country
- trans_count
- approved_count
- trans_total_amount
- approved_total_amount
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Transactions (
    id INT,
    country VARCHAR(50),
    state VARCHAR(20),
    amount INT,
    trans_date DATE
);

-- ❗ Your SQL Solution Below
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country;