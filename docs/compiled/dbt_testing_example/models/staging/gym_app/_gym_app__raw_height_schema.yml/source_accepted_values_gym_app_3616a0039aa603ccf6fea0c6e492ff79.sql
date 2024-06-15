
    
    

with all_values as (

    select
        height_unit as value_field,
        count(*) as n_records

    from "neondb"."dbt_testing_example"."raw_height"
    group by height_unit

)

select *
from all_values
where value_field not in (
    'cm','inches'
)


