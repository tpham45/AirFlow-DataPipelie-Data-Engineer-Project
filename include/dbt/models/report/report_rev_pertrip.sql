with total_fact_trip as (
    select  
        count(f.trip_id) as total_trip,
        sum(f.total_amount) as total_revenue
    from {{ref('fact_trip')}} f
)

select 
    (t.total_revenue / nullif(t.total_trip, 0)) as revenue_per_trip
from total_fact_trip t
