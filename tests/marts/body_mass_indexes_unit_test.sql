{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test ('body_mass_indexes',
    'it should calculate the body mass intex for each weight with height record') %}
    
  {% call dbt_unit_testing.mock_ref ('int_weight_measurements_with_latest_height') %}
    select
        to_date('2022-09-01', 'YYYY-MM-DD') as created_date,
        1 as user_id,
        84.50 as weight,
        190 as height
  {% endcall %}

  {% call dbt_unit_testing.expect() %}
    select
        to_date('2022/09/01', 'YYYY-MM-DD') as created_date,
        1 as user_id,
        23.4 as bmi
  {% endcall %}

{% endcall %}