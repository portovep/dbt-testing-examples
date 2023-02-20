with

height as (

    select * from {{ dbt_unit_testing.ref('stg_gym_app__height') }}

),

weight as (

    select * from {{ ref('stg_gym_app__weight') }}

),

enrich_with_lasted_height_recorded_before_the_weight_measurement as (

    select
        weight.created_date,
        user_id,
        weight,
        (select height
         from height
         where  height.created_date < weight.created_date and
                height.user_id = weight.user_id
         order by height.created_date DESC
         limit 1) as height
    from weight
)

select * from enrich_with_lasted_height_recorded_before_the_weight_measurement