/*
1. Null Values
2. Update Statement
3. Delete Statement
4. Alter Table:
	a) Add column in existing table
    b) Modify/Alter column
    c) Alter table - Drop column
*/

# Create Database
CREATE DATABASE customers;

SHOW DATABASES;

USE customers;

# Create customer_info Table
CREATE TABLE customer_info(
id integer auto_increment,
first_name varchar(25),
last_name varchar(25),
salary integer,
primary key(id)
);

SHOW TABLES;

# Insert records in a Table
INSERT INTO customer_info(first_name, last_name, salary)
VALUES
("John", "Daniel", 60000),
("Raja", "Ghosh", 40000),
("Kevin", "Richard", 70000),
("Suresh", "Gupta", 50000),
("Mohan", "Aggarwal", NULL);

SELECT * FROM customer_info;

# Retrieving the NULL value
SELECT * FROM customer_info WHERE salary IS NULL;

# Retrieving the NOT NULL value
SELECT * FROM customer_info WHERE salary IS NOT NULL;

# Update statement to replace the NULL value
UPDATE customer_info SET salary = 50000 WHERE id = 5;

# Delete statement
DELETE FROM customer_info WHERE id=5;

# Alter Tablle
## Add column in existing table
ALTER TABLE customer_info ADD COLUMN email varchar(25);
ALTER TABLE customer_info ADD COLUMN dob date;

# Update statement to insert values into email column
UPDATE customer_info SET email="hello123@gmail.com" WHERE id=1;
UPDATE customer_info SET dob=1996 WHERE id=1;

# Modify/Alter column name
ALTER TABLE customer_info MODIFY dob year;

# Checking the schema
DESC customer_info;

# Alter table - Drop column
ALTER TABLE customer_info DROP email;
ALTER TABLE customer_info DROP COLUMN last_name;
