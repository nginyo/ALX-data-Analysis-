select category,
	avg(unit_price) 
from retailedge.products
group by category;

select *
from retailedge.products;

select category,name,
	avg(unit_price) over (partition by category) as product_category
from retailedge.products
order by name asc;

select name,unit_price,category,
			row_number() over (PARTITION by CATEGORY order by category) as rank_assign
from retailedge.products;

select name,unit_price,category,
			rank() over (order by category) as rank_assign
from retailedge.products;

select name,unit_price,category,
			dense_rank() over (order by category) as rank_assign
from retailedge.products;

select name,unit_price,category,
			ntile(5) over (order by category) as rank_assign
from retailedge.products;

SELECT COUNT(NAME)
FROM retailedge.products;

SELECT NAME,UNIT_PRICE,
	cast(unit_PRICE AS DECIMAL) AS UNIT_price
from retailedge.products;

select name,unit_price,
	convert(unit_price,decimal(2,2))
from retailedge.products

#Aggregation Using Window Functions

