 select listing_id,
date AS review_date, 
reviewer_name,
comments AS review_text, 
sentiment AS review_sentiment
from 
{{source('raw_airbnb','reviews')}}