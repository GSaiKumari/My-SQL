CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;
## Creating table worker
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);
## Inserting data(values) into the table
Insert into worker
	(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)VALUES
		(001,'Monika','Arora',100000,'2014-02-20 09:00:00','HR'),
        (002,'Niharika','Verma',80000,'2014-06-11 09:00:00','Admin'),
        (003,'Vishal','Singhal',300000,'2014-02-20 09:00:00','HR'),
        (004,'Amitabh','Singh',500000,'2014-02-20 09:00:00','Admin'),
        (005,'Vivek','Bhati',500000,'2014-06-11 09:00:00','Admin'),
        (006,'Vipul','Diwan',200000,'2014-06-11 09:00:00','Account'),
        (007,'Satish','Kumar',75000,'2014-01-20 09:00:00','Account'),
		(008,'Geetika','Chauhan',90000,'2014-04-11 09:00:00','Admin');
## Creating table Bonus

CREATE TABLE BONUS(
	WORKER_REF_ID INT,
    BONUS_DATE DATETIME,
    BONUS_AMOUNT INT(10),
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
	ON DELETE CASCADE
);
## Inserting data(values) into the table

INSERT into BONUS
	(WORKER_REF_ID,BONUS_DATE,BONUS_AMOUNT)VALUES
		(001,'2016-02-20',5000), 
		(002,'2016-06-11',3000),
        (003,'2016-02-20',4000),
        (001,'2016-02-20',4500), 
        (002,'2016-06-11',3500);
## Creating a table title    
CREATE TABLE TITLE (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
	ON DELETE CASCADE
);

## Inserting data(values) into the table

INSERT INTO TITLE
	(WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM)VALUES
		(1,'Manager','2016-02-20 00:00:00'),
        (2,'Executive','2016-06-11 00:00:00'), 
        (8,'Executive','2016-06-11 00:00:00'),
        (5,'Manager','2016-06-11 00:00:00'), 
        (4,'Asst. Manager','2016-06-11 00:00:00'), 
        (7,'Executive','2016-06-11 00:00:00'), 
        (6,'Lead','2016-06-11 00:00:00'), 
        (3,'Lead','2016-06-11 00:00:00');

# Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;  ## Getting first name as worker name(alias name) from worker table 

# Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT upper(FIRST_NAME) FROM WORKER; ## Getting Upper case of first name using UPPER

# Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT distinct DEPARTMENT FROM WORKER; ## Used distinct to get unique values

# Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
SELECT substring(FIRST_NAME,1,3) FROM WORKER; # Using substring and mentioning the number of characters to print in first name 

# Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
SELECT INSTR(FIRST_NAME,BINARY'a') FROM WORKER where FIRST_NAME = 'Amitabh'; ## Getting lower case a position in the name 

# Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(FIRST_NAME) FROM WORKER; ## Used Right TRIM to remove white spaces on right side

# Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(DEPARTMENT) FROM WORKER; ## Used Right Left TRIM to remove white spaces on left side

# Q-8 Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT LENGTH(DEPARTMENT) FROM WORKER; ## DISTINCT to find unique values and Used LENGTH to find length of department

# Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME,'a','A') FROM WORKER ## Used REPLACE for changing 'a' with 'A'

# Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS 'COMPLETE_NAME' FROM WORKER; ## CONCAT is used to join two strings into single

#Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM WORKER ORDER BY FIRST_NAME; ## Order by gives the order in ascending order

# Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM WORKER ORDER BY FIRST_NAME asc,DEPARTMENT desc; ## Order by gives the order in ascending order and order by desc gives order in descending order


# Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME IN('VIPUL','SATISH') ## Selecting all(*) workers from worker table and get a particular name using IN

# Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME NOT IN('VIPUL','SATISH') ## Used NOT IN where it gives names other name the specified names 

# Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
SELECT * FROM WORKER WHERE DEPARTMENT LIKE 'ADMIN' ## Used LIKE to get Department as Admin

# Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%a%'## used LIKE to get Workers whose First name contains 'a' any where in the name 

# Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE 'a%' ## used LIKE to get Workers whose First name contains 'a' at the end

# Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '_____H' ## Using like and given 5 spaces for getting the sixth alphabet as H

# Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000 # Getting salary between given range from all workers

# Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM WORKER WHERE YEAR(JOINING_DATE) LIKE 2014 AND MONTH(JOINING_DATE) LIKE 2 ## using LIKE and getting the workers joining in feb 2014

# Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(*) FROM WORKER WHERE DEPARTMENT LIKE 'ADMIN' ## using count and getting count of workers with department Admin

# Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS WORKER_NAME,SALARY FROM WORKER ## Making the first name and second name as worker name and getting salary fro  worker
	WHERE WORKER_ID IN (SELECT WORKER_ID FROM WORKER WHERE SALARY BETWEEN 50000 AND 100000) ## selecting the salary between the given range

# Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT,COUNT(WORKER_ID) NO_OF_WORKERS
FROM WORKER
GROUP BY DEPARTMENT 
ORDER BY NO_OF_WORKERS DESC; ## Count the workers in each department and group them by department in descending order

# Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT DISTINCT W.FIRST_NAME,T.WORKER_TITLE
FROM WORKER W
INNER JOIN TITLE T
ON W.WORKER_ID =T.WORKER_REF_ID
AND T.WORKER_TITLE in ('MANAGER'); ## Inner Joining title table and worker table and  getting workers who are also managers 

# Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT WORKER_TITLE,AFFECTED_FROM,COUNT(*)
FROM TITLE
GROUP BY WORKER_TITLE,AFFECTED_FROM
HAVING COUNT(*)>1; ## getting duplicate records title table 

# Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM Worker WHERE WORKER_ID%2 != 0;Gives the odd rows in table

# Q-27. Write an SQL query to show only even rows from a table.
SELECT * FROM Worker WHERE WORKER_ID%2 = 0; # Gives the even rows in table

# Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE WorkerClone LIKE Worker; ## Created new table workerclone like worker table 

# Q-29. Write an SQL query to fetch intersecting records of two tables.
(SELECT * FROM Worker)
UNION
(SELECT * FROM WorkerClone); ## Union used for insersection of records in worker and workerclone table.Gets records of worker table to workerclone

# Q-30. Write an SQL query to show records from one table that another table does not have.
SELECT  *
FROM    Worker
WHERE   DEPARTMENT NOT IN (SELECT WORKER_TITLE FROM Title)

# Q-31. Write an SQL query to show the current date and time.
SELECT current_date,current_time(); # current date and time

# Q-32. Write an SQL query to show the top n (say 10) records of a table.
SELECT * FROM WORKER ORDER BY SALARY LIMIT 10; ## limited the records to 10 to get 10 records

# Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT MAX(SALARY) FROM WORKER ## max(salary) gives highest salary

# Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
SELECT Salary
FROM Worker W1
WHERE 4 = (  ## n=5,n-1=4
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary 
 );

# Q-35. Write an SQL query to fetch the list of employees with the same salary.
Select distinct W.WORKER_ID,W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID; ## Getting salary of 2 workers with same salary where worker id is not same




# Q-36. Write an SQL query to show the second highest salary from a table.
SELECT max(SALARY) FROM WORKER WHERE SALARY NOT IN (SELECT max(salary) from WORKER); ## when salary not in max(salary) then the second salary will be reflected

# Q-37. Write an SQL query to show one row twice in results from a table.
SELECT FIRST_NAME,DEPARTMENT  FROM WORKER W WHERE W.DEPARTMENT='ADMIN'
UNION ALL
SELECT FIRST_NAME,DEPARTMENT FROM WORKER W1 WHERE W1.DEPARTMENT='ADMIN'; ## Getting the results twice in Admin department using unionall



# Q-38. Write an SQL query to fetch intersecting records of two tables.
(SELECT * FROM WORKER)
UNION
(SELECT * FROM WORKERCLONE) ## used union for intersection of records

# Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM WORKER
WHERE WORKER_ID <= (SELECT COUNT(WORKER_ID)/2 FROM WORKER) ## worker id count gives 100% records.when divided by 2 gives 50% records

# Q-40. Write an SQL query to fetch the departments that have less than five people in it.
SELECT DEPARTMENT, COUNT(WORKER_ID) AS 'No of workers' FROM WORKER GROUP BY DEPARTMENT Having COUNT(WORKER_ID)<5 ## selecting count of worker id less than 5 to get departments less than 5 people

# Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT,COUNT(DEPARTMENT) AS 'Number of workers' FROM WORKER GROUP BY DEPARTMENT # Count gives the number of people in all departments 

# Q-42. Write an SQL query to show the last record from a table.
SELECT * FROM WORKER WHERE WORKER_ID=(SELECT max(WORKER_ID) FROM WORKER) #  Selecting max of  worker id gives last row

# Q-43. Write an SQL query to fetch the first row of a table.
SELECT * FROM WORKER WHERE WORKER_ID=(SELECT min(WORKER_ID) FROM WORKER) # Selecting minimum worker id gives 1st row

# Q-44. Write an SQL query to fetch the last five records from a table.
(SELECT * FROM WORKER ORDER BY WORKER_ID DESC LIMIT 5) ## fectching the record with the limit as 5 in descending order
ORDER BY WORKER_ID ASC; 

# Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT FIRST_NAME, MAX(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT ## max(salary) gives highest salary in each department 

# Q-46. Write an SQL query to fetch three max salaries from a table.
SELECT distinct SALARY  from WORKER  order by SALARY DESC LIMIT 3; 


# Q-47. Write an SQL query to fetch three min salaries from a table.
SELECT distinct SALARY  from WORKER  order by SALARY  LIMIT 3; ## selecting three minimum salaries with limit 3

# Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT * from Worker W1 where
n-1 = (select count(distinct salary) from worker w2 where w2.salary>w1.salary)

# Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT DEPARTMENT,SUM(SALARY) from WORKER group by DEPARTMENT; ## total salaries paid in all  departments

# Q-50. Write an SQL query to fetch the names of workers who earn the highest salary. 
SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker); ## Getting first name and salary from the table,geting max of salary which gives highest salary









