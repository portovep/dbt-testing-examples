with

source as (

    select * from {{ dbt_unit_testing.source('gym_app', 'raw_height') }}

),

renamed as (

    select
        TO_DATE(date, 'DD/MM/YYYY') as created_date,
        user_id,
        height,
        height_unit as measurement_unit
    from source

)

select * from renamed

