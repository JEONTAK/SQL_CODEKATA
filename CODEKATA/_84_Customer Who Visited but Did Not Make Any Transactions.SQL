select customer_id, count(*) as count_no_trans
from Visits as v
where visit_id not in(
    select visit_id from transactions
)
group by 1