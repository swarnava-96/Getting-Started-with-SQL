/* SQL Indexes
CREATE INDEX statement in SQL is used create indexes in tables.
The indexes are used to retrieve data from the database more quickly than others.
The user cannot see the indexes, and they are just used to speed up queries/searches.
Note: Updating the table with indexes takes a lot of time than updating a table without indexes.
It is because the indexes also needs an update.
So, only create indexes on those columns that will be frequently searched against.
*/

 USE customers;
 
 SHOW TABLES;
 
 CREATE TABLE person4(
 id INT NOT NULL,
 first_name VARCHAR(25) NOT NULL,
 last_name VARCHAR(25) NOT NULL,
 age INT
 );
 
 SELECT * FROM person4;
 
 DESC person4;
 
 CREATE INDEX index_age
 ON person4(age);
 
 CREATE INDEX index_age_id
 ON person4(age,id);
 
 ALTER TABLE person4
 DROP INDEX index_age;
 
 ALTER TABLE person4
 DROP INDEX index_age_id;
 