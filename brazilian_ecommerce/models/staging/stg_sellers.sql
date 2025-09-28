WITH source AS (
    SELECT * FROM READ_CSV_AUTO('data/csv/olist_sellers_dataset.csv'))

SELECT
    seller_id, seller_zip_code_prefix, 
    TRIM(LOWER(seller_city)) AS seller_city,seller_state
FROM
    source