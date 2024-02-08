
  
    

    create or replace table `taxi-project-412919`.`taxi_data`.`dim_vendor`
      
    
    

    OPTIONS()
    as (
      --Create dim_vendo table
    select 
        vendorindex_id,
        vendor_id,
        vendor_type
    from
        `taxi-project-412919`.`taxi_data`.`taxi_metadata`
    );
  