use sakila;

select * from rental
limit 5;

select * from film
limit 5;

select * from category
limit 5;

select * from inventory
limit 5;

select * from film_category
limit 5;

select distinct f.film_id , title, f.rating, category_id, c.name from rental as r
join inventory as i
using (inventory_id)
join film as f
using (film_id)
join film_category as fc
using (film_id)
join category as c
using (category_id)
;


select distinct(film_id)  from film
join inventory
using (film_id)
join rental
using (inventory_id)
join film_category
using (film_id)
join category
using (category_id);

select distinct title , max(if(rental_date BETWEEN '2005-05-01' AND '2005-05-31', 1, 0)) as rented_in_may 
from film
join inventory
using (film_id)
join rental
using (inventory_id)
group by title;

SELECT DISTINCT f.title, MAX(IF(r.rental_date BETWEEN '2005-05-01' AND '2005-05-31', 1, 0)) as rented_in_may 
FROM film f
LEFT JOIN inventory i USING (film_id)
LEFT JOIN rental r USING (inventory_id)
GROUP BY F.title
ORDER BY f.title;

select distinct film_id, title, special_features, rental_rate, rating, release_year, category_id, name  from film f
join film_category fc
using (film_id)
join category
using (category_id)

