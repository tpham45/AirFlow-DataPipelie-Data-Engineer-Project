with time_convert as (
    select 
        d.datetimeindex_id,
        cast(d.pick_datetime as timestamp) as pickup_timestamp,
        cast(d.drop_datetime as timestamp) as dropoff_timestamp,
        -- Extract the hour from the pickup timestamp
        extract(hour from cast(d.pick_datetime as timestamp)) as pickup_hour
    from `taxi-project-412919`.`taxi_data`.`dim_datetime` d
    join `taxi-project-412919`.`taxi_data`.`fact_trip` f 
        on d.datetimeindex_id = f.datetimeindex_id
),
fact_trip_cte as (
    select  
        extract(hour from t.pickup_timestamp) as pickup_hour,
        count(ft.trip_id) as total_trip,
        sum(ft.total_amount) as total_revenue
    from time_convert t
    join  `taxi-project-412919`.`taxi_data`.`fact_trip` ft
    on t.datetimeindex_id = ft.datetimeindex_id
    group by pickup_hour
)
select 
    fc.pickup_hour,
    case when fc.total_trip > 0 then fc.total_revenue / fc.total_trip else 0 end as revenue_per_hour
from fact_trip_cte fc
order by fc.pickup_hour