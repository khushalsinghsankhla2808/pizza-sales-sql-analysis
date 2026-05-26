-- Analyze the cumulative revenue generated over time.

SELECT order_date,
ROUND(SUM(total_revenue) OVER (ORDER BY order_date),2) AS CUM_REVENUE
FROM
(SELECT 
    orders.order_date,
    ROUND(SUM(pizzas.price * order_details.quantity),
            2) AS total_revenue
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
        JOIN
    orders ON orders.order_id = order_details.order_id 
    GROUP BY orders.order_date) AS sales;  