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

),

converted_to_metric_system as (
   
    select
        created_date,
        user_id,
        case when measurement_unit = 'inches' then round(height * 2.54)
            else height
        end as height,
        'cm' as measurement_unit
    from renamed
    
)

select * from converted_to_metric_system

