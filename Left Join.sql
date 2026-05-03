use d12;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    dept_id INT
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

show tables;

INSERT INTO departments (dept_id, dept_name) VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing');

INSERT INTO employees (emp_name, dept_id) VALUES
('Alice', 101),
('Bob', 102),
('Charlie', NULL),
('David', 101),
('Eve', 103),
('Frank', NULL),
('Grace', 102),
('Hannah', 105);

-- 1.  Write a query to display all employees and their department names.

select e.emp_name,d.dept_name
from employees e
left join departments d
on e.dept_id = d.dept_id;

-- 2.  Write a query to display all employees along with department names,
-- and show "No Department" if an employee is not assigned to any department.

select e.*,
      case
      when d.dept_name is null then "No department" else d.dept_name end as dept_name
from employees e
left join departments d
on e.dept_id = d.dept_id;

-- 3. Write a query to find employees who do not belong to any department.

select 
e.*,d.*
from employees e
left join departments d
on e.dept_id = d.dept_id
where d.dept_id is Null ;

-- 4.  Write a query to display all departments and the number of employees in each department.

select d.dept_name,count(e.emp_id) as number_of_employees
from employees e
left join departments d
on e.dept_id = d.dept_id
group by d.dept_name
order by count(e.emp_id) desc;

-- 5. Write a query to display all employees and only their department name if it is 'IT', otherwise show NULL.

select e.*,
case 
   when d.dept_name ='IT' then 'IT' else null end as dept_name
from employees e
left join departments d
on e.dept_id = d.dept_id;

-- 6. Write a query to display only employees who belong to the 'HR' department.

select e.emp_name,d.dept_name
from employees e
right join departments d
on e.dept_id = d.dept_id
where d.dept_name = 'HR';

-- 7. Write a query to display employee name and department name, but only include departments where dept_id = 101 using LEFT JOIN condition.

select e.emp_name,d.dept_name
from employees e
left join departments d
on e.dept_id = d.dept_id and d.dept_id =101;

-- 8.  Write a query to display all departments that do not have any employees.

select d.*
from departments d
left join employees e
on e.dept_id = d.dept_id 
where e.dept_id is null;


-- 9. Write a query to display employee name and department name, sorted by department name.


select e.emp_name,d.dept_name
from departments d
left join employees e
on e.dept_id = d.dept_id 
order by d.dept_name;


-- 10.  Write a query to display:
-- employee name
-- department name
-- a new column status
-- "Assigned" if employee has a department
-- "Not Assigned" if no department

select distinct e.emp_name,d.dept_name,
case 
when d.dept_name is not null then "Assigned" else "Not assigned" end as Emp_Status
from employees e
left join departments d
on e.dept_id = d.dept_id 
order by d.dept_name;
