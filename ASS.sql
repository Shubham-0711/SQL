create table customers
(
c_id int primary key ,
c_name varchar (30),
city varchar (30),
country varchar(20),
postal_code int
)

insert into customers (c_id,c_name,city,country,postal_code)values
(10,'klause','oslo','norway',1234),
(20,'demon','paris','uk',1124),
(30,'stephan','anglet','france',5123),
(40,'ellijha','rome','itly',5236),
(50,'caroine','miami','usa',6066),
(60,'elena','london','uk',7896),
(70,'rock','germany','berline',0230),
(80,'enzo','sydney','Austrilia',2364),
(90,'bonnie','seoul','korea',7822),
(100,'katharin','tokohashi','japan',1003),
(110,'jermy','india','pune',1530),
(111,'kol','bhusan','korea',null),
(112,'tyler','india','mumbai',null)


-----1)Write a statement that will select the City column from the Customers table
select city from customers
-----2)Select all the different values from the Country column in the Customers table.
select country from customers
-----3)Select all records where the City column has the value "London
select *from customers where city='London'
-----4)Use the NOT keyword to select all records where City is NOT "Berlin".
insert into customers values(113,'tony','Berlin','jermny',1151)
select*from customers where city not in('Berlin')
select*from customers
-----5)Select all records where the CustomerID column has the value 20.
select*from customers where c_id=20
--6)Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
insert into customers values(114,'sham','london','jermny',121110)

select*from customers where city='Berlin' or postal_code='121110'
--7)Select all records where the City column has the value 'Berlin' or 'London'.
select*from customers where city='Berlin' or city='London'

--8)Select all records from the Customers table, sort the result alphabetically by the column City.
select*from customers
select*from customers order by city 
--9)Select all records from the Customers table, sort the result reversed alphabetically by the column City.
select*from customers
select*from customers order by city desc

--10)Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City
select*from customers
select*from customers order by city 
select*from customers order by country
--11.	Select all records from the Customers where the PostalCode column is empty.
select*from customers where postal_code is null
--12.	Select all records from the Customers where the PostalCode column is NOT empty.
select*from customers where postal_code is not null

--13.	Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
update customers set  city='oslo' where country='Norway' 
select*

--14.	Delete all the records from the Customers table where the Country value is 'Norway'.
delete customers where country='Norway'




create ta
--15.	Use the MIN function to select the record with the smallest value of the Price column.

--16.	Use an SQL function to select the record with the highest value of the Price column.
--17.	Use the correct function to return the number of records that have the Price value set to 20
--18.	Use an SQL function to calculate the average price of 