--Create dim_ratecode table
    select 
        ratecodeIndex_id,
        ratecode_id,
        ratecode_name
    from
        {{source('taxi_data','taxi_metadata')}}