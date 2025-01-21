select p.product_id, coalesce(round(sum(price * units) / sum(units), 2), 0)  as average_price
from Prices as p
         left join UnitsSold as s
                   on p.product_id = s.product_id
                       and s.purchase_date between p.start_date and p.end_date
group by 1