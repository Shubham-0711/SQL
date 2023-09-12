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
