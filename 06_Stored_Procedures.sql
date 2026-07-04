-- =====================================================
-- Project: Dairy Products Management System
-- File: 06_Stored_Procedures.sql
-- Purpose: Stored Procedures for Reusable Logic
-- =====================================================
DELIMITER //

CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE GetCustomerOrders(IN custID INT)
BEGIN
    SELECT 
        o.OrderID,
        o.OrderDate,
        o.TotalAmount,
        o.OrderStatus
    FROM Orders o
    WHERE o.CustomerID = custID;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE GetProductStock(IN prodID INT)
BEGIN
    SELECT 
        p.ProductName,
        i.AvailableStock,
        i.ReorderLevel
    FROM Inventory i
    JOIN Products p ON i.ProductID = p.ProductID
    WHERE p.ProductID = prodID;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE AddCustomer(
    IN cname VARCHAR(100),
    IN cphone VARCHAR(15),
    IN cemail VARCHAR(100),
    IN caddress VARCHAR(255)
)
BEGIN
    INSERT INTO Customers(CustomerName, Phone, Email, Address)
    VALUES(cname, cphone, cemail, caddress);
END //

DELIMITER ;

