WITH source AS (
    SELECT * FROM READ_CSV_AUTO('data/csv/olist_products_dataset.csv'))


SELECT
product_id,product_category_name,product_photos_qty
FROM source
