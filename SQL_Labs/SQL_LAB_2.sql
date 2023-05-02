USE sakila;

-- 1) all actors called scarlett
SELECT * FROM sakila.actor
WHERE first_name = 'Scarlett';

-- 2) available for rent = all films they have, have been rented = have ever been rented out
SELECT COUNT(inventory_id) FROM inventory;
SELECT COUNT(DISTINCT(inventory_id)) FROM rental;

-- 3) movie lengths
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration FROM film;

-- 4) AVG length
SELECT TIME(AVG(length)) AS average_length FROM film; 

-- 5) Distinct actor last names (look at the rows)
SELECT DISTINCT(last_name) FROM actor;

-- 6) days operating
SELECT DATEDIFF(max(return_date),min(rental_date)) AS 'Operating days' 
FROM sakila.rental;

-- 7) 
SELECT * ,date_format(rental_date, '%M') AS month, DATE_FORMAT(rental_date, '%W') AS weekday
from rental
limit 20;

-- 8)
SELECT rental_id, rental_date,
       CASE DAYOFWEEK(rental_date)
           WHEN 1 THEN 'weekend'
           WHEN 7 THEN 'weekend'
           ELSE 'workday'
       END AS day_type
FROM rental;

-- 9)
SELECT release_year FROM film;

-- 10)
SELECT title FROM film
WHERE title LIKE '%ARMAGEDDON%';

-- 11)
SELECT title FROM film
WHERE title LIKE '%APOLLO';

-- 12)
SELECT * FROM film
ORDER BY length DESC
LIMIT 10;

-- 13)
SELECT * FROM film
WHERE special_features LIKE '%Behind%';
