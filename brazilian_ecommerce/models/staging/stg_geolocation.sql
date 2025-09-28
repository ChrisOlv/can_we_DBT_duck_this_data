WITH source AS (
    SELECT * FROM READ_CSV_AUTO('data/csv/olist_geolocation_dataset.csv'))

SELECT 
    geolocation_zip_code_prefix,
    TRIM(LOWER(geolocation_city)) AS geolocation_city,
    geolocation_state
FROM source