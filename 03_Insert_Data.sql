-- =====================================================
-- Project : Dairy Products Management System
-- File    : 03_Insert_Data.sql
-- Purpose : Insert Sample Data
-- Author  : Romit Joshi
-- =====================================================
INSERT INTO Categories (CategoryName)
VALUES
('Milk'),
('Butter'),
('Cheese'),
('Curd'),
('Paneer'),
('Ghee'),
('Ice Cream');
INSERT INTO Suppliers
(SupplierName, ContactPerson, Phone, Email, Address)
VALUES
('Amul Ltd','Ramesh','9876543210','amul@gmail.com','Ahmedabad'),
('Mother Dairy','Suresh','9876543211','mother@gmail.com','Delhi'),
('Parag Foods','Mahesh','9876543212','parag@gmail.com','Pune'),
('Britannia','Rajesh','9876543213','brit@gmail.com','Bangalore'),
('Nestle','Amit','9876543214','nestle@gmail.com','Mumbai');
INSERT INTO Products
(ProductName, CategoryID, SupplierID, Price)
VALUES
('Toned Milk',1,1,68),
('Salted Butter',2,2,55),
('Cheddar Cheese',3,3,180),
('Fresh Curd',4,4,45),
('Paneer',5,5,320),
('Pure Ghee',6,1,650),
('Vanilla Ice Cream',7,2,120);
INSERT INTO Customers
(CustomerName, Phone, Email, Address)
VALUES
('Rahul Sharma','9876500001','rahul@gmail.com','Mumbai'),
('Priya Singh','9876500002','priya@gmail.com','Delhi'),
('Amit Verma','9876500003','amit@gmail.com','Pune'),
('Neha Joshi','9876500004','neha@gmail.com','Jaipur'),
('Rohit Patel','9876500005','rohit@gmail.com','Ahmedabad');
INSERT INTO Employees
(EmployeeName, Designation, Salary, Phone)
VALUES
('Ankit','Manager',45000,9876500101),
('Rohit','Cashier',28000,9876500102),
('Sahil','Sales Executive',25000,9876500103),
('Meena','Store Keeper',26000,9876500104),
('Pooja','Delivery Executive',24000,9876500105);
INSERT INTO Orders
(CustomerID, EmployeeID, OrderDate, TotalAmount, OrderStatus)
VALUES
(1,1,'2025-06-01',358,'Delivered'),
(2,2,'2025-06-02',620,'Delivered'),
(3,3,'2025-06-03',180,'Pending'),
(4,4,'2025-06-04',608,'Delivered'),
(5,5,'2025-06-05',45,'Processing');
INSERT INTO OrderDetails
(OrderID, ProductID, Quantity, UnitPrice, TotalPrice)
VALUES
(1,1,2,68,136),
(1,2,4,55,220),
(2,6,1,650,650),
(3,3,1,180,180),
(4,5,2,320,640),
(5,4,1,45,45);
INSERT INTO Inventory
(ProductID, AvailableStock, ReorderLevel)
VALUES
(1,100,20),
(2,80,15),
(3,60,10),
(4,120,30),
(5,50,10),
(6,40,8),
(7,70,15);
INSERT INTO Payments
(OrderID, PaymentDate, Amount, PaymentMethod, PaymentStatus)
VALUES
(1,'2025-06-01',358,'UPI','Paid'),
(2,'2025-06-02',620,'Card','Paid'),
(3,'2025-06-03',180,'Cash','Pending'),
(4,'2025-06-04',608,'Net Banking','Paid'),
(5,'2025-06-05',45,'Cash','Pending');
INSERT INTO Delivery
(OrderID, DeliveryDate, DeliveryStatus, DeliveryAddress)
VALUES
(1,'2025-06-02','Delivered','Mumbai'),
(2,'2025-06-03','Delivered','Delhi'),
(3,'2025-06-04','Pending','Pune'),
(4,'2025-06-05','Delivered','Jaipur'),
(5,'2025-06-06','Processing','Ahmedabad');
INSERT INTO Purchase
(SupplierID, PurchaseDate, TotalAmount)
VALUES
(1,'2025-05-25',15000),
(2,'2025-05-26',12000),
(3,'2025-05-27',10000),
(4,'2025-05-28',8000),
(5,'2025-05-29',9000);
INSERT INTO PurchaseDetails
(PurchaseID, ProductID, Quantity, CostPrice)
VALUES
(1,1,100,55),
(2,2,80,45),
(3,3,60,150),
(4,4,120,30),
(5,5,50,250);
INSERT INTO Discounts
(ProductID, DiscountPercent, StartDate, EndDate)
VALUES
(1,10,'2025-06-01','2025-06-30'),
(2,5,'2025-06-01','2025-06-30'),
(3,15,'2025-06-01','2025-06-30'),
(4,8,'2025-06-01','2025-06-30'),
(5,12,'2025-06-01','2025-06-30');
INSERT INTO Feedback
(CustomerID, ProductID, Rating, Comments, FeedbackDate)
VALUES
(1,1,5,'Excellent Quality','2025-06-02'),
(2,2,4,'Very Good','2025-06-03'),
(3,3,5,'Fresh Cheese','2025-06-04'),
(4,5,4,'Nice Paneer','2025-06-05'),
(5,4,5,'Very Fresh','2025-06-06');