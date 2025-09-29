SELECT
    geolocation_zip_code_prefix,
    geolocation_city,
    REGEXP_REPLACE(geolocation_state,';\s*$', '') AS geolocation_state

FROM {{ ref('stg_geolocation') }} 