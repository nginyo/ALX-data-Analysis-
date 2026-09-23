## 1. WHERE & Filtering Basics
#1.1 List all customers from Kenya.

Select *
from
	kenya.customers;
    
#1.2 List all products priced above $50.

select *
from
	kenya.products
where
	unit_price>50;
    
#1.3 List all orders that are **not** `'Completed'`
select *
from
	kenya.orders
where 
	status != "Completed";
    
select *
from
	kenya.orders
where
	not status="Completed";
    
#1.4 Find all products with `stock_qty` between 50 and 150 (inclusive).
select *
from
	kenya.products
where
	stock_qty between 50 and 150;
    
#1.5 Find all customers whose `loyalty_tier` is `NULL` (not enrolled).
Select*
from
	kenya.customers
where
	 loyalty_tier is null;


#1.6 Find all orders placed in March 2023.
 
select 
	*
from 
	kenya.orders
where 
	order_date like "2023-03%";

select 
	*
from
	kenya.orders
where
	order_date>='2023-03-01'
and	
	order_date<='2023-03-31';
## 2. Logical Operators (AND / OR / NOT / IN / BETWEEN / LIKE)
#2.1 Find products in the `'Electronics'` category priced under $30.
select *
from
	kenya.products
where
	category="electronics"
and	
	unit_price<30;

#2.2 Find customers who are from `'Kenya'` **or** have a `'Gold'` loyalty tier.
select
	*
from
	kenya.customers
where
	country="Kenya"
or
	loyalty_tier='Gold';
    
#2.3 Find orders that are `'Cancelled'` **or** `'Returned'` using `IN`.
select 
	*
from 
	kenya.orders
where
	status in ("cancelled","returned");

#2.4 Find products whose name contains the word `"Desk"` (use `LIKE`).
select *
from
	kenya.products
where
	product_name like "%desk%";
#2.5 Find customers whose email does **not** end in `.com` — first check if any do, then instead write a query for customers whose email starts with a vowel (a, e, i, o, u).
select *
from 
	kenya.customers
where
	not email like "%com"
or
	lower(email) like "a%" 
or 
	lower(email) like "e%" 
or 
	lower(email) like "i%" 
or 
	lower(email) like "o%" 
or 
	lower(email) like "u%"; 

SELECT * FROM customers
WHERE LOWER(full_name) LIKE 'a%' OR LOWER(full_name) LIKE 'e%'
   OR LOWER(full_name) LIKE 'i%' OR LOWER(full_name) LIKE 'o%'
   OR LOWER(full_name) LIKE 'u%';
   
#2.6 Find employees who are in the `'IT'` department **and** earn more than $70,000, **or** who are in `'Sales'` **and** earn more than $90,000.
select *
from
	kenya.employees
where
	(department="IT" and salary>70000)
or 
	(department="Sales" and salary>90000);

## 3. Numeric Functions
#3.1 Show each product's price rounded to the nearest whole dollar.
select
	product_id,
	product_name,
    category,
    round(unit_price,0)as Round_price,
    stock_qty
from
	kenya.products;

#3.2 Show each order item's line total (`quantity * unit_price`).
select
	order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    quantity*unit_price as linetotal
from
	kenya.order_items;
  
 #3.3 For every product, compute the price after a 15% discount, rounded to 2 decimal places.
select
	product_id,
	product_name,
	category,
	unit_price,
	stock_qty,
	round(unit_price*0.85,2) as DiscountPrice
from
	kenya.products;

#3.4 Show the absolute difference between each product's `unit_price` and $50.
select
	product_id,
	product_name,
	category,
	unit_price,
	stock_qty,
    abs(unit_price-50)AS diff_from_50
from
	kenya.products;
    
#3.5 Using `order_items`, show quantity divided by 2 using integer division (`FLOOR`/`DIV`) versus normal division, side by side.
select
	order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    (quantity/2),
    (quantity/2.0)
from
	kenya.order_items;
    
SELECT order_item_id, quantity,
       quantity / 2 AS integer_division,      -- integer/integer truncates in most engines
       quantity / 2.0 AS true_division
FROM order_items;

#3.6 Compute the square root of each product's `unit_price` (just for practice with `SQRT`).
select
	product_id,
    product_name,
    category,
    unit_price,
    round(sqrt(unit_price),2)
from
	kenya.products;

## 4. Aggregation (GROUP BY, HAVING, aggregate functions)
#4.1 Count how many customers are in each country.
select
country,
count(customer_id)
from 
	kenya.customers
group by 
	country;

#4.2 Find the total revenue (`quantity * unit_price`) per order.
select
	sum(quantity*unit_price)as totalrevenue
from
	kenya.order_items;

#4.3 Find the average `unit_price` of products in each category.
select
	avg(unit_price)as avg_unit_price
from
	kenya.order_items;

#4.4 Find the total quantity sold per product.
select
	product_id,
    sum(quantity)as totalquantity
from
	kenya.order_items
group by	
	product_id
order by
	totalquantity asc;

#4.5 Find categories that have **more than 4** products (`HAVING`).
select
	category,
    count(*)as totalproducts
from
	kenya.products
group by
	category
having 
	count(*)>1;
    

SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category
HAVING COUNT(*) > 4;

select
    category,
    count(product_name)
from
	kenya.products
group by
	category
having
	count(product_name)>4;

#4.6 Find customers who have placed **more than 2** orders.
select	
	customer_id,
    count(order_id)
from
	kenya.orders
group by
	customer_id
having
	count(order_id)>2;
    
#4.7 Find the min, max, and average salary per department.
select
	department,
	min(salary),
    max(salary)
from
	kenya.employees
group by
	department;

#4.8 Find the total revenue generated per customer, counting only `'Completed'` orders.
select
    customers.full_name,
    sum(quantity*unit_price)as revenue
from 
	kenya.customers
join
	orders
on
	customers.customer_id = orders.customer_id
join
	order_items
on
	orders.order_id=order_items.order_id
where
	orders.status="Completed"
group by
	customers.full_name
order by
	revenue desc;

## 5. Top-N Queries
#5.1 Find the 5 most expensive products.
select
	product_name,
	unit_price
from
	kenya.products
order by
	unit_price desc
limit 5;

#5.2 Find the top 3 customers by number of orders placed.
select
	full_name,
    count(order_id)
from
	kenya.customers
join
	orders
on
	customers.customer_id=orders.customer_id
group by
	full_name
order by	
	count(order_id) desc
limit 3;

-- 5.2
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
ORDER BY order_count DESC
LIMIT 3;

