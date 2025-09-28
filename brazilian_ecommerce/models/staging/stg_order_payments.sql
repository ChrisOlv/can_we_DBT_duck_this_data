WITH source AS (
    SELECT * FROM READ_CSV_AUTO('data/csv/olist_order_payments_dataset.csv'))


SELECT 
    order_id,payment_sequential,payment_type,payment_installments,payment_value
FROM source