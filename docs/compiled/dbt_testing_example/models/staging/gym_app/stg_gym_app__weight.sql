with

source as (

    select * from "neondb"."dbt_testing_example"."raw_weight"

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