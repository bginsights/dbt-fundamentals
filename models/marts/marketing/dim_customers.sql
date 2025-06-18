WITH final AS (
    SELECT
    *
    FROM
    {{
        ref('int_jaffle_shop__customer_ordrers_agg')
    }}

)

SELECT
*
FROM
final
