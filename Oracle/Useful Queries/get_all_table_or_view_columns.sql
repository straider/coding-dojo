SELECT  *
FROM    user_tab_columns
WHERE   table_name = Upper( '&table_or_view_name' )
ORDER   BY  column_id
;
