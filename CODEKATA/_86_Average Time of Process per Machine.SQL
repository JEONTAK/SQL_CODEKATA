with totalTime as (
    select machine_id, process_id, max(case when activity_type = 'end' then timestamp end) - max(case when activity_type = 'start' then timestamp end) as time
from activity
group by 1,2
    )

select machine_id, round(avg(time), 3) as processing_time
from totalTime
group by 1