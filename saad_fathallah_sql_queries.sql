-- Create the database
CREATE DATABASE superstore;
USE superstore;
CREATE TABLE sales (
    Row_ID INT,
    Order_ID TEXT,
    Order_Date TEXT,
    Ship_Date TEXT,
    Ship_Mode TEXT,
    Customer_ID TEXT,
    Customer_Name TEXT,
    Segment TEXT,
    Country TEXT,
    City TEXT,
    State TEXT,
    Postal_Code TEXT,
    Region TEXT,
    Product_ID TEXT,
    Category TEXT,
    Sub_Category TEXT,
    Product_Name TEXT,
    Sales DECIMAL(10,2)
);
SELECT COUNT(*) FROM sales;
SELECT * FROM sales LIMIT 5;
DESCRIBE sales;
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;
SELECT 
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
GROUP BY Segment
ORDER BY Total_Sales DESC;
SELECT 
    Category,
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
GROUP BY Category, Region
ORDER BY Category, Region;
SELECT DISTINCT Customer_Name
FROM sales
WHERE Customer_Name NOT IN (
    SELECT DISTINCT Customer_Name
    FROM sales
    WHERE STR_TO_DATE(Order_Date, '%c/%e/%Y') >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
);
SELECT 
    DATE_FORMAT(STR_TO_DATE(`Order Date`, '%c/%e/%Y'), '%Y-%m') AS Month,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
GROUP BY Month
ORDER BY Month;
SELECT 
    `Customer Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 5;
SELECT 
    `Product Name`,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 5;
SELECT 
    `Ship Mode`,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
GROUP BY `Ship Mode`
ORDER BY Total_Sales DESC;
SELECT DISTINCT `Customer Name`
FROM sales
WHERE `Customer Name` NOT IN (
    SELECT DISTINCT `Customer Name`
    FROM sales
    WHERE STR_TO_DATE(`Order Date`, '%c/%e/%Y') >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
);
SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    COUNT(DISTINCT `Order ID`) AS Total_Orders,
    ROUND(SUM(Sales) / COUNT(DISTINCT `Order ID`), 2) AS Avg_Order_Value
FROM sales;