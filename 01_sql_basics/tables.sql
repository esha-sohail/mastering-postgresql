--BRAZILLIAN E_COMMERCE PUBLIC DATASET BY OLIST 
--FIRST WE WILL CREATE TABLES AND IMPORT DATA INTO THESE 
-- CREATE TABLE customers 
CREATE TABLE customers(
customer_id  VARCHAR(100) NOT NULL,
customer_unique_id VARCHAR(100),
customer_zip_code_prefix VARCHAR(50),
customer_city VARCHAR(100),
customer_state VARCHAR(50)
);
SELECT * FROM customers;
DROP TABLE customers;
-- import data into table customers 
-- NOW WE CREATE ALL THE OTHER TABLES 
CREATE TABLE orders (
order_id VARCHAR(100),
customer_id VARCHAR(100),
order_status VARCHAR(50),
order_purchase_timestamp TIMESTAMP,
order_approved_at TIMESTAMP,
order_delivered_carrier_date TIMESTAMP,
order_delivered_customer_date TIMESTAMP,
order_estimated_delivery_date TIMESTAMP
);
SELECT * FROM orders;
DROP TABLE orders;  


-- order item table \
CREATE TABLE order_item(
order_id VARCHAR(100) NOT NULL,
order_item_id INT,
product_id VARCHAR(100),
seller_id VARCHAR(100),
shipping_limit_date TIMESTAMP,
price NUMERIC(10,2),
freight_value NUMERIC(10,2)
);

SELECT* FROM order_item;

--table order_payments
CREATE TABLE order_payments(
order_id VARCHAR(100) NOT NULL,
payment_sequential INT,
payment_type VARCHAR(50),
payment_installments INT,
payment_value NUMERIC(10,2)
);
 SELECT * FROM order_payments;

 -- table 
 CREATE TABLE order_reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);
 SELECT * FROM order_reviews;
 DROP TABLE order_reviews;


 -- table products
 CREATE TABLE products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g NUMERIC(10,2),
    product_length_cm NUMERIC(10,2),
    product_height_cm NUMERIC(10,2),
    product_width_cm NUMERIC(10,2)
);
SELECT* FROM products;

-- table sellers
CREATE TABLE sellers (
    seller_id VARCHAR(50),
    seller_zip_code_prefix VARCHAR(10),
    seller_city VARCHAR(100),
    seller_state CHAR(2)
);
SELECT * FROM sellers;

 -- table geolocation
 CREATE TABLE geolocation (
    geolocation_zip_code_prefix VARCHAR(10),
    geolocation_lat NUMERIC(10,6),
    geolocation_lng NUMERIC(10,6),
    geolocation_city VARCHAR(100),
    geolocation_state CHAR(2)
);
SELECT * FROM geolocation; 

-- CREATE table category translation
CREATE TABLE category_translation (
    product_category_name VARCHAR(100),
    product_category_name_english VARCHAR(100)
);
SELECT * FROM category_translation;
