E-commerce Database Design 🛒:

This repository contains the SQL script for a complete relational database management system designed for an e-commerce store. The project demonstrates core database concepts, including schema design, data normalization, and the implementation of various relationships and constraints.

Database Schema:

The database, named EcommerceDB, is composed of four main tables that manage customer information, product details, and the ordering process. The tables are linked through a well-defined structure to ensure data integrity and efficient querying.

Tables & Relationships:

Customers: Stores customer information such as name, email, and address.

Relationship: Has a one-to-many relationship with the Orders table. Each customer can place multiple orders.

Products: Holds details about the products available in the store, including name, price, and stock quantity.

Relationship: Has a one-to-many relationship with the Order_Details table.

Orders: Contains information about each order placed, such as the order date and its current status.

Relationship: The CustomerID is a foreign key linking each order to a specific customer, enforcing the one-to-many relationship.

Order_Details: Serves as a junction table to manage the many-to-many relationship between Orders and Products. It records the quantity and price of each item within an order.

Key Features:

Normalization: The database schema adheres to normalization principles, reducing data redundancy and improving data integrity.

Constraints: Proper use of constraints ensures data quality:

PRIMARY KEY: Uniquely identifies each record.

FOREIGN KEY: Enforces referential integrity between tables.

NOT NULL: Prevents essential fields from being empty.

UNIQUE: Guarantees unique values for columns like email addresses.

CHECK: Ensures data validity, e.g., prices and quantities are non-negative.
