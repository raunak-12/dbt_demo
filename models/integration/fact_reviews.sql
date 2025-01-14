{{
  config(
    materialized = 'incremental'
    
    
  )  
}}
SELECT * FROM {{ ref('src_reviews') }}
WHERE review_text is not null
{% if is_incremental() %}
 AND review_date > (select max(review_date) from {{ this }})
{% endif %}
 