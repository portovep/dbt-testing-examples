with

source as (

    select * from {{ source('gym_app', 'raw_weight') }}

),

renamed as (

    select
        TO_DATE(date, 'DD/MM/YYYY') as created_date,
        weight,
        user_id,
        measurement_unit
    from source

),

converted_to_metric_system as (
   
    select
        created_date,
        user_id,
        case when measurement_unit = 'pounds' then round(weight / 2.205)
            else weight
        end as weight,
        'kg' as measurement_unit
    from renamed
    
)

select * from converted_to_metric_system

