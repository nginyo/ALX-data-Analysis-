# SQL Practice Project — BrightCart

Work through these in order. Each section starts easy and ramps up.
Load `01_schema_and_data.sql` first. Check yourself against
`03_solutions.sql` only after you've attempted each question.

**Tables:** `customers`, `products`, `orders`, `order_items`, `employees`

---

## 1. WHERE & Filtering Basics

1.1 List all customers from Kenya.

1.2 List all products priced above $50.

1.3 List all orders that are **not** `'Completed'`.

1.4 Find all products with `stock_qty` between 50 and 150 (inclusive).

1.5 Find all customers whose `loyalty_tier` is `NULL` (not enrolled).

1.6 Find all orders placed in March 2023.

---

## 2. Logical Operators (AND / OR / NOT / IN / BETWEEN / LIKE)

2.1 Find products in the `'Electronics'` category priced under $30.

2.2 Find customers who are from `'Kenya'` **or** have a `'Gold'` loyalty tier.

2.3 Find orders that are `'Cancelled'` **or** `'Returned'` using `IN`.

2.4 Find products whose name contains the word `"Desk"` (use `LIKE`).

2.5 Find customers whose email does **not** end in `.com` — first check if any do, then instead write a query for customers whose email starts with a vowel (a, e, i, o, u).

2.6 Find employees who are in the `'IT'` department **and** earn more than $70,000, **or** who are in `'Sales'` **and** earn more than $90,000.

---

## 3. Numeric Functions

3.1 Show each product's price rounded to the nearest whole dollar.

3.2 Show each order item's line total (`quantity * unit_price`).

3.3 For every product, compute the price after a 15% discount, rounded to 2 decimal places.

3.4 Show the absolute difference between each product's `unit_price` and $50.

3.5 Using `order_items`, show quantity divided by 2 using integer division (`FLOOR`/`DIV`) versus normal division, side by side.

3.6 Compute the square root of each product's `unit_price` (just for practice with `SQRT`).

---

## 4. Aggregation (GROUP BY, HAVING, aggregate functions)

4.1 Count how many customers are in each country.

4.2 Find the total revenue (`quantity * unit_price`) per order.

4.3 Find the average `unit_price` of products in each category.

4.4 Find the total quantity sold per product.

4.5 Find categories that have **more than 4** products (`HAVING`).

4.6 Find customers who have placed **more than 2** orders.

4.7 Find the min, max, and average salary per department.

4.8 Find the total revenue generated per customer, counting only `'Completed'` orders.

---

## 5. Top-N Queries

5.1 Find the 5 most expensive products.

5.2 Find the top 3 customers by number of orders placed.

5.3 Find the top 3 best-selling products by total quantity sold.

5.4 Find the single most recent order for each customer (1 row per customer) — try this two ways: with a correlated subquery, and (after Section 7) with a window function.

5.5 Find the 2nd highest salary in the `employees` table without using `LIMIT`/`OFFSET` tricks alone — think about `DISTINCT` + subquery.

5.6 Find the top-selling product **per category** (highest total quantity sold within each category).

---

## 6. String Functions

6.1 Show each customer's name in all uppercase.

6.2 Show each customer's email domain (the part after `@`).

6.3 Concatenate each customer's name and country into one string like `"Amara Okafor (Kenya)"`.

6.4 Find the length (number of characters) of each product name.

6.5 Show each employee's first name only (the text before the first space in `full_name`).

6.6 Replace all spaces in product names with underscores.

6.7 Find products whose name starts with a vowel and has more than 10 characters.

6.8 Trim and standardize: pretend `full_name` might have extra leading/trailing spaces — write a query that trims and title-cases customer names defensively (use `TRIM`, and `UPPER`/`LOWER`/`INITCAP` depending on your dialect).

---

## 7. Window Functions

7.1 For each order item, show a running total of revenue **within its order**, ordered by `order_item_id`.

7.2 Rank customers by total spend (completed orders only) using `RANK()`.

7.3 For each product, show its price alongside the average price of its category, using `AVG() OVER (PARTITION BY ...)`.

7.4 For each customer's orders, use `LAG()` to show the date of their previous order next to the current one.

7.5 Use `ROW_NUMBER()` to find each customer's **most recent** order (1 row per customer) — compare this result to your answer in 5.4.

7.6 For each employee, show their salary and the difference between their salary and their department's average salary.

7.7 Use `NTILE(4)` to split products into 4 price-based buckets (quartiles).

---

## 8. Date Functions

8.1 Show each order's `order_date` and the day of the week it fell on.

8.2 Find all orders placed in the last (most recent) 90 days of data — i.e., within 90 days of the maximum `order_date` in the table.

8.3 Calculate how many days each customer has been signed up, relative to today's date.

8.4 Group orders by month and count how many orders happened each month.

8.5 Find employees who have been with the company for more than 5 years (relative to today's date), using `hire_date`.

8.6 For each customer, calculate the number of days between their `signup_date` and their first order date.

---

## 9. Control Flow Functions (CASE WHEN, COALESCE, NULLIF, IF/IFNULL)

9.1 Label each product as `'Budget'` (<$20), `'Mid-range'` ($20–$100), or `'Premium'` (>$100) using `CASE`.

9.2 Replace `NULL` loyalty tiers with the text `'Not Enrolled'` using `COALESCE`.

9.3 Label each order as `'Recent'` if placed after `2023-05-01`, otherwise `'Older'`.

9.4 For each employee, show `'No Manager'` if `manager_id` is `NULL`, otherwise show the manager's name (requires a self-join + `CASE`/`COALESCE`).

9.5 Create a pivoted summary: one row per category, with separate columns showing the count of `'Budget'`, `'Mid-range'`, and `'Premium'` products (conditional aggregation using `CASE` inside `SUM`/`COUNT`).

9.6 Flag orders as `'High Value'` if their total exceeds $200, `'Medium'` if between $50–$200, else `'Low'` — combine this with a `GROUP BY` to count how many orders fall in each bucket.

---

## 10. Mixed / Miscellaneous Challenge (combine everything)

10.1 For each country, find total completed revenue, and rank countries from highest to lowest revenue.

10.2 Find each customer's favorite (most-purchased-by-quantity) product category.

10.3 Find the month-over-month growth in total revenue (use a window function with `LAG` on monthly aggregated revenue).

10.4 Identify customers who have **never** placed a `'Completed'` order (some placed orders that were all cancelled/returned/pending, or placed none at all).

10.5 Build a report: for each employee who manages others, show their name, department, number of direct reports, and the average salary of their direct reports.

10.6 Find the product with the highest revenue in each month of 2023.

---

### How to use this project
- Try each question cold before peeking at solutions.
- If stuck, re-read the relevant section header — it tells you which concept to reach for.
- Once comfortable, try rewriting a few solutions a different way (e.g., subquery vs. window function) to build flexibility.
