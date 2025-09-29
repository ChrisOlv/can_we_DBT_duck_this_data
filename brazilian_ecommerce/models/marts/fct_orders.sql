SELECT
    -- Clé primaire du Fait
    stg_oi.order_id || '-' || stg_oi.order_item_id AS fact_key, 
    
    -- Clés Étrangères (Dimensions)
    stg_o.customer_id,
    stg_oi.product_id,
    stg_oi.seller_id,

    -- Attributs de la commande (Répétés par article)
    stg_o.order_id,
    stg_o.order_status,
    stg_o.order_purchase_timestamp,
    stg_o.order_approved_at,
    stg_o.order_delivered_customer_date,
    stg_o.order_estimated_delivery_date,

    -- Mesures (Faits)
    stg_oi.price,
    stg_oi.freight_value,
    (stg_oi.price + stg_oi.freight_value) AS total_item_value -- Métrique clé

FROM {{ref('stg_order_items')}} AS stg_oi  -- Commence par la granularité la plus basse
INNER JOIN {{ref ('stg_orders')}} AS stg_o -- Jointure vers la commande
    ON stg_oi.order_id = stg_o.order_id