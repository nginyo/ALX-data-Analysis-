#Task 1: Customer Region Categorization
#The marketing team wants to categorize customers into three regions: 'Domestic' for customers in the USA, 'Americas' for customers in Canada and Mexico, 
#and 'International' for all other countries.
#Query: Use a CASE statement to create a new column, CustomerRegion, based on the Country field.

SELECT 
    country,
    city,
    CASE
        WHEN country IN ('USA') THEN 'Domestic'
        WHEN country IN ('Canada' , 'Mexico') THEN 'Americas'
        ELSE 'International'
    END 'region categorisation'
FROM
    northwind.customers;
    
    
#Task 2: Fax Customer Identification
#The sales team wants to identify which customers have a fax machine so that they can send them a special promotion. 
#A customer is considered to have a fax machine if their Fax number is not NULL. Otherwise, they are a 'Standard' customer.
#Query: Use an IF statement to create a new column, ContactStatus, based on whether the Fax column is NULL.

select 		
	customerid,
    fax,
    if (isnull(fax),"non_standard","standard")
from
	northwind.customers;

#Task 3: Order Urgency Flag
#Operations needs to quickly see which orders are urgent. An order is 'Urgent' if the ShippedDate is greater than the RequiredDate. Otherwise, it is 'On-Time'.
#Query: Use a CASE statement to create a new column, UrgencyFlag, comparing the ShippedDate and RequiredDate.
select
	customerid,shippeddate,requireddate,
	case
		when (date(shippeddate)>date(requireddate))
			then "Urgent"
        else
			"On-Time"
		end as "UrgencyFlag"
from
	northwind.orders;

select
	customerid,
    requireddate,
    shippeddate,
	if (date(shippeddate)>date(requireddate), "Urgent","On-Time")as Urgency_flag
from 
	northwind.orders;

#Task 4: Customer Count by Region
#The marketing team wants a summary of customer counts for each region you defined in Task 1.
#Query: Use the CASE statement within a GROUP BY query to count customers for each region.

select
	case
		when country in("Usa") then "Domestic"
        when country in("Mexico","Canada") then "Americas"
        else "International"
        end as "region_categorisation",
        count(country)
from
	northwind.customers
group by
	case
		when country in("Usa") then "Domestic"
        when country in("Mexico","Canada") then "Americas"
        else "International"
	end;
    
#Task 5: Orders Shipped with Express Freight
#The logistics manager wants to know how many orders were shipped using express freight. An order is considered 'Express' if its Freight cost is greater than $100.
#Query: Use an IF statement inside an aggregate function to count only the orders with a Freight cost over $100.

select
	 sum(if((freight)>100,1,0))
from
	northwind.orders;

    
SELECT 
    SUM(IF(freight > 100, 1, 0)) AS ExpressOrderCount
FROM northwind.orders;

#Task 6: High-Value Order Count by Year
#The finance department wants to see how many orders had freight charges over $500 each year. 
#Write a query that uses a CASE expression inside a SUM to count orders where Freight > 500, grouped by the order year.
#Query: Use a CASE statement within a SUM aggregation and group the results by the year of the OrderDate.

SELECT
year(orderdate)as orderyear,
count(*) as totalorders,
	SUM(CASE
		WHEN
			FREIGHT>500 THEN 1
				ELSE 0
            END )as "Highvalueordercount"
FROM 
	NORTHWIND.ORDERS
group by
	year(orderdate)
order by
	year(orderdate);

#Task 7: Order Price Category
#The pricing team wants to classify entire orders based on the total number of items purchased. 
#To do this, you should calculate the total quantity for each order by summing all Quantity values across its line items in the OrderDetails table, 
#then assign a category according to the business rules. Orders with more than 50 total items should be labelled as 'Bulk', 
#those with between 10 and 50 items as 'Standard', and those with fewer than 10 items as 'Small'.
#Query: Use SUM(Quantity) grouped by OrderID together with a CASE statement to create a new column called OrderCategory.

