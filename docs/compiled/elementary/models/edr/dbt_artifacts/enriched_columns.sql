


with information_schema_columns as (
    select
        lower(database_name) as database_name,
        lower(schema_name) as schema_name,
        lower(table_name) as table_name,
        lower(column_name) as name,
        data_type
    from "neondb"."dbt_testing_example_elementary"."information_schema_columns"
),

dbt_columns as (
    select
        lower(database_name) as database_name,
        lower(schema_name) as schema_name,
        lower(table_name) as table_name,
        lower(name) as name,
        description
    from "neondb"."dbt_testing_example_elementary"."dbt_columns"
)

select
    database_name,
    schema_name,
    table_name,
    name,
    data_type,
    description
from information_schema_columns
left join dbt_columns using (database_name, schema_name, table_name, name)