/* SAMPLE CRICKET CASE STUDY */

SELECT * FROM cricket_1;
SELECT * FROM cricket_2;

/* Find all the players who were present in test match 1 or test match 2 */
SELECT Player_Name from cricket_1
UNION
SELECT Player_Name from cricket_2;

/* Write a MySQL query to find the players from the test match 1 having popularity higher than the average popularity. */
SELECT Player_Name, Popularity FROM cricket_1 WHERE Popularity > (SELECT AVG(Popularity) FROM cricket_1);

/* Find Player_id and Player_Name that are common in the test match 1 and test match 2 */
SELECT Player_id, Player_Name FROM cricket_1
WHERE cricket_1.Player_id IN (SELECT Player_id FROM cricket_2);

/* Retrieve Player_id, Runs and Player_Name from cricket_1 table and display list of players where the runs are more than the average runs */
SELECT Player_id, Runs, Player_Name FROM cricket_1
WHERE Runs > (SELECT AVG(Runs) FROM cricket_1);

/* Write a query to extract the Player_id, Runs and Player_Name from the table cricket_1 where the runs are greater than 50 */
SELECT Player_id, Runs, Player_Name FROM cricket_1
WHERE Runs > 50;

/* Write a query to extract all the columns from cricket_1 where Player_Name starts with "Y" and ends with "v" */
SELECT * FROM cricket_1 WHERE Player_Name LIKE 'Y%v';

/* Write a query to extract all the columns from cricket_1 where Player_Name does not end with 't' */
SELECT * FROM cricket_1 WHERE Player_Name NOT LIKE '%t'; 

SELECT * FROM cricket_combine;

/* Extract the Player_id, and Player_Name of the players where the Charisma value is null */ 
SELECT Player_id, Player_Name FROM cricket_combine WHERE Charisma IS NULL;

/* Seperate all Player_id into single numeric ids (example PL1 = 1) */ 
SELECT Player_id, SUBSTR(Player_ID, 3) FROM cricket_combine; 

/* Write a MYSQL query to extract Player_id, Player_Name, and Charisma where the Charisma is greater than 25 */
SELECT Player_id, Player_Name, Charisma FROM cricket_combine WHERE Charisma > 25;
