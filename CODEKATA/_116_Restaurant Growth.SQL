WITH Custom AS (
    SELECT visited_on, SUM(amount) as amount
    FROM Customer
    GROUP BY visited_on
),
     Result AS(
         SELECT
             CASE
                 WHEN visited_on >= (SELECT MIN(visited_on) + INTERVAL 6 DAY FROM Custom) THEN visited_on
                 END AS visited_on,
             SUM(amount) OVER(
                 ORDER BY visited_on
                 ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
                 ) AS amount,
             ROUND(AVG(amount) OVER(
                 ORDER BY visited_on
                 ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
                 ), 2) AS average_amount
         FROM Custom
     )

SELECT visited_on, amount, average_amount
FROM Result
WHERE visited_on IS NOT NULL