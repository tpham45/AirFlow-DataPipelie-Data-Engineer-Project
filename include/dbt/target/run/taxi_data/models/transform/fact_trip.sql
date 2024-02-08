
  
    

    create or replace table `taxi-project-412919`.`taxi_data`.`fact_trip`
      
    
    

    OPTIONS()
    as (
      --Create fact_trip table
    select 
        trip_id,
        vendorindex_id,
        datetimeindex_id,
        locationindex_id,
        ratecodeindex_id,
        payment_typeindex_id,
        store_and_fwd_flag_index_id,
        passenger_count,
        trip_distance,
        fare_amount,
        extra,
        mta_tax, 
        tip_amount,
        tolls_amount,
        improvement_surcharge,
        congestion_surcharge,
        Airport_fee,
        total_amount
    from
        `taxi-project-412919`.`taxi_data`.`taxi_metadata`
    );
  