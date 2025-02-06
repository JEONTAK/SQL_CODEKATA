WITH Request AS (
    SELECT requester_id as id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id
    FROM RequestAccepted
)

SELECT id, COUNT(*) as num
FROM Request
GROUP BY id
ORDER BY num desc
LIMIT 1