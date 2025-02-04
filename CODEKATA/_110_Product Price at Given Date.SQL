SELECT p.product_id, COALESCE(latest.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) AS p
         LEFT JOIN (
    SELECT product_id, new_price
    FROM Products
    WHERE change_date = (
        SELECT MAX(change_date)
        FROM Products p2
        WHERE p2.product_id = Products.product_id
          AND p2.change_date <= '2019-08-16'
    )
) AS latest
                   ON p.product_id = latest.product_id