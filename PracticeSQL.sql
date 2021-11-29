show databases;

/* DATA DEFINITION LANGUAGE COMMANDS (DDL) */ 


/* Creating a database */
CREATE database practice;

USE practice;

/* Creating table */
CREATE TABLE employees(
emp_id INT(10) NOT NULL,
first_name VARCHAR(20),
last_name VARCHAR(20) NOT NULL,
salary INT(10) NOT NULL,
PRIMARY KEY (emp_id));

/* Lets see the table */
SELECT * FROM employees;

/* Lets see the table structure */
DESCRIBE employees;

/* Adding a new column */
ALTER TABLE employees ADD COLUMN contact INT(10);
ALTER TABLE employees ADD COLUMN dept_id INT(10);

/* Renaming column name */
ALTER TABLE employees RENAME COLUMN contact TO job_code;

/* Deleting records from table using TRUNCATE */ 
TRUNCATE TABLE employees;

/* Deleting the entire table using DROP */
DROP TABLE employees;

/* DATA MANIPULATION LANGUAGE COMMANDS (DML) */ 

/* Inserting data into database using INSERT */
INSERT INTO employees(
emp_id, first_name, last_name, salary)
VALUES(
101, 'Steven', 'King', 10000);

INSERT INTO employees
VALUES(
102, 'Edwin', 'Thomas', 15000);

INSERT INTO employees
VALUES(
10, 'Harry', 'Potter', 20000);

INSERT INTO employees 
VALUES(
104, 'John', 'Cena', 50000);

INSERT INTO employees 
VALUES(105, 'Steven','Lorel', 150000);

INSERT INTO employees(
emp_id, last_name, salary)
VALUES(106, 'Andrew', 25000);


/* Updating data into database using UPDATE */
UPDATE employees
SET emp_id = 103
WHERE emp_id = 10;

UPDATE employees
SET first_name = "John"
WHERE emp_id = 101;

UPDATE employees 
SET salary = 15000
WHERE emp_id = 105;

UPDATE employees
SET dept_id = 1
WHERE EMP_ID = 101;

UPDATE employees
SET dept_id = 2
WHERE EMP_ID = 102;

UPDATE employees
SET dept_id = 3
WHERE EMP_ID = 103;

UPDATE employees
SET dept_id = 1
WHERE EMP_ID = 104;

UPDATE employees
SET dept_id = 2
WHERE EMP_ID = 105;

UPDATE employees
SET dept_id = 3
WHERE EMP_ID = 106;

/* Deleting data into database using DELETE */
DELETE FROM employees
WHERE emp_id IN (101,103);


/* DATA CONTROL LANGUAGE COMMANDS (DCL) */ 
/* GRANT: GRANT <column names> ON <table name> TO <user> */
/* REVOKE: REVOKE <column names> ON <table name> TO <user> */
/* GRANT is used for giving access to users of specific columns. REVOKE is used for hiding specific columns from certain users. */

/* TRANSACTION CONTROL LANGUAGE COMMANDS (TCL) */

/* COMMIT -> saves the work done, ROLLBACK -> restores database to origin state since last commit, SAVEPOINT -> identify a point in a transaction to which you can rollback later. */

/* SQL OPERATORS */

/* FILTER OPERATORS -- WHERE */
SELECT* FROM employees WHERE emp_id = 101;
SELECT * FROM employees WHERE salary = 10000;

/* LOGICAL OPERATORS -- AND, OR, NOT */
SELECT * FROM employees WHERE first_name = 'Steven' AND last_name = 'King';
SELECT * FROM employees WHERE first_name = 'Steven' OR salary = 20000;
SELECT * FROM employees WHERE first_name = 'Steven' AND salary != 20000;

/* COMPARISION OPERATORS -- =, >, >=, <, <=, <> or != */
SELECT * FROM employees WHERE first_name = 'Steven' AND salary <= 20000;
SELECT * FROM employees WHERE first_name = 'Steven' AND salary >=15000;

/* SPECIAL OPERATORS -- BETWEEN, LIKE, ISNULL, IN, DISTINCT */
SELECT * FROM employees WHERE salary BETWEEN 15000 AND 20000;
SELECT * FROM employees WHERE first_name LIKE 'Steven';
SELECT * FROM employees WHERE first_name IS NULL;
SELECT * FROM employees WHERE salary IN (10000, 20000);
SELECT DISTINCT(first_name) FROM employees;

/* AGGREGATION OPERATORS -- AVG, COUNT, MAX, MIN, SUM */
SELECT AVG(salary) FROM employees;
SELECT COUNT(*) FROM employees;
SELECT MIN(salary) FROM employees;
SELECT MAX(salary) FROM employees;
SELECT SUM(salary) FROM employees;

/* GROUP BY CLAUSE */
SELECT first_name, MAX(salary), dept_id 
FROM employees 
GROUP BY dept_id;

/* HAVING CLAUSE */
SELECT AVG(salary), dept_id
FROM employees
GROUP BY dept_id
HAVING COUNT(dept_id) >=2;

/* ORDER BY CLAUSE */
SELECT * FROM employees
ORDER BY salary DESC;

/* UNION OPERATOR */

CREATE TABLE product1(
category_id INT,
product_name VARCHAR(20)
);

SELECT * FROM product1;

INSERT INTO product1
VALUES(1, 'Samsung');

INSERT INTO product1
VALUES(2, 'Nokia');

INSERT INTO product1
VALUES(3, 'Redmi');

INSERT INTO product1
VALUES(6, 'HP');

CREATE TABLE product2(
category_id INT,
product_name VARCHAR(20)
);

SELECT * FROM product2;

INSERT INTO product2
VALUES(1, 'Samsung');

INSERT INTO product2
VALUES(2, 'Nokia');

INSERT INTO product2
VALUES(5, 'Apple');

INSERT INTO product2
VALUES(4, 'HP');

INSERT INTO product2
VALUES(10, 'Dell');

SELECT product_name FROM product1
UNION
SELECT product_name FROM product2;

/* UNION ALL OPERATOR */
SELECT product_name FROM product1
UNION ALL
SELECT product_name FROM product2;

/* SQL JOINS */

CREATE TABLE department(
dept_id INT(10),
dept VARCHAR(20)
);

ALTER TABLE department
ADD COLUMN dept_location VARCHAR(20);

SELECT * FROM department;

INSERT INTO department
VALUES(1, 'Data Science','Kolkata');

INSERT INTO department
VALUES(2, 'Big Data', 'Bangalore');

INSERT INTO department
VALUES(3, 'Finance', 'Hyderabad');

INSERT INTO department
VALUES(4, 'Human Resource','Mumbai');

INSERT INTO department
VALUES(5, 'Block Chain', 'Delhi');

/* INNER JOIN */
SELECT e.first_name, e.salary, d.dept_id, d.dept_location, d.dept
FROM employees e
INNER JOIN department d
ON 
e.dept_id = d.dept_id;

/*LEFT JOIN */
SELECT e.first_name, e.salary, e.dept_id, d.dept, d.dept_location
FROM employees e
LEFT JOIN department d
ON 
e.dept_id = d.dept_id;

/* RIGHT JOIN */ 
SELECT e.first_name, e.salary, d.dept_id, d.dept, d.dept_location
FROM employees e
RIGHT JOIN department d
ON
e.dept_id = d.dept_id;

/* FULL OUTER JOIN */
SELECT e.first_name, e.salary, d.dept_id, d.dept, d.dept_location
FROM employees e
LEFT JOIN department d
ON
e.dept_id = d.dept_id
UNION
SELECT e.first_name, e.salary, d.dept_id, d.dept, d.dept_location
FROM employees e
RIGHT JOIN department d
ON
e.dept_id = d.dept_id;

/* CROSS JOIN */ 
SELECT * FROM employees 
CROSS JOIN department;

