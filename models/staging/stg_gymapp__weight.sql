with

source as (

    select * from {{ dbt_unit_testing.ref('raw_weight') }}

),

renamed as (

    select
        TO_DATE(date, 'DD/MM/YYYY') as created_date,
        weight,
        user_id,
        measurement_unit
    from source

)

select * from renamed

