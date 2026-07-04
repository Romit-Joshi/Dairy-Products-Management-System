-- =====================================================
-- Project: Dairy Products Management System
-- File: 10_Indexes.sql
-- Purpose: Performance Optimization using Indexes
-- =====================================================
CREATE INDEX idx_customer_phone
ON Customers(Phone);
CREATE INDEX idx_product_name
ON Products(ProductName);
CREATE INDEX idx_orders_customer
ON Orders(CustomerID);
CREATE INDEX idx_orderdetails_product
ON OrderDetails(ProductID);
CREATE INDEX idx_payments_order
ON Payments(OrderID);
