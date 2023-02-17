{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test ('int_weight_measurements_with_latest_height',
    'it should enrich weight measurement with latest height measurement') %}
    
  {% call dbt_unit_testing.mock_ref ('stg_gym_app__weight') %}
    select
        to_date('2022-09-01', 'YYYY-MM-DD') as created_date,
        1 as user_id,
        82.50 as weight
  {% endcall %}

  {% call dbt_unit_testing.mock_ref ('stg_gym_app__height') %}
    select
        to_date('2021-07-01', 'YYYY-MM-DD') as created_date,
        1 as user_id,
        182 as height
    UNION ALL
    select
        to_date('2022-08-01', 'YYYY-MM-DD') as created_date,
        1 as user_id,
        183 as height
  {% endcall %}

  {% call dbt_unit_testing.expect() %}
    select
        to_date('2022/09/01', 'YYYY-MM-DD') as created_date,
        1 as user_id,
        82.50 as weight,
        183 as height
  {% endcall %}

{% endcall %}

UNION ALL

{% call dbt_unit_testing.test ('int_weight_measurements_with_latest_height',
    'it should enrich weight with null height when height measurement does not exist') %}
    
  {% call dbt_unit_testing.mock_ref ('stg_gym_app__weight') %}
    select
        to_date('2022-09-01', 'YYYY-MM-DD') as created_date,
        1 as user_id,
        82.50 as weight
  {% endcall %}

  {% call dbt_unit_testing.mock_ref ('stg_gym_app__height') %}
    select
        to_date('2021-07-01', 'YYYY-MM-DD') as created_date,
        2 as user_id,
        182 as height
  {% endcall %}

  {% call dbt_unit_testing.expect() %}
    select
        to_date('2022/09/01', 'YYYY-MM-DD') as created_date,
        1 as user_id,
        82.50 as weight,
        null as height
  {% endcall %}

{% endcall %}