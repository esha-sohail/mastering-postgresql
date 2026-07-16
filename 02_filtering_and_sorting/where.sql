
--Phase 2: Filtering & Sorting
--11.Find orders placed in 2018.
SELECT *
FROM orders
WHERE order_purchase_timestamp >= '2018-01-01'
  AND order_purchase_timestamp < '2019-01-01';
  --OR
  SELECT *
FROM orders
WHERE EXTRACT(YEAR FROM order_purchase_timestamp) = 2018;

--12.Retrieve customers from Rio de Janeiro.
SELECT * FROM customers
WHERE customer_city='rio de janeiro';

--13.Show products with photos greater than 5.
SELECT * FROM products
WHERE product_photos_qty>5;

--14.Find payments above 500.
SELECT * FROM order_payments
WHERE payment_value > 500;

--15.List top 20 most expensive order items.
SELECT * FROM order_item
ORDER BY price desc
LIMIT 20;

--16.Find sellers with ZIP codes beginning with 01.
SELECT * FROM sellers 
WHERE seller_zip_code_prefix LIKE '01%';

--17.Show reviews with score 1.
SELECT * FROM order_reviews
WHERE review_score =1;

--18.Find orders delivered later than expected.
SELECT * FROM orders
WHERE order_delivered_customer_date > order_estimated_delivery_date;

--19.Show orders that were canceled.
SELECT * FROM orders
WHERE order_status='canceled';

--20.Find products whose names exceed 50 characters.
SELECT * FROM products
WHERE product_name_lenght>50;