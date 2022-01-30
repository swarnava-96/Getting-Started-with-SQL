/* SQL Joins
1. Inner Join
2. Left Join
3. Right Join
4. Full Join
5. Natural Join
6. Cross Join
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
(3,"Pushpok","Jaiswal",24),
(4, "Deeyan","Mukherjee",25),
(5, "Pranoy","Mundal",24);

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

# Inner Join
SELECT students.first_name, students.last_name, students.age, department.department_name 
FROM students 
INNER JOIN department
ON 
students.student_id=department.student_id;

# Left Join
SELECT students.first_name, students.last_name, students.age, department.department_name
FROM students LEFT JOIN department
ON
students.student_id=department.student_id;

# Right Join
SELECT students.first_name, students.last_name, students.age, department.department_name
FROM students RIGHT JOIN department
ON
students.student_id=department.student_id;

# Full Outer Join
SELECT students.first_name, students.last_name, students.age, department.department_name
FROM students LEFT JOIN department
ON
students.student_id=department.student_id
UNION
SELECT students.first_name, students.last_name, students.age, department.department_name
FROM students RIGHT JOIN department
ON
students.student_id=department.student_id;

# Natural Join
SELECT students.first_name, students.last_name, students.age, department.department_name
FROM students NATURAL JOIN department;

# Cross Join
SELECT students.first_name, students.last_name, students.age, department.department_name
FROM students CROSS JOIN department;





