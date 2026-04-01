-- View complete Customers table
SELECT * FROM customers;

-- View complete Orders table
SELECT * FROM orders;

-- View complete Payments table
SELECT * FROM payments;

-- View complete Reviews table
SELECT * FROM reviews


-- =============================================
-- Step 1: Customers Clean Table
-- Purpose: Remove duplicates and handle NULL values
-- =============================================
CREATE TABLE customers_clean AS
SELECT DISTINCT * FROM customers;

-- Fill NULLs for city and state
UPDATE customers_clean
SET customer_city = COALESCE(customer_city, 'Unknown'),
    customer_state = COALESCE(customer_state, 'Unknown');

-- =============================================
-- Step 2: Orders Clean Table
-- Purpose: Remove duplicates, handle missing values, convert timestamp to date
-- =============================================
CREATE TABLE orders_clean AS
SELECT DISTINCT * FROM orders;

-- Fill NULLs for order_status
UPDATE orders_clean
SET order_status = COALESCE(order_status, 'Unknown');

-- Convert timestamp to DATE type
ALTER TABLE orders_clean
ALTER COLUMN order_purchase_timestamp TYPE DATE
USING order_purchase_timestamp::DATE;

-- =============================================
-- Step 3: Payments Clean Table
-- Purpose: Remove duplicates, handle missing payment types
-- =============================================
CREATE TABLE payments_clean AS
SELECT DISTINCT * FROM payments;

UPDATE payments_clean
SET payment_type = COALESCE(payment_type, 'Unknown');

-- =============================================
-- Step 4: Reviews Clean Table
-- Purpose: Remove duplicates, fill NULL review_score with mean
-- =============================================
CREATE TABLE reviews_clean AS
SELECT DISTINCT * FROM reviews;

-- Fill NULL review_score with mean
UPDATE reviews_clean
SET review_score = COALESCE(
    review_score,
    (SELECT ROUND(AVG(review_score)) FROM reviews_clean)
);

-- Convert text to DATE type
ALTER COLUMN review_date TYPE DATE
USING review_date ::DATE;



-- =============================================
-- Step 1: Create Clean Table & Remove Duplicates
-- =============================================
CREATE TABLE reviews_clean AS
SELECT DISTINCT *
FROM reviews;


-- =============================================
-- Step 2: Check NULL Values in Each Column
-- =============================================
SELECT 
    SUM(CASE WHEN review_id IS NULL THEN 1 ELSE 0 END) AS null_review_id,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
    SUM(CASE WHEN review_score IS NULL THEN 1 ELSE 0 END) AS null_review_score,
    SUM(CASE WHEN review_date IS NULL THEN 1 ELSE 0 END) AS null_review_date
FROM reviews_clean;


-- =============================================
-- Step 3: Fill NULL Values Using Mean (Imputation)
-- =============================================
UPDATE reviews_clean
SET review_score = COALESCE(
    review_score,
    (
        SELECT ROUND(AVG(review_score))
        FROM reviews_clean
    )
);  



