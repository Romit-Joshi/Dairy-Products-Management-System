-- =====================================================
-- Project: Dairy Products Management System
-- File: 07_Functions.sql
-- Purpose: User Defined Functions
-- =====================================================
DELIMITER //

CREATE FUNCTION CalculateTotalPrice(qty INT, price DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN qty * price;
END //

DELIMITER ;
DELIMITER //

CREATE FUNCTION GetCustomerName(custID INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE cname VARCHAR(100);

    SELECT CustomerName INTO cname
    FROM Customers
    WHERE CustomerID = custID;

    RETURN cname;
END //

DELIMITER ;
DELIMITER //

CREATE FUNCTION CheckStock(prodID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stock INT;

    SELECT AvailableStock INTO stock
    FROM Inventory
    WHERE ProductID = prodID;

    RETURN stock;
END //

DELIMITER ;
