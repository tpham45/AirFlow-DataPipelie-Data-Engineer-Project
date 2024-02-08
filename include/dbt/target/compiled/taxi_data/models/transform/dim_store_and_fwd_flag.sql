--Create dim_store_and_fwd_flag table
    select 
        store_and_fwd_flag_index_id,
        store_and_fwd_flag_id,
        store_and_fwd_flag_type
    from
        `taxi-project-412919`.`taxi_data`.`taxi_metadata`