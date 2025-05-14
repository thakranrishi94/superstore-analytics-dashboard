CREATE DATABASE SuperstoreDB;
USE SuperstoreDB;

# Check for duplicates based on key columns

select orderID, count(*) as DuplicateCount
from superstore
group by orderID
having count(*) > 1;

# Remove duplicates

delete from superstore
where orderID in (
	select orderID from (
		select orderID from superstore
        group by orderID
        having count(*) > 1) as temp);
        
# Find missing values

SELECT *
FROM Superstore
WHERE CustomerName IS NULL OR Sales IS NULL OR Profit IS NULL;

# Check and removing invalid data

SELECT *
FROM Superstore
WHERE Sales < 0 OR Profit < 0;

DELETE FROM Superstore
WHERE Sales < 0 OR Profit < 0;

# Check and fix invalid dates

SELECT *
FROM Superstore
WHERE ShipDate < OrderDate;

UPDATE Superstore
SET ShipDate = OrderDate
WHERE ShipDate < OrderDate;


# DATA ANALYSIS

# Total Sales, Profit, and Orders

SELECT 
    SUM(Sales) AS TotalSales, 
    SUM(Profit) AS TotalProfit, 
    COUNT(DISTINCT OrderID) AS TotalOrders
FROM Superstore;

# Sales by Category

SELECT 
    Category, 
    SUM(Sales) AS TotalSales, 
    SUM(Profit) AS TotalProfit
FROM Superstore
GROUP BY Category
ORDER BY TotalSales DESC;

# Monthly Sales Trends

SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month, 
    SUM(Sales) AS MonthlySales
FROM Superstore
GROUP BY Month
ORDER BY Month;

# Top 5 Customers by Revenue

SELECT 
    CustomerName, 
    SUM(Sales) AS TotalSales
FROM Superstore
GROUP BY CustomerName
ORDER BY TotalSales DESC
LIMIT 5;

# Regional Performance

SELECT 
    Region, 
    SUM(Sales) AS TotalSales, 
    SUM(Profit) AS TotalProfit
FROM Superstore
GROUP BY Region
ORDER BY TotalSales DESC;

# Export Cleaned Data

SELECT *
FROM Superstore
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Cleaned_Superstore.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';



select * from superstore;





