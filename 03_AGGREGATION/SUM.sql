--Phase 3: Aggregations
--.Calculate total revenue.
SELECT SUM(payment_value) AS total_revnue
FROM order_payments;

--Find total freight cost.
SELECT * from order_item;
SELECT SUM(freight_value) AS total_cost
from order_item;