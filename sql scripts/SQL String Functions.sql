#Customer Email Clean-Up
/*The marketing team has noticed some customer email addresses have leading or trailing spaces. They want a report of all customers, 
showing their CustomerId and their Email address after removing any leading or trailing whitespace.
Query: Use a string function to remove leading and trailing spaces from the Email column.*/

SELECT 
	CustomerId,
    email,
    length(rtrim(ltrim(email)))as new_email
FROM	
	chinook.customer;

/*For a personalized email campaign, the marketing team wants a single column for the full name of each customer, formatted as "Lastname, Firstname". 
They also need this name column to be in all uppercase for consistency.
Query: Use string concatenation and case conversion functions to format the FirstName and LastName columns*/

select 
	firstname,
	lastname,
    upper(concat(firstname," ",lastname))as fullname
from
	chinook.customer;
    
/*Task 3: Employee Contact Details
The HR department wants a clean report of all employees. They need a single column that combines the FirstName, LastName, Title, and Phone number, 
formatted as "Firstname Lastname, Title: Phone".
Query: Use string concatenation to combine the employee details into a single column.*/

select
	firstname,
    lastname,
    title,
    phone,
    concat(
    firstname," ",lastname," ",title,":",phone)
from
	chinook.employee;

/*Task 4: Extracting Customer's City Code
The logistics team wants to analyze customer distribution. They need a report showing the CustomerId, FirstName, LastName, and a new column called CityCode. 
The CityCode should be the first three characters of the City column, in lowercase.
Query: Use a substring function and a case conversion function to extract and format the city code.*/
select
	customerid,
    firstname,
    lastname,
    city,
    upper(concat(customerid," ",firstname," ",lastname))as customer_details,
    upper(substring(city,1,4))as city_code
from
	chinook.customer;
    
select
	customerid,
    firstname,
    lastname,
    city,
    substring(city,1,4),
    left(city,4)
from
	chinook.customer;

select *
from chinook.CUSTOMER;

/*Task 5: Invoice Date Formatting
The accounting department needs a report of all invoices. They want the InvoiceDate to be formatted as a string in the YYYY-MM-DD format. 
The report should include the InvoiceId, CustomerId, and the new formatted date column.
Query: Use a date formatting function to convert the InvoiceDate into YYYY-MM-DD format.*/

select 
	InvoiceId,
    CustomerId,
    date(invoicedate)as Date,
    date_format(invoicedate,"%y-%m-%d")
from chinook.invoice;

/*Task 6: Calculating a 'Customer ID Hash'
For internal system checks, the IT department needs a unique, standardized identifier for each customer. 
Create a report with CustomerId and a new column called CustomerID_Hash. 
This hash should be a string created by concatenating the first two letters of the FirstName and the first two letters of the LastName, both in lowercase.
Query: Use substring and case conversion functions to extract the first two letters of the FirstName and LastName, convert them to lowercase, and concatenate them.*/

select
	customerid,
    lower(concat(substring(firstname,1,2),substring(lastname,1,2)))as customerid_Hash
from
	chinook.customer;
    
/*Task 7: Customer Data Type Conversion
The reporting tool used by management expects the InvoiceId to be a string. 
Create a query that shows the InvoiceId, but with its data type explicitly converted to CHAR (or VARCHAR) using CAST(). 
Also, include the CustomerId and Total for each invoice.
Query: Use the CAST() function to convert the InvoiceId to a character data type.*/

select
	customerid,
    total,
    cast(invoiceid as char(32)) as incoice_ID
from
	chinook.invoice;
     
/*Task 8: Customer Email Domain Check
The IT team wants to audit the email domains used by customers. Create a report that shows the FirstName, LastName, and a new column EmailDomain. 
The EmailDomain should be the portion of the email address that comes after the '@' symbol
Query: Use string functions to find the position of the @ symbol and extract the substring that follows it.*/

select 
	firstname,
    lastname,
    right(email,length(email)-position('@' in email))as EmailDomain
from
	chinook.customer;
    
SELECT 
	FirstName, 
	LastName, 
    SUBSTRING(Email, LOCATE('@', Email) + 1) AS EmailDomain 
FROM chinook.Customer;

/*Task 9: Customer Name Length
The marketing team is running a survey and wants to know the length of each customer's first name. 
Create a report showing the CustomerId, FirstName, and a new column called NameLength that shows the number of characters in their first name.
Query: Use a string length function to count the characters in the FirstName column.*/

select
	customerId,
	firstname,
    length(firstname)
from
	chinook.customer;
    
/*Task 10: Standardizing Employee Titles
HR wants a report to audit employee titles. They've noticed some titles are in mixed cases and want to see them all in lowercase. 
Create a report showing EmployeeId, LastName, and a new column Title_Lowercase with the title in all lowercase.
Query: Use a case conversion function to change the Title column to lowercase.*/

select
	employeeid,
    lastname,
    lower(title)as title_lowecase
from
	chinook.employee
    
