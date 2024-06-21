-- Create a database for stock management
CREATE DATABASE IF NOT EXISTS StockManagement;

-- Use the created database
USE StockManagement;

-- Create a table for products
CREATE TABLE IF NOT EXISTS Products (
    ProductID INTEGER PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(255) NOT NULL,
    Category VARCHAR(50),
    UnitPrice DECIMAL(10, 2) NOT NULL,
    StockQuantity INTEGER NOT NULL
);

alter Table Products ADD ProductID AUTO_INCREMENT;

-- Create a table for suppliers
CREATE TABLE IF NOT EXISTS Suppliers (
    SupplierID INTEGER PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(255) NOT NULL,
    ContactPerson VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(255)
);

-- Create a table for transactions
CREATE TABLE IF NOT EXISTS Transactions (
    TransactionID INTEGER PRIMARY KEY AUTO_INCREMENT,
    ProductID INTEGER,
    SupplierID INTEGER,
    TransactionType VARCHAR(10) NOT NULL, -- 'In' for stock in, 'Out' for stock out
    Quantity INTEGER NOT NULL,
    TransactionDate DATE NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Insert sample data into the Products table
INSERT INTO Products (ProductName, Category, UnitPrice, StockQuantity) VALUES
    ('Laptop', 'Electronics', 899.99, 50),
    ('Printer', 'Office Supplies', 149.99, 30),
    ('Chair', 'Furniture', 49.99, 100);

-- Insert sample data into the Suppliers table
INSERT INTO Suppliers (SupplierName, ContactPerson, ContactNumber, Email) VALUES
    ('ABC Electronics', 'Rahul Sharma', '9876543210', 'rahul.sharma@example.com'),
    ('XYZ Office Supplies', 'Neha Kapoor', '8765432109', 'neha.kapoor@example.com'),
    ('PQR Furniture', 'Amit Singh', '7654321098', 'amit.singh@example.com'),
    ('LMN Stationery', 'Sneha Verma', '6543210987', 'sneha.verma@example.com'),
    ('UVW Tech Solutions', 'Kiran Gupta', '5432109876', 'kiran.gupta@example.com');

-- Insert sample data into the Transactions table
-- Assuming you have corresponding ProductIDs in the Products table
INSERT INTO Transactions (ProductID, SupplierID, TransactionType, Quantity, TransactionDate) VALUES
    (1, 1, 'In', 50, '2024-01-12'),
    (2, 2, 'In', 30, '2024-01-13'),
    (3, 3, 'In', 100, '2024-01-14'),
    (1, 4, 'Out', 20, '2024-01-15'),
    (2, 5, 'Out', 10, '2024-01-16');
