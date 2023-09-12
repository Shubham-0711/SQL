create database Employee

create table emp
(
eid int primary key identity(1,1) ,
ename varchar(30),
salary numeric(12,2),
dept_name varchar(20),
gender char(2),
E_Location varchar (30) ,
Position varchar (20),
Age int
)

insert into emp (ename,salary,dept_name,gender,E_Location,Position,Age)
values
('sandesh',25000,'HR','M','Pune','Manager',28),
('Bhakti',23000,'Employee','F','Pune','Employee',25),
('Gauri',26000,'Employee','F','Pune','Employee',23),
('Ankita',22000,'Employee','F','Pune','Sr.Dev',31),
('Sanket',31000,'Employee','M','Pune','Project Manager',24),
('sandesh',25000,'Employee','M','Pune','jr.dev',26)
select *from emp
drop table emp

--1.find out all employee whose salary is more 25k less 50k
select*from emp where salary>25000 or salary<50000

--2.find out the all employee whose name start with ‘n’
select* from emp where ename like 's%'

--3. find out the number of employee from each dept
select count (dept_name) as 'total count ' from emp 

select gender ,count (*) from emp group by gender
--4.find out the maximum salary of the employee
select max (salary)as 'Max Salary' from emp

--5.find out the gender wise employee count
select count (gender) as 'total count ' from emp 

--6. write query to find out the employee whose is working in Pune location and salary is more
--Than 24k.

select*from emp where E_location='Pune' and salary<24000
--7. write query to calculate the pf calculation 12%

select   ename,salary,salary+(salary*0.12)as PF from emp

--8. write query to update the position of employee  as a managar whose salary more than 28k
update emp set salary=28000 where position='manager'

select*from emp

--9. write query to remove the employee whos age is more than 30 and salary is 24k
delete from emp where age<28 and salary=25000

select*from emp

--10 write query find out the records where employee name contain ‘e’
select*from emp where ename like '%e%'

