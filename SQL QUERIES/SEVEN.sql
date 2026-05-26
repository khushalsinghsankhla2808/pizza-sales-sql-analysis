-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(order_time) AS HOURS, COUNT(order_id) AS order_count
FROM
    orders
GROUP BY HOURS
ORDER BY HOURS;
  