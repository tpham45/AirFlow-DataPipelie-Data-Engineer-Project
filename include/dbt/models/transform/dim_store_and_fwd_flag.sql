--Create dim_store_and_fwd_flag table
    select 
        store_and_fwd_flag_index_id,
        store_and_fwd_flag_id,
        store_and_fwd_flag_type
    from
        {{source('taxi_data','taxi_metadata')}}
