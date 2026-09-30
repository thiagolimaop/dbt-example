{{ 
config(
    tags=['Commercial']
)
}}

WITH

    sales as (
        SELECT
            *
        FROM
            {{ ref('int_sales') }}
    )

SELECT
    *
FROM
    sales