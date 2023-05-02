USE sakila;
 -- 1) drop picture column from staff table
ALTER TABLE staff
DROP COLUMN picture;

-- 3) insert new staff member tammy
SELECT * FROM customer
WHERE first_name = 'Tammy' AND last_name = 'Sanders';

INSERT INTO staff (first_name, last_name, email, address_id, store_id, username)
Values ('Tammy', 'Sanders', 'TAMMY.SANDERS@sakilacustomer.org', 79, 1, 'Tammy');

SELECT * FROM staff;

-- 3) Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1
SELECT * FROM rental;

select * from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; -- id = 130

SELECT * FROM film
WHERE title = "Academy Dinosaur"; -- id = 1

SELECT * FROM inventory
WHERE film_id = 1; -- 1,2,3,4

SELECT * FROM rental
WHERE customer_id = 130;

INSERT INTO rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES ('2023-03-06 12:12:12', 1, 130, '2023-03-07 12:12:12', 1, '2023-03-05 12:12:12');

-- for the second part of this lab, refer to the pdf document in the same repository