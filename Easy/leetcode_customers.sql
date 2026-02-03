-- https://leetcode.com/problems/customers-who-visited-but-did-not-make-any-transactions/

/*
LeetCode 1581 — Customers Who Visited but Did Not Make Any Transactions

Table: Visits
+----------+-------------+
| visit_id | customer_id |
+----------+-------------+
visit_id is the primary key.

Table: Transactions
+----------------+----------+--------+
| transaction_id | visit_id | amount |
+----------------+----------+--------+
transaction_id is the primary key.

Find the IDs of the users who visited the mall without making any transactions
and the number of times they made these types of visits.
Return the result table sorted in any order.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Visits (
    visit_id INT PRIMARY KEY,
    customer_id INT
);

CREATE TABLE IF NOT EXISTS Transactions (
    transaction_id INT PRIMARY KEY,
    visit_id INT,
    amount INT
);

-- ❗ Your SQL Solution Below
SELECT
    v.customer_id,
    COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
    ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id;
