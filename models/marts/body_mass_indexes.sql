with

weights_with_latest_height as (

    select * from {{ ref('int_weight_measurements_with_latest_height') }}

),

body_mass_indexes as (

    select
        created_date,
        user_id,
        weight,
        height,
        round((weight::numeric / (height::numeric / 100) ^ 2)::numeric, 1) as bmi
    from weights_with_latest_height
)

select * from body_mass_indexes