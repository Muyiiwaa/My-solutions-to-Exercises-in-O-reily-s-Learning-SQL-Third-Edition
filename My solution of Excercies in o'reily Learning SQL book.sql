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
Exercise 9.1
Construct a query against the film table that uses a filter condition with a 
noncorrelated subquery against the category table to find all action films (category.name ='Action').
*/


select f.film_id, f.title, f.rental_rate, f.rental_duration,c.name,fc.category_id
from sakila.film f
join sakila.film_category fc on f.film_id = fc.film_id
join sakila.category c on fc.category_id = c.category_id
where c.name = (SELECT category.name FROM category where category.name = 'Action')


SELECT * FROM category;