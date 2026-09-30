{{ 
config(
    tags=['Commercial']
)
}}

WITH

    orders as (
        SELECT
            EXTRACT(MONTH FROM order_date) as month
            ,EXTRACT(YEAR FROM order_date) as YEAR
            ,freight
        FROM
            {{ ref('stg_orders') }}
    ),

    sales AS (
        SELECT
            year
            ,month
            ,SUM(freight) AS total_freight
        FROM
            orders
        GROUP BY
            year,
            month
    )

SELECT
    *
FROM
    sales