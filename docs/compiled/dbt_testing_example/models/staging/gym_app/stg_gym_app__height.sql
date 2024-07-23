with

source as (

    select * from "neondb"."dbt_testing_example"."raw_height"

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