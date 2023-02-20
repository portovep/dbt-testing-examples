# Context

## Adding support for imperial units

### Component test

```sql
-- body_mass_indexes_component_test
UNION ALL

{% call dbt_unit_testing.test ('body_mass_indexes',
    'it should calculate the body mass index for measurements captured in imperial unit system', {"include_missing_columns": true}) %}

  {% call dbt_unit_testing.mock_source('gym_app', 'raw_weight', {"input_format": "csv"}) %}

    date,user_id,weight,measurement_unit
    '01/07/2009',1,176.37,'pounds'
    '01/07/2009',2,154.32,'pounds'

  {% endcall %}

  {% call dbt_unit_testing.mock_source('gym_app', 'raw_height', {"input_format": "csv"}) %}

    date,user_id,height,height_unit
    '01/05/2009',1,70.87,'inches'
    '01/05/2009',2,64.96,'cm'

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
```

### Weight unit test

```sql
-- stg_gym_app__weight_unit_test.sql

UNION ALL

{% call dbt_unit_testing.test('stg_gym_app__weight',
    'it should convert pounds to kilograms') %}

  {% call dbt_unit_testing.mock_source('gym_app', 'raw_weight', {"input_format": "csv"}) %}

    date,user_id,weight,measurement_unit
    '01/07/2009',1,176.37,'pounds'

  {% endcall %}

  {% call dbt_unit_testing.expect() %}

    select
        to_date('2009-07-01', 'YYYY-MM-DD') as created_date,
        80 as weight,
        1 as user_id,
        'kg' as measurement_unit

  {% endcall %}

{% endcall %}
```

### Weight unit test solution

```sql
-- stg_gym_app__weight.sql

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
```

### Height unit test

```sql
-- stg_gym_app__height_unit_test.sql
UNION ALL

{% call dbt_unit_testing.test('stg_gym_app__height',
    'it should convert inches to centimeters') %}

  {% call dbt_unit_testing.mock_source('gym_app', 'raw_height', {"input_format": "csv"}) %}

    date,user_id,height,height_unit
    '01/07/2009',1,70.8661,'inches'

  {% endcall %}

  {% call dbt_unit_testing.expect() %}

    select
        to_date('2009-07-01', 'YYYY-MM-DD') as created_date,
        1 as user_id,
        180 as height,
        'cm' as measurement_unit

  {% endcall %}

{% endcall %}
```

### Height unit test solution

```sql
-- stg_gym_app__height.sql


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
```
