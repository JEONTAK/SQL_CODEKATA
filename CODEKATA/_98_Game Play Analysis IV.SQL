select round(sum(case when datediff(event_date, first_login) = 1 then 1 else 0 end) / count(distinct a.player_id),2) as fraction
from activity as a
         join (select player_id, min(event_date) as first_login
               from activity
               group by 1) as t
              on a.player_id = t.player_id