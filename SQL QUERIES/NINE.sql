-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(daily_total),0) AS avg_pizzas_per_day
FROM (
    SELECT 
        o.order_date,
        SUM(od.quantity) AS daily_total
    FROM orders o
    JOIN order_details od 
        ON o.order_id = od.order_id
    GROUP BY o.order_date
) AS daily_orders;