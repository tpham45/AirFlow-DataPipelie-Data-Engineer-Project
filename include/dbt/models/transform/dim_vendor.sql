--Create dim_vendo table
    select 
        vendorindex_id,
        vendor_id,
        vendor_type
    from
        {{source('taxi_data','taxi_metadata')}}
