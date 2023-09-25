create table Student
(
roll_no int,
name varchar(20),
percentage decimal(6,1),
city varchar(10),
dob date
)

--- modify the data type 
alter table Student alter column name varchar (25)

-- add column to table
alter table Student add  state varchar(20)

--remove col. in table
alter table Student drop column state

--remove column
exec sp_rename 'Student.roll_no','RollNo'
---------------------------------------------------------------------
alter table Student drop column RollNo


alter table Student add RollNo int

exec sp_rename  'Student.RollNo','Roll_no'
----------------------------------------------------------------------
exec sp_help Student ----- to get info of Table
----------------------------------------------------------------------

------------------ Not Null---------------------------
create table Emp
(
name varchar(20)not null
)
drop table Emp

-----------------------Unique Key-------------------------------------

create table Emp
(
name varchar(20) not null,
email varchar (30) unique
) 
                 ---------------OR-------------

				 create table Empl
				 (
				 name varchar (20) not null,
				 email varchar (30),
				 constraint un_email unique (email)
				 )


------------With alter command 

alter table Empl alter column name varchar(20) not null

alter table Empl add constraint un_email unique (email)-----adding column

alter table Empl add constraint un_email_mo unique (email,Mobile)



----------------------------- Foreign Key --------------------------------------
create table Dept
(
did int,
dname varchar(10),
constraint pk_dept primary key (did)
)

-----------------------------------------------
create table Employee
(
id int,
name varchar(20),
did int,
constraint pk_Employee primary key(id),
constraint fk_emp_dept foreign key(did) references Dept(did)  
)

-----------------alter  
	--alter table Employee add constraint fk_emp_dept foreign key(did) references Dept(did)


	------------------------------------- CHECK -------------------------------------------
	alter table Employee add age int  ---- adding age column in employe table

	alter table Employee add constraint ch_age check(age>=18) ----add check condition 
	
	exec sp_help Employee 

	alter table Employee drop constraint ch_age 
	--------------------------------------------------------------------

	

create table Bank 
(
Acc_no int,
Name varchar(20) not null,
email varchar(20) unique,
balance int,

constraint pk_bank primary key (Acc_no),
constraint chk_bal check (balance>0)
)
exec sp_help Bank 

alter table Employee add constraint ch_age check(age>=18)

alter table employee drop constraint ch_age
exec sp_help employee

drop table Bank
--------------------------default---------------------------------

create table Bank 
(
Acc_no int,
Name varchar(20) not null,
email varchar(20) unique,
balance int,
branch varchar(20) default('kothrud'),

constraint pk_bank primary key (Acc_no),
constraint chk_bal check (balance>0)
)


alter table Bank add Branch varchar(20)-----add branch column in table Bank

alter table Bank drop Branch

alter table bank add constraint de_branch default 'Pune' for branch

exec sp_help Bank

drop table Empl

create table EMP_1
(
id int primary key,
name varchar (20) not null,
email varchar(20) unique,
age int check (age>=18),
salary numeric (12,2)
)

select *from EMP_1

insert into EMP_1 values (1,'shubham','shubh@123gamil.com',22,25000.45)
insert into EMP_1 values (2,'sanket','sanket@gamil.com',25,25000.45)
insert into EMP_1 values (3,'somesh','somesh@123gamil.com',26,25000.45)
insert into EMP_1 values (4,'sahil','sahi@123gamil.com',29,25000.45)
insert into EMP_1 values (5,'abhijeet','abhi@123gamil.com',20,28000.45)
insert into EMP_1 values (6,'sandesh','sandesh@123gamil.com',22,25000.45)
insert into EMP_1 values (7,'chidanand','chidanad@123gamil.com',22,25000.45)
insert into EMP_1 values (8,'rushi','rushii@123gamil.com',23,2600.45)
insert into EMP_1 values (9,'nikita','niki@123gamil.com',24,26000.45)
insert into EMP_1 values (10,'nikhil','nik@123gamil.com',25,25000.45)
insert into EMP_1 values (11,'kabir','kabir@123gamil.com',15,25000.45)
insert into EMP_1 values (12,'shivam','shivm@123gamil.com',19,25000.45)
insert into EMP_1 values (13,'mansi','mansi@123gamil.com',18,25000.45)
insert into EMP_1 values (14,'krutika','kru@123gamil.com',19,25000.45)
insert into EMP_1 values (15,'shubh','shubh@123gamil.com',20,25000.45)
insert into EMP_1 values (16,'Riya','Riya@gmail.com',23,250000.12345)

select *from EMP_1 
                ----------------------UPdate Comm----------------------
update EMP_1 Set salary=18000 where id=3 ----------To update Data From existing table

update EMP_1 set salary=25000,age=25 where id=3 --------to update multiple data 

                ------------------------Delete comm--------------------------

alter table EMP_1 add city varchar(20)---- city column added
alter table EMP_1 drop column city


update EMP_1 set city='pune' where id in(1,2,3,4,5)
update EMP_1 set city='nashik' where id in(6,7,8,9,10,11)
update EMP_1 set city='delhi' where id in(12,13,14,15)

delete from EMP_1 where id=15




-----------------------------DQL comm---------------------------------

select name,age from EMP_1

-----------alias to the column & to the table 

select name as 'Emp_Name',age as'Emp_Age' from EMP_1

select*from EMP_1 where id=1
select*from EMP_1 where age=22


               -----Distinct --it is used to get unique recor
select distinct city='pune' from EMP_1


--and -all the condition should true
--/combine all the condition & fetch matched data 
                    
select*from EMP_1 where id in(1,2,3)






---------------------------------------------------------------------------------



----Create table product
----Id
----Name
----Price
----Company
----Insert 10 records

--Write below select quries
--Display all records
--Display products whose price is < 2000
--Display products whose company name is LG
--Display products whose price is between 2000 to 5000
--Display unique company name 
--Display products whose company is dell & hp


create table Product
(
id int,
P_name varchar(20),
Price numeric(12,2),
company varchar(30)
)

insert into Product values(1,'Laptop',700000,'HP')
insert into Product values(2,'Laptop',750000,'Dell')
insert into Product values(3,'Pc',800000,'Asus')
insert into Product values(4,'Keyboard',2000,'HP')
insert into Product values(5,'Mouse',500,'Asus')
insert into Product values(6,'Gaming PC',120000,'HP')
insert into Product values(7,'Laptop',700000,'HP')
insert into Product values(8,'Laptop',700000,'Dell')
insert into Product values(9,'Laptop',850000,'Dell')
insert into Product values(10,'Laptop',650000,'Acer')

select*from Product ---Display All Product
select*from Product where Price<2000 --Display Product whose company price is <2000
select*from Product where company='Acer'--Display products whose company name is LG
select*from Product where Price between 2000 and 5000
select distinct company from Product --Display unique company name 
select *from product where company='Dell'or company='HP'

----------------------------------------------------------------------------------------------------


--like clause-Search the term for varchar/string 

select * from EMP_1 

select *from EMP_1 where name like '%s'
select *from EMP_1 where name like 's%'
select *from EMP_1 where name like '%s%'

select *from EMP_1 where name like '[a-g]%'

select *from EMP_1 where name like 'R____'
------------------------- NOT LIKE --------------------------

select *from EMP_1 where name not like '%s%'
select *from EMP_1 where name not like'%[a-g]%'


-------------------order by
select*from EMP_1 order by name,age
select*from EMP_1 order by age desc
select*from EMP_1 order by name,email
select*from EMP_1 order by salary
select*from EMP_1 order by age

-------------------ties
select top 3 with ties *from EMP_1 order by salary 

select top 5 *from EMP_1 order by id

-------------------fetch and offset---------------------

select *from EMP_1 order by salary desc 
offset 2 rows 
fetch next 1 rows only


------4 and 3 high salary  
select *from EMP_1 order by id desc
offset 2 rows
fetch next 2 rows only
--------------------------------------------------------------------------------------

-----------------------------------------joins------------------------------------------------------
drop table DEP
create table DEP
(
did int primary key,
dname varchar(20)
)

insert into DEP values	(101,'HR'),(102,'Admin'),(103,'Development'),
(104,'Testing')

alter table EMP_1 add did int
alter table EMP_1 add constraint pk_FK_DEP_emp 
foreign key(did) references DEP(did)


update EMP_1 set did=101 where id in(1,13) 
update EMP_1 set did=102 where id in(2,3) 
update EMP_1 set did=103 where id in(3,4,5,6,7,8) 
update EMP_1 set did=104 where id in(9,10) 
update EMP_1 set did=105 where id in(11,12) 

select *from EMP_1
select*from DEP
							--------------- INNER JOIN -----------------

select e.*,d.dname
from EMP_1 e
inner join DEP d on d.did=e.did 

select e.*,

							--------------------CROSS JOIN-------------------------

							                    ---------------------Self Join---------------------

select e1.name as 'Earn High ',e1.salary ,e2.name as 'Earn Less' ,e2.salary 
from EMP_1 e1,EMP_1 e2
where e1.salary>e2.salary


alter table EMP_1 add managerid int -- ALTERING THE EMP TABLE 
select*from EMP_1

update EMP_1 set managerid =4 where id in (1,2,3)
update EMP_1 set managerid =5 where id in (6,7,8,9)
update EMP_1 set managerid =9 where id in (10,11,12)



                             -------------------SELF JOIN --------------------
select e1.name as 'Employee', e2.name as 'Manager'
from EMP_1 e1,EMP_1 e2  --E1 AND E2 IS ALIS
where e1.managerid=e2.id



               



			          ----------------------Cross Join----------------------

					
 create table color		-----------TABLE 1
(id int primary key,
color varchar(30)
)
insert into color (id,color) values
(1,'RED'),
(2,'white'),
(3,'blue'),
(4,'yellow'),
(5,'green')

 create table size		-----------TABLE 2
(
s_id int primary key,
size varchar(10)
)
insert into size (s_id,size) values
(1,'S'),
(2,'M'),
(3,'L'),
(4,'X'),
(5,'XL')

select 

select *from color cross join size ---syntax


            ---------------------------------------------GROUP BY --------------------------------------------------
select *from Prdt

select p_name , count (p_name)as'Count Of Prd' from Prdt
group by p_name 

select*from EMP_1

exec sp_help EMP_1
select*from Student

select id,count (id) as'Count of id' from EMP_1
group by id




select city,count(city) as'count of city' from EMP_1
group by city

select e_name,count (e_name) as 'coutn 'from EMP_1
group by e_name


select getdate()
select 2023-22

                      ----------------------- BUILT IN FUNCT ---------------------------------

select*from EMP_1

select name,len (name)from EMP_1---- to find lenght

select UPPER(name)as 'Employee Name' from EMP_1  --for uppercase

select LOWER(name)as 'Employee Name' from EMP_1 --for Lowercase

select SUBSTRING(email,0,5)as 'Substring' from EMP_1 --to extract no of chars from given col

select TRIM(name)from EMP_1--removing leading and trailing space

select LTRIM(name)from EMP_1--remove the spaces from left side

select RTRIM(name)from EMP_1--remove the space from right side

select replace(name,'@','#')from EMP_1 --conversion from one type to another dat type 

select CONCAT(name,'-->',email,'-->',email)from EMP_1--

select cast(salary as varchar(20))as 'String Salary 'from EMP_1

--year,month,day ---extract the year or month or day from the date 
select cast(getdate()as time) from EMP_1
select year (cast(getdate()as date))
select month (cast (getdate ()as date))
select day (cast (getdate()as date )) 

select name,age,year(cast(getdate()as date)) from EMP_1



											---------------------Views--------------------------

----to create 
create view name_shubham as
select *from EMP_1 WHERE name='shubham'

---To Run view 
select*from name_shubham

----adding new view
create view info as
select name,age,salary from EMP_1 where id
=(select did from DEP dname='HR')

select *from DEP



------------------------------- STORED PROCEDURE -----------------------------
create proc sp_emp
as begin
select*from EMP_1
return 
end 

--- to call sp
exec sp_emp

---with parameters
--create Procedure
     --or--
create proc sp_emp_City(@City varchar(10))
as begin 
select*from EMP_1 where age=22
return 
end

exec sp_emp_City
@city='Pune'

--------------------------------------DML
create proc sp_insert_emp
(
@id int,
@name varchar(30),
@Email varchar(30),
@age int,
@sal numeric(12,2),
@city varchar(30),
@did int,
@mid int
)
as begin 
insert into EMP_1 values(@id,@name,@Email,@age,@sal,@city,@did,@mid) 
return
end

------UPDATE 
create proc sp_ins_emp
(
@id int,
@name varchar(30),
@Email varchar(30),
@age int,
@sal numeric(12,2),
@city varchar(30),
@did int,
@mid int
)
as begin 
update EMP_1 set
id=@id,name=@name,email=@Email,age=@age,salary=@sal,
city=@city,did=@did,managerid=@mid where id=@id
return
end

exec sp_ins_emp
@id=12,
@name='Test2',
@email='test@gmail.com',
@age=23,
@sal=34567.45,
@city='Pune',
@did=103,
@mid=4



select *from EMP_1


----------------------------IDENTITY KEY--------------------------------

create table Prod
(
id int primary key identity(101,1),
name varchar(20),
price int
)

insert into Prod values('Pencil',20)
insert into Prod values('Pen',50)
insert into Prod values('Pendrive',500)
select * from Prod


-----------------------------------------BUILT IN FUNC---------------------------------------
--addition of 2 no 
create function addition (@a int,@b int)
returns int
as begin 
declare @c int --declare variable
-- code to exe
set @c=@a+@b
return @c
end 

--called method
--  DBO -database object
select dbo.addition(10,20)as'sum'

--scalar function

create function GetEmpName(@id int)
returns varchar(20)
as begin
return( select name from Employee where id=@id)
end

select dbo.GetEmpName(1) as 'Emp name'


-- multi value function begin & end keyword not need to write

create function GetEmpByDept(@did int)

returns table
as
return (select * from Employee where did=@did)


select * from dbo.GetEmpByDept(103)

select*from Prdt
------_________-----------------------------------------------------------------------------------

--create function to accept the product price and give 10% disc. and return disc price 
create function getDiscount (@p_price int)
returns decimal
as begin
declare @d_price decimal
set @d_price=@p_price-(@p_price*0.10)
return @d_price
end


select p_price ,dbo.getDiscount(p_price)as 'Discount Price' from Prdt