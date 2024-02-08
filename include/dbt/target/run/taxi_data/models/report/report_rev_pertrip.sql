
  
    

    create or replace table `taxi-project-412919`.`taxi_data`.`report_rev_pertrip`
      
    
    

    OPTIONS()
    as (
      with total_fact_trip as (
    select  
        count(f.trip_id) as total_trip,
        sum(f.total_amount) as total_revenue
    from `taxi-project-412919`.`taxi_data`.`fact_trip` f
)

select 
    (t.total_revenue / nullif(t.total_trip, 0)) as revenue_per_trip
from total_fact_trip t
    );
  