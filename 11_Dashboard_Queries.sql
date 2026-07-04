-- =====================================================
-- Project: Dairy Products Management System
-- File: 11_Dashboard_Queries.sql
-- Purpose: Business Dashboard & Analytics
-- =====================================================
SELECT COUNT(*) AS TotalCustomers FROM Customers;
SELECT COUNT(*) AS TotalProducts FROM Products;
SELECT COUNT(*) AS TotalOrders FROM Orders;
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;
SELECT SUM(Amount) AS TotalPayments FROM Payments;
SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalSold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC;
SELECT 
    c.CustomerName,
    SUM(o.TotalAmount) AS TotalSpent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalSpent DESC;
SELECT 
    p.ProductName,
    i.AvailableStock
FROM Inventory i
JOIN Products p ON i.ProductID = p.ProductID
WHERE i.AvailableStock < 20;
SELECT 
    MONTH(OrderDate) AS Month,
    SUM(TotalAmount) AS MonthlySales
FROM Orders
GROUP BY MONTH(OrderDate)
ORDER BY Month;
SELECT 
    DeliveryStatus,
    COUNT(*) AS TotalDeliveries
FROM Delivery
GROUP BY DeliveryStatus;
