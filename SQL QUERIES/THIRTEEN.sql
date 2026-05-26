-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

SELECT name , total_revenue
FROM
(SELECT category, name , total_revenue,
RANK() OVER (PARTITION BY category ORDER BY total_revenue DESC) AS revenue 
FROM 
(SELECT 
    pizza_types.category,
    pizza_types.name,
    ROUND(SUM(pizzas.price * order_details.quantity),
            2) AS total_revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category , pizza_types.name) AS A) AS B
WHERE revenue <= 3;

