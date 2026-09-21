-- ====================================================================
-- 4 Queries using a single table
-- ====================================================================

-- 1. Retrieve all customers located in Syria
SELECT * FROM customers WHERE country = 'Syria';

-- 2. List all products sorted by price from highest to lowest
SELECT product_name, price FROM products ORDER BY price DESC;

-- 3. Find all orders placed after January 1, 2024
SELECT * FROM orders WHERE order_date > '2024-01-01';

-- 4. Get the total number of products in the inventory
SELECT COUNT(*) AS total_products FROM products;

-- ====================================================================
-- 4 Queries using JOIN (Inner & Left)
-- ====================================================================

-- 5. INNER JOIN: Retrieve all orders along with the customer's full name
SELECT orders.order_id, customers.first_name, customers.last_name, orders.total_amount
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;

-- 6. LEFT JOIN: List all customers and their orders, including those who haven't ordered yet
SELECT customers.first_name, orders.order_id, orders.total_amount
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;

-- 7. INNER JOIN: Get order item details along with the specific product names
SELECT order_items.order_id, products.product_name, order_items.quantity
FROM order_items
INNER JOIN products ON order_items.product_id = products.product_id;

-- 8. Multiple INNER JOINs: Show full details of orders (Customer Name, Product, and Quantity)
SELECT c.first_name, p.product_name, oi.quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- ====================================================================
-- 2 Queries using GROUP BY + HAVING
-- ====================================================================

-- 9. Calculate Total sales per customer (Only showing customers with total sales > 0)
SELECT customer_id, SUM(total_amount) AS total_sales
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 0;

-- 10. Find dates where the daily total number of orders is strictly greater than 5
SELECT order_date, COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_date
HAVING COUNT(order_id) > 5;

-- ====================================================================
-- 2 Queries using Subqueries
-- ====================================================================

-- 11. Find customers who have placed an order above the overall average order amount
SELECT first_name, last_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id 
    FROM orders 
    WHERE total_amount > (SELECT AVG(total_amount) FROM orders)
);

-- 12. Find the names of products that have never been ordered
SELECT product_name
FROM products
WHERE product_id NOT IN (
    SELECT DISTINCT product_id 
    FROM order_items
);