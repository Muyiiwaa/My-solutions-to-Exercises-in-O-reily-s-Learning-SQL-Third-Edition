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
21. Create a report that shows the City, CompanyName, ContactName of customers from 
cities that has letter L in the name
sorted by ContactName.*/

select city, CompanyName, contactname
from customers
where city like '%L%';

/*
22. 
Create a report that shows the FirstName,
 LastName, BirthDate of employees born in the 1950s.*/

select firstname, lastname,Birthdate
from employees
where date_format(BirthDate, '%Y') = '1950';

 /*
23. Create a report that shows the FirstName, LastName, 
the year of Birthdate as birth year from the employees table.*/

select firstname, lastname, date_format(BirthDate, '%y') as `Birth Year`
from employees;

/*
24. Create a report showing OrderID, total number of Order ID as 
NumberofOrders from the orderdetails table grouped by*/

select orderid, count(orderid) as `Number of orders`
from orders
GROUP BY orderid;

/*
OrderID and sorted by NumberofOrders in descending order. 
HINT: you will need to use a Groupby statement.*/

select orderid, count(orderid) as `Number of orders`
from orders
GROUP BY orderid
order by `Number of orders` desc;

/*
25. Create a report that shows the SupplierID, ProductName, 
CompanyName from all product Supplied by Exotic Liquids,
Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID*/

select p.SupplierID, p.productname, s.CompanyName
from suppliers s
join products p on s.SupplierID = p.SupplierID
where s.CompanyName in ('Exotic Liquids', 'Specialty Biscuits, Ltd.','Escargots Nouveaux')
order by SupplierID;


/*
26. Create a report that shows the ShipPostalCode, OrderID, OrderDate, 
RequiredDate, ShippedDate, ShipAddress of all orders
with ShipPostalCode beginning with "98124".*/


select ShipPostalCode, orderid, OrderDate, RequiredDate, ShippedDate, ShipAddress
from orders
where ShipPostalCode like '98124%';


/*
27. Create a report that shows the ContactName, ContactTitle, 
CompanyName of customers that the has no "Sales" in their
ContactTitle.*/

select contactname, ContactTitle, CompanyName
from customers
where not ContactTitle like '%sales%';

/*
28. Create a report that shows the LastName, FirstName, City of 
employees in cities other than "Seattle";*/

select lastname, firstname, city
from employees
where not city = 'Seattle'; 

/*
29. Create a report that shows the CompanyName, ContactTitle, 
City, Country of all customers in any city in Mexico or other
cities in Spain other than Madrid.*/

select ContactTitle, CompanyName, city, country
from customers
where (not city = 'madrid' and country = 'spain') or (country = 'mexico' ); 

/*
30. Create a select statement that outputs the following:*/

select concat(firstname,' ', lastname,' ', 'can be reached at x', ' ',postalcode) as contactinfo
from employees;

/*
31. Create a report that shows the ContactName of all customers that do not have letter 
A as the second alphabet in their
Contactname.*/

select contactname
from customers
where not ContactName like '_a%';

/*
32. Create a report that shows the average UnitPrice rounded to the next whole number, 
total price of UnitsInStock and
maximum number of orders from the products table. 
All saved as AveragePrice, TotalStock and MaxOrder respectively.*/

select round(AVG(UnitPrice), -1) as `Average Price`, sum(UnitsInStock) as `Total Stock`, Max(QuantityPerUnit) as  Max_order
from products;

--this particular question is a little unclear

/*
33. Create a report that shows the SupplierID, CompanyName, CategoryName,
 ProductName and UnitPrice from the products,
suppliers and categories table.*/

select s.supplierid, s.CompanyName, c.categoryname, p.productname, p.unitprice
from products p
join categories c on p.categoryid = c.categoryid
join suppliers s on s.supplierid = p.supplierid;

/*
34. Create a report that shows the CustomerID, sum of Freight, 
from the orders table with sum of freight greater $200, grouped
by CustomerID. HINT: you will need to use a Groupby and a Having statement.*/

select customerid, sum(freight) as `sum of freight`
from orders
group by customerid
having `sum of freight` > 200;


/*
35. Create a report that shows the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and
customers table with discount given on every purchase.*/

/*
36. Create a report that shows the EmployeeID, the LastName and FirstName as employee, 
and the LastName and FirstName of
who they report to as manager from the employees table sorted by Employee ID. HINT: This is a SelfJoin.*/

/*
37. Create a report that shows the average, minimum and maximum UnitPrice
 of all products as AveragePrice, MinimumPrice
and MaximumPrice respectively.*/

/*
38. Create a view named CustomerInfo that shows the CustomerID, CompanyName, 
ContactName, ContactTitle, Address, City,
Country, Phone, OrderDate, RequiredDate, ShippedDate 
from the customers and orders table. HINT: Create a View.*/

/*
39. Change the name of the view you created from customerinfo to customer details.*/

/*
40. Create a view named ProductDetails that shows the ProductID, CompanyName, 
ProductName, CategoryName, Description,
QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, 
Discontinued from the supplier, products and
categories tables. HINT: Create a View*/

/*
41. Drop the customer details view.*/

/*
42. Create a report that fetch the first 5 character of categoryName from the category tables
 and renamed as ShortInfo*/

 /*
43. Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table HINT: Create
a Table, use the LIKE Statement and INSERT INTO statement. */