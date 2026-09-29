{{ 
config(
    tags=['Commercial']
)
}}

WITH

    orders as (
        SELECT
            customer_id
            ,employee_id
            ,freight
            ,order_date
            ,order_id
            ,required_date
            ,ship_address
            ,ship_city
            ,ship_country
            ,ship_name
            ,ship_postal_code
            ,ship_region
            ,ship_via
            ,shipped_date
            ,CASE WHEN shipped_date IS NULL THEN 'Pending shipment'
                ELSE 'Sent'
            END AS status_shipment
        FROM
            {{ source('northwind', 'orders') }}
    )

SELECT * FROM orders