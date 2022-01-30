/*
1. Create Database
2. Drop Database
3. Create Table
4. Insert into Table
5. Drop Table
*/

SHOW DATABASES;

USE world;

SHOW TABLES;

SELECT * FROM country;

# Create Database
CREATE DATABASE customers;

USE customers;

# Create Table
CREATE TABLE customer_info(id INTEGER, first_name VARCHAR(10), last_name VARCHAR(10));

SHOW TABLES;

SELECT * FROM customer_info;

# Insert into table
INSERT INTO customer_info(id, first_name, last_name) VALUES (1, 'Swarnava', 'Mukherjee');
INSERT INTO customer_info(id, first_name, last_name) VALUES (2, "Abhishek", "Roy");

SELECT * FROM customer_info;

# Drop Table
DROP TABLE customer_info;

SHOW TABLES;

# Drop Database
DROP DATABASE customers;

SHOW DATABASES;
