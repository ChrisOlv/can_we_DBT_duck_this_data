WITH source AS (
    SELECT * FROM READ_CSV_AUTO('data/csv/olist_customers_dataset.csv'))


SELECT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    TRIM(LOWER(customer_city)) AS customer_city,
    customer_state
FROM source
