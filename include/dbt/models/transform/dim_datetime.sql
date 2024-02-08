--Create dim_datetime table
    select 
        datetimeindex_id,
        pick_datetime,
        pick_day,
        pick_month,
        pick_year,
        pick_weekday,
        drop_datetime,
        drop_hour,
        drop_day,
        drop_month,
        drop_year,
        drop_weekday
    from
        {{source('taxi_data','taxi_metadata')}}
