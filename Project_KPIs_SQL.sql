USE swiggy_dashboard_db;

-- 1. Total Orders
SELECT COUNT(OrderID) AS Total_Orders
FROM Orders;

-- 2. Total Revenue
SELECT SUM(`Total Amount`) AS Total_Revenue
FROM Orders;

-- 3. Average Order Value (AOV)
SELECT 
    ROUND(SUM(`Total Amount`) / COUNT(OrderID), 2) AS Average_Order_Value
FROM Orders;

-- 4. Total Customers
SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM Orders;

-- 5. Repeat Customers Percentage
SELECT 
    ROUND(
        (COUNT(*) - COUNT(DISTINCT `Customer ID`)) / COUNT(DISTINCT `Customer ID`) * 100, 2
    ) AS Repeat_Customers_Percentage
FROM Orders;

-- 6. Delivery Efficiency (On-Time Deliveries %)
SELECT 
    ROUND(
        SUM(CASE WHEN `Delivery Status` = 'On Time' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2
    ) AS OnTime_Delivery_Percentage
FROM Delivery;

-- 7. Top Performing Restaurants (By Revenue)
SELECT 
    r.Name AS Restaurant_Name,
    SUM(o.`Total Amount`) AS Revenue
FROM Orders o
JOIN Restaurant r ON o.`Restaurant ID` = r.RestaurantID
GROUP BY r.Name
ORDER BY Revenue DESC
LIMIT 3;

-- 8. Order Cancellation Rate
SELECT 
    ROUND(
        SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2
    ) AS Cancellation_Rate_Percentage
FROM Orders;

-- 9. Customer Satisfaction Score (CSS)
SELECT 
    ROUND(AVG(`Delivery Feedback Rating`), 2) AS Customer_Satisfaction_Score
FROM Delivery;

-- 10. Active Delivery Agents
SELECT 
    COUNT(DISTINCT `Delivery Agent ID`) AS Active_Delivery_Agents
FROM Delivery;

-- 11. Average Delivery Time (in Minutes)
SELECT 
    ROUND(AVG(timestampdiff(MINUTE, `Pickup Time`, `Actual Delivery Time`)), 2) AS Avg_Delivery_Time_Minutes
FROM Delivery
WHERE `Pickup Time` IS NOT NULL AND `Actual Delivery Time` IS NOT NULL;


-- 12. Revenue Per Customer
SELECT 
    ROUND(SUM(`Total Amount`) / COUNT(DISTINCT `Customer ID`), 2) AS Revenue_Per_Customer
FROM Orders;

-- 13. Peak Order Hours
SELECT 
    HOUR(`Order Date`) AS Order_Hour,
    COUNT(OrderID) AS Order_Count
FROM Orders
GROUP BY Order_Hour
ORDER BY Order_Count DESC;

-- 14. Top Food Categories
SELECT 
    r.`Cuisine Type` AS Category,
    COUNT(o.OrderID) AS Orders
FROM Orders o
JOIN Restaurant r ON o.`Restaurant ID` = r.RestaurantID
GROUP BY r.`Cuisine Type`
ORDER BY Orders DESC
LIMIT 10;

-- 15. Customer Lifetime Value (CLV)
SELECT 
    ROUND(SUM(`Total Amount`) / COUNT(OrderID), 2) AS AOV,
    ROUND(COUNT(OrderID) / COUNT(DISTINCT `Customer ID`), 2) AS AvgOrderFrequency,
    ROUND(
        (SUM(`Total Amount`) / COUNT(OrderID)) * (COUNT(OrderID) / COUNT(DISTINCT `Customer ID`)),
        2
    ) AS CLV
FROM Orders	
WHERE TRIM(LOWER(`Status`)) != 'Cancelled';