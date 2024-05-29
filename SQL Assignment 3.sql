1. -- Query that will produce customer names from the city texas
select first_name, last_name, city
from customer   
full join address 
on customer.address_id = address.address_id
full join city_ 
on address.city_id = city_.city_id
where city = 'Texas';

select *
from city_

2. select * from payment
select * from customer 

-- Query that will produce a list of customer's with payments above 6.99
select customer.customer_id, first_name, last_name, amount
from customer
right join payment 
on customer.customer_id = payment.customer_id
where amount > 6.99;

3. select * from payment 
-- Find names of customer that paid an amount greater than 175
select customer_id, first_name, last_name
from customer 
where customer_id in ( 
	select customer_id
	from payment 
	group by customer_id 
	having SUM(amount) > 175
	order by SUM(amount) desc
);

4. select * from customer 
select * from city_
select * from address

-- List of all customers that live in Nepal
select customer_id, first_name, last_name
from customer 
full join address 
on customer.address_id = address.address_id
full join city_ 
on address.city_id = city_.city_id
where city = 'Nepal';

5. select * from rental 
select * from staff
select * from payment

-- List that shows which staff member that had the most transaction
select staff_id, first_name, last_name
from staff  
where staff_id in (
	select staff_id
	from payment 
	group by staff_id
	order by SUM(amount) desc
	limit 1
);

6. select * from film

-- List that shows the number of movies for each rating
select rating, COUNT(rating)
from film
group by rating;

7. select * from customer 
select * from payment

-- Query that shows all customers who made a single payment above $6.99
select first_name, last_name, payment.amount
from customer 
left join payment on customer.customer_id = payment.customer_id
where amount > 6.99;

8. select * from rental
select * from payment

-- Query that produce data of how many free rentals the store gave away
select rental.customer_id, rental.rental_id
from rental
left join payment
on rental.rental_id = payment.rental_id
where payment_id is null or amount is null;

select COUNT(*) as Missing_Payment_Count
from rental
left join payment
on rental.rental_id = payment.rental_id
where payment_id is null or amount is null;

