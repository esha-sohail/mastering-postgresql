--JOIN OPERATIONS 
--41.Show customer city and order status together.
SELECT o.order_status ,c.customer_city
FROM customers c
join orders o
on c.customer_id= o.customer_id;

--42.Show seller information for every order item.
select oi.order_item_id,s.seller_id,s.seller_state
from order_item oi
join sellers s
on oi.seller_id=s.seller_id
order by oi.order_id

--43.Display product category names for each ordered product.
select oi.order_id,oi.product_id, p.product_category_name, ct.product_category_name_english
AS category_name
from order_item oi
join products p
on oi.product_id= p.product_id
JOIN category_translation ct
    ON p.product_category_name = ct.product_category_name
order by oi.order_id;

--44.Join category translations with products.
select ct.product_category_name_english,p.product_id
from products p
join category_translation ct
on p.product_category_name= ct.product_category_name

--45.Show customer state and payment amount
select c.customer_id,c.customer_state,op.payment_value as payment_amount
from customers c
join orders o
on c.customer_id= o.customer_id
join order_payments op
on op.order_id=o.order_id
order by c.customer_state;

--46.Find review scores for every product sold.
select r.review_score,p.product_category_name
from products p
join order_item oi
on p.product_id= oi.product_id
join order_reviews r
on oi.order_id=r.order_id
order by r.review_score;

--47.Find customers who bought products from multiple sellers.
SELECT
    c.customer_id,
    c.customer_unique_id,
    COUNT(DISTINCT oi.seller_id) AS seller_count
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_item oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_unique_id
HAVING  COUNT(DISTINCT oi.seller_id) > 1
ORDER BY seller_count DESC;

--48.Find orders containing multiple products.
select order_id,count(distinct product_id) as product_count
from order_item
group by order_id
having count(distinct product_id) >1
order by product_count desc;
