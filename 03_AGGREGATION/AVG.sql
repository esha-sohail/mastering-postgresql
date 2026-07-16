--Find average order value.
SELECT 
    AVG(payment_value) AS average_order_value
FROM order_payments;

--Find average review score.
SELECT AVG(review_score) AS avg_score
FROM order_reviews;