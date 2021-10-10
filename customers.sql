SELECT 

a.id as customer_id,
a.name,
a.email,
b.first_order,
b.count as number_of_orders

FROM `analytics-engineers-club.coffee_shop.customers` a

JOIN

(SELECT 
customer_id,
MIN(created_at) as first_order,
COUNT(*) as count
from `analytics-engineers-club.coffee_shop.orders`
GROUP BY 1) b 

ON a.id = b.customer_id 

limit 10;
