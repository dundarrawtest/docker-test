WITH order_totals AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.order_status,
        SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    GROUP BY
        o.order_id,
        o.customer_id,
        o.order_status
)
SELECT
    *
FROM order_totals
ORDER BY order_total DESC;

