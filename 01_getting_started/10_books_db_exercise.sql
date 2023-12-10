SELECT REVERSE(UPPER("Why does my cat look at me with such hatred?"));

SELECT REPLACE(CONCAT("I", " ", "like", " ", "cats"), " ", "_");

SELECT REPLACE(title, " ", "->") AS title FROM books;

SELECT author_lname AS forwards, REVERSE(author_lname) AS backwards FROM books;

SELECT UPPER(CONCAT(author_fname, " ", author_lname)) FROM books;

SELECT CONCAT(title, " was released in ", released_year) AS blurb FROM books;

SELECT title, CHAR_LENGTH(title) AS "character count" FROM books;

SELECT CONCAT(SUBSTRING(title, 1, 10), "...") AS "short title",
CONCAT(author_fname, ",", author_lname) AS author,
CONCAT(stock_quantity, " in stock") AS quantity
FROM  books;


-- REFINING SELECTION
SELECT title FROM books WHERE title LIKE "%stories%";

-- Longest book;
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-- Three mpost recent books
SELECT CONCAT(title, " - ", released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;

SELECT title, author_lname FROM BOOKS 
WHERE author_lname LIKE "% %";

-- Three books with the lowest stock
SELECT title, released_year, stock_quantity 
FROM books ORDER BY stock_quantity LIMIT 3;

SELECT title, author_lname FROM  books
ORDER BY author_lname,title;

SELECT UPPER(CONCAT("My favorite author is ", author_fname, " ", author_lname)) AS yell from BOOKS ORDER BY author_lname;

SELECT DISTINCT(UPPER(CONCAT("My favorite author is ", author_fname, " ", author_lname))) AS yell from BOOKS ORDER BY author_lname;














-- AGREGATE SOLUTION

-- Number of books in the db
SELECT count(*) as "Total books in db" FROM books;

-- How many books were released each year
SELECT released_year, COUNT(released_year) AS "Books per year" FROM books GROUP BY released_year ORDER BY COUNT(released_year) DESC;

-- tOTAL NUMBER OF BOOK IN STOCK
SELECT SUM(stock_quantity) AS "Total books in Stock" FROM books;

-- Average release year for each author
SELECT author_fname, author_lname, AVG(released_year) 
FROM books GROUP BY author_fname,author_lname;

-- NB --> VERY SLOW
-- Full name of the author who wrote the longest book
SELECT CONCAT(author_lname," ", author_fname) FROM books 
WHERE pages=(SELECT MAX(pages) FROM books);

-- Number of books and average of the summation of their pages
SELECT released_year, count(released_year) AS "# books", AVG(pages) AS "avg pages"
FROM books GROUP BY released_year ORDER BY released_year;