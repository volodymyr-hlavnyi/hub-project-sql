use sakila;
select database();

-- 1
SELECT title,
       rating,
       CASE
           WHEN rating = 'G' THEN 'General Audiences - All ages admitted.'
           WHEN rating = 'PG' THEN 'Parental Guidance Suggested - Some material may not be suitable for children.'
           WHEN rating = 'PG-13' THEN 'Parents Strongly Cautioned - Some material may be inappropriate for children under 13.'
           WHEN rating = 'R' THEN 'Restricted - Under 17 requires accompanying parent or adult guardian.'
           WHEN rating = 'NC-17' THEN 'Adults Only - No one 17 and under admitted.'
           ELSE 'Unknown Rating'
       END AS rating_description
FROM film;

-- 2
SELECT rating,
       COUNT(*) AS film_count
FROM film
GROUP BY rating;

-- 3
SELECT title,
       rating,
       COUNT(*) OVER (PARTITION BY rating) AS film_count_by_rating
FROM film;
-- В запросе с использованием оконной функции 
-- (PARTITION BY), результат будет показывать 
-- количество фильмов в каждом рейтинге для 
-- каждого фильма в данном рейтинге. 
-- В отличие от запроса с GROUP BY, 
-- который выводит одно общее количество 
-- фильмов для каждой категории рейтинга, 
-- запрос с оконной функцией выводит количество 
-- фильмов в рейтинге в каждой строке.

-- 4
SELECT c.first_name,
       c.last_name,
       p.payment_date,
       p.amount
FROM payment p
INNER JOIN customer c ON p.customer_id = c.customer_id;

-- 5 
SELECT c.first_name,
       c.last_name,
       DATE_FORMAT(p.payment_date, '%e %M %Y') AS formatted_payment_date,
       p.amount
FROM payment p
INNER JOIN customer c ON p.customer_id = c.customer_id;





