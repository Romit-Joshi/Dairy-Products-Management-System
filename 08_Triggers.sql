-- =====================================================
-- Project: Dairy Products Management System
-- File: 08_Triggers.sql
-- Purpose: Automatic Stock & Business Logic
-- =====================================================
DELIMITER //

CREATE TRIGGER ReduceStockAfterOrder
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET AvailableStock = AvailableStock - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END //

DELIMITER ;
DELIMITER //

CREATE TRIGGER IncreaseStockAfterPurchase
AFTER INSERT ON PurchaseDetails
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET AvailableStock = AvailableStock + NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END //

DELIMITER ;
DELIMITER //

CREATE TRIGGER PreventNegativeStock
BEFORE INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    DECLARE currentStock INT;

    SELECT AvailableStock INTO currentStock
    FROM Inventory
    WHERE ProductID = NEW.ProductID;

    IF currentStock < NEW.Quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient Stock Available';
    END IF;
END //

DELIMITER ;
