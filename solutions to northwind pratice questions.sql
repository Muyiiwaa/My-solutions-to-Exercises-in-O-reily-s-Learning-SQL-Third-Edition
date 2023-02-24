show DATABASES;

use northwind;


show Tables;

/*
1. Create a report that shows the CategoryName and Description from the categories 
table sorted by CategoryName.
*/

select c.categoryname, c.Description
from categories c
ORDER BY c.CategoryName;


/*
2. Create a report that shows the ContactName, CompanyName, 
ContactTitle and Phone number from the customers table
sorted by Phone.
*/

select contactname, CompanyName, ContactTitle, Phone
from customers
ORDER BY phone;


/*
 3. Create a report that shows the capitalized FirstName and capitalized 
 LastName renamed as FirstName and Lastname
respectively and HireDate from the employees table sorted from 
the newest to the oldest employee.

*/

select upper(lastname) as LASTNAME, upper(FirstName) as FIRSTNAME, HireDate
from employees
ORDER BY hiredate;

/*
4. Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, 
Freight from the orders table sorted
by Freight in descending order.

*/

select OrderID, OrderDate, ShippedDate, customerid, Freight
from orders
ORDER BY Freight desc
limit 10;

/*
5. Create a report that shows all the CustomerID in lowercase
 letter and renamed as ID from the customers table.*/

select lower(customerid) as id
from customers;

/*6. Create a report that shows the CompanyName, Fax, Phone, Country,
 HomePage from the suppliers table sorted by the
Country in descending order then by CompanyName in ascending order.*/

select CompanyName, fax, phone, country, HomePage
from suppliers
order by country desc, CompanyName;

/*
7. Create a report that shows CompanyName, ContactName of 
all customers from ‘Buenos Aires' only.*/

select CompanyName,contactname,city
from customers
where city = 'buenos aires';



/*
8. Create a report showing ProductName, UnitPrice, QuantityPerUnit of
 products that are out of stock.*/

 select  ProductName, UnitPrice, QuantityPerUnit, UnitsInStock
 from products
 where UnitsInStock = 0;


/*
9. Create a report showing all the ContactName, Address, 
City of all customers not from Germany, Mexico, Spain.*/

select contactname, Address, city,country
from customers
where country in ('germany','mexico','spain');


/*
10. Create a report showing OrderDate, ShippedDate, CustomerID, 
Freight of all orders placed on 21 May 1996.*/

select OrderDate, ShippedDate, customerid, freight
from orders
where date_format(OrderDate, '%y-%m-%d') =  '96-05-21';

/*
11. Create a report showing FirstName, LastName,
 Country from the employees not from United States.*/

select firstname, lastname, country
from employees
where not country = 'Usa';

 
/*
12. Create a report that shows the EmployeeID, OrderID,
 CustomerID, RequiredDate, ShippedDate from all orders shipped later
than the required date.*/


select EmployeeID, OrderID, customerid, RequiredDate, ShippedDate 
from orders
where datediff(RequiredDate, ShippedDate) < 0;


/*
13. Create a report that shows the City, CompanyName, ContactName of customers
 from cities starting with A or B. */

select city, CompanyName, contactname
from customers
where city like 'A%' or city like 'B%';


/*
14. Create a report showing all the even numbers of OrderID from the orders table.*/

select OrderID
from orders
where MOD(orderid, 2) = 0;


/*
15. Create a report that shows all the orders where the freight cost more than $500.*/

select orderid, freight
from orders
where  freight > 500; 


/*
16. Create a report that shows the ProductName, UnitsInStock, 
UnitsOnOrder, ReorderLevel of all products that are up for
reorder.*/

select productname, UnitsInStock, UnitsOnOrder,ReorderLevel
from products
where ReorderLevel = 0;


/*
17. Create a report that shows the CompanyName, 
ContactName number of all customer that have no fax number.*/

select CompanyName, contactname, phone, fax
from customers
where fax is null;

/*
18. Create a report that shows the FirstName, 
LastName of all employees that do not 
report to anybody.*/

select firstname, lastname, reportsto
from employees
where reportsto is null;

/*
19. Create a report showing all the odd numbers of OrderID from the orders table.
*/

select orderid
from orders
where mod(orderid, 2) > 0;


/*
20. Create a report that shows the CompanyName, ContactName, 
Fax of all customers that do not have Fax number and sorted
by ContactName.*/

select CompanyName, contactname, fax
from customers
where fax IS NULL
order by contactname;


/*
21. Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name
sorted by ContactName.*/



22. Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s.
23. Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table.
24. Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by
OrderID and sorted by NumberofOrders in descending order. HINT: you will need to use a Groupby statement.
25. Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids,
Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID
26. Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders
with ShipPostalCode beginning with "98124".
27. Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their
ContactTitle.
28. Create a report that shows the LastName, FirstName, City of employees in cities other "Seattle";
29. Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other
cities in Spain other than Madrid.
30. Create a select statement that outputs the following:
