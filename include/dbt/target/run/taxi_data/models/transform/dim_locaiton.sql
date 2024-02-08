
  
    

    create or replace table `taxi-project-412919`.`taxi_data`.`dim_locaiton`
      
    
    

    OPTIONS()
    as (
      --Create dim_location table
    select 
        locationindex_id,
        PUlocationCode,
        DOlocationCode
    from
        `taxi-project-412919`.`taxi_data`.`taxi_metadata`
    );
  