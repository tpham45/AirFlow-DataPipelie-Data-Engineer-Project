
  
    

    create or replace table `taxi-project-412919`.`taxi_data`.`dim_ratecode`
      
    
    

    OPTIONS()
    as (
      --Create dim_ratecode table
    select 
        ratecodeIndex_id,
        ratecode_id,
        ratecode_name
    from
        `taxi-project-412919`.`taxi_data`.`taxi_metadata`
    );
  