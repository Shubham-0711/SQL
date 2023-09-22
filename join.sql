create database CSC

create table country
(
cid int primary key ,
cname varchar (30)
)

insert country (cid,cname ) values
(1,'INDIA'),
(2,'CANADA')

create table Stte
(
ssid int primary key,
sname varchar(30),
cid int,

foreign key (cid) references country(cid)
)
insert Stte (ssid,sname,cid) values
(101,'Maharashtra',1),
(102,'Karnataka',1),
(103,'Alabama',2),
(104,'Alaska',2)

create table City 
(
city_id int Primary key,
c_name  varchar(30),
ssid int,

foreign key (ssid )references Stte(ssid)
)

insert into City (city_id,c_name,ssid) values
( 1,'PUNE',101),
( 2,'NASHIK',101),
( 3,'NAGER',101),
( 4,'MYSURU',102),
( 5,'MANGLURU',102),
( 6,'HUBBALI',102),
( 7,'HUNTSVILLE',103),
( 8,'MOBILE',103),
( 9,'MONTGOMERY',103),
( 10,'SITKA',104),
( 11,'JUNEU',104),
( 12,'ANCHORAYE',104)









