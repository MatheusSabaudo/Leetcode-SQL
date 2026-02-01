-- https://leetcode.com/problems/article-views-i/

/*
LeetCode 1148 — Article Views I

Table: Views
+------------+------+
| article_id | int  |
| author_id  | int  |
| viewer_id  | int  |
| view_date  | date |
+------------+------+

Find all authors that viewed at least one of their own articles.
Return the result sorted by author_id.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Views (
    article_id INT,
    author_id INT,
    viewer_id INT,
    view_date DATE
);

-- ❗ Your SQL Solution Below
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id;
