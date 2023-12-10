-- RELATIONSHIPS AND JOINS
-- Real world data are messy and interrelated

-- TYPES OF DATA RELATIONSHIPS
-- RELATIONSHIP BASICS IN MYSQL
-- 1. One to One Relationship
      --  customer_details_table one relationship with customer table
      -- One customer has only one customer details
      -- One customer detail can only belong to one user
-- 2. One to Many Relationship (1:MANY)
      -- Most Common
      -- Books has many reviews but reviews belong to one book
      -- One book has many reviews
      -- One review only belongs to one book
-- 3. Many to Many Relationship
      -- Still relatively common
      --   One book might have many author
      -- One Author can have many books 

 

-- 1:MANY RELATIONSHIP
CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE  NOT NULL
);

CREATE TABLE orders(
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_date DATE NOT NULL,
  order_price DECIMAL(8,2) NOT NULL,
  customer_id INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
); 

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');


INSERT INTO orders (order_date, order_price, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);


-- THIS RESULT TO AN ERROR
INSERT INTO orders (order_date, order_price, customer_id)
VALUES ('2016/02/10', 99.99, 111)


-- CROSS JOIN
-- Probably will never use.Takes one table then conjoin ir withe every row in another table.
SELECT first_name, last_name, order_date, order_price FROM customers, orders;

-- IMPLICIT INNER JOIN 
SELECT first_name, last_name, order_date, order_price
FROM customers, orders
WHERE orders.customer_id = customers.id;


-- EXPLICIT INNER JOIN
SELECT first_name, last_name, email, order_date, order_price
FROM customers JOIN orders
ON orders.customer_id = customers.id;

-- INNER JOIN WITH AGGREGATE FUNCTION
SELECT first_name, last_name, SUM(order_price) AS total_spent FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent DESC;

-- INNER JOIN IS WHAT PEOPLE DO MOST OF THE TIME


-- -LEFT JOIN
--  Do you want to see how customer are purchasing from your ecommerce site from the best spender to those that haven't spend.
--  Do you want to thank the best spender and you want to implore the stingy/sapa man association to come and buy 
--  then use LEFT JOIN to retrieve all customers from your DB and see if they have purchased or not

SELECT first_name, last_name, order_date, order_price FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id;


SELECT first_name, last_name, order_date, IFNULL(SUM(order_price),0) AS total_spent FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id
GROUP BY order_price
ORDER BY order_price;


--      RIGHT JOIN
SELECT first_name, last_name, order_price, order_date FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id;


SELECT first_name, last_name, AVG(order_price) AS total_spent, order_date, 
CASE
  WHEN COUNT(*) > 1 THEN CONCAT(COUNT(*), " orders")
  ELSE CONCAT(COUNT(*), " order")
END AS total_orders 
FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent DESC; 

-- ON DELETE CASCADE
-- When we delete a primary key from one table all the orders that depend on it in another table get deleted as well using the foreign key
CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE  NOT NULL
);

CREATE TABLE orders(
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_date DATE NOT NULL,
  order_price DECIMAL(8,2) NOT NULL,
  customer_id INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
); 
