select
	name,
    city
from 
	foodhub.customers;

select 
	name,
    cuisine
from
	foodhub.restaurants;
    
select 
	upper(name)as customer_name,
    trim(lower(city))as city,
    concat(upper(name), " ",trim(lower(city)))as customerlabel
from
	foodhub.customers;

select 
	cuisine,
    substring(cuisine,1,5)
from
	foodhub.restaurants;
    
select
	order_id,
	order_date,
    year(order_date)as year,
    month(order_date)as month,
    day(order_date)as day,
    datediff(now(),order_date) as days_ago,
    date_add(order_date,interval 3 day)as est_delivery
from 
	foodhub.orders;
    
SELECT
    order_id,
    order_date,

    -- YEAR() extracts the year from the order date.
    YEAR(order_date) AS `Year`,

    -- MONTH() extracts the month from the order date.
    MONTH(order_date) AS `Month`,

    -- DAY() extracts the day of the month from the order date.
    DAY(order_date) AS `Day`,

    -- DATEDIFF() calculates the number of days between the order date and today.
    DATEDIFF(CURDATE(), order_date) AS `Days Ago`,

    -- DATE_ADD() adds 3 days to the order date to estimate delivery.
    DATE_ADD(order_date, INTERVAL 3 DAY) AS `Est. Delivery`

FROM orders
ORDER BY order_date ASC;


select 
	order_date,
    item_name,
    avg(price) over (partition by item_name)as item
from 
	foodhub.orders;
    
select*
from foodhub.orders;

select 
	order_id,
    order_date,
    item_name,
    lag(order_date) over (order by order_date)as previous_order,
    datediff(order_date,lag(order_date) over (order by order_date))as days
from
	foodhub.orders;
    
select
	(DATE_ADD("2024-01-10",INTERVAL 14 DAY)) 
from
	foodhub.orders
where
	ORDER_DATE(DATE_ADD("2024-01-10",INTERVAL 14 DAY))    