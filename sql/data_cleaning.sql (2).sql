-- =====================================================
-- E-Commerce Customer Churn Analysis
-- Data Cleaning Queries
-- =====================================================


-- =====================================================
-- View Raw Tables
-- =====================================================

SELECT * FROM customers;

SELECT * FROM orders;

SELECT * FROM payments;

SELECT * FROM reviews;



-- =====================================================
-- Customers Table Cleaning
-- =====================================================

-- Step 1: Create Clean Table & Remove Duplicates

CREATE TABLE customers_clean AS
SELECT DISTINCT *
FROM customers;


-- Step 2: Check NULL Values

SELECT 
SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
SUM(CASE WHEN customer_city IS NULL THEN 1 ELSE 0 END) AS null_customer_city,
SUM(CASE WHEN customer_state IS NULL THEN 1 ELSE 0 END) AS null_customer_state
FROM customers_clean;


-- Step 3: Handle NULL Values

UPDATE customers_clean
SET 
customer_city = COALESCE(customer_city, 'Unknown'),
customer_state = COALESCE(customer_state, 'Unknown');



-- =====================================================
-- Orders Table Cleaning
-- =====================================================

-- Step 1: Create Clean Table & Remove Duplicates

CREATE TABLE orders_clean AS
SELECT DISTINCT *
FROM orders;


-- Step 2: Check NULL Values

SELECT 
SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
SUM(CASE WHEN order_purchase_timestamp IS NULL THEN 1 ELSE 0 END) AS null_order_date,
SUM(CASE WHEN order_status IS NULL THEN 1 ELSE 0 END) AS null_order_status
FROM orders_clean;


-- Step 3: Handle NULL Values

UPDATE orders_clean
SET order_status = COALESCE(order_status, 'Unknown');


-- Step 4: Convert Timestamp to Date

ALTER TABLE orders_clean
ALTER COLUMN order_purchase_timestamp TYPE DATE
USING order_purchase_timestamp::DATE;



-- =====================================================
-- Payments Table Cleaning
-- =====================================================

-- Step 1: Create Clean Table

CREATE TABLE payments_clean AS
SELECT DISTINCT *
FROM payments;


-- Step 2: Check NULL Values

SELECT 
SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
SUM(CASE WHEN payment_type IS NULL THEN 1 ELSE 0 END) AS null_payment_type,
SUM(CASE WHEN payment_value IS NULL THEN 1 ELSE 0 END) AS null_payment_value
FROM payments_clean;


-- Step 3: Handle NULL Values

UPDATE payments_clean
SET payment_type = COALESCE(payment_type, 'Unknown');



-- =====================================================
-- Reviews Table Cleaning
-- =====================================================

-- Step 1: Create Clean Table & Remove Duplicates

CREATE TABLE reviews_clean AS
SELECT DISTINCT *
FROM reviews;


-- Step 2: Check NULL Values

SELECT 
SUM(CASE WHEN review_id IS NULL THEN 1 ELSE 0 END) AS null_review_id,
SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
SUM(CASE WHEN review_score IS NULL THEN 1 ELSE 0 END) AS null_review_score,
SUM(CASE WHEN review_date IS NULL THEN 1 ELSE 0 END) AS null_review_date
FROM reviews_clean;


-- Step 3: Fill NULL Values Using Mean

UPDATE reviews_clean
SET review_score = COALESCE(
review_score,
(
SELECT ROUND(AVG(review_score))
FROM reviews_clean
)
);


-- Step 4: Convert Date Format

ALTER TABLE reviews_clean
ALTER COLUMN review_date TYPE DATE
USING review_date::DATE;


