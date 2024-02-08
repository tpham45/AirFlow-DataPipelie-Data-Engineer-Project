--Create dim_location table
    select 
        locationindex_id,
        PUlocationCode,
        DOlocationCode
    from
        {{source('taxi_data','taxi_metadata')}}
