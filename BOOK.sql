drop table Book_table

create table Book_table
(
B_id int ,
B_name varchar (30) not null,
A_id int ,
Price int

constraint pk_B_id primary key (B_id)
constraint fk_Authorid foreign key(A_id) references Author_table (A_id)
)
insert into Book_table (B_id,B_name,A_id,Price)values
(101,'To Kill a Mockingbird',1,500),
(102,'1984',1,500),
(103,'The Catcher in the Rye',2,650),
(104,'The Lord of the Rings',3,360),
(105,'Brave New World',4,850),
(106,'The Hobbit',5,800)


sp_help book_table
create table Author_table 
(
A_id int,
A_name varchar (20) not null,
Ph_no varchar check(Ph_no>=10),
Email varchar (20) unique (Email),
A_Add varchar (30),
City varchar (30) not null

constraint pk_Aid primary key (A_id)
)

insert into Author_table (A_id,A_name,Email,City) vALUES
(1,'XYZ','XYZ@gmail.com','PUNE'),
(2,'abc','abc@gmail.com','NASHIK'),
(3,'pqr','pqr@gmail.com','Nagpur'),
(4,'cba','cba@gmail.com','Solapur'),
(5,'op','opr@gamil.com','Nager')

sp_help author_table

drop table Award_table
create table Award_table
(
Award_id int,
Award_typeid int,
A_id int,
B_id int,
A_year int 

constraint pk_a_id primary key(Award_id ),
constraint fk_type_id foreign key (Award_typeid) references Award_Mtable(Award_typeid),
constraint fk_A_id foreign key (A_id) references Author_Table(A_id),
constraint fk_bid1 foreign key(B_id) references Book_Table(B_id)
)
insert into Award_table (Award_id,Award_typeid,A_id,B_id,A_year)values
(101,01,1,101,2000),
(102,02,2,102,2001),
(103,03,3,103,2002)


drop table Award_Mtable 
create table Award_Mtable
(
Award_typeid int ,
Award_name varchar(30),
Award_Price numeric (12,2)

constraint pk_Award_typeid primary key (Award_typeid)

)

insert into Award_Mtable (Award_typeid,Award_name,Award_Price)values
(01,'BEST BOOK',150000),
(02,'BEST WRITER',450000),
(03,'BEST SELLER',55000)

select *from Book_table
select*from Author_table
Select *from Award_table
select*from Award_Mtable




--1)Find the book which is writtern by xyz
select B_name from Book_table b,Author_table a
where b.A_id=a.A_id and
A_name='XYZ'

--2)Find author name for book '1984'
select A_name from Book_table b,Author_table a
where b.A_id=a.A_id and
B_name='1984'

--3)find author name who got an award in 2000
select A_name from Author_table a join Award_table b on
 a.A_id=b.A_id where b.A_year='2001' 

 --4)find the books got an awards
 select B_name from Book_table b join Award_table a on
 a.b_id=b.b_id

 --5)find out the author wise book count
 select A_name , count (*) as 'Count of Book' from Author_table a inner join 
 Book_table b on
 a.A_id=b.A_id group by a.A_name

 --6)find the authorname who got only one award 
 select A_name ,count(A_id)as 'count' from Author_table a join Award_table d 
 on a.A_id=d.A_id 
 group by A_name having count=1

 select  a.A_name 
from Author_table a join 




--7)find the author name who got best writer award
select a.A_name from Author_table a
join Award_table d on 


--8)find the author who got award price more  than 50000
select a.A_name
from Author_table a
inner join Award_table aw
on a.A_id=aw.A_id
inner join Award_Mtable awm
on aw.Award_typeid=awm.Award_typeid
where awm.Award_Price>50000

--9)find author who got maximum Award
select top 1 a.A_name
from Author_table a join Award_table d 
on a.A_id=d.A_id
group by (a.A_name) order by count(*) desc
