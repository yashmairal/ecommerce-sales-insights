-- 2_Revenue.sql
-- Step 1: Set schema search path
SET search_path TO ecom;
 
-- Step 2: Discover all tables in the ecom schema
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'ecom'
ORDER BY table_name;


-- Step 3: Calculate Revenue by month
SELECT 
      DATE_TRUNC('month',O.created_at)::DATE AS Sales_Month,
      COUNT(DISTINCT O.order_id ) AS Total_Orders,
      ROUND(SUM(OI.qty*OI.unit_price)::NUMERIC , 2) AS Monthly_Revenue,
      ROUND(SUM(OI.qty*OI.unit_price)/COUNT(DISTINCT O.order_id)::NUMERIC,2) AS Average_order_value
FROM orders AS O 
JOIN order_items AS OI
ON O.order_id=OI.order_id
WHERE O.status IN ('paid','delivered','DELIVERED') AND  O.payment_status='paid'
GROUP BY 1;