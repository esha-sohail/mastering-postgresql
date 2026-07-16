--Count customers per state.
SELECT 
customer_state,COUNT(*) AS total_customers
FROM customers
GROUP BY customer_state
order by total_customers desc;

--Count sellers per state.
SELECT * FROM sellers;
SELECT seller_state, COUNT(*) as total_seller
FROM sellers
GROUP BY seller_state
ORDER BY total_seller desc;

--Calculate average installments per payment type.
SELECT payment_type, AVG(payment_installments) AS avg_installment
FROM order_payments
GROUP BY payment_type
ORDER BY avg_installment DESC;

--Find the total number of delivered orders.
SELECT COUNT(*) AS ORDER_DELIVERED
FROM orders
WHERE order_status='delivered'