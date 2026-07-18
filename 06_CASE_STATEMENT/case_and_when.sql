/*CASE STATEMENTS
Classify reviews as:

Excellent (5)
Good (4)
Average (3)
Poor (1-2)

Count each category.*/
SELECT review_score,review_id,
CASE
when review_score = 5 then 'excellent'
when review_score = 4 then 'good'
when review_score = 3 then 'average'
else 'poor'
end as total_reviews
FROM order_reviews 
order by review_score;

/*Classify customers into:

High-value
Medium-value
Low-value

based on total spending.*/
select customer_id, total_spending,
case
when total_spending > 1000 then 'high_value'
when total_spending < 250 then 'low-value'
else 'medium_value'
end as category_customer
from(
 select 
 o.customer_id,sum(op.payment_value) as total_spending
from
orders o
join order_payments op 
on o.order_id = op.order_id
group by o.customer_id) t
order by total_spending desc;

/* Categorize products into:

Cheap
Moderate
Expensive

using price ranges you define.*/
select min(price) from order_item;

select product_id,price,
case
when price >4000 then 'expensive'
when price < 1000 then 'cheap'
else 'moderate'
end as product_category
from order_item
order by price desc;

  /*Label delivery performance:

Early
On Time
Delayed*/
select * from orders;
 select order_id ,order_delivered_customer_date ,order_purchase_timestamp, order_estimated_delivery_date,
 case
 when order_delivered_customer_date < order_estimated_delivery_date then 'early'
 when order_delivered_customer_date = order_estimated_delivery_date then 'on time'
 else 'delayed'
 end as delivery_perfomance
 from orders
 WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
ORDER BY order_purchase_timestamp;
