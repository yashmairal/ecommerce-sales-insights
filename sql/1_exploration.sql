-- 1_exploration.sql
-- Step 1: Set schema search path
SET search_path TO ecom;
 
-- Step 2: Discover all tables in the ecom schema
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'ecom'
ORDER BY table_name;

-- Step 3 Finding Order Volume and Customers who ordered
SELECT 
    COUNT(*) AS Total_Orders,
    COUNT(DISTINCT Customer_Id) AS Total_Customers, 
    MIN(created_at) AS Earliest_Order, 
    MAX(created_at) AS Latest_Order 
FROM orders;

-- Total Customers from Core "Customer" table 
SELECT 
COUNT(DISTINCT Customer_Id)
 FROM customers;

