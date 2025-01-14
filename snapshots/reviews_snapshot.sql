{% snapshot reviews_snapshots %}

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
 select listing_id as id,
date AS review_date, 
reviewer_name,
comments AS review_text, 
sentiment AS review_sentiment
from 
{{source('raw_airbnb','reviews')}} 

{% endsnapshot %}



 

