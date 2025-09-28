WITH source AS (
    SELECT * FROM READ_CSV_AUTO('data/csv/olist_order_reviews_dataset.csv'))


SELECT
    review_id,
    order_id,
    review_score,
    CAST(review_creation_date as DATE) as review_creation_date
FROM source