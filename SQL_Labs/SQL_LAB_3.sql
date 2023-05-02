-- 1)
SELECT DISTINCT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;

-- 2)
SELECT DISTINCT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;

-- 3) 
SELECT staff_id, COUNT(*) as total_rentals
FROM rental
GROUP BY staff_id;

-- 4)
SELECT release_year, COUNT(*) AS total_films
FROM film
GROUP BY release_year;

-- 5)
SELECT rating , count(*) as total_films 
from film
group by rating;

-- 6)
SELECT rating, ROUND(AVG(length), 2) AS avg_length
FROM film
GROUP BY rating;

-- 7)
SELECT rating, ROUND(AVG(length), 2) AS avg_length
FROM film
GROUP BY rating
HAVING avg_length>120;

-- 8)
SELECT title, length, RANK() OVER(ORDER BY length DESC) AS 'rank' FROM film;





