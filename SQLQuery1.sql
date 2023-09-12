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
