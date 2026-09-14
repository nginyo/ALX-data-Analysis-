#Rank all the orders of a specific customer from the most recent to the least recent using window functions. Assume that the customer ID is 'ALFKI'
select *
from northwind.orders;

select 
	customerID,
    OrderDate,
    row_number() over (partition by CustomerID
    order  by OrderDate asc)as recent_orders
from northwind.orders
where
	CustomerID="BOTTM";

SELECT 
    OrderID, 
    OrderDate,
    RANK() OVER (ORDER BY OrderDate DESC) AS Order_rank
FROM 
    Orders 
WHERE 
    CustomerID = 'ALFKI';


#Calculate a running total of the quantity of orders using window functions.
select
	OrderID,
    Quantity,
    sum(Quantity) over (partition by OrderID
    order by OrderID) as total_quantity
from 
	northwind.orderdetails;

SELECT 
    OrderID, 
    Quantity, 
    SUM(Quantity) OVER (ORDER BY OrderID) AS RunningTotal 
FROM 
    OrderDetails;

/*Use window functions to find the difference in successive order dates for each customer. 
Use the appropriate MySQL date-difference function to calculate the number of days between the current order date and the previous one.*/

select
	customerID,
	OrderID,
    OrderDate,
    lag(OrderDate,1) over(partition by CustomerID
    order by OrderDate)as prev_order_date,
    timestampdiff(
    day,
    lag(OrderDate,1) over(partition by CustomerID
    order by OrderDate),
    orderDate
    )as date_diff_prev_order_date
from
	northwind.orders;
    
select *
from northwind.orderdetails;

#Calculate the moving average of the quantity of the last 3 orders for each product using window functions.
select 
	orderid,	
	productid,
    Quantity,
    avg(quantity) over (partition by ProductID
    order by orderid
    rows between 2 preceding and current row)as avg_quantity
from
	northwind.orderdetails;

SELECT 
    OrderID, 
    ProductID, 
    Quantity,
    AVG(Quantity) OVER (
        PARTITION BY ProductID 
        ORDER BY OrderID 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingAvgQuantity
FROM 
    OrderDetails
ORDER BY 
    ProductID, 
    OrderID;