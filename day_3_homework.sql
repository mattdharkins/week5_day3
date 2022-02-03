-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT first_name, last_name, district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district LIKE 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
SELECT first_name, last_name, amount
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99


-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
SELECT customer.customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT payment.customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);


-- 4. List all customers that live in Nepal (use the city
-- table)
SELECT first_name, last_name, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';


-- 5. Which staff member had the most
-- transactions?
SELECT first_name, last_name, COUNT(payment_id) AS num_transactions
FROM payment
FULL JOIN staff
ON payment.staff_id = staff.staff_id
GROUP BY first_name, last_name
ORDER BY num_transactions DESC LIMIT 1;


-- 6. How many movies of each rating are
-- there?
SELECT rating, COUNT(film_id)AS num_movies
FROM film
GROUP BY rating
ORDER BY num_movies DESC


-- 7. Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT last_name, first_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM PAYMENT
	WHERE amount > 6.99
	GROUP BY customer_id
)
ORDER BY last_name


-- 8. How many free rentals did our stores give away?
SELECT COUNT(payment_id), amount
FROM payment
GROUP BY amount
ORDER BY amount LIMIT 1
