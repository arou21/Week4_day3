-- 1. List all customers who live in Texas (use
-- JOINs)
-- Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still
SELECT *
FROM address 
JOIN customer on customer.address_id = address.address_id
WHERE district = 'Texas'


-- 2. Get all payments above $6.99 with the Customer's Full
-- Mary Smith,  Harold Martino, Ida Andrews, Frank Waggoner, Gregory Mauldin, Douglas Graf, Arthur Simpkins, Ryan Salisbury, Rodger Quintanilla,
-- Joe Gillilan, Jack Foust, Jonathan Scarborough, Justin Ngo, Keith Rico, Samuel Marlow, Ralp Madrigal, Bruce Schwarz
-- Harry Arce, Wayne Truong, BIll poulin, Louis Leone, 
SELECT Distinct first_name, last_name, amount 
FROM payment
JOIN customer ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
-- 341
SELECT Distinct customer_id
FROM payment
WHERE amount > 175

-- 4. List all customers that live in Nepal (use the city
-- table)
-- Kevin Schuler
SELECT *
FROM address 
JOIN customer on customer.address_id = address.address_id
JOIN city on city.city_id = address.city_id
JOIN country ON country.country_id=city.country_id
WHERE country.country = 'Nepal'


-- 5. Which staff member had the most
-- transactions?
-- Jon Stephens 
SELECT first_name, last_name, COUNT(*)
From staff
JOIN payment on payment.staff_id  = staff.staff_id
GROUP BY Staff.staff_id

-- 6. How many movies of each rating are
-- there?
-- Rated R = 195, Rated NC-17 = 209, Rated, G = 178, rated PG-13 = 223, Rated PG = 194, 1 unrated movie
SELECT rating, COUNT(*)
FROM film
GROUP BY rating

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
-- PLEASE VIEW THE LIST

SELECT * FROM Customer WHERE customer_id IN(SELECT Distinct customer_id 
FROM payment
WHERE amount > 6.99)



-- 8. How many free rentals did our stores give away?
-- these are rentals that have not been paid for 
SELECT * 
FROM rental
WHERE rental_id NOT IN (SELECT rental_id FROM payment)
