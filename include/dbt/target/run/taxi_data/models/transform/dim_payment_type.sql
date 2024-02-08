
  
    

    create or replace table `taxi-project-412919`.`taxi_data`.`dim_payment_type`
      
    
    

    OPTIONS()
    as (
      --Create dim_paymenttype table
    select 
        payment_typeindex_id,
        payment_type_id,
        payment_type_name
    from
        `taxi-project-412919`.`taxi_data`.`taxi_metadata`
    );
  