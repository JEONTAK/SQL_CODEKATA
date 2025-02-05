WITH Name AS(
    SELECT name
    FROM Users U
             JOIN MovieRating M
                  ON U.user_id = M.user_id
    GROUP BY M.user_id
    ORDER BY COUNT(*) DESC , name
    LIMIT 1
)
   , Movie AS(
    SELECT title
    FROM Movies M
             JOIN MovieRating R
                  ON M.movie_id = R.movie_id
    WHERE DATE_FORMAT(created_at, "%Y-%m") = '2020-02'
    GROUP BY M.movie_id
    ORDER BY AVG(rating) DESC, title
    LIMIT 1
)

SELECT name AS results
FROM Name
UNION ALL
SELECT title
FROM Movie