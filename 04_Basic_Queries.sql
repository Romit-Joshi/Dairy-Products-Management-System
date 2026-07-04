-- =====================================================
-- Project: Dairy Products Management System
-- File: 04_Basic_Queries.sql
-- Purpose: Basic SELECT, JOIN, Aggregation Queries
-- =====================================================
SHOW TABLES;
SELECT * FROM Products;
SELECT * FROM Customers;
SELECT 
    o.OrderID,
    c.CustomerName,
    o.OrderDate,
    o.TotalAmount,
    o.OrderStatus
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;
SELECT 
    od.OrderID,
    p.ProductName,
    od.Quantity,
    od.UnitPrice,
    od.TotalPrice
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID;
SELECT COUNT(*) AS TotalOrders FROM Orders;
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;
SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalSold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC;
SELECT 
    p.ProductName,
    i.AvailableStock
FROM Inventory i
JOIN Products p ON i.ProductID = p.ProductID
WHERE i.AvailableStock < 50;
SELECT * FROM Payments;
