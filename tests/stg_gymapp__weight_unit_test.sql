{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test('stg_gymapp__weight',
    'it should cast string date to date') %}
    
  {% call dbt_unit_testing.mock_ref('raw_weight', {"input_format": "csv"}) %}

    date,user_id,weight,measurement_unit
    '01/07/2009',1,82.50,'kg'
  
  {% endcall %}

  {% call dbt_unit_testing.expect() %}
  
    select
        to_date('2009-07-01', 'YYYY-MM-DD') as created_date,
        82.50 as weight,
        1 as user_id,
        'kg' as measurement_unit
  
  {% endcall %}

{% endcall %}