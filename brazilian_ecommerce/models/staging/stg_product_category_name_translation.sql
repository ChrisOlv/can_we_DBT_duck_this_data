WITH source AS (
    SELECT * FROM READ_CSV_AUTO('data/csv/product_category_name_translation.csv'))


SELECT product_category_name,product_category_name_english
FROM source