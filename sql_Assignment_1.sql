--1. How many actors are there with the last name ‘Wahlberg’?
--Answer: 2 Nick Wahlber and Daryl Wahlberg
select count(last_name) from actor
where last_name like 'Wahlberg';
--OR
select count(last_name) from actor
where last_name = 'Wahlberg';
--OR
select first_name, last_name from actor
where last_name like 'Wahlberg';
--OR
select first_name, last_name from actor
where last_name = 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?
--Answer: 0
select count(amount) from payment
where amount >= 3.99 and amount <= 5.99;
--OR
select payment_id, amount from payment
where amount >= 3.99 and amount <= 5.99;

--3. What film does the store have the most of? (search in inventory)
--Answer: The max amount of films in inventory is 8. There is a few films with that amount.
select film_id, count(film_id) as inventory_count from inventory
group by film_id
order by inventory_count desc;

--4. How many customers have the last name ‘William’?
--Answer: 0 with last name William. 1 with last name Williams (Linda Williams)
select first_name, last_name  from customer
where last_name = 'William';
--OR
select count(last_name) from customer
where last_name = 'William';
--OR
select count(last_name) from customer
where last_name like 'William';
--OR
select first_name, last_name  from customer
where last_name like 'Williams';
--OR
select count(last_name) from customer
where last_name = 'Williams';

--5. What store employee (get the id) sold the most rentals?
--Answer: Staff Id 1 Mike dols the most 8,040
select staff_id, count(staff_id) as rentals_sold from rental
group by staff_id;
--OR
select staff_id, count(staff_id) as rentals_sold from rental
group by staff_id
order by rentals_sold desc;
--OR
select staff_id, count(staff_id) as rentals_sold from rental
group by staff_id
order by rentals_sold desc limit 1;

--6. How many different district names are there?
--Answer: 378 district names
select count(distinct district) from address;
--OR
select count(distinct district) as district_count
from address;

--7. What film has the most actors in it? (use film_actor table and get film_id)
--Answer: Film Id 508 with 15 actors in it (Lambs Cincinatti)
select film_id, count(distinct actor_id) as actors from film_actor
group by film_id 
order by actors desc;
--OR
select film_id, count(distinct actor_id) as actors from film_actor
group by film_id 
order by actors desc limit 1;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
--Answer: 13 
select first_name, last_name from customer
where last_name like '%es' and store_id = 1;
--OR
select count(last_name) from customer
where last_name like '%es' and store_id = 1;

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
--Answer: 11
select amount from payment 
where customer_id between 380 and 430 and rental_id > 250
group by amount;
--OR
select amount, count(distinct amount) as number_of_payments from payment
where customer_id between 380 and 430 and rental_id > 250
group by amount;
--OR
select amount from payment 
where customer_id between 380 and 430
group by amount
having count(rental_id) > 250;

--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
--Answer: 5 rating categories with 209  
select distinct(rating), count(rating) from film
group by rating
order by rating desc;
--OR
select count(distinct rating) as distintc_rating_count,
(select max(rating) from film) as max_rating from film;





