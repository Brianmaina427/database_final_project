-- Create the database
CREATE DATABASE EcommerceDB;

-- Use the newly created database
USE EcommerceDB;

-- -----------------------------------------------------
-- Table `Customers`
-- A table to store customer information
-- One-to-many relationship with 'Orders'
-- -----------------------------------------------------
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY AUTO_INCREMENT,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(100) NOT NULL UNIQUE,
  Phone VARCHAR(20),
  Address VARCHAR(255)
);

-- -----------------------------------------------------
-- Table `Products`
-- A table to store product details
-- One-to-many relationship with 'Order_Details'
-- -----------------------------------------------------
CREATE TABLE Products (
  ProductID INT PRIMARY KEY AUTO_INCREMENT,
  ProductName VARCHAR(100) NOT NULL,
  Description TEXT,
  Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0),
  StockQuantity INT NOT NULL CHECK (StockQuantity >= 0)
);

-- -----------------------------------------------------
-- Table `Orders`
-- A table to store order information
-- One-to-many relationship from 'Customers'
-- -----------------------------------------------------
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY AUTO_INCREMENT,
  OrderDate DATETIME NOT NULL,
  Status VARCHAR(50) NOT NULL DEFAULT 'Pending',
  CustomerID INT NOT NULL,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- -----------------------------------------------------
-- Table `Order_Details`
-- A linking table for the many-to-many relationship between 'Orders' and 'Products'
-- -----------------------------------------------------
CREATE TABLE Order_Details (
  OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
  OrderID INT NOT NULL,
  ProductID INT NOT NULL,
  Quantity INT NOT NULL CHECK (Quantity > 0),
  PriceAtPurchase DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
  UNIQUE KEY (OrderID, ProductID) -- Ensures a product is not duplicated in a single order
);
