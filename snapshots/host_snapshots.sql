{% snapshot host_snapshots %}

{{
    config(
        target_database = 'INT',
        unique_key='id',
        target_schema = 'SNAPSHOT',
        strategy = 'timestamp',
        updated_at = 'updated_at',
        invalidate_hard_deletes = True
    )
}}

  SELECT
id,
NAME AS host_name, 
is_superhost, 
created_at, 
updated_at
FROM
{{source('raw_airbnb','hosts')}}

{% endsnapshot %}



 

