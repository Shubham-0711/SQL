CREATE DATABASE ORG
SELECT *FROM sys.ORG

CREATE TABLE Worker
(
	WORKER_ID INT NOT NULL PRIMARY KEY ,
	FIRST_NAME VARCHAR(25),
	LAST_NAME VARCHAR(25),
	SALARY INT,
	JOINING_DATE DATE ,
	DEPARTMENT VARCHAR(25)
)

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE,DEPARTMENT) VALUES
					(001, 'Monika', 'Arora', 100000, '02/20/2014 ','HR'),
					(002, 'Niharika', 'Verma', 80000, '06/11/2014 ', 'Admin'),
					(003, 'Vishal', 'Singhal', 300000, '02/20/2014 ', 'HR'),
					(004, 'Amitabh', 'Singh', 500000, '02/20/2014 ', 'Admin'),
					(005, 'Vivek', 'Bhati', 500000, '06/11/2014 ', 'Admin'),
					(006, 'Vipul', 'Diwan', 200000, '06/11/2014', 'Account'),
					(007, 'Satish', 'Kumar', 75000, '01/20/2014 ', 'Account'),
					(008, 'Geetika', 'Chauhan', 90000, '04/11/2014 ', 'Admin')
select*from Worker
---------------------------------------------------------------------------------------------------
CREATE TABLE Bonus 
(
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATE,

	FOREIGN KEY  (WORKER_REF_ID)REFERENCES Worker(WORKER_ID)
)

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
				(001, 5000, '02/20/2016'),
				(002, 3000, '06/11/2016'),
				(003, 4000, '02/20/2016'),
				(001, 4500, '02/20/2016'),
				(002, 3500, '06/11/2016')
-----------------------------------------------------------------------------------------------------
CREATE TABLE Title 
(
	WORKER_REF_ID INT,
	WORKER_TITLE VARCHAR(25),
	AFFECTED_FROM DATE,

	FOREIGN KEY (WORKER_REF_ID)REFERENCES Worker(WORKER_ID)
)

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
					 (001, 'Manager','02/20/2016 '),
					 (002, 'Executive','06/11/2016 '),
					 (008, 'Executive','06/11/2016 '),
					 (005, 'Manager','06/11/2016 '),
					 (004, 'Asst. Manager','06/11/2016 '),
					 (007, 'Executive','06/11/2016 '),
					 (006, 'Lead','06/11/2016 '),
					 (003, 'Lead','06/11/2016 ')


										-----------------------------------------------------------------------
																	---- QUERY's ----
										-----------------------------------------------------------------------


--Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.

select FIRST_NAME as 'WORKER_NAME' from Worker

--Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
select upper (FIRST_NAME) from Worker

--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
select distinct DEPARTMENT from Worker

--Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.
Select substring(FIRST_NAME,1,3) from Worker;

--Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.
select CHARINDEX('a',FIRST_NAME) from Worker where FIRST_NAME='Amitabh'

--Q-6. Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.
select RTRIM(FIRST_NAME) from Worker  

--Q-7. Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.
select LTRIM (DEPARTMENT) from Worker

--Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.
select distinct DEPARTMENT,len(DEPARTMENT)from Worker

--Q-9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
select REPLACE(FIRST_NAME,'a','A')  from Worker
--select REPLACE(FIRST_NAME,'a','A')as'Replace TBL' from Worker

--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. A space char should separate them.
select concat (FIRST_NAME ,' ',LAST_NAME) as 'COMPLETE_NAME'from Worker  -----(' ')--> for space 

--Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select *from Worker order by FIRST_NAME 

--Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select *from Worker order by FIRST_NAME ,DEPARTMENT desc

--Q-13. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
select *from Worker where FIRST_NAME like'Vipul' or FIRST_NAME like'Satish'
--select *from Worker where FIRST_NAME in ('Vipul' ,'Satish')

--Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.
select *from Worker where FIRST_NAME not like'Vipul' or FIRST_NAME like'Satish'
--select *from Worker where FIRST_NAME not in ('Vipul' ,'Satish')

--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select *from Worker where department like 'Admin'

--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select*from Worker where FIRST_NAME like '%a%'

--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select*from Worker where FIRST_NAME like '%a'

--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select*from Worker where FIRST_NAME like '______H'

--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select *from Worker where salary between 100000 and 500000

--Q-20. Write an SQL query to print details of the Workers who joined in Feb’2014.
select *from Worker where year (JOINING_DATE) = '2014'and MONTH(JOINING_DATE)='02'

--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count (*)from Worker where department like 'Admin'

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select FIRST_NAME  from Worker where SALARY>= 50000 and SALARY<= 100000
									--OR--
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000)


--Q-23. Write an SQL query to fetch the no. of workers for each department in descending order.
select department ,count(WORKER_ID) as workers from Worker
group by DEPARTMENT
order by workers desc

--Q-24. Write an SQL query to print details of the Workers who are also Managers.
select concat(w.FIRST_NAME,' ',LAST_NAME)as 'Worker Name',t.WORKER_TITLE
from Worker w inner join Title t0
on w.WORKER_ID=t.WORKER_REF_ID
where WORKER_TITLE ='Manager'

--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select
from worker 



--Q-26. Write an SQL query to show only odd rows from a table.


--Q-27. Write an SQL query to show only even rows from a table.


--Q-28. Write an SQL query to clone a new table from another table.
SELECT * INTO WorkerClone FROM Worker

create table workercopy as select *from Worker

--Q-29. Write an SQL query to fetch intersecting records of two tables.
select * from worker
intersect
select * from workerclone

--Q-30. Write an SQL query to show records from one table that another table does not have.
select * from worker
minus
select *  from title

--Q-31. Write an SQL query to show the current date and time.
select getdate() as 'date and time'


--Q-32. Write an SQL query to show the top n (say 10) records of a table.
select top 10 * from worker order by salary desc

--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select top 5 * from worker order by salary desc

--Q-34. Write an SQL query to determine the 5th highest salary without using the TOP or limit method.
SELECT Salary
FROM Worker W1
WHERE 4 = 
 ( SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 )

--Q-35. Write an SQL query to fetch the list of employees with the same salary.
select distinct w.worker_id , w.first_name,w.salary from worker w ,
 worker w1 
where w.salary = w1.salary
and w.worker_id != w1.worker_id

--Q-36. Write an SQL query to show the second-highest salary from a table.
Select max(Salary) from Worker 
where Salary not in (Select max(Salary) from Worker)

--Q-37. Write an SQL query to show one row twice in the results from a table.
select first_name , department
from worker w where w.DEPARTMENT = 'HR'
union all
select first_name , department
from worker w1 where w1.department='HR'

--Q-38. Write an SQL query to fetch intersecting records of two tables.
select * from worker
intersect
select * from WorkerClone 

--Q-39. Write an SQL query to fetch the first 50% of records from a table.
select top 50 percent * from Worker



--Q-40. Write an SQL query to fetch the departments that have less than five people in them.
SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5

--Q-41. Write an SQL query to show all departments along with the number of people in there.
select department , count(department) as 'number of worker' from worker 
group by department 

--Q-42. Write an SQL query to show the last record from a table
select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker)

--Q-43. Write an SQL query to fetch the first row of a table.
select * from worker where worker_id = (select min(worker_id) from worker)

--Q-44. Write an SQL query to fetch the last five records from a table.
select top 5 *  from worker order by worker_id desc 

--Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
select department , max(salary) as 'highest salary' from worker 
group by DEPARTMENT 


--Q-46. Write an SQL query to fetch three max salaries from a table.
select top 3 * from worker order by salary desc


--Q-47. Write an SQL query to fetch three min salaries from a table.
select top 3 * from worker order by salary

--Q-48. Write an SQL query to fetch nth max salaries from a table.



--Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
 SELECT DEPARTMENT, sum(Salary) from worker group by DEPARTMENT

--Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME, SALARY from Worker
WHERE SALARY=(SELECT max(SALARY) from Worker)



-----------------22,-----------------------------