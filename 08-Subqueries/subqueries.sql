-- phase 8 subqueries
--Find products priced above the average product price.
select product_id,price 
from order_item
where price > (
select avg(price) as avg_product_price
from order_item)
order by price desc;

--Find sellers whose revenue exceeds overall average seller revenue.
select seller_id,price
from order_item
where price > (
select avg(price) as avg_seller_revnue
from order_item) 
order by price desc;

--or 

SELECT
    seller_id,
    total_revenue
FROM (
    SELECT
        seller_id,
        SUM(price) AS total_revenue
    FROM order_item
    GROUP BY seller_id
) s
WHERE total_revenue > (
    SELECT AVG(seller_revenue)
    FROM (
        SELECT
            SUM(price) AS seller_revenue
        FROM order_item
        GROUP BY seller_id
    ) avg_sellers
)
ORDER BY total_revenue DESC;