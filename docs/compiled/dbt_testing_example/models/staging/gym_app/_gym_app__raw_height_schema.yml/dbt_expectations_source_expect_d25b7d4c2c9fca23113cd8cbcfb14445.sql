with relation_columns as (

        
        select
            cast('DATE' as TEXT) as relation_column,
            cast('TEXT' as TEXT) as relation_column_type
        union all
        
        select
            cast('USER_ID' as TEXT) as relation_column,
            cast('INTEGER' as TEXT) as relation_column_type
        union all
        
        select
            cast('HEIGHT' as TEXT) as relation_column,
            cast('DOUBLE PRECISION' as TEXT) as relation_column_type
        union all
        
        select
            cast('HEIGHT_UNIT' as TEXT) as relation_column,
            cast('TEXT' as TEXT) as relation_column_type
        
        
    ),
    test_data as (

        select
            *
        from
            relation_columns
        where
            relation_column = 'HEIGHT_UNIT'
            and
            relation_column_type not in ('TEXT')

    )
    select *
    from test_data