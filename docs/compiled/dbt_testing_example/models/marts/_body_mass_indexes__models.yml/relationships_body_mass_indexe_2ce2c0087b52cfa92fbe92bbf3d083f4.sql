
    
    

with child as (
    select user_id as from_field
    from "neondb"."dbt_testing_example"."body_mass_indexes"
    where user_id is not null
),

parent as (
    select user_id as to_field
    from "neondb"."dbt_testing_example"."raw_height"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


