USE sakila;

-- 1) show store id, city, country
SELECT store_id, city, country
FROM store s
JOIN address a
USING (address_id)
JOIN city ci
USING (city_id)
JOIN country co
USING (country_id);

-- 2) money earned per store
SELECT store_id, SUM(amount) AS Total_Amount_Earned 
FROM staff s 
JOIN payment p
USING (staff_id)
GROUP BY store_id;

-- 3) longest film categories
SELECT c.category_id, AVG(f.length)
FROM film f 
JOIN film_category c 
USING (film_id)
GROUP BY c.category_id
ORDER BY AVG(f.length) DESC;

-- 4) most frequently rented movies
SELECT film_id, title, rental_rate
FROM film
ORDER BY rental_rate DESC; -- ????

-- 5) top 5 categories in money earned
SELECT c.name, SUM(p.amount)
FROM category c
JOIN film_category fc USING (category_id)
JOIN inventory i USING (film_id)
JOIN staff s  USING (store_id)
JOIN payment p  USING (staff_id)
GROUP BY c.name
-- ORDER BY SUM(p.amount) DESC
LIMIT 5;

SELECT c.name, SUM(p.amount)
FROM payment p
JOIN staff s USING (staff_id)
JOIN inventory i USING (store_id)
JOIN film_category USING (film_id)
JOIN category c USING (category_id)
GROUP BY c.name
ORDER BY SUM(p.amount) DESC
LIMIT 5;

SELECT category.name, sum(payment.amount) as total_rev
FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
JOIN inventory ON inventory.inventory_id = rental.inventory_id
JOIN film_category ON film_category.film_id = inventory.film_id
JOIN category on category.category_id = film_category.category_id
group by category.name;

-- The first to tries dont work, because theyre stopping after 30secs, and i cant figure out why, the last one is from meysour, which works a treat...

-- 6) ACADEMY DINOSAUR available in store 1?
SELECT title, store_id
FROM film
JOIN inventory i 
USING (film_id)
WHERE title = 'ACADEMY DINOSAUR' AND store_id = '1';

-- 7) pairing of actors via self join
SELECT f1.actor_id AS 'Actor_1', f2.actor_id 'Actor_2', f1.film_id, a1.first_name AS Actor_1, a1.last_name AS Actor_1, a2.first_name AS Actor_2, a2.last_name AS Actor_2
FROM film_actor f1
JOIN film_actor f2
JOIN actor a1
ON a1.actor_id = f1.actor_id
JOIN actor a2
ON a2.actor_id = f2.actor_id
WHERE f1.actor_id > f2.actor_id and f1.film_id = f2.film_id;


