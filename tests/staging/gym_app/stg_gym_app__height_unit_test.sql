{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test('stg_gym_app__height',
    'it should cast string date to date type') %}
    
  {% call dbt_unit_testing.mock_source('gym_app', 'raw_height', {"input_format": "csv"}) %}

    date,user_id,height,height_unit
    01/07/2009,1,180,cm
  
  {% endcall %}

  {% call dbt_unit_testing.expect() %}
  
    select
        to_date('2009-07-01', 'YYYY-MM-DD') as created_date,
        180 as height
  {% endcall %}

{% endcall %}