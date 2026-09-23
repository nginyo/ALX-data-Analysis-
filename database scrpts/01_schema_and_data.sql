-- =====================================================================
-- SQL PRACTICE PROJECT: "BrightCart" Mini E-Commerce Database
-- =====================================================================
-- Standard ANSI SQL, tested for PostgreSQL / MySQL 8+ syntax.
-- A few functions differ by dialect (noted with -- MySQL: / -- Postgres:
-- comments in the questions file where it matters).
--
-- Run this whole file first in your SQL client (DB Fiddle, SQLite
-- Online, pgAdmin, MySQL Workbench, DBeaver, etc.) to build the schema
-- and load the data. Then work through 02_questions.md topic by topic.
-- =====================================================================
drop database if exists kenya;
create database if not exists Kenya;
use kenya;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;

-- ---------------------------------------------------------------------
-- CUSTOMERS
-- ---------------------------------------------------------------------
CREATE TABLE customers (
    customer_id   INT PRIMARY KEY,
    full_name     VARCHAR(100),
    email         VARCHAR(100),
    country       VARCHAR(50),
    signup_date   DATE,
    loyalty_tier  VARCHAR(20)   -- 'Bronze', 'Silver', 'Gold', NULL = not enrolled
);

INSERT INTO customers (customer_id, full_name, email, country, signup_date, loyalty_tier) VALUES
(1,  'Amara Okafor',        'amara.okafor@mail.com',   'Kenya',    '2022-01-15', 'Gold'),
(2,  'Brian Mutiso',        'b.mutiso@mail.com',       'Kenya',    '2022-03-02', 'Silver'),
(3,  'Chloe Dubois',        'chloe.d@mail.com',        'France',   '2021-11-20', 'Gold'),
(4,  'David Kim',           'david.kim@mail.com',      'S.Korea',  '2023-02-10', NULL),
(5,  'Elena Petrova',       'elena.p@mail.com',        'Russia',   '2022-07-19', 'Bronze'),
(6,  'Farid Haidari',       'farid.h@mail.com',        'Iran',     '2023-05-30', 'Silver'),
(7,  'Grace Wanjiru',       'grace.w@mail.com',        'Kenya',    '2021-09-05', 'Gold'),
(8,  'Hassan Ali',          'hassan.ali@mail.com',     'Somalia',  '2023-08-14', NULL),
(9,  'Isabella Rossi',      'isabella.r@mail.com',     'Italy',    '2022-12-01', 'Bronze'),
(10, 'James Otieno',        'james.o@mail.com',        'Kenya',    '2023-01-22', 'Silver'),
(11, 'Karin Larsen',        'karin.l@mail.com',        'Norway',   '2021-06-11', 'Gold'),
(12, 'Liu Wei',              'liu.wei@mail.com',       'China',    '2022-04-27', NULL),
(13, 'Maria Santos',        'maria.s@mail.com',        'Brazil',   '2023-03-18', 'Bronze'),
(14, 'Noah Schmidt',        'noah.s@mail.com',         'Germany',  '2022-10-09', 'Silver'),
(15, 'Ochieng Odhiambo',    'ochieng.o@mail.com',      'Kenya',    '2023-06-25', 'Gold');

-- ---------------------------------------------------------------------
-- PRODUCTS
-- ---------------------------------------------------------------------
CREATE TABLE products (
    product_id    INT PRIMARY KEY,
    product_name  VARCHAR(100),
    category      VARCHAR(50),
    unit_price    DECIMAL(10,2),
    stock_qty     INT
);

INSERT INTO products (product_id, product_name, category, unit_price, stock_qty) VALUES
(101, 'Wireless Mouse',        'Electronics', 19.99,  150),
(102, 'Mechanical Keyboard',   'Electronics', 59.99,   80),
(103, 'USB-C Hub',             'Electronics', 24.50,  120),
(104, '27-inch Monitor',       'Electronics', 219.00,  40),
(105, 'Noise Cancelling Headphones', 'Electronics', 129.99, 60),
(106, 'Office Chair',          'Furniture',   149.00,  35),
(107, 'Standing Desk',         'Furniture',   349.00,  20),
(108, 'Desk Lamp',             'Furniture',   22.75,  100),
(109, 'Bookshelf',             'Furniture',   89.00,   25),
(110, 'Notebook Set',          'Stationery',   6.99,  300),
(111, 'Gel Pens (12-pack)',    'Stationery',   4.50,  400),
(112, 'Sticky Notes',          'Stationery',   2.25,  500),
(113, 'Water Bottle',          'Lifestyle',   14.00,  200),
(114, 'Yoga Mat',              'Lifestyle',   28.00,   90),
(115, 'Backpack',              'Lifestyle',   45.99,   70);

-- ---------------------------------------------------------------------
-- ORDERS
-- ---------------------------------------------------------------------
CREATE TABLE orders (
    order_id      INT PRIMARY KEY,
    customer_id   INT,
    order_date    DATE,
    status        VARCHAR(20),  -- 'Completed', 'Cancelled', 'Pending', 'Returned'
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(1001, 1,  '2023-01-05', 'Completed'),
(1002, 2,  '2023-01-08', 'Completed'),
(1003, 1,  '2023-01-20', 'Cancelled'),
(1004, 3,  '2023-02-02', 'Completed'),
(1005, 4,  '2023-02-14', 'Completed'),
(1006, 5,  '2023-02-15', 'Returned'),
(1007, 7,  '2023-03-01', 'Completed'),
(1008, 6,  '2023-03-03', 'Pending'),
(1009, 8,  '2023-03-10', 'Completed'),
(1010, 1,  '2023-03-15', 'Completed'),
(1011, 9,  '2023-03-22', 'Completed'),
(1012, 10, '2023-04-02', 'Completed'),
(1013, 11, '2023-04-05', 'Completed'),
(1014, 2,  '2023-04-11', 'Cancelled'),
(1015, 12, '2023-04-18', 'Completed'),
(1016, 13, '2023-05-01', 'Completed'),
(1017, 7,  '2023-05-06', 'Completed'),
(1018, 14, '2023-05-09', 'Pending'),
(1019, 3,  '2023-05-20', 'Completed'),
(1020, 15, '2023-06-01', 'Completed'),
(1021, 1,  '2023-06-04', 'Completed'),
(1022, 5,  '2023-06-10', 'Completed'),
(1023, 10, '2023-06-15', 'Returned'),
(1024, 11, '2023-06-21', 'Completed'),
(1025, 9,  '2023-07-02', 'Completed'),
(1026, 7,  '2023-07-08', 'Completed'),
(1027, 6,  '2023-07-15', 'Completed'),
(1028, 4,  '2023-07-19', 'Cancelled'),
(1029, 15, '2023-07-25', 'Completed'),
(1030, 12, '2023-08-01', 'Completed');

-- ---------------------------------------------------------------------
-- ORDER ITEMS (line items per order — quantity & price at time of sale)
-- ---------------------------------------------------------------------
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id      INT,
    product_id    INT,
    quantity      INT,
    unit_price    DECIMAL(10,2),  -- price charged (may differ from current product price)
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1,  1001, 101, 2,  19.99),
(2,  1001, 103, 1,  24.50),
(3,  1002, 105, 1, 129.99),
(4,  1003, 106, 1, 149.00),
(5,  1004, 102, 1,  59.99),
(6,  1004, 110, 3,   6.99),
(7,  1005, 104, 1, 219.00),
(8,  1006, 113, 2,  14.00),
(9,  1007, 107, 1, 349.00),
(10, 1007, 108, 2,  22.75),
(11, 1008, 111, 5,   4.50),
(12, 1009, 101, 1,  19.99),
(13, 1009, 115, 1,  45.99),
(14, 1010, 105, 1, 129.99),
(15, 1010, 103, 2,  24.50),
(16, 1011, 114, 2,  28.00),
(17, 1012, 109, 1,  89.00),
(18, 1012, 112, 4,   2.25),
(19, 1013, 104, 1, 219.00),
(20, 1013, 106, 1, 149.00),
(21, 1014, 101, 3,  19.99),
(22, 1015, 110, 5,   6.99),
(23, 1016, 102, 1,  59.99),
(24, 1017, 107, 1, 349.00),
(25, 1017, 108, 1,  22.75),
(26, 1018, 111, 2,   4.50),
(27, 1019, 105, 1, 129.99),
(28, 1020, 115, 2,  45.99),
(29, 1020, 113, 1,  14.00),
(30, 1021, 101, 1,  19.99),
(31, 1021, 102, 1,  59.99),
(32, 1022, 114, 1,  28.00),
(33, 1023, 109, 1,  89.00),
(34, 1024, 104, 2, 219.00),
(35, 1025, 110, 2,   6.99),
(36, 1025, 111, 3,   4.50),
(37, 1026, 107, 1, 349.00),
(38, 1027, 106, 1, 149.00),
(39, 1028, 103, 1,  24.50),
(40, 1029, 101, 4,  19.99),
(41, 1029, 108, 2,  22.75),
(42, 1030, 105, 1, 129.99),
(43, 1030, 115, 1,  45.99);

-- ---------------------------------------------------------------------
-- EMPLOYEES (self-referencing table — good for JOINs / hierarchy work)
-- ---------------------------------------------------------------------
CREATE TABLE employees (
    employee_id   INT PRIMARY KEY,
    full_name     VARCHAR(100),
    department    VARCHAR(50),
    salary        DECIMAL(10,2),
    hire_date     DATE,
    manager_id    INT   -- references employee_id, NULL for top of hierarchy
);

INSERT INTO employees (employee_id, full_name, department, salary, hire_date, manager_id) VALUES
(1, 'Peter Kariuki',   'Sales',      95000, '2018-03-01', NULL),
(2, 'Susan Achieng',   'Sales',      62000, '2019-06-15', 1),
(3, 'Tom Njoroge',     'Sales',      58000, '2020-01-10', 1),
(4, 'Uma Devi',        'Marketing',  71000, '2019-02-20', NULL),
(5, 'Victor Owuor',    'Marketing',  54000, '2021-04-05', 4),
(6, 'Wanjiku Kamau',   'IT',         88000, '2017-11-11', NULL),
(7, 'Xavier Mwangi',   'IT',         67000, '2020-09-01', 6),
(8, 'Yara Ibrahim',    'IT',         72000, '2019-08-19', 6),
(9, 'Zainab Yusuf',    'HR',         60000, '2018-07-23', NULL),
(10,'Alex Cho',        'HR',         49000, '2022-01-30', 9),
(11,'Beatrice Mwende', 'Sales',      63500, '2021-10-02', 1),
(12,'Collins Barasa',  'IT',         77000, '2018-05-14', 6);
