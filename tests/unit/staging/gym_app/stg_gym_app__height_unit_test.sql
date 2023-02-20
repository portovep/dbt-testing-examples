{{ config(tags=['unit-test', 'unit-tests']) }}

{% call dbt_unit_testing.test('stg_gym_app__height',
    'it should cast string date to date type') %}
    
  {% call dbt_unit_testing.mock_source('gym_app', 'raw_height', {"input_format": "csv"}) %}

    date,user_id,height,height_unit
    '01/07/2009',1,180,'cm'
  
  {% endcall %}

  {% call dbt_unit_testing.expect() %}
  
    select
        to_date('2009-07-01', 'YYYY-MM-DD') as created_date
  {% endcall %}

{% endcall %}

UNION ALL

{% call dbt_unit_testing.test('stg_gym_app__height',
    'it should clean column names') %}
    
  {% call dbt_unit_testing.mock_source('gym_app', 'raw_height', {"input_format": "csv"}) %}

    date,user_id,height,height_unit
    '01/07/2009',1,180,'cm'
  
  {% endcall %}

  {% call dbt_unit_testing.expect() %}
  
    select
        to_date('2009-07-01', 'YYYY-MM-DD') as created_date,
        1 as user_id,
        180 as height,
        'cm' as measurement_unit
        
  {% endcall %}

{% endcall %}