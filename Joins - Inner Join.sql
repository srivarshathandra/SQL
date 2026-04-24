create database joins;

use joins;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(100),
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name, city) VALUES
(1, 'Ravi Kumar', 'Hyderabad'),
(2, 'Anjali Sharma', 'Bangalore'),
(3, 'Rahul Verma', 'Delhi'),
(4, 'Sneha Reddy', 'Hyderabad'),
(5, 'Amit Singh', 'Mumbai');

INSERT INTO orders (order_id, customer_id, product_name, amount, order_date) VALUES
(101, 1, 'Laptop', 55000, '2025-01-10'),
(102, 2, 'Mobile', 20000, '2025-01-12'),
(103, 1, 'Headphones', 2000, '2025-01-15'),
(104, 3, 'Tablet', 30000, '2025-02-01'),
(105, 4, 'Camera', 45000, '2025-02-10'),
(106, 2, 'Smartwatch', 8000, '2025-02-15'),
(107, 5, 'Laptop', 60000, '2025-03-01'),
(108, 4, 'Mobile', 22000, '2025-03-05');


-- 1. Get customer names and product names for all orders


select c.name, o.product_name
from customers c
inner join orders o
on c.customer_id = o.customer_id ;

-- 2. Find customers who placed orders with amount greater than 20000

select c.customer_id,c.name
from customers c
inner join orders o
on c.customer_id = o.customer_id 
where o.amount >20000;

-- 3. Get customer name, city, and product name where city is 'Hyderabad'

select c.name,c.city,o.product_name
from customers c
inner join orders o
on c.customer_id = o.customer_id 
where c.city = "Hyderabad";

-- 4. Find all orders where product name starts with 'L' and amount is greater than 10000

select c.name,o.product_name,o.amount
from customers c
inner join orders o
on c.customer_id = o.customer_id 
where o.product_name like "L%" and o.amount >10000;

-- 5. Get customers who ordered products between amount 10000 and 50000

select c.name,o.product_name,o.amount
from customers c
inner join orders o
on c.customer_id = o.customer_id 
where o.amount between 10000 and 50000;

-- 6. Find customer names who ordered either 'Laptop' or 'Mobile'

select c.name,o.product_name,o.amount
from customers c
inner join orders o
on c.customer_id = o.customer_id 
where o.product_name in ('Laptop' , 'Mobile');

-- 7. Get top 5 highest order amounts with customer names

select c.name,o.amount
from customers c
inner join orders o
on c.customer_id = o.customer_id 
order by o.amount desc
limit 5;

-- 8. Skip first 5 highest orders and get next 5 records with customer name and amount

select c.name,o.amount
from customers c
inner join orders o
on c.customer_id = o.customer_id 
order by o.amount desc
limit 5 offset 5;

-- 9. Find customers whose name starts with 'A' and who placed orders greater than 30000

select c.name,o.amount
from customers c
inner join orders o
on c.customer_id = o.customer_id 
where c.name Like "A%" and o.amount >30000;

-- 10. 🔥 (Advanced)
-- Get customer name, city, product name where:
-- city is 'Delhi' OR 'Mumbai'
-- amount > 20000
-- product name contains 'Pro'
-- show only 3 records after skipping first 2 records


select c.name,c.city,o.product_name
from customers c
inner join orders o
on c.customer_id = o.customer_id 
where city in ('Delhi' , 'Mumbai') 
and o.amount > 30000 
and o.product_name like "%Pro%"
limit 3 offset 2;




