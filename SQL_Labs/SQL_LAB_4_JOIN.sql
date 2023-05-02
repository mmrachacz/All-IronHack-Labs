USE sakila;

-- 1) Number of films per category
SELECT c.category_id, COUNT(f.film_id) as 'Number of films'
FROM film f
JOIN film_category c 
USING (film_id)
GROUP BY c.category_id;

SELECT * FROM payment;

-- 2) Total Sale amount by each staff member in August 2005
SELECT first_name, last_name, SUM(amount) as Total_amount_rung_up
FROM staff s 
JOIN payment 
USING (staff_id)
WHERE payment_date LIKE '%2005-08%'
GROUP BY s.staff_id;

-- 3) Actor with most appearances
SELECT a.actor_id, a.first_name, a.last_name, COUNT(f.film_id) AS 'Total Films'
FROM film_actor f
JOIN actor a
USING (actor_id)
GROUP BY a.actor_id
ORDER BY COUNT(f.film_id) ASC;

-- 4) Customer with highest total rental count
SELECT last_name, COUNT(r.rental_id) AS 'Total count'
FROM customer c 
JOIN rental r 
USING (customer_id)
GROUP BY customer_id
ORDER BY COUNT(r.rental_id) DESC;

-- 5) first name, last name, address of staff members
SELECT first_name, last_name, address
FROM staff
JOIN address
USING (address_id);

-- 6) number of actors per each film
SELECT * 
FROM film f
JOIN film_actor a
USING (film_id);

-- 7) total paid by customer
SELECT SUM(amount), customer_id, first_name, last_name
FROM payment p
JOIN customer c
USING (customer_id)
GROUP BY customer_id
ORDER BY last_name ASC;

-- 8) Films per category
SELECT category_id AS category, COUNT(film_id) as Total_Number_of_films
FROM film f
JOIN film_category c 
USING (film_id)
GROUP BY (category_id);



