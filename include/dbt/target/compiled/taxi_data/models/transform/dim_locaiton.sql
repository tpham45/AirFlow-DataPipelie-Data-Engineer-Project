--Create dim_location table
    select 
        locationindex_id,
        PUlocationCode,
        DOlocationCode
    from
        `taxi-project-412919`.`taxi_data`.`taxi_metadata`