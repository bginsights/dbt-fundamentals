SELECT
*
FROM
{{
    ref('stg_jaffle_shop__customers')
}}
LEFT JOIN {{
    ref('stg_jaffle_shop__orders_agg')
}} USING (customer_id)
