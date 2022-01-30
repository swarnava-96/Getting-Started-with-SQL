/*
SQL CONSTRAINTS
SQL constraints are used to specify any rules for the records in a table.
Constraints can be used to limit the type of data that can go into a table.
It ensures the accuracy and reliability of the records in the table, and
if there is any violation between the constraints and the record action,
the action is aborted. Constraints can be column level or table level.
Column-level constraints apply to a column and table-level constraints 
apply to the whole table.

1. Not Null
2. Unique
3. Primary Key
4. Foreign Key
5. Check
6. Default
7. Index
*/

USE customers;

# Not Null Constraint
CREATE TABLE students(
id INT NOT NULL,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
age INT
);

DESC students;

ALTER TABLE students MODIFY age INT NOT NULL;

# Unique Constraint
CREATE TABLE person(
id INT NOT NULL,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
age INT NOT NULL,
UNIQUE(id)
);

DESC PERSON;

INSERT INTO person
VALUES
(1,"Swarnava","Mukherjee",25),
(2, "Sachin","Gupta",26);

SELECT * FROM person;

ALTER TABLE person ADD UNIQUE(first_name);

## Adding two features and making it unique constraint
ALTER TABLE person
ADD CONSTRAINT uc_person UNIQUE(age,first_name);

## Droping two features unique constraint
ALTER TABLE person
DROP INDEX uc_person;

# Primary Key --> Candidate Key
CREATE TABLE person1(
id INT NOT NULL,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25),
age INT,
CONSTRAINT pk_person PRIMARY KEY(id,last_name)
);

DESC person1;

ALTER TABLE person1
ADD PRIMARY KEY(id);

ALTER TABLE person1
DROP PRIMARY KEY;

ALTER TABLE person1
ADD CONSTRAINT pk_person PRIMARY KEY(id,first_name);

# Foreign Key
CREATE TABLE person2(
id INT NOT NULL,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
age INT,
salary INT,
PRIMARY KEY(id)
);

DESC person2;

CREATE TABLE department(
id INT NOT NULL,
department_id INT NOT NULL,
department_name VARCHAR(25) NOT NULL,
PRIMARY KEY(department_id),
CONSTRAINT fk_persondepartment FOREIGN KEY(id) REFERENCES person2(id)
);

DESC department;

DROP TABLE department;

CREATE TABLE department(
id INT NOT NULL,
department_id INT NOT NULL,
department_name VARCHAR(25) NOT NULL,
PRIMARY KEY(department_id)
);

DESC department;

ALTER TABLE department
ADD FOREIGN KEY(id) REFERENCES PERSON2(id);

DROP TABLE person2;
DROP TABLE department; 

# Check Constraint
CREATE TABLE person2(
id INT NOT NULL,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
age INT,
salary INT,
PRIMARY KEY(id),
CHECK(salary<50000)
);

DESC person2;

INSERT INTO person2 VALUES(1,'Swarnava','Mukherjee',25,20000);

SELECT * FROM person2;

# Default Constraint
CREATE TABLE person3(
id INT NOT NULL,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
city VARCHAR(25) DEFAULT 'Kolkata'
);

DESC person3;

ALTER TABLE person3
ALTER city DROP DEFAULT;
