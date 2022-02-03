# Lets create the database first that will hold our two tables
CREATE DATABASE ecom;

# Lets use this ecom database
USE ecom;

# Lets create our first table that is customer table:
CREATE TABLE customer(
customer_id INT NOT NULL,
customer_name VARCHAR(25) NOT NULL,
city VARCHAR(25) NOT NULL,
grade INT,
deliveryagent_id INT NOT NULL,
PRIMARY KEY(customer_id)
);

# Lets see the schema of the table
DESC customer;

# Lets insert values into our customer table
INSERT INTO customer VALUES
(3002,"Nick Rimando","New York",100,5001),
(3007,"Brad Davis","New York",200,5001),
(3005,"Graham Zusi","California",200,5002),
(3008,"Julian Green","London",300,5002),
(3004,"Fabian Johnson","Paris",300,5006),
(3009,"Geoff Cameron","Berlin",100,5003),
(3003,"Jozy Altidor","Moscow",200,5007),
(3001,"Brad Guzan","London",100,5005);

# Lets see the entries
SELECT * FROM customer;

# Additional step as I have wrongly inserted one value
UPDATE customer SET grade=NULL WHERE customer_id=3001;

# Lets create our second table that is deliveryagent table:
CREATE TABLE deliveryagent(
deliveryagent_id INT NOT NULL,
name VARCHAR(25) NOT NULL,
city VARCHAR(25) NOT NULL,
commission DECIMAL(6,2) NOT NULL,
PRIMARY KEY(deliveryagent_id)
);

# Lets see the schema of the table
DESC deliveryagent;

# Lets insert values into our deliveryagent table
INSERT INTO deliveryagent VALUES
(5001,"James Hoog","New York",0.15),
(5002,"Nail Knite","Paris",0.13),
(5005,"Pit Alex","London",0.11),
(5006,"Mc Lyon","Paris",0.14),
(5007,"Paul Adam","Rome",0.13),
(5003,"Lauson Hen","San Jose",0.12);

# Lets see the entries
SELECT * FROM deliveryagent;

/*Answer 3:
SQL query to display the customer_name, customer city, grade, 
deliveryagent, deliveryagent city. 
The result should be ordered by ascending on customer_id. 
*/

SELECT customer.customer_id, customer.customer_name, customer.city, customer.grade, deliveryagent.name, deliveryagent.city
FROM customer LEFT JOIN deliveryagent
ON
customer.deliveryagent_id=deliveryagent.deliveryagent_id
ORDER BY customer.customer_id;