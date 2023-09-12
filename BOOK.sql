create database Books

create table book_table
(
Book_id int primary key,
Book_Name varchar(10) not null,
Author_id int ,
Price numeric(10,2)
)

create table Author_
(
author_id int primary key ,
author_name varchar(20) ,
ph_no varchar(10) ,
email varchar(20) unique ,
Address varchar(50),
city varchar (10),
)
