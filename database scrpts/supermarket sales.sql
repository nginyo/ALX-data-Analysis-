DROP DATABASE IF EXISTS supermarket_sales;

CREATE DATABASE IF NOT EXISTs supermarket_sales;

USE supermarket_sales;  -- ✅ ADDED: Select the database

DROP TABLE IF EXISTS customers;
CREATE TABLE customers
(
customer_id   INT ,
customer_name VARCHAR(32),
gender        VARCHAR(32),
city          VARCHAR(32),
signup_date   DATE
);
INSERT INTO customers(customer_id,customer_name,gender,city,signup_date)
values
(1,"John Mwangi","Male","Nairobi",'2025-01-15'),
(2,"Mary Wanjiku","Female","Nakuru",'2025-02-10'),
(3,"Peter Otieno","Male","Kisumu",'2025-03-05');


Drop Table if exists branches;
create table branches
(
branch_id int primary key,
branch_name varchar(32),
city varchar(32)
);
insert into branches(branch_id,branch_name,city)
values
(1,"CBD","Nairobi"),
(2,"Town","Nakuru"),
(3,"Central","Mombasa"),
(4,"Central","Kisumu");

Drop table if exists products;
create table products
(product_id int primary key,
product_name varchar(32),
category varchar(32),
unit_price decimal,
cost_price decimal);

insert into products(product_id,product_name,category,unit_price,cost_price)
values
(101,"Milk 1L","Dairy",120,85),
(102,"Bread","Bakery",80,50),
(103,"Rice 2KG","Grains",350,270),
(104,"Cooking Oil 1L","Cooking",280,220),
(105,"Sugar 2KG","Grains",320,250);


drop table if exists orders;
create table orders(
order_id int,
customer_id int,
branch_id int,
order_date date,
payment_method varchar(32)
);
insert into orders(order_id,customer_id,branch_id,order_date,payment_method)
values
(1001,1,1,'2026-01-05',"M-Pesa"),
(1002,2,2,'2026-01-06',"Cash"),
(1003,3,4,'2026-01-07',"Card");

drop table if exists order_items;
create table order_items

(order_item_id int primary key,
order_id int,
product_id int,
quantity int,
discount decimal);
insert into order_items(order_item_id,order_id,product_id,quantity,discount)
values
(1,1001,101,3,0),
(2,1001,102,2,0.05),
(3,1002,103,20,10),
(4,1003,104,1,0),
(5,1003,105,2,0.05)



