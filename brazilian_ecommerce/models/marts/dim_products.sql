SELECT
    product_id,
    product_category_name,
    product_photos_qty
FROM {{ ref('stg_products') }} 