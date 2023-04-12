USE sakila;

-- In the table actor, which are the actors whose last names are not repeated? 
SELECT DISTINCT last_name AS unique_last_name FROM actor;

-- Which last names appear more than once? 
SELECT last_name AS repeated_last_name, count(last_name) AS frequency 
FROM actor 
GROUP BY last_name
HAVING count(last_name) > 1;

-- Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, COUNT(*) as rental_count
FROM rental
GROUP BY staff_id;

-- Using the film table, find out how many films were released each year.
SELECT release_year, COUNT(*) FROM film
GROUP BY release_year;

-- Using the film table, find out for each rating how many films were there.
SELECT rating, COUNT(*) as film_count FROM film
GROUP BY rating;

-- the mean length of the film for each rating type. 
-- Round off the average lengths to two decimal places
select rating, round(avg(length),2) from film
group by rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?
select rating, avg(length) from film
group by rating
having avg(length) > 120;

-- Rank films by length (filter out the rows that have nulls or 0s in length column).
-- In your output, only select the columns title, length, and the rank.
SELECT Rank() OVER(ORDER BY length DESC) AS 'rank', title, length FROM film
WHERE length IS NOT NULL AND length > 0;