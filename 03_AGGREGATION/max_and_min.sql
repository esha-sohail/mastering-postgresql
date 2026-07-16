--.Find maximum and minimum payment amounts.
SELECT 
MAX(payment_value) AS max_payment,
MIN(payment_value) AS min_payment
FROM order_payments;
