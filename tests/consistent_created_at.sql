select  r.review_date, l.created_at 
from {{ref('fact_reviews')}} r
left join {{ref('dim_listings')}} l
on r.listing_id = l.listing_id
where r.review_date > l.created_at