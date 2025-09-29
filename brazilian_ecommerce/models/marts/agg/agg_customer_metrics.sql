-- customer aggregation to facilitate data analysis

SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS lifetime_orders,
    SUM(total_item_value) AS lifetime_spent,
    MIN(order_purchase_timestamp) AS first_purchase_date
    
FROM {{ ref('fct_orders') }}

GROUP BY 1