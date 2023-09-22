create database D_P

create table Doctor
(
Doctor_id int primary key,
first_name varchar(30),
last_name varchar(30),
speciality varchar(25)
)

insert into Doctor values
(101,'Atul','Mhaske','Cardiologists'),
(102, 'Bhakti','Jare','Dermatologists'),
(103,'Muskan','Shaikh','Emergency'),
(104,'Sanika','Nimase','Family Physicians'),
(105, 'Pooja', 'Nimase','Hematologists')

---------------------------------------------------------------------------------------
create table Patients
(
patient_id int primary key,
first_name varchar(30),
last_name varchar(30),
gender char(1),
Birthdate date,
city varchar(30),
province_id char(2),
allergies varchar(80),
height decimal,
weight decimal

constraint fk_p_id foreign key (province_id)references province_names (province_id) 
)

insert into Patients values(1,'Shubham','Dalvi','M','2001/07/11','Pune','AH','Astama',167,55)
insert into Patients values(2,'Rushi','Kharade','M','1998/11/29','Nagar','AU','Skin',153,60)
insert into Patients values(3,'Shubham','Tidke','M','2000/08/12','Pune','NA','Food',159,70)
insert into Patients values(4,'Sujit','Sabale','M','2001/05/13','Mumbai','TH','Dust',157,65)
insert into Patients values(5,'Ajay','Nikam','M','2002/09/14','Delhi','TH','Perfume',165,54)
insert into Patients values(6,'Alisha','Mhasake','F','1999/02/15','Nagar','AU','Fish',170,50)
insert into Patients values(7,'Riya','Malpani','F','1998/12/16','Satara','AH','Chemical',155,75)
insert into Patients values(8,'Riya','Malpani','F','1998/12/16','Satara','AH',null,155,75)

---------------------------------------------------------------------------------------------------
drop table Admissions
create table Admissions
(
patient_id int,
Doctor_id int,
admission_date date,
discharge_date date,
diagnosis varchar(35),

constraint fk_patient_id foreign key(patient_id) references Patients(patient_id),
constraint fk_Doc_id foreign key(Doctor_id) references Doctor(Doctor_id)
)
insert into Admissions values(2,102, '2023/07/16','2023/07/26','Diabetes')
insert into Admissions values(5,101,'2023/06/26','2023/07/15','Depression')
insert into Admissions values(4,104, '2023/07/16','2023/07/26','Diabetes')
insert into Admissions values(1,105, '2023/01/16','2023/01/31','Anxiety')
insert into Admissions values(3,101, '2023/05/16','2023/05/26','Diabetes')

select*from Admissions

-------------------------------------------------------------------------------------------------
create table province_names
(
province_id char(2) primary key,
province_name varchar(30),
)

insert into province_names  values ('AH','Ahemednagar'),('AU','Aurangabad'),('NA','Nagpur'),('TH','Thane')




--1.	Show the first name, last name and gender of patients who’s gender is ‘M’
select first_name,last_name,gender from Patients where gender='M'
--2.	Show the first name & last name of patients who does not have any allergies
select first_name,last_name,gender from Patients where allergies is null

--3.	Show the patients details that start with letter ‘C’
select *from Patients where first_name like's%'
--4.	Show the patients details that height range 100 to 200
select *from Patients where height between 100 and 200
--5.	Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null
update Patients set allergies='NKA'where allergies is null
select*from Patients
--6.	Show how many patients have birth year is 2020


--7.	Show the patients details who have greatest height
select  top 1*from Patients order by  height desc  
--8.	Show the total amount of male patients and the total amount of female patients in the patients table.
select p.gender, COUNT(*)as'Count'
from Patients p
group by gender g


--9.Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'.
--Show results ordered ascending by allergies then by first_name then by last_name.
select p.first_name,p.last_name,p.allergies
from Doctor d
where d.allergies in('Astama','Perfume')
order by allergies,first_name,last_name

--10.	Show first_name, last_name, and the total number of admissions attended for each doctor.
--Every admission has been attended by a doctor.
select concat(d.first_name,' ',d.last_name) as 'Patient Full Name' , count(d.doctor_id) as 'Attened admission'
from Doctor d
inner join Admissions a on d.doctor_id = a.doctor_id
inner join Patients p on p.patient_id = a.patient_id
group by concat(d.first_name,' ', d.last_name)  


--11.	For every admission, display the patient's full name, their admission diagnosis,
--and their doctor's full name who diagnosed their problem.

select CONCAT(p.first_name, ' ',p.last_name) as 'patient full name', a.diagnosis, CONCAT(d.first_name, ' ', d.last_name) as 'doctor'
from Patients p
inner join Admissions a on a.patient_id= p.patient_id
inner join doctor d on d.doctor_id = a.doctor_id