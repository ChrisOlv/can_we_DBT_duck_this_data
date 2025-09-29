-- aggregation table to simplify data analysis

SELECT
    DATE(order_purchase_timestamp) AS sale_date,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(total_item_value) AS total_revenue,

    
    COUNT(DISTINCT customer_id) AS daily_active_customers

FROM {{ ref('fct_orders') }}

GROUP BY 1
ORDER BY 1