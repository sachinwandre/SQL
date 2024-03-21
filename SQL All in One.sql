CREATE DATABASE IF NOT EXISTS practice;
# DROP DATABASE IF EXISTS practice;
USE practice;
CREATE DATABASE college;
USE college;

CREATE TABLE student(
roll_no INT PRIMARY KEY,
name VARCHAR(50),
marks VARCHAR(50),
grade VARCHAR(3),
city  VARCHAR(50)
);

DROP TABLE IF EXISTS student;
SELECT * FROM student;

SHOW DATABASES;
SHOW TABLES;

INSERT INTO student (roll_no, name, marks, grade, city) VALUES
(1, 'Rajesh Sharma', 85, 'A', 'Mumbai'),
(2, 'Priya Patel', 92, 'A+', 'Ahmedabad'),
(3, 'Amit Singh', 78, 'B', 'Delhi'),
(4, 'Anita Gupta', 96, 'A+', 'Kolkata'),
(5, 'Rahul Kumar', 70, 'C', 'Chennai'),
(6, 'Pooja Verma', 89, 'A', 'Bangalore'),
(7, 'Vikram Singh', 64, 'D', 'Hyderabad'),
(8, 'Neha Rajput', 97, 'A+', 'Pune'),
(9, 'Ramesh Tiwari', 82, 'B', 'Jaipur'),
(10, 'Sunita Reddy', 75, 'C', 'Lucknow'),
(11, 'Manoj Yadav', 87, 'A', 'Indore'),
(12, 'Seema Mishra', 90, 'A', 'Bhopal'),
(13, 'Rajeev Kumar', 96, 'A+', 'Patna'),
(14, 'Anjali Sharma', 78, 'B', 'Nagpur'),
(15, 'Vishal Gupta', 76, 'C', 'Agra'),
(16, 'Kavita Singh', 85, 'A', 'Coimbatore'),
(17, 'Sanjay Patel', 70, 'C', 'Vadodara'),
(18, 'Ritu Verma', 89, 'A', 'Ludhiana'),
(19, 'Arjun Kumar', 94, 'A+', 'Noida'),
(20, 'Sarita Singh', 81, 'B', 'Faridabad');

select * from student;
select name from student;
select name,marks from student;
INSERT INTO student (roll_no, name, marks, grade, city) VALUES (21,'Sachin',99,'A+','Pune');
select * from student;
insert into student (roll_no, name, marks, grade, city) values(22,'Anant','98','A+','Pune'),(23,'Sagar','97','A+','Kolhapur');
select * from student;

create database company;
use company;
create table infosys(
emp_id int primary key,
emp_name varchar(50),
salary int default 50000
);

insert into infosys (emp_id,emp_name,salary) values(1,'Sachin',890000),(2,'Anant',900000);
select * from infosys;
insert into infosys(emp_id,emp_name) values(3,'Sagar');

use college;
select * from student;

# Constraint
create table teacher(
teacher_id int primary key,
teacher_number int unique,
teacher_age int not null,
teacher_height int check (teacher_height > 150),
teacher_salary int default 50000,
teacher_subject_id int,
foreign key (teacher_subject_id) references subject(id)
#primary key(teacher_id,teacher_number) use to create primary key using combination of multiple columns
);

select city from student;
select distinct city from student; # Unique value from city column
select distinct grade from student;
select * from student where city='Mumbai';
select * from student where marks > 80;
select * from student where marks+10 > 100;
select * from student where marks> 90 and grade='A+';
select * from student where marks = 90;
select * from student where marks > 80 or city='Pune';
select * from student where marks between 80 and 90;
select * from student where city in ('Pune','Mumbai','Bhopal');
select * from student where city not in ('Pune','Mumbai','Bhopal');
select * from student limit 5;
select * from student where marks between 90 and 100 limit 3;
select * from student order by city asc;
select * from student order by marks desc;
select * from student order by marks desc limit 3;

# Aggregate Functions
# Min Max Sum Avg Count
select max(marks) from student;
select min(marks) from student;
select min(marks) from student where marks > 90;
select avg(marks) from student;
select max(marks) from student where marks between 80 and 90;
select avg(marks) from student where marks between 80 and 90;
select sum(marks) from student;
select count(name) from student;
select * from student;
select count(grade) from student;


select city,count(name) from student group by city;
select grade,count(roll_no) from student group by grade;
select city,avg(marks) from student group by city;
select city,name,avg(marks) from student group by city,name; 


insert into student values(24,'Sachin',96,'A+','Pune');

select city,avg(marks) from student group by city order by city;
select city,avg(marks) from student group by city order by avg(marks) asc; # ordered by avg marks
select grade, count(roll_no) from student group by grade order by grade desc;

select city,count(roll_no) from student group by city having max(marks) > 90;
select * from student where marks>90;
select city,count(roll_no) from student group by city having max(marks) > 90;


update student set grade ='O' where grade='A+';
update student set grade='O+' where marks between 95 and 100;
update student set marks = marks+1;

delete from student where name='Sachin';
delete from student;


-- Create the subject table
CREATE TABLE subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(255) NOT NULL
);

drop table subject;
drop table teacher; -- Need to delete first child table then parent table

-- Create the teacher table with subject_id as a foreign key
CREATE TABLE teacher (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(255) NOT NULL,
    subject_id INT,
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Insert 5 rows into the teacher table
INSERT INTO subject (subject_id, subject_name)
VALUES
    (1, 'Mathematics'),
    (2, 'Science'),
    (3, 'History'),
    (4, 'English'),
    (5, 'Physics');

-- Insert teachers with associated subject_id
INSERT INTO teacher (teacher_id, teacher_name, subject_id)
VALUES
    (111, 'John Doe', 1),
    (222, 'Jane Smith', 2),
    (333, 'Michael Johnson', 3),
    (444, 'Emily Davis', 1),
    (555, 'Robert Wilson', 5),
    (666, 'Sarah Brown', 2),
    (777, 'David Lee', 4),
    (888, 'Linda Clark', 5),
    (999, 'Daniel White', 4),
    (1000, 'Karen Turner', 5);

select * from subject;

select * from teacher;

update subject set subject_id = 10 where subject_id = 5;

-- set sqi_safe_updates = 0;
-- SET SQL_SAFE_UPDATES = 0;
select * from student;

-- Add column
alter table student add column age int;
#alter table student add column age int not null default 18;

-- Drop Column
alter table student drop column age;

-- Rename column name
alter table student change age student_age int; 

-- Modify the column data type
alter table student modify student_age varchar(4);

-- Rename the table name
alter table student rename to student_record;
alter table student_record rename to student;



CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    department_id INT,
    foreign key (department_id) references departments(department_id) 
);

drop table employees;
drop table departments;

INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'Finance'),
    (3, 'IT'),
    (4,'Support'),
    (5,'Technical');

INSERT INTO employees (employee_id, employee_name, department_id)
VALUES
    (101, 'John Doe', 1),
    (102, 'Jane Smith', 2),
    (103, 'Mike Johnson', 3),
    (104, 'Emily Davis', 2),
    (105,'Sachin Wandre',2),
    (106,'Santosh Wandre',3),
	(107,'Anant Shete',1);
    
-- drop table employees;
-- drop table departments;

select * from departments;

-- inner join
select * from departments inner join employees on departments.department_id = employees.department_id; 

-- left join
select * from departments as d left join employees as e on d.department_id = e.department_id;

-- right join
select * from departments as d right join employees as e on d.department_id = e.department_id;
-- full join
select * from departments as d left join employees as e on d.department_id = e.department_id
union
select * from departments as d right join employees as e on d.department_id = e.department_id;

# SELECT * FROM employees FULL OUTER JOIN departments ON employees.department_id = departments.department_id;

CREATE TABLE CUSTOMERS (
   ID INT NOT NULL,
   NAME VARCHAR (20) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS CHAR (25),
   SALARY DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);

INSERT INTO CUSTOMERS VALUES
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00 ),
(2, 'Khilan', 25, 'Delhi', 1500.00 ),
(3, 'Kaushik', 23, 'Kota', 2000.00 ),
(4, 'Chaitali', 25, 'Mumbai', 6500.00 ),
(5, 'Hardik', 27, 'Bhopal', 8500.00 ),
(6, 'Komal', 22, 'MP', 4500.00 ),
(7, 'Muffy', 24, 'Indore', 10000.00 );


CREATE TABLE ORDERS (
   OID INT NOT NULL,
   DATE VARCHAR (20) NOT NULL,
   CUSTOMER_ID INT NOT NULL,
   AMOUNT DECIMAL (18, 2)
);

INSERT INTO ORDERS VALUES 
(102, '2009-10-08 00:00:00', 3, 3000.00),
(100, '2009-10-08 00:00:00', 3, 1500.00),
(101, '2009-11-20 00:00:00', 2, 1560.00),
(103, '2008-05-20 00:00:00', 4, 2060.00);

-- inner join
select * from customers inner join orders on CUSTOMERS.ID = ORDERS.CUSTOMER_ID;
-- left join
select * from customers left join orders on CUSTOMERS.ID = ORDERS.CUSTOMER_ID;
-- right join
select * from customers right join orders on CUSTOMERS.ID = ORDERS.CUSTOMER_ID;
-- Full join
SELECT ID, NAME, AMOUNT, DATE
FROM CUSTOMERS
LEFT JOIN ORDERS
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID
UNION
SELECT ID, NAME, AMOUNT, DATE
FROM CUSTOMERS
RIGHT JOIN ORDERS
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID;

-- Below is not working for full join
-- SELECT ID, NAME, AMOUNT, DATE
-- FROM CUSTOMERS
-- FULL JOIN ORDERS
-- ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID;

-- left exclusive join
select * from customers left join orders on CUSTOMERS.ID = ORDERS.CUSTOMER_ID where ORDERS.CUSTOMER_ID is null;

-- right exclusive join
select * from customers right join orders on CUSTOMERS.ID = ORDERS.CUSTOMER_ID where customers.ID is null;

-- How to combine the both exclusive results
select * from customers left join orders on CUSTOMERS.ID = ORDERS.CUSTOMER_ID where ORDERS.CUSTOMER_ID is null
UNION
select * from customers right join orders on CUSTOMERS.ID = ORDERS.CUSTOMER_ID where customers.ID is null;


-- Self join
CREATE TABLE soft_employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT
);

INSERT INTO soft_employees (employee_id, employee_name, manager_id)
VALUES
    (1, 'John Doe', 4),
    (2, 'Jane Smith', 4),
    (3, 'Alice Johnson', 1),
    (4, 'Bob Brown', NULL),
    (5, 'Charlie Wilson', 2);

drop table soft_employees;

select a.employee_name as manager_name,b.employee_name
from soft_employees a
join soft_employees b
on a.employee_id = b.manager_id;


-- SQL sub queries
-- Get name of all student who scored more than avg marks

select avg(marks) from student;

select name,marks from student where marks > (select avg(marks) from student);

select name from student where marks > 85.42;

-- Find the name of the student with even roll nos.

select * from student where roll_no % 2 = 0;  

select roll_no,name from student where roll_no in (select roll_no from student where roll_no %2 =0 );

-- Find the max marks from pune

select * from student where city='Pune';
select MAX(marks) from student where city='Pune';
select MAX(marks) from (select * from student where city='Pune') AS temp;

-- View
CREATE VIEW view1 AS
select name,city from student;

select * from view1;

drop view view1;



CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(255),
    emp_city VARCHAR(255),
    emp_salary INT
);

-- Inserting records into the "employee" table
INSERT INTO employee (emp_id, emp_name, emp_city, emp_salary)
VALUES
    (1, 'John Smith', 'New York', 60000),
    (2, 'Jane Doe', 'Los Angeles', 55000),
    (3, 'Michael Lee', 'Chicago', 62000),
    (4, 'Emily Davis', 'Houston', 58000),
    (5, 'David Chen', 'San Francisco', 65000),
    (6, 'Sarah Wilson', 'Miami', 54000),
    (7, 'Kevin Brown', 'Boston', 63000),
    (8, 'Lisa Taylor', 'Atlanta', 59000),
    (9, 'Brian Hall', 'Dallas', 61000),
    (10, 'Emma Adams', 'Seattle', 57000),
    (11, 'Anant', 'Pune', 160000),
	(12, 'Anant Shete', 'Solapur', 155000),
	(13, 'Sagar Kadam', 'Sangli', 162000),
	(14, 'Raju Patil', 'Sangli', 158000),
	(15, 'Jamir Mullani', 'Solapur', 165000),
	(16, 'Soham Vader', 'Pune', 14000),
	(17, 'Sachin Wandre', 'Kolhapur', 163000),
	(18, 'Santosh Wandre', 'Satara', 159000),
	(19, 'Sarang Patil', 'Sangli', 161000),
	(20, 'Sujit Wandre', 'Satara', 157000);
    
# Ordered salary by descending
select * from employee order by emp_salary desc;
    
# Select max salary from employee
select * from employee where emp_salary=(select max(emp_salary) from employee);
    
# Select second max salary from employee
select * from employee where emp_salary=(select max(emp_salary) from employee where emp_salary < (select max(emp_salary) from employee));
select * from  employee order by emp_salary desc limit 1,1;

# Select third max salary from employee
select * from employee where emp_salary=(select max(emp_salary) from employee where emp_salary < (select max(emp_salary) from employee where emp_salary < (select max(emp_salary) from employee)));
select * from employee order by emp_salary desc limit 2,1;
select * from employee e1 where 3-1 = (select count(distinct emp_salary) from employee e2 where e2.emp_salary > e1.emp_salary);

select * from employee order by emp_salary asc;

# Select lowest salary from employee
select * from employee where emp_salary = (select min(emp_salary) from employee);
select * from employee order by emp_salary asc limit 1;
select * from employee order by emp_salary asc limit 0,1;

# Select second lowest salary from employee
select * from employee where emp_salary = (select min(emp_salary) from employee where emp_salary > (select min(emp_salary) from employee));
select * from employee order by emp_salary asc limit 1,1;

# Select third lowest salary from employee
select * from employee order by emp_salary asc limit 2,1;
select * from employee e1 where 3-1 =(select count(distinct emp_salary) from employee e2 where e2.emp_salary < e1.emp_salary);

# Select the employee whose names are begin with S
select * from employee where emp_name like 'S%';

# Select the employee whose names are end with ndre
select * from employee where emp_name like '%ndre';

# Select names start with S and having 5 length
select * from employee where emp_name like 'S____%';

# Select names who having g in names
select * from employee where emp_name like '%g%';

# Select salary 
select * from employee where emp_salary in(55000,62000);
select * from employee where emp_salary between 67000 and 180000;

# Create a table from another table and copy data
create table employee2 as select emp_name,emp_salary from employee;

# Create a table from another table with no records
create table employee3 as select * from employee where 6=7;
select * from employee3;

delete from employee2 where emp_salary between 60000 and 100000;
delete from employee where emp_salary in (54000,58000);

# Drop table i.e delete all rows and table as well
drop table if exists employee2;
select * from employee2;

# Delete all rows i.e records from table, table exist
truncate table employee2;

-- SQL Wildcards
-- Return all customers that starts with the letter 'a':
-- SELECT * FROM Customers WHERE CustomerName LIKE 'a%';

-- Return all customers that ends with the pattern 'es':
-- SELECT * FROM Customers WHERE CustomerName LIKE '%es';

-- Return all customers that contains the pattern 'mer':
-- SELECT * FROM Customers WHERE CustomerName LIKE '%mer%';

-- Return all customers with a City starting with any character, followed by "ondon":
-- SELECT * FROM Customers WHERE City LIKE '_ondon';

-- Return all customers with a City starting with "L", followed by any 3 characters, ending with "on":
-- SELECT * FROM Customers WHERE City LIKE 'L___on';

-- Return all customers starting with either "b", "s", or "p": 
-- SELECT * FROM Customers WHERE CustomerName LIKE '[bsp]%';

-- Return all customers starting with "a", "b", "c", "d", "e" or "f": 
-- SELECT * FROM Customers WHERE CustomerName LIKE '[a-f]%';

-- Return all customers that starts with "a" and are at least 3 characters in length:
-- SELECT * FROM Customers WHERE CustomerName LIKE 'a__%';

-- Return all customers that have "r" in the second position: 
-- SELECT * FROM Customers WHERE CustomerName LIKE '_r%';


# SQL query to find out the duplicate records
select emp_id,count(emp_id) from employee group by emp_id;
select emp_id,count(emp_id) from employee group by emp_id having count(emp_id) > 1;

# Find out even and odd empid 
select * from employee where MOD(emp_id,2) = 0;

select * from employee where MOD(emp_id,2) = 1;

# To display first and last record
select * from employee where emp_id = (select min(emp_id) from employee);
select * from employee order by emp_id asc limit 0,1;

select * from employee where emp_id = (select max(emp_id) from employee);
select * from employee order by emp_id desc limit 0,1;

select * from employee;

update employee set emp_salary = 200000 where emp_id in(1,10,20);

# find out the persons having the same city
select distinct(e1.emp_id),e1.emp_salary,e1.emp_city from employee e1,employee e2 where e1.emp_city = e2.emp_city and e1.emp_id != e2.emp_id order by emp_city;

# find out the persons having the same salary
select distinct(e1.emp_id),e1.emp_salary from employee e1,employee e2 where e1.emp_salary = e2.emp_salary and e1.emp_id != e2.emp_id order by emp_salary;

# Retrived last 3 records
select * from employee order by emp_id desc limit 3;
select * from (select * from employee order by emp_id desc limit 3) temp order by emp_id asc;

# Write a query to add multiple records in a table
insert into employee values (21,'Jon','Chandgad',90000),(22,'Jony','Kolhapur',76890),(23,'Janardan','Sanpada',9800);

# Write a query to add/delete multiple cols in a table
alter table employee add column emp_email varchar(20),add column emp_designation varchar(20);

select * from employee;

alter table employee drop column emp_email,drop column emp_designation;

# Write a query to find out the 2nd highest value in a table
select * from employee where emp_salary = (select max(emp_salary) from employee where emp_salary < (select max(emp_salary) from employee));

select distinct(emp_salary) from employee order by emp_salary desc limit 1,1;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
# Find max value without using ORDER BY
select * from employee where emp_salary = (select max(emp_salary) from employee);

CREATE TABLE `movies` (
  `name` varchar(72) DEFAULT NULL,
  `rating` varchar(9) DEFAULT NULL,
  `genre` varchar(9) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `released` varchar(45) DEFAULT NULL,
  `score` decimal(2,1) DEFAULT NULL,
  `votes` decimal(8,1) DEFAULT NULL,
  `director` varchar(24) DEFAULT NULL,
  `writer` varchar(26) DEFAULT NULL,
  `star` varchar(27) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `budget` varchar(10) DEFAULT NULL,
  `gross` varchar(11) DEFAULT NULL,
  `company` varchar(63) DEFAULT NULL,
  `runtime` decimal(4,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `movies` (`name`, `rating`, `genre`, `year`, `released`, `score`, `votes`, `director`, `writer`, `star`, `country`, `budget`, `gross`, `company`, `runtime`) VALUES
('The Shining', 'R', 'Drama', 1980, 'June 13, 1980 (United States)', '8.4', '927000.0', 'Stanley Kubrick', 'Stephen King', 'Jack Nicholson', 'United Kingdom', '19000000.0', '46998772.0', 'Warner Bros.', '146.0'),
('The Blue Lagoon', 'R', 'Adventure', 1980, 'July 2, 1980 (United States)', '5.8', '65000.0', 'Randal Kleiser', 'Henry De Vere Stacpoole', 'Brooke Shields', 'United States', '4500000.0', '58853106.0', 'Columbia Pictures', '104.0'),
('Star Wars: Episode V - The Empire Strikes Back', 'PG', 'Action', 1980, 'June 20, 1980 (United States)', '8.7', '1200000.0', 'Irvin Kershner', 'Leigh Brackett', 'Mark Hamill', 'United States', '18000000.0', '538375067.0', 'Lucasfilm', '124.0'),
('Airplane!', 'PG', 'Comedy', 1980, 'July 2, 1980 (United States)', '7.7', '221000.0', 'Jim Abrahams', 'Jim Abrahams', 'Robert Hays', 'United States', '3500000.0', '83453539.0', 'Paramount Pictures', '88.0'),
('Caddyshack', 'R', 'Comedy', 1980, 'July 25, 1980 (United States)', '7.3', '108000.0', 'Harold Ramis', 'Brian Doyle-Murray', 'Chevy Chase', 'United States', '6000000.0', '39846344.0', 'Orion Pictures', '98.0'),
('Friday the 13th', 'R', 'Horror', 1980, 'May 9, 1980 (United States)', '6.4', '123000.0', 'Sean S. Cunningham', 'Victor Miller', 'Betsy Palmer', 'United States', '550000.0', '39754601.0', 'Paramount Pictures', '95.0'),
('The Blues Brothers', 'R', 'Action', 1980, 'June 20, 1980 (United States)', '7.9', '188000.0', 'John Landis', 'Dan Aykroyd', 'John Belushi', 'United States', '27000000.0', '115229890.0', 'Universal Pictures', '133.0'),
('Raging Bull', 'R', 'Biography', 1980, 'December 19, 1980 (United States)', '8.2', '330000.0', 'Martin Scorsese', 'Jake LaMotta', 'Robert De Niro', 'United States', '18000000.0', '23402427.0', 'Chartoff-Winkler Productions', '129.0'),
('Superman II', 'PG', 'Action', 1980, 'June 19, 1981 (United States)', '6.8', '101000.0', 'Richard Lester', 'Jerry Siegel', 'Gene Hackman', 'United States', '54000000.0', '108185706.0', 'Dovemead Films', '127.0'),
('The Long Riders', 'R', 'Biography', 1980, 'May 16, 1980 (United States)', '7.0', '10000.0', 'Walter Hill', 'Bill Bryden', 'David Carradine', 'United States', '10000000.0', '15795189.0', 'United Artists', '100.0'),
('Any Which Way You Can', 'PG', 'Action', 1980, 'December 17, 1980 (United States)', '6.1', '18000.0', 'Buddy Van Horn', 'Stanford Sherman', 'Clint Eastwood', 'United States', '15000000.0', '70687344.0', 'The Malpaso Company', '116.0'),
('The Gods Must Be Crazy', 'PG', 'Adventure', 1980, 'October 26, 1984 (United States)', '7.3', '54000.0', 'Jamie Uys', 'Jamie Uys', 'N!xau', 'South Africa', '5000000.0', '30031783.0', 'C.A.T. Films', '109.0'),
('Popeye', 'PG', 'Adventure', 1980, 'December 12, 1980 (United States)', '5.3', '30000.0', 'Robert Altman', 'Jules Feiffer', 'Robin Williams', 'United States', '20000000.0', '49823037.0', 'Paramount Pictures', '114.0'),
('Ordinary People', 'R', 'Drama', 1980, 'September 19, 1980 (United States)', '7.7', '49000.0', 'Robert Redford', 'Judith Guest', 'Donald Sutherland', 'United States', '6000000.0', '54766923.0', 'Paramount Pictures', '124.0'),
('Dressed to Kill', 'R', 'Crime', 1980, 'July 25, 1980 (United States)', '7.1', '37000.0', 'Brian De Palma', 'Brian De Palma', 'Michael Caine', 'United States', '6500000.0', '31899000.0', 'Filmways Pictures', '104.0'),
('Somewhere in Time', 'PG', 'Drama', 1980, 'October 3, 1980 (United States)', '7.2', '27000.0', 'Jeannot Szwarc', 'Richard Matheson', 'Christopher Reeve', 'United States', '5100000.0', '9709597.0', 'Rastar Pictures', '103.0'),
('Fame', 'R', 'Drama', 1980, 'May 16, 1980 (United States)', '6.6', '21000.0', 'Alan Parker', 'Christopher Gore', 'Eddie Barth', 'United States', '', '21202829.0', 'Metro-Goldwyn-Mayer (MGM)', '134.0'),
('9 to 5', 'PG', 'Comedy', 1980, 'December 19, 1980 (United States)', '6.9', '29000.0', 'Colin Higgins', 'Patricia Resnick', 'Jane Fonda', 'United States', '10000000.0', '103300686.0', 'IPC Films', '109.0'),
('The Fog', 'R', 'Horror', 1980, 'February 8, 1980 (United States)', '6.8', '66000.0', 'John Carpenter', 'John Carpenter', 'Adrienne Barbeau', 'United States', '1000000.0', '21448782.0', 'AVCO Embassy Pictures', '89.0'),
('Stir Crazy', 'R', 'Comedy', 1980, 'December 12, 1980 (United States)', '6.8', '26000.0', 'Sidney Poitier', 'Bruce Jay Friedman', 'Gene Wilder', 'United States', '', '101300000.0', 'Columbia Pictures', '111.0'),
('Cruising', 'R', 'Crime', 1980, 'February 15, 1980 (United States)', '6.5', '20000.0', 'William Friedkin', 'William Friedkin', 'Al Pacino', 'West Germany', '11000000.0', '19814523.0', 'Lorimar Film Entertainment', '102.0'),
('Heaven\'s Gate', 'R', 'Adventure', 1980, 'April 24, 1981 (United States)', '6.8', '14000.0', 'Michael Cimino', 'Michael Cimino', 'Kris Kristofferson', 'United States', '44000000.0', '3484523.0', 'Partisan Productions', '219.0'),
('The Final Countdown', 'PG', 'Action', 1980, 'August 1, 1980 (United States)', '6.7', '22000.0', 'Don Taylor', 'Thomas Hunter', 'Kirk Douglas', 'United States', '12000000.0', '16647800.0', 'Bryna Productions', '103.0'),
('Xanadu', 'PG', 'Fantasy', 1980, 'August 8, 1980 (United States)', '5.3', '12000.0', 'Robert Greenwald', 'Richard Christian Danus', 'Olivia Newton-John', 'United States', '20000000.0', '22762571.0', 'Universal Pictures', '96.0'),
('Urban Cowboy', 'PG', 'Drama', 1980, 'June 6, 1980 (United States)', '6.4', '14000.0', 'James Bridges', 'Aaron Latham', 'John Travolta', 'United States', '', '46918287.0', 'Paramount Pictures', '132.0'),
('Altered States', 'R', 'Horror', 1980, 'December 25, 1980 (United States)', '6.9', '33000.0', 'Ken Russell', 'Paddy Chayefsky', 'William Hurt', 'United States', '', '19853892.0', 'Warner Bros.', '102.0'),
('Little Darlings', 'R', 'Comedy', 1980, 'March 21, 1980 (United States)', '6.5', '5100.0', 'Ron Maxwell', 'Kimi Peck', 'Tatum O\'Neal', 'United States', '', '34326249.0', 'Stephen Friedman/Kings Road Productions', '96.0'),
('Raise the Titanic', 'PG', 'Action', 1980, 'August 1, 1980 (United States)', '5.0', '4100.0', 'Jerry Jameson', 'Adam Kennedy', 'Jason Robards', 'United Kingdom', '36000000.0', '', 'ITC Films', '115.0'),
('Brubaker', 'R', 'Crime', 1980, 'June 20, 1980 (United States)', '7.2', '17000.0', 'Stuart Rosenberg', 'W.D. Richter', 'Robert Redford', 'United States', '9000000.0', '37121708.0', 'Twentieth Century Fox', '131.0'),
('American Gigolo', 'R', 'Crime', 1980, 'February 1, 1980 (United States)', '6.2', '22000.0', 'Paul Schrader', 'Paul Schrader', 'Richard Gere', 'United States', '4800000.0', '22743674.0', 'Paramount Pictures', '117.0'),
('My Bodyguard', 'PG', 'Comedy', 1980, 'September 26, 1980 (United States)', '7.1', '8900.0', 'Tony Bill', 'Alan Ormsby', 'Chris Makepeace', 'United States', '', '22482952.0', 'Twentieth Century Fox', '102.0'),
('Prom Night', 'R', 'Horror', 1980, 'July 18, 1980 (United States)', '5.4', '16000.0', 'Paul Lynch', 'William Gray', 'Leslie Nielsen', 'Canada', '', '14796236.0', 'Guardian Trust Company', '92.0'),
('Smokey and the Bandit II', 'PG', 'Action', 1980, 'August 15, 1980 (United States)', '5.3', '15000.0', 'Hal Needham', 'Hal Needham', 'Burt Reynolds', 'United States', '', '66132626.0', 'Universal Pictures', '100.0'),
('Cattle Annie and Little Britches', 'PG', 'Drama', 1980, 'April 24, 1981 (United States)', '6.1', '604.0', 'Lamont Johnson', 'David Eyre', 'Scott Glenn', 'United States', '5100000.0', '534816.0', 'Cattle Annie Productions', '97.0'),
('Seems Like Old Times', 'PG', 'Comedy', 1980, 'December 19, 1980 (United States)', '6.7', '9100.0', 'Jay Sandrich', 'Neil Simon', 'Goldie Hawn', 'United States', '', '43995918.0', 'Rastar Films', '102.0'),
('Private Benjamin', 'R', 'Comedy', 1980, 'October 10, 1980 (United States)', '6.2', '24000.0', 'Howard Zieff', 'Nancy Meyers', 'Goldie Hawn', 'United States', '10000000.0', '69847348.0', 'Warner Bros.', '109.0'),
('The Hollywood Knights', 'R', 'Comedy', 1980, 'May 30, 1980 (United States)', '6.3', '4300.0', 'Floyd Mutrux', 'Floyd Mutrux', 'Tony Danza', 'United States', '4000000.0', '10000000.0', 'PolyGram Filmed Entertainment', '91.0'),
('Motel Hell', 'R', 'Comedy', 1980, 'October 24, 1980 (United States)', '6.0', '11000.0', 'Kevin Connor', 'Robert Jaffe', 'Rory Calhoun', 'United States', '3000000.0', '6342668.0', 'Camp Hill', '101.0'),
('The Jazz Singer', 'PG', 'Drama', 1980, 'December 19, 1980 (United States)', '5.9', '4000.0', 'Richard Fleischer', 'Samson Raphaelson', 'Laurence Olivier', 'United States', '', '27118000.0', 'EMI Films', '115.0'),
('Coal Miner\'s Daughter', 'PG', 'Biography', 1980, 'March 7, 1980 (United States)', '7.5', '17000.0', 'Michael Apted', 'Thomas Rickman', 'Sissy Spacek', 'United States', '', '67182787.0', 'Universal Pictures', '124.0'),
('The Watcher in the Woods', 'PG', 'Family', 1980, 'October 9, 1981 (United States)', '6.3', '5700.0', 'John Hough', 'Brian Clemens', 'Bette Davis', 'United States', '', '5000000.0', 'Walt Disney Productions', '84.0'),
('Breaker Morant', 'PG', 'Drama', 1980, 'July 3, 1980 (Australia)', '7.9', '13000.0', 'Bruce Beresford', 'Jonathan Hardy', 'Edward Woodward', 'Australia', '', '', 'The South Australian Film Corporation', '107.0'),
('The Stunt Man', 'R', 'Action', 1980, 'June 27, 1980 (United States)', '7.1', '9000.0', 'Richard Rush', 'Lawrence B. Marcus', 'Peter O\'Toole', 'United States', '3500000.0', '7063886.0', 'Melvin Simon Productions', '131.0'),
('Where the Buffalo Roam', 'R', 'Biography', 1980, 'April 25, 1980 (United States)', '6.6', '11000.0', 'Art Linson', 'Hunter S. Thompson', 'Peter Boyle', 'United States', '', '6659377.0', 'Universal Pictures', '99.0'),
('The Awakening', 'R', 'Horror', 1980, 'October 31, 1980 (United States)', '4.8', '2000.0', 'Mike Newell', 'Allan Scott', 'Charlton Heston', 'United Kingdom', '', '8415112.0', 'EMI Films', '101.0'),
('Cheech and Chong\'s Next Movie', 'R', 'Comedy', 1980, 'July 18, 1980 (United States)', '6.1', '12000.0', 'Tommy Chong', 'Tommy Chong', 'Cheech Marin', 'United States', '', '41675194.0', 'Universal Pictures', '99.0'),
('The Island', 'R', 'Action', 1980, 'June 13, 1980 (United States)', '5.3', '3900.0', 'Michael Ritchie', 'Peter Benchley', 'Michael Caine', 'United States', '22000000.0', '15716828.0', 'Universal Pictures', '109.0'),
('The Boogey Man', 'R', 'Horror', 1980, 'November 7, 1980 (United States)', '4.6', '3900.0', 'Ulli Lommel', 'Ulli Lommel', 'Suzanna Love', 'United States', '300000.0', '', 'The Jerry Gross Organization', '82.0'),
('The Nude Bomb', 'PG', 'Action', 1980, 'May 9, 1980 (United States)', '5.1', '3100.0', 'Clive Donner', 'Mel Brooks', 'Don Adams', 'United States', '15000000.0', '14662035.0', 'Universal Pictures', '94.0');

select * from movies;

# Find managers of all employees
select  e1.fname as manager_name,e2.fname from employee e1 join employee e2 where e1.manager_id = e2.emp_id;

# Use of wild cards
select * from employee where emp_name like 'S___';

select * from employee where emp_city like 'P___';
select * from movies where name like '%man%';
select * from movies where name like '%man';

# If else based questions
SELECT 
    emp_salary, 
    CASE 
        WHEN emp_salary <= 70000 THEN 'Junior'
        WHEN emp_salary > 70000 AND emp_salary < 100000 THEN 'Senior'
        ELSE 'Manager'
    END AS Designation
FROM employee;


# Find category-wise top value
select genre,name,score from movies m1 where score = (select max(score) from movies m2 where m2.genre = m1.genre); 

select genre,max(score) from movies group by genre;

# Find/delete all the duplicate values

# Joining 3 tables
select name,age,group_name from users u join membership m on u.user_id = m.user_id join group1  g on g.group_id=m.group_id;

