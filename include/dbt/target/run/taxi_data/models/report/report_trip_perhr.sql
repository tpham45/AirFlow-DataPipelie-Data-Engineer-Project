
  
    

    create or replace table `taxi-project-412919`.`taxi_data`.`report_trip_perhr`
      
    
    

    OPTIONS()
    as (
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
)

select
    t.pickup_hour,
    count(t.datetimeindex_id) as trips_per_hour
from time_convert t
group by t.pickup_hour
order by t.pickup_hour
    );
  