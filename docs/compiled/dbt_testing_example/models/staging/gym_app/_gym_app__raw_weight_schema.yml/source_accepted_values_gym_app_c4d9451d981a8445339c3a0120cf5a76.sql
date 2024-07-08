
    
    

with all_values as (

    select
        measurement_unit as value_field,
        count(*) as n_records

    from "neondb"."dbt_testing_example"."raw_weight"
    group by measurement_unit

)

select *
from all_values
where value_field not in (
    'kg','pounds'
)


