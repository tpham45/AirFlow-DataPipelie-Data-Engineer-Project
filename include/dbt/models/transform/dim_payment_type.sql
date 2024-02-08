--Create dim_paymenttype table
    select 
        payment_typeindex_id,
        payment_type_id,
        payment_type_name
    from
        {{source('taxi_data','taxi_metadata')}}
