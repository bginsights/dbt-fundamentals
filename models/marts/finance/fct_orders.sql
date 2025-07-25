WITH orders AS (
    SELECT
    *
    FROM {{
        ref ('stg_jaffle_shop__orders')
    }}
)

,payments AS (
    SELECT
    *
    FROM {{
        ref ('stg_stripe__payments')
    }}
)

,order_payments AS (
    SELECT
    order_id
    ,SUM(CASE WHEN status = 'success' THEN amount END) AS amount
    FROM
    payments
    GROUP BY
    1
)

,final AS (
    SELECT
    orders.order_id
    ,orders.customer_id
    ,orders.order_date
    ,COALESCE(order_payments.amount, 0) AS amount
    FROM
    orders
    LEFT JOIN order_payments USING(order_id)
)

SELECT * FROM final
