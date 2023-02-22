{{ config(tags=['unit-test', 'component-test']) }}

{% call dbt_unit_testing.test ('body_mass_indexes',
    'it should calculate the body mass index for users with weight and height measurements') %}
    
  {% call dbt_unit_testing.mock_source('gym_app', 'raw_weight', {"input_format": "csv"}) %}

    date,user_id,weight,measurement_unit
    '01/07/2009',1,80,'kg'
    '01/07/2009',2,70,'kg'
  
  {% endcall %}

  {% call dbt_unit_testing.mock_source('gym_app', 'raw_height', {"input_format": "csv"}) %}

    date,user_id,height,height_unit
    '01/05/2009',1,180,'cm'
    '01/05/2009',2,165,'cm'
  
  {% endcall %}

  {% call dbt_unit_testing.expect() %}
    select
        to_date('2009/07/01', 'YYYY-MM-DD') as created_date,
        1 as user_id,
        24.7 as bmi
    
    UNION ALL

    select
        to_date('2009/07/01', 'YYYY-MM-DD') as created_date,
        2 as user_id,
        25.7 as bmi
  {% endcall %}

{% endcall %}