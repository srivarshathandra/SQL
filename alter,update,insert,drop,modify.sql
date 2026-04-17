use d12;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

INSERT INTO employees (id, name, salary, department) VALUES
(1, 'Amit', 45000, 'IT'),
(2, 'Neha', 52000, 'HR'),
(3, 'Rahul', 60000, 'Finance'),
(4, 'Sneha', 48000, 'IT'),
(5, 'Arjun', 75000, 'Management'),
(6, 'Priya', 50000, 'HR'),
(7, 'Kiran', 67000, 'Finance'),
(8, 'Divya', 55000, 'IT'),
(9, 'Ravi', 72000, 'Management'),
(10, 'Anjali', 49000, 'HR'),
(11, 'Vikram', 80000, 'Management'),
(12, 'Pooja', 53000, 'IT'),
(13, 'Suresh', 62000, 'Finance'),
(14, 'Meena', 47000, 'HR'),
(15, 'Rohit', 58000, 'IT'),
(16, 'Kavya', 61000, 'Finance'),
(17, 'Manoj', 54000, 'HR'),
(18, 'Swathi', 69000, 'Management'),
(19, 'Deepak', 56000, 'IT'),
(20, 'Lakshmi', 51000, 'Finance');


-- Insert 5 employee records into the employees table.

insert into employees values
(21,'Rinky', 45000, 'HR'),
(22, 'Sweety', 53000, 'HR'),
(23, 'SwathiRani', 65000, 'Management'),
(24, 'Deepak Sai', 54000, 'IT'),
(25, 'Lakshmi kancu', 50000, 'Finance');


select * from employees;


-- Add a new column called age to the employees table.

alter table employees
add age int;

-- Add two new columns:
-- city
-- joining_date

alter table employees
add city varchar(20),
add joining_date date;


-- Change the datatype of salary column to BIGINT.

alter table employees
modify salary BIGINT;

-- Modify two columns:
-- change age datatype to BIGINT
-- increase city column size to VARCHAR(100)

alter table employees
modify age bigint,
modify city varchar(100);

-- Rename the column name to full_name.

alter table employees
change name full_name varchar(50);


-- UPDATE
-- Update the age of the employee whose id is 1.

update employees
set age = 22
where id =1;

UPDATE employees SET city = 'Hyderabad'
WHERE id IN (1, 4, 8, 12, 19);

UPDATE employees SET city = 'Vizag' WHERE id IN (2, 6, 10, 14, 17);

UPDATE employees SET city = 'Warangal' WHERE id IN (3, 7, 13, 16, 20);

UPDATE employees SET city = 'Bangalore' WHERE id IN (5, 9, 11, 15, 18);

-- Update the city of all employees working in the HR department to Hyderabad.
SET SQL_SAFE_UPDATES = 0;

update  employees
set city ='Kerala'
where department = 'HR';

-- Update the salary and department of the employee whose id is 2.

update employees
set salary = '60000',
     department = 'IT'
where id =2;

-- Update the salary and city for employees whose salary is less than 50000.

update employees
set salary = '60000',
     city= 'Hyderabad'
where salary > '50000';


select * from employees;

-- Delete the employee whose id is 3.

delete from employees
where id = 3;


-- Delete all employees working in the HR department.

delete from employees
where department = 'HR';

-- Delete all records from the employees table but keep the table structure.

truncate table employees;


-- Remove the joining_date column from the table.

alter table employees
drop column joining_date;

-- Remove both age and city columns from the table.


alter table employees
drop column age,
drop column city;

-- Insert 2 new employee records into the employees table.

INSERT INTO employees 
VALUES
(21, 'Ramesh', 55000, 'IT'),
(22, 'Sita', 62000, 'Finance');

-- Increase the salary by 5000 for all employees working in the IT department.

update employees
set salary = salary+5000
where department ='IT';

-- Delete the entire employees table from the database.

drop table employees;