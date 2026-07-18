--CTE THAT IS COMMON TABLE EXPRESSION , MAKE A TEMPORARY TABLE AND USE IT IMMEDIATELY;
--Using a CTE, calculate total spending per customer and show the top 20.
WITH customer_spending AS (
    SELECT
        o.customer_id,
        SUM(op.payment_value) AS total_spending
    FROM orders o
    JOIN order_payments op
        ON o.order_id = op.order_id
    GROUP BY o.customer_id
)

SELECT
    customer_id,
    total_spending
FROM customer_spending
ORDER BY total_spending DESC
LIMIT 20;

--Build a CTE to compute monthly revenue.

WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
        SUM(op.payment_value) AS total_revenue
    FROM orders o
    JOIN order_payments op
        ON o.order_id = op.order_id
    GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
)

SELECT
    month,
    total_revenue
FROM monthly_revenue
ORDER BY month;

--Create a CTE to calculate average review scores by seller.
with avg_review_score as(
select oi.seller_id,avg(r.review_score) as avg_score
from order_item oi
join order_reviews r
on oi.order_id = r. order_id
group by seller_id)  

select seller_id, avg_score
from avg_review_score
order by avg_score desc;
