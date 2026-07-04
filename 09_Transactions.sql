-- =====================================================
-- Project: Dairy Products Management System
-- File: 09_Transactions.sql
-- Purpose: Safe Transactions (COMMIT / ROLLBACK)
-- =====================================================
START TRANSACTION;

INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, TotalAmount, OrderStatus)
VALUES (1, 1, CURDATE(), 500, 'Processing');

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice, TotalPrice)
VALUES (LAST_INSERT_ID(), 1, 2, 250, 500);

-- If everything is correct
COMMIT;
START TRANSACTION;

INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, TotalAmount, OrderStatus)
VALUES (2, 2, CURDATE(), 300, 'Processing');

-- Suppose something goes wrong
ROLLBACK;
START TRANSACTION;

INSERT INTO Payments (OrderID, PaymentDate, Amount, PaymentMethod, PaymentStatus)
VALUES (1, CURDATE(), 500, 'UPI', 'Paid');

COMMIT;