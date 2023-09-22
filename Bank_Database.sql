create database Bank_Database

select name from sys.tables
--===============================================================================--
create table AccountType
(
AccType_id int primary key,
AccType  varchar(30)
)

insert into AccountType values (1,'Saving'),(2,'Current'),(3,'Salary'),(4,'Fixed Deposite')

-----------------------------------------------------------------------------------
create table Bank
(
Bank_id int primary key,
Name varchar(50),
Address varchar(50),
city varchar(20),
state varchar(20)
)

insert into Bank values (111,'Baroda Bank','Katraj','Pune','Maharastra')
insert into Bank values (112,'HDFC Bank','Trumala','Tirupati','Andhra Pradesh')
insert into Bank values (113,'Maharastra Bank','ABC','Ahemednagar','Maharastra')
insert into Bank values (114,'State Bank Of India','Swargate','Pune','Maharastra')
insert into Bank values (115,'Axis Bank','DP Road','Kochi','Kerala')
insert into Bank values (116,'IDFC Bank','Kilaa Road','Indore','Madhya Pradesh')

--------------------------------------------------------------------------------------
create table Customer_Master
(
Cust_id int primary key,
Cust_name varchar(50),
Contact varchar(15),
age int,
Pan_No varchar(10)
)
insert into Customer_Master values(11,'Alisha','876543210',21,'ALI7895A')
insert into Customer_Master values(12,'Sandesh','8574961231',23,'SAN748595H')
insert into Customer_Master values(13,'Shubham','7485961254',20,'SHU748595M')
insert into Customer_Master values(14,'Sujit','7485978564',24,'SUJ485962T')
insert into Customer_Master values(15,'Rushi','7589648576',25,'RUS748596I')
insert into Customer_Master values(16,'Suraj','85947586489',30,'SUJ745210T')
insert into Customer_Master values(17,'Payal','9585474218',24,'PAY962310L')
insert into Customer_Master values(18,'Tanuja','7584967898',19,'TAN852012A')
insert into Customer_Master values(19,'Riya','6859475865',18,'RIY123123A')
insert into Customer_Master values(20,'Aishwarya','9857412458',40,'AIS158158A')
insert into Customer_Master values(21,'Rohit','7085749585',35,'ROH147147T')
insert into Customer_Master values(22,'Ajay','8600852852',50,'AJA458965Y')
insert into Customer_Master values(23,'Sagar','7485474120',18,'SAG789789R')
insert into Customer_Master values(24,'Piyush','7085748484',23,'PIY423423H')
insert into Customer_Master values(25,'Abhi','9995554447',23,'ABH785964I')
------------------------------------------------------------------------------------
create table Customer
(
Cust_id int ,
constraint fk_Cust_id_Customer_Master foreign key (Cust_id) references Customer_Master(Cust_id),

Bank_id int
constraint fk_Bank_id_bank foreign key (Bank_id) references Bank(Bank_id),
)
insert into Customer values(11,111),(12,112),(13,113),(14,114),(15,115),(16,116),(17,115),(18,111),(19,112),(20,113),(21,114),(22,111),(23,116),(24,115),(25,114)

------------------------------------------------------------------------------------
create table Accounts
(
Acc_No int primary key,
Cust_id int,
constraint fk_Custid_Customer_Master foreign key (Cust_id) references Customer_Master(Cust_id),
AccType_id int,
constraint fk_AccTypeid_AccountType foreign key (AccType_id) references AccountType(AccType_id),
Balance numeric(10,2),
)
insert into Accounts values (1112131401,11,2,11500.10)
insert into Accounts values (12131402,12,1,2540.20)
insert into Accounts values (31131403,13,2,14254.30)
insert into Accounts values (2112104,14,2,11500.40)
insert into Accounts values (9742455,15,3,7584.50)
insert into Accounts values (14131401,16,4,65849.60)
insert into Accounts values (35241401,17,1,7415.70)
insert into Accounts values (02131471,18,2,24153.80)
insert into Accounts values (14131401,19,4,12345.90)
insert into Accounts values (15231401,20,4,1458.10)
insert into Accounts values (15241301,21,1,7583.20)
insert into Accounts values (15241311,22,4,14268.30)
insert into Accounts values (15241401,23,1,99999.40)
insert into Accounts values (15214071,24,2,8884.50)
insert into Accounts values (12314501,25,3,75841.12)

---------------------------------------------------------------------------------------------

create table Transactions
(
Trans_id int,
Acc_No int,
constraint fk_Acc_No_Accounts foreign key (Acc_No) references Accounts(Acc_No),
Amount numeric(10,2),
Transaction_Type varchar(20),
Date date,
)
insert into Transactions values (201,1112131401,1500.10,'Credit','2023/09/23')
insert into Transactions values (202,12131402,240.20,'Credit','2023/09/22')
insert into Transactions values (203,31131403,144.30,'Credit','2023/09/21')
insert into Transactions values (204,2112104,1500.40,'Debit','2023/08/10')
insert into Transactions values (205,9742455,784.50,'Debit','2023/07/13')
insert into Transactions values (206,14131401,5849.60,'Credit','2023/09/03')
insert into Transactions values (207,35241401,741.70,'Debit','2022/01/01')
insert into Transactions values (208,02131471,4153.80,'Credit','2023/05/15')
insert into Transactions values (209,14131401,123.90,'Debit','2023/02/05')
insert into Transactions values (210,15231401,458.10,'Credit','2022/10/11')
insert into Transactions values (211,15241301,83.20,'Debit','2023/08/08')
insert into Transactions values (212,15241311,10268.30,'Credit','2023/04/06')
insert into Transactions values (213,15241401,19999.40,'Debit','2021/09/23')
insert into Transactions values (214,15214071,884.50,'Debit','2023/04/05')
insert into Transactions values (215,12314501,75841.12,'Credit','2020/09/23')
------------------------------------------------------------------------------------

insert into Transactions values (216,15214071,5001.50,'Credit','2023/05/05')
insert into Transactions values (217,12131402,999.99,'Debit','2022/09/22')
insert into Transactions values (218,12131402,777.99,'Credit','2022/05/11')
insert into Transactions values (219,2112104,1240.60,'Debit','2022/10/10')
insert into Transactions values (220,12314501,75841.12,'Credit','2020/09/23')

delete Transactions where Trans_id =204
--================================================
select * from Bank
select * from Customer_Master
select * from Customer
select * from AccountType
select * from Accounts
select * from Transactions

--================================================
--1.Find the no of accounts in saving account
select count(*) as 'Saving Acc. Count' from Accounts a
inner join AccountType aty on aty.AccType_id=a.AccType_id
where aty.AccType='Saving'

--2.Display all bank name, cname , city from all  bank in ascending order of bankname  and desceding order of city name
select b.Name,cm.Cust_name,b.city 
from bank b
inner join Customer c on c.Bank_id=b.Bank_id 
inner join customer_master cm on cm.Cust_id = c.Cust_id 
order by b.Name,b.city desc

--3.Find the customer who has perform maximum number of transaction

select top 1 cm.cust_id, count(*) as 'No. of trans',cm.Cust_name
from Customer_Master cm
inner join Accounts a on cm.Cust_id=a.Cust_id
inner join Transactions t on a.Acc_No=t.Acc_No
group by cm.Cust_id,cm.Cust_name 
order by count(cm.Cust_id)desc



--4.find the customers whose  balance is greater than avg balance of saving accounts.
select avg() as 'Balance' from 

--5.find the amount , name of customer whose acc_no is 12345 
select t.Amount,cm.Cust_name
from  Customer_Master cm
join Accounts a on a.Cust_id=cm.Cust_id
join Transactions t on t.Acc_No=a.Acc_No
where a.Acc_No='12131402'


--6.display the customer name ,contact of customers whose account type is
--‘saving’ order by descending order of cname .
select cm.Cust_name,cm.Contact
from Customer_Master cm
join Accounts a on cm.Cust_id=a.Cust_id
join AccountType act on act.AccType_id=a.AccType_id
where AccType ='Saving'
order by cm.Cust_name desc

--7.	display bank name , total balance of all customers in that bank of all banks in
--descending order of balance.
select b.Name,a.Balance
from  bank b 
join Customer c on c.Bank_id=b.Bank_id
join accounts a on a.Cust_id=c.Cust_id
order by a.Balance desc

--5. Cust_name account number,cust_id,AccType_id 

select cm.Cust_name,a.Acc_No,a.Cust_id ,a.AccType_id from Accounts a
join Customer_Master cm on a.Cust_id=cm.Cust_id