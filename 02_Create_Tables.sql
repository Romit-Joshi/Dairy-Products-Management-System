-- =====================================================
-- TABLE: Categories
-- =====================================================

CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);
-- =====================================================
-- TABLE: Suppliers
-- =====================================================

CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactPerson VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255)
);
-- =====================================================
-- TABLE: Products
-- =====================================================

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT,
    SupplierID INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
-- =====================================================
-- TABLE: Customers
-- =====================================================

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Email VARCHAR(100),
    Address VARCHAR(255)
);
-- =====================================================
-- TABLE: Employees
-- =====================================================

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Designation VARCHAR(100),
    Salary DECIMAL(10,2),
    Phone VARCHAR(15)
);
-- =====================================================
-- TABLE: Orders
-- =====================================================

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    OrderStatus VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
-- =====================================================
-- TABLE: OrderDetails
-- =====================================================

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    TotalPrice DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- =====================================================
-- TABLE: Inventory
-- =====================================================

CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    AvailableStock INT,
    ReorderLevel INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- =====================================================
-- TABLE: Payments
-- =====================================================

CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    PaymentStatus VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
-- =====================================================
-- TABLE: Delivery
-- =====================================================

CREATE TABLE Delivery (
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    DeliveryDate DATE,
    DeliveryStatus VARCHAR(50),
    DeliveryAddress VARCHAR(255),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
-- =====================================================
-- TABLE: Purchase
-- =====================================================

CREATE TABLE Purchase (
    PurchaseID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierID INT,
    PurchaseDate DATE,
    TotalAmount DECIMAL(10 , 2 ),
    FOREIGN KEY (SupplierID)
        REFERENCES Suppliers (SupplierID)
);
-- =====================================================
-- TABLE: PurchaseDetails
-- =====================================================

CREATE TABLE PurchaseDetails (
    PurchaseDetailID INT AUTO_INCREMENT PRIMARY KEY,
    PurchaseID INT,
    ProductID INT,
    Quantity INT,
    CostPrice DECIMAL(10,2),
    FOREIGN KEY (PurchaseID) REFERENCES Purchase(PurchaseID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- =====================================================
-- TABLE: Discounts
-- =====================================================

CREATE TABLE Discounts (
    DiscountID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    DiscountPercent DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- =====================================================
-- TABLE: Feedback
-- =====================================================

CREATE TABLE Feedback (
    FeedbackID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Rating INT,
    Comments VARCHAR(255),
    FeedbackDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
