use product_sales;

CREATE TABLE products (
   product_id INT PRIMARY KEY,
   product_name VARCHAR(50),
   category VARCHAR(30),
   price DECIMAL(10,2),
   stock INT,
   brand VARCHAR(30)
);

INSERT INTO products VALUES
(1, 'iPhone 13', 'Mobile', 70000, 10, 'Apple'),
(2, 'Galaxy S21', 'Mobile', 60000, 15, 'Samsung'),
(3, 'Redmi Note 11', 'Mobile', 20000, 25, 'Xiaomi'),
(4, 'MacBook Air', 'Laptop', 90000, 5, 'Apple'),
(5, 'Dell Inspiron', 'Laptop', 55000, 8, 'Dell'),
(6, 'HP Pavilion', 'Laptop', 60000, 7, 'HP'),
(7, 'Sony Headphones', 'Accessories', 8000, 20, 'Sony'),
(8, 'Boat Earbuds', 'Accessories', 2000, 50, 'Boat'),
(9, 'iPad', 'Tablet', 50000, 12, 'Apple'),
(10, 'Samsung Tab', 'Tablet', 30000, 18, 'Samsung'),
(11, 'Asus Laptop', 'Laptop', 65000, 6, 'Asus'),
(12, 'OnePlus 11', 'Mobile', 55000, 14, 'OnePlus'),
(13, 'Realme Narzo', 'Mobile', 15000, 30, 'Realme'),
(14, 'Lenovo ThinkPad', 'Laptop', 75000, 4, 'Lenovo'),
(15, 'JBL Speaker', 'Accessories', 10000, 22, 'JBL'),
(16, 'Mi Pad', 'Tablet', 25000, 16, 'Xiaomi'),
(17, 'AirPods', 'Accessories', 15000, 9, 'Apple'),
(18, 'Oppo F21', 'Mobile', 22000, 19, 'Oppo'),
(19, 'Vivo V27', 'Mobile', 28000, 17, 'Vivo'),
(20, 'Noise Watch', 'Accessories', 5000, 40, 'Noise');


select *
from products;

--  GROUP BY (Basic → Intermediate)
-- 1. Find total number of products in each category

select category , count(product_name)
from products
group by category;

 
-- 2. Find total stock available for each category

select category, sum(stock) as total_stocks
from products
group by category;

-- 3. Find average price of products in each brand

select brand, round(avg(price),2) as avg_of_products
from products
group by brand
order by brand asc;


-- 4. Count how many products each brand has

select brand ,count(*) as products
from products
group by brand;

-- 5. Find maximum price in each category

select category, max(price) as max_price_in_Category
from products
group by category;

-- GROUP BY + ORDER BY
-- 6. Find total stock per brand and sort it in descending order

select brand,sum(stock) as total_stocks
from products
group by brand
order by total_stocks desc; 


-- 7. Find average price per category and display highest first

select avg(price) as avg_price, category
from products
group by category
order by avg_price desc;

-- 8. Count products per category and sort by count (low to high)

select count(*) as products, category
from products
group by category
order by category asc;

 -- HAVING (Filtering Groups)
-- 9. Show categories having more than 3 products

select * from products;
select category,count(product_name)
from products
group by  category
having count(*) >3;

-- 10. Show brands where total stock is greater than 40

select brand,sum(stock)as total_stocks
from products
group by brand
having total_stocks >40;

-- 11. Find categories where average price is less than 30,000

select category, round(avg(price),2) as avg_price
from products
group by category
having avg(price) < 30000;

-- 12. Show brands having more than 2 products

select brand, count(*) as product
from products
group by brand
having count(*) >2;

-- 13. Find categories where maximum price is above 70,000

select category, max(price) as maximum_price
from products
group by category
having maximum_price >70000;


-- GROUP BY + HAVING + ORDER BY (Important)
-- 14. Find brands with total stock > 30 and sort by stock descending
select brand, sum(stock) as total_stocks
from products
group by brand
having sum(stock) >30
order by total_stocks desc;

-- 15. Show categories with avg price > 40,000 and sort highest first
select category, avg(price) as avg_price
from products
group by category
having avg(price) > 40000
order by avg_price desc;

-- 16. Count products per brand, show only brands with count ≥ 2, sort by count desc

select brand, count(*) as products_per_brand
from products
group by brand
having count(*) >=2
order by products_per_brand desc;

-- 🔹 LIMIT (Top Results)
-- 17. Get top 5 most expensive products

select product_name,price 
from products
order by price desc
limit 5;

-- 18. Get 3 cheapest products

select product_name, price
from products
order by price asc
limit 3;

-- 🔹 LIMIT + OFFSET (Pagination Concept)
-- offset means how many rows should i have to skipp so!!

-- 19. Skip first 5 highest priced products and get next 5

select product_name,price
from products
order by price desc
limit 5 offset 5;

-- 20. Get 4 products starting from the 3rd cheapest product

-- 1st cheapest → offset 0
-- 2nd cheapest → offset 1
-- 3rd cheapest → offset 2 ✅
select product_name, price
from products
order by price asc
limit 4 offset 2;