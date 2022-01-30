/* SQL Views
View is a virtual table based on the result set of an SQL query.
Note: Update statemts, groupby, having statements, aggregate functions, union,left right outer joins,
subqueries will not work inside VIEWS.
*/

USE customers;

SHOW TABLES;

CREATE TABLE students(
student_id INT AUTO_INCREMENT,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
age INT,
PRIMARY KEY(student_id)
);

DESC students;

INSERT INTO students VALUES
(1,"Swarnava","Mukherjee",25),
(2,"Abhishek","Roy",25),
(3,"Pushpok","Jaiswal",24);

SELECT * FROM students;

CREATE TABLE department(
student_id INT AUTO_INCREMENT,
department_name VARCHAR(25) NOT NULL,
FOREIGN KEY(student_id) REFERENCES students(student_id)
);

DESC department;

INSERT INTO department VALUES
(1,"Economics"),
(2,"Finance"),
(3,"Computer Science");

SELECT * FROM department;

# Creating View and Inner Join
CREATE VIEW student_info AS
SELECT first_name, last_name, age, department_name FROM students 
INNER JOIN
department
USING(student_id);

SELECT * FROM student_info;

DROP VIEW student_info;