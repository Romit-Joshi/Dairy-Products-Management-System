-- =====================================================
-- Project: Dairy Products Management System
-- File: 05_Views.sql
-- Purpose: Create Views for Reporting
-- =====================================================
CREATE VIEW CustomerOrdersView AS
SELECT 
    o.OrderID,
    c.CustomerName,
    o.OrderDate,
    o.TotalAmount,
    o.OrderStatus
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;
CREATE VIEW ProductSalesView AS
SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.TotalPrice) AS TotalSales
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;
CREATE VIEW InventoryStatusView AS
SELECT 
    p.ProductName,
    i.AvailableStock,
    i.ReorderLevel
FROM Inventory i
JOIN Products p ON i.ProductID = p.ProductID;
CREATE VIEW SupplierPurchaseView AS
SELECT 
    s.SupplierName,
    pu.PurchaseID,
    pu.PurchaseDate,
    pu.TotalAmount
FROM Purchase pu
JOIN Suppliers s ON pu.SupplierID = s.SupplierID;
CREATE VIEW PaymentSummaryView AS
SELECT 
    o.OrderID,
    p.PaymentDate,
    p.Amount,
    p.PaymentMethod,
    p.PaymentStatus
FROM Payments p
JOIN Orders o ON p.OrderID = o.OrderID;
