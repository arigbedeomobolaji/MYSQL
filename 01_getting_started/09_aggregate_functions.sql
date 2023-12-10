-- COUNT - number of rows (docs) in a table
SELECT COUNT(*) FROM books;
SELECT COUNT(*) AS "total rows" FROM books;
SELECT COUNT(DISTINCT author_lname, author_fname) as "Total authors" FROM books;

SELECT COUNT(title) AS "title that contains 'THE'" FROM books
WHERE title LIKE "%the%";



-- GROUP BY - used to group related data total into sub rows
-- SELECT [fields to ouput] FROM <table_name>
--  GROUP BY "field to use to group data"
SELECT CONCAT(
   author_lname, " ", 
   author_fname, " authored ", 
   COUNT(title), " book(s)."
)
AS books_auhtored,
title
FROM books
GROUP BY author_lname,author_fname;

SELECT released_year, title
, COUNT(released_year) AS "books released per year"
 FROM books 
GROUP BY released_year ORDER BY COUNT(released_year) DESC;

-- MAX and MIN - returns the max or min in a particular columns
-- SELECT MAX(pages) FROM books;         - returns the book with the highest number of pages
-- SELECT MIN(pages) FROM books         - returns the book with the lowest number of pages
-- SELECT max(released_year) AS "newest bold" FROM books   - returns the most recently released book
-- SELECT MAX(pages) AS "book with highest number of pages" FROM books
-- SELECT MIN(released_year) AS "oldest book", max(released_year) AS "newest book" FROM books;
-- SELECT MIN(pages) AS "lowest number of pages", MAX(pages) AS "highest number of pages" FROM books;

-- USING MAX or MIN to output a particulat row/record can be done using
-- SUBQUERIES - which is slow
-- ORDER BY is fast
-- This query returns the book with the highest number of pages.
SELECT book_id,title,CONCAT(author_lname, " ", author_fname) AS author, pages, released_year FROM books
WHERE pages = ( SELECT MAX(pages) FROM books);
-- This query returns the book with the lowest number of pages
-- SELECT book_id,title,CONCAT(author_lname, " ", author_fname) AS author, pages, released_year FROM books
-- WHERE pages = ( SELECT MIN(pages) FROM books);

-- This is FASTER
SELECT * FROM books ORDER BY pages DESC LIMIT 1;  -- MAX
SELECT * FROM books ORDER BY pages ASC LIMIT 1;   -- MIN

-- MIN/MAX with GROUP BY

-- finding the first released year (published year) for each author
SELECT author_fname, author_lname, Min(released_year) 
from books
GROUP BY author_lname,author_fname; 

-- Find the longest page count for each author
SELECT author_fname, author_lname, title, Max(pages), count(*)
FROM books
GROUP BY author_lname,author_fname


-- SUM
-- SELECT SUM(column) FROM books
-- SELECT SUM(column) FROM books GROUP BY <criteria.



-- AVG
-- SELECT AVG(column_to_average) FROM books
-- SELECT AVG(sub_row_column)