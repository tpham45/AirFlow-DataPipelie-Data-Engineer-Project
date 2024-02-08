--Create dim_ratecode table
    select 
        ratecodeIndex_id,
        ratecode_id,
        ratecode_name
    from
        `taxi-project-412919`.`taxi_data`.`taxi_metadata`