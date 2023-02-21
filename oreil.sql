show DATABASES;

use sakila;

select * from sakila.customer limit 10;

show Tables;

/*
Exercise 3.1
Retrieve the actor ID, first name, and last name for all actors. Sort by last name and then by first name.
*/


select actor_id, first_name, last_name
from actor
ORDER BY first_name, last_name;

/*
Exercise 3-2
Retrieve the actor ID, first name, and last name for all actors whose last name equals 'WILLIAMS' or 'DAVIS'.
*/

SELECT actor_id, first_name, last_name
FROM actor
where last_name = 'WILLIAMS' or last_name = 'DAVIS';


/* 
Exercise 3-3
Write a query against the rental table that returns the IDs of the customers who rented 
a film on July 5, 2005 (use the rental.rental_date column, and you can use the
date() function to ignore the time component). Include a single row for each distinct
customer ID. */


select DISTINCT customer_id, date_format(rental_date, '%Y-%M-%D') as rent_date
from rental
where date(rental_date) = '2005-07-05';


/* 

Fill in the blanks (denoted by <#>) for this multitable query to achieve the following
results:
SELECT c.email, r.return_date
FROM customer c
INNER JOIN rental <1>
ON c.customer_id = <2>
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY <3> <4>;

*/

SELECT c.email, r.return_date
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY r.return_date, c.email;


/*
Exercise 4-3
Construct a query that retrieves all rows from the payments table where the amount
is either 1.98, 7.98, or 9.98.
*/


SELECT * 
FROM  payment
where amount in (1.98,7.98,9.98);


/*
Construct a query that finds all customers whose last name contains an A in the sec‐
ond position and a W anywhere after the A.
*/

select first_name, last_name
from customer
where last_name like '%_aw%';


/*
Write a query that returns the title of every film in which an actor with the first name
JOHN appeared.
*/

select f.title
from film f
where film_id in
 (select fa.film_id 
 from film_actor fa
 join actor a on fa.actor_id = a.actor_id
 where a.first_name = 'JOHN');

/*
Exercise 6-2
Write a compound query that finds the first and last names of all actors and custom‐
ers whose last name starts with L.
*/

select first_name, last_name
from actor
where last_name like 'L%'
UNION
select first_name, last_name
from customer
where last_name like 'L%';


/*
Exercise 6-3
Sort the results from Exercise 6-2 by the last_name column.
*/

select first_name, last_name
from actor
where last_name like 'L%'
UNION
select first_name, last_name
from customer
where last_name like 'L%'
order by last_name;


/*
Exercise 7-1
Write a query that returns the 17th through 25th characters of the string 'Please
find the substring in this string'.

*/

select SUBSTRING('please find the substring in this string', 17,25) as extracted_string;


/*
Exercise 7-2
Write a query that returns the absolute value and sign (−1, 0, or 1) of the number
−25.76823. Also return the number rounded to the nearest hundredth.
*/

select abs(- 25.76823) as outputs
union
select sign(- 25.76823)
union
select round(- 25.76823, -2);

/*
Exercise 7-3
Write a query to return just the month portion of the current date.
*/

select date_format(CURRENT_DATE, '%M') as current_month;


/*
Exercise 8-1
Construct a query that counts the number of rows in the payment table.
*/

select count(payment_id) as diff_payment
from payment;


/*
Exercise 8-2
Modify your query from Exercise 8-1 to count the number of payments made by each
customer. Show the customer ID and the total amount paid for each customer.
*/

select concat(c.first_name, ' ', c.last_name) as `full name`,p.customer_id, 
count(p.payment_id) as `no of payments`, sum(p.amount) as `sum of payment`
from payment p
join customer c on p.customer_id = c.customer_id
GROUP BY p.customer_id;

/*
Exercise 8-3
Modify your query from Exercise 8-2 to include only those customers who have
made at least 40 payments.
*/

select concat(c.first_name, ' ', c.last_name) as `full name`,p.customer_id, 
count(p.payment_id) as `no of payments`, sum(p.amount) as `sum of payment`
from payment p
join customer c on p.customer_id = c.customer_id
GROUP BY p.customer_id
having `no of payments` > 40;


/*
Exercise 9.1
Construct a query against the film table that uses a filter condition with a 
noncorrelated subquery against the category table to find all action films (category.name ='Action').
*/



select f.film_id, f.title, f.rental_rate, f.rental_duration,c.name,fc.category_id
from sakila.film f
join sakila.film_category fc on f.film_id = fc.film_id
join sakila.category c on fc.category_id = c.category_id
where c.name = (SELECT category.name FROM category where category.name = 'Action')


/*
Exercise 9-2
Rework the query from Exercise 9-1 using a correlated subquery against the category
and film_category tables to achieve the same results.
*/








/*
Exercise 9-3
Join the following query to a subquery against the film_actor table to show the level
of each actor:
SELECT 'Hollywood Star' level, 30 min_roles, 99999 max_roles
UNION ALL
SELECT 'Prolific Actor' level, 20 min_roles, 29 max_roles
UNION ALL
SELECT 'Newcomer' level, 1 min_roles, 19 max_roles
*/

/*
Exercise 10-1
Using the following table definitions and data, write a query that returns each cus‐
tomer name along with their total payments:
 Customer:
Customer_id Name
----------- ---------------
1 John Smith
2 Kathy Jones
3 Greg Oliver
 Payment:
Payment_id Customer_id Amount
---------- ----------- --------
101 1 8.99
102 3 4.99
103 1 7.99
Include all customers, even if no payment records exist for that customer

*/
-- since the question is not very clear, the query above returns total payments ever made by each cust.

select c.Name, sum(p.amount) as `total payments`
from Customer c
join Payment p on c.Customer_id = p.Customer_id
GROUP BY c.Name

-- the query below just joins customer name and their payments whether or not they've ever made payment

select c.Name, sum(p.amount) as `total payments`
from Customer c
right join Payment p on c.Customer_id = p.Customer_id
GROUP BY c.Name


/*
Exercise 10-2
Reformulate your query from Exercise 10-1 to use the other outer join type (e.g., if
you used a left outer join in Exercise 10-1, use a right outer join this time) such that
the results are identical to Exercise 10-1.

*/

select sum(p.amount) as `total payments`, c.Name
from payment p
left join Customer c on c.Customer_id = p.Customer_id
GROUP BY c.Name


/*



*/

/*
*/

/*
*/

/*
*/

/*
*/

/*
*/