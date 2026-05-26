-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    ROUND(SUM(pizzas.price * order_details.quantity),
            2) AS total_revenue,
    pizza_types.name AS pizza_name
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 3
;
