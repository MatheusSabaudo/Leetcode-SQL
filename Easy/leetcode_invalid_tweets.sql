-- https://leetcode.com/problems/invalid-tweets/

/*
LeetCode 1683 — Invalid Tweets

Table: Tweets
+----------+---------+
| tweet_id | int     |
| content  | varchar |
+----------+---------+

A tweet is invalid if the length of its content is strictly greater than 15.
Return the tweet_id of all invalid tweets.
*/

-- Example Table Creation (optional)
CREATE TABLE IF NOT EXISTS Tweets (
    tweet_id INT,
    content VARCHAR(100)
);

-- ❗ Your SQL Solution Below
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
