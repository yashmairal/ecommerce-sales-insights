-- ====================================================================
-- Milestone 4: Customer Segmentation & Concentration
-- File: sql/03_customers.sql
-- ====================================================================

SET search_path TO ecom;
 

WITH Customer_Summary AS (SELECT 
C.Customer_Id,
COUNT(DISTINCT O.order_id) AS Total_Orders,
COALESCE(SUM(OI.unit_price*OI.qty), 0) AS Lifetime_Spend 
FROM Customers AS C
LEFT JOIN Orders AS O
ON C.Customer_Id=O.Customer_Id  
AND  O.status IN ('paid','delivered','DELIVERED')
LEFT JOIN Order_items AS OI 
ON O.order_id=OI.order_id  
GROUP BY 1 )      

SELECT
    CASE
        WHEN total_orders = 1 THEN '1. One-Time Buyer'
        WHEN total_orders BETWEEN 2 AND 4 THEN '2. Repeat Buyer (2-4)'
        WHEN total_orders >= 5 THEN '3. VIP Buyer (5+)'
        ELSE '0. Inactive / No Orders'
    END AS Customer_Segment,
COUNT(*) AS Total_Count,    
ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER(),2) AS Pct_Customers, 
ROUND(SUM(Lifetime_Spend)::NUMERIC,2) AS Total_Revenue, 
ROUND(100 * SUM(Lifetime_Spend) / SUM(SUM(Lifetime_Spend)) OVER() , 2 ) AS Pct_Revenue,
ROUND(AVG(lifetime_spend)::NUMERIC, 2) AS Avg_customer_spend
FROM Customer_Summary
GROUP BY 1  
ORDER BY 1



