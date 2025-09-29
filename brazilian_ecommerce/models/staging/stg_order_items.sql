WITH source AS (
    SELECT * FROM READ_CSV_AUTO('data/csv/olist_order_items_dataset.csv'))


SELECT order_id,
order_item_id,
product_id,
seller_id,
shipping_limit_date,
price,
freight_value
FROM source
WHERE order_id IS NOT NULL
AND order_item_id IS NOT NULL
