create database company_db;

use company_db;

create table employees (
emp_id int,
emp_name varchar(50),
department varchar(50),
age int,
city varchar(50),
joining_year int
);

insert into employees values
(1, 'Amit', 'HR', 25, 'Hyderabad', 2021),
(2, 'Sneha', 'HR', 30, 'Hyderabad', 2022),
(3, 'Rahul', 'HR', 35, 'Bangalore', 2023),

(4, 'Kiran', 'IT', 28, 'Bangalore', 2021),
(5, 'Divya', 'IT', 32, 'Chennai', 2022),
(6, 'Arjun', 'IT', 29, 'Hyderabad', 2023),
(7, 'Meena', 'IT', 40, 'Bangalore', 2021),

(8, 'Ravi', 'Finance', 45, 'Chennai', 2020),
(9, 'Pooja', 'Finance', 38, 'Mumbai', 2021),
(10, 'Nikhil', 'Finance', 50, 'Mumbai', 2022),

(11, 'Anil', 'Sales', 27, 'Delhi', 2022),
(12, 'Priya', 'Sales', 26, 'Delhi', 2023),
(13, 'Suresh', 'Sales', 31, 'Mumbai', 2021),
(14, 'Neha', 'Sales', 29, 'Hyderabad', 2023),
(15, 'Vikas', 'Sales', 33, 'Bangalore', 2022),

(16, 'Kavya', 'Marketing', 24, 'Chennai', 2023),
(17, 'Rohit', 'Marketing', 36, 'Delhi', 2022),
(18, 'Ananya', 'Marketing', 41, 'Mumbai', 2021),

(19, 'Tarun', 'Support', 23, 'Hyderabad', 2023),
(20, 'Deepa', 'Support', 34, 'Chennai', 2022),
(21, 'Manoj', 'Support', 37, 'Bangalore', 2021),
(22, 'Swathi', 'Support', 28, 'Hyderabad', 2020);


select * from employees;

-- 1. 🏆 Top Departments by Hiring
-- Find the top 2 departments with the highest number of employees.

select department, count(*) as highest_employees
from employees
group by department
order by count(*) desc
limit 2;

-- 2. 🚫 Ignore First Top Department
-- Find the 2nd and 3rd highest hiring departments.


select department, count(*) as second_third_employees
from employees
group by department
order by count(*) desc
limit 2 offset 1;

-- 3. 📍 Cities with High Workforce
-- Find locations that have more than 2 employees.

select city, count(*) as employee
from employees
group by city
having count(*) > 2;

-- 4. 🎯 Experienced Departments
-- Find departments where the average age of employees is greater than 28.

select department, round(avg(age),0) as avg_of_age
from employees
group by department
having avg(age) > 28;

-- 5. 🧓 Oldest Workforce Departments
-- Find the top 3 departments with the highest maximum age.

select department, max(age) 
from employees
group by department
order by  max(age) desc
limit 3;

-- 6. 📅 Recent Hiring Trend
-- Find the top 2 years with the highest number of employees joined.

select joining_year, count(*) 
from employees
group by joining_year
order by count(*) desc
limit 2;

-- 7. 🏢 Balanced Teams
-- Find departments having between 3 and 6 employees.

select department, count(*)
from employees
group by department
having count(*) between 3 and 6;


select * from employees;
-- 8. 📊 Mid-Level Hiring (Pagination)
-- Find the next 3 departments after the top 2 departments based on employee count.

select department,count(*)
from employees
group by department
order by count(*) desc
limit 3 offset 2;

-- 9. 🌆 Top Locations by Avg Age
-- Find the top 3 locations with the highest average age of employees.

select city,round(avg(age),0)
from employees
group by city
order by avg(age) desc
limit 3;

-- 10. 🔍 Filter + Group + Sort (Real Interview)
-- Find departments with more than 2 employees where employees are older than 25, and show the top 2 departments based on count.

select department,count(*)
from employees
where age >25
group by department
having count(*) >2
order by count(*) desc
limit 2;