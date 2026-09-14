#How many customers do we have?
select count(customer_id) as Number_of_customers
from supermarket_sales.customers;

#How many products are in our database?

select count(product_id) as  number_of_products
from supermarket_sales.products;

#How many branches does KenyaMart have?
select count(branch_id) as Kenyamart_branches
from supermarket_sales.branches;

#Display all products and their price
select product_name,unit_price
from supermarket_sales.products;

#Display products that cost more than KSh 200.



select *
from customers