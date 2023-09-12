create database Facebook

create table FBUser 
(
us_id int primary key ,
us_name varchar(30),
Email varchar (20),
Ph_no varchar(10),
Total_post int
)

create table Post
(
Post_id int primary key ,
us_id int,
post_content varchar(20),
post_img varchar(30),
post_vd varchar(30)

constraint fk_us_id foreign key (us_id) references FBUser(us_id)
)

create table Freindship
(
us_id int,
freind_id int primary key,
fstatus_code int,

constraint fk_usid foreign key (us_id) references FBUser(us_id)
)

create table freindship_status
(
status_code int primary key,
f_status int 
)
