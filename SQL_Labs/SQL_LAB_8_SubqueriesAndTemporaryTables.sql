use sakila;

-- 1) number of copies of hunchback impossible
select count(film_id) as number_of_copies_hunchback_impossible
from film
join inventory
using (film_id)
where title = 'Hunchback Impossible';

-- 2) list of films longer than average running time of all films
select * from film
where length > (select avg(length) as average from film);

-- 3) all actors appearing in alone trip
select actor_id, first_name, last_name from film_actor 
join actor
using (actor_id)
where film_id = (select film_id from film
where title = 'Alone Trip');

-- 4) all movies in family films
select title from film_category
join film
using (film_id)
where category_id = (select category_id from category
where name = 'Family');

-- 5) name and email from canadians
select first_name, last_name, email from address
join (select city_id from city
where country_id = (select country_id from country
where country = 'Canada')) as sub2
using (city_id)
join customer
using (address_id);

-- 6) films that starr most prolific actor (most prolific means has been in the most films) count(distinct(actor_id))
create temporary table most_prolific_actor as (
SELECT actor_id, count(film_id) as number_of_films from film_actor
group by actor_id
order by number_of_films DESC
limit 1);

select title from most_prolific_actor
join film_actor
using (actor_id)
join film
using (film_id);

-- 7) most profitable customer
create temporary table most_profitable_customer
select first_name, last_name, customer_id, sum(amount) as total_amount from payment
join customer
using (customer_id)
group by customer_id
order by total_amount desc
limit 1;

select title as Karl_Seal_rented from rental
join most_profitable_customer
using (customer_id)
join inventory
using (inventory_id)
join film
using (film_id);

-- 8) customer that spent more than the average
create temporary table total_per_customer (
select customer_id, sum(amount) as total from payment
group by customer_id);

create temporary table average (
select avg(total) as total_avg from total_per_customer);

select customer_id, first_name, last_name, total from total_per_customer
join customer
using (customer_id)
where total > (select total_avg from average);