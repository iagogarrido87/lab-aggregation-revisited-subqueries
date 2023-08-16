-- 1. Select the first name, last name, and email address of all the customers who have rented a movie:
SELECT c.first_name, c.last_name, c.email
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id;

-- 2. What is the average payment made by each customer (display the customer id, customer name (concatenated), and the average payment made):
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       AVG(p.amount) AS average_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, customer_name;

-- 3. Select the name and email address of all the customers who have rented the "Action" movies:
-- Using multiple JOIN statements:
SELECT DISTINCT c.first_name, c.last_name, c.email
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
WHERE cat.name = 'Action';

-- Using subqueries and IN condition:
SELECT first_name, last_name, email
FROM customer
WHERE customer_id IN (
    SELECT DISTINCT c.customer_id
    FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category cat ON fc.category_id = cat.category_id
    WHERE cat.name = 'Action'
);


