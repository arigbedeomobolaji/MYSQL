--  SELECT CONCAT(SUBSTRING(title, 1,10), ".... Read More") AS more FROM books WHERE book_id>10;

-- SELECT 
--   CONCAT(
--     SUBSTRING(
--       REPLACE(title, "e", "3"),
--       1,
--       10
--     ),
--     " - ",
--     "has been replaced with number 3"
--   )
-- FROM 
-- books;


-- SELECT
--   book_id,
--   CONCAT(REVERSE(author_fname), REVERSE(author_lname)) AS content
-- FROM books
-- WHERE book_id > 5 AND book_id < 10;


-- SELECT 
--   book_id,
--   CONCAT(author_fname, " ", author_lname ) AS fullname,
--   title
-- FROM books
-- WHERE CHAR_LENGTH(CONCAT_WS(" ", author_fname, author_lname))<=12;

-- SELECT
--   book_id,
--   author_lname,
--   CONCAT(CONCAT(author_lname, " ", author_fname), " last name is ", CHAR_LENGTH(author_lname), " charcters long") AS length_desc
-- FROM books;

-- SELECT
--   book_id,
--   CONCAT
--   (
--     UPPER("my FAvouriTE book IS "), 
--     UPPER(title)
--   ) AS favourite_book,
--   CONCAT
--   (
--     LOWER("It is WRITTEN BY: "), 
--     LOWER(CONCAT(author_fname, " ", author_lname))
--     ) AS writer
-- FROM books;

-- REVERSE AND UPPERCASE

-- SELECT 
--   REVERSE(UPPER("why does my cat look at me with hatred!"));

-- SELECT
--   book_id,
--   REPLACE(title, " ", "->") AS title
-- FROM books;

-- SELECT
--   author_lname AS forwards,
--   REVERSE(author_lname) AS backwards
-- FROM books;

-- SELECT
--   UPPER(
--     CONCAT(
--       author_fname,
--       " ",
--       author_lname
--     )
--   ) AS "fullname in Caps"
-- FROM books;

-- SELECT
--   CONCAT_WS(
--     " ",
--     title,
--     "was released in",
--     released_year
--   ) AS blurbs
-- FROM books;

-- SELECT
--   title,
--   CHAR_LENGTH(title) AS "character count"
-- FROM books;

-- SELECT
--   CONCAT(
--     SUBSTRING(title, 1, 10),
--     "..."
--   ) 
--   AS "short title",
--   CONCAT(
--     author_lname,
--     ",",
--     author_fname
--   ) 
--   AS author,
--   CONCAT(
--     stock_quantity,
--     " ",
--     "in stock"
--   ) AS quantity
-- FROM books
-- WHERE released_year=2001;

-- DISTINCT - return one copy if duplicate of found item exist
-- SELECT DISTINCT author_lname FROM books;

-- USE DISTINCT ON MULTIPLE COLUMNS
-- SELECT DISTINCT
--   CONCAT(author_fname, " ", author_lname) AS fullname 
-- FROM books;

-- OR

-- SELECT DISTINCT
--   author_fname,author_lname
-- FROM books;

-- It can also work on strings 
-- SELECT DISTINCT
--   released_year
-- FROM books;


-- ORDER BY 
-- SELECT * FROM books ORDER BY author_lname;
/* 
SELECT 
  book_id, 
  CONCAT(author_lname, " ", author_fname) AS fullname,
  released_year
FROM books
ORDER BY 2;
-- order by FULLNAME 
*/
/* 
-- ORDER BY is Ascending (ASC) by default to make it sort in descending order we use DESC
SELECT 
  book_id,
  CONCAT(author_lname, " ", author_fname) AS fullname,
  released_year
FROM books
ORDER BY 3 DESC;    -- Only sort with the most recent 2021 at the top
*/

-- we can also sort using multiple field but the next field after the first one sort only the ones 
-- that are not rightly sortedin the second field
-- assuming we have DAVID HUGMAN && DAVID ZACH, FELIX ARNOLD - It will SORT IT AS FOLLOWS;
      -- DAVID HUGMAN,
      -- DAVID ZACH,
      -- FELIX ARNOLD
-- SELECT
--   author_lname AS "1st sorted by lname",
--   author_fname AS "2nd sorted by fname",
--   released_year
-- FROM books
-- ORDER by author_lname,author_fname

-- N.B numbers comes before characters
-- SELECT * FROM books ORDER BY title      -- 10% happier comes first

-- RETURN FIRST BOOK WITH THE HIGHEST NUMBER OF PAGES
-- SELECT title,pages FROM books ORDER BY pages DESC;



-- LIMIT - gives us only data from the table
-- LIMIT how_many_do_you_want_me_to_return
-- SELECT * FROM books ORDER BY released_year DESC LIMIT 2;

-- LIMIT where_do_you-want-me_to_start-I-always_starts-at-zero,how_many_do_you_want_me_to_return;
-- SELECT 
--   book_id,
--   CONCAT(author_fname, " ", author_lname) AS author,
--   title,
--   released_year AS "Produced in"
-- FROM books
-- ORDER BY title
-- LIMIT 0, 1;


-- TO select from x, infinity
-- SELECT * FROM books ORDER BY title DESC LIMIT 0, 18898898;

-- LIKE - BETTER WAY TO SEARCH SPECIFICALLY
-- few things to note
-- SYNTAX
--  SELECT fields FROM <table_name> WHERE field_for_criteria LIKE "REGEX||STR"
-- % - means wild card like (.) in regExp
-- underscore (-) means select exactly one character
-- let's get started

-- 1. SELECT anything that has "da" in between
-- SELECT book_id, author_fname, author_lname FROM books
-- WHERE CONCAT(author_fname, " ", author_lname) LIKE "%da%"

-- 2. SELECT author_fname that only start with "F" and has any characters after
-- SELECT book_id, author_fname, author_lname FROM books
-- WHERE author_fname LIKE "F%"

-- 3. SELECT author_fname that ends with "a" and nothing after 
-- SELECT book_id, author_fname, author_lname FROM books
-- WHERE author_fname LIKE "%a"

-- 4. SELECT stock_quantity that has only two digits
-- SELECT book_id, author_fname, author_lname, stock_quantity FROM books
-- WHERE stock_quantity LIKE "__"

-- 5. SELECT title that has % in between
-- SELECT book_id, author_fname, author_lname, title FROM books
-- WHERE title LIKE "%\%%";

-- 6. SELECT title that has an Underscore (_) in between
-- SELECT book_id, author_fname, author_lname, title FROM books
-- WHERE title LIKE "%\_%";

-- 7. SELECT title that has an backward slash (\) in between
-- SELECT book_id, author_fname, author_lname, title FROM books
-- WHERE title LIKE "%\\\%";

-- COUNT
-- SELECT COUNT(*) FROM books;
-- SELECT COUNT(*) AS "total rows" FROM books;
-- SELECT COUNT(DISTINCT author_lname, author_fname) as "Total authors" FROM books;
/* SELECT COUNT(title) as "title that contains 'THE'" FROM books
WHERE title LIKE "%the%"; */



-- GROUP BY - used to group related data total into sub rows
-- SELECT [fields to ouput] FROM <table_name>
--  GROUP BY "fieldl to use to group data"
/* SELECT CONCAT(author_lname, " ", author_fname, " authored ", count(title), " book(s).") AS books_auhtored FROM books
GROUP BY author_lname,author_fname */
/* SELECT released_year, COUNT(released_year) AS "books released per year" FROM books 
GROUP BY released_year ORDER BY COUNT(released_year) DESC */


-- MAX and MIN - returns the max or min in a particular columns
-- SELECT MAX(pages) FROM books         - returns the book with the highest number of pages
-- SELECT MIN(pages) FROM books         - returns the book with the lowest number of pages
-- SELECT max(released_year) FROM books   - returns the most recently released book
-- SELECT MAX(pages) AS "book with highest number of pages" FROM books

-- USING MAX or MIN to output a particulat row/record can be done using
-- SUBQUERIES - which is slow
-- ORDER BY 
-- SELECT book_id,title,CONCAT(author_lname, " ", author_fname) AS author, pages, released_year FROM books
-- WHERE pages = ( SELECT MAX(pages) FROM books);
-- SELECT book_id,title,CONCAT(author_lname, " ", author_fname) AS author, pages, released_year FROM books
-- WHERE pages = ( SELECT MIN(pages) FROM books);

/*
-- this is FASTER
SELECT * FROM books ORDER BY pages DESC LIMIT 1;  -- MAX
SELECT * FROM books ORDER BY pages ASC LIMIT 1;   -- MIN */


-- MIN/MAX with GROUP BY
-- finding the first released year (published year) for each author
/* SELECT author_fname, author_lname, Min(released_year) 
from books
GROUP BY author_lname,author_fname; */
-- Find the longest page count for each author
-- SELECT author_fname, author_lname, title, Max(pages), count(*)
-- FROM books
-- GROUP BY author_lname,author_fname

-- SUM
-- SELECT SUM(column) FROM books
-- SELECT SUM(column) FROM books GROUP BY <criteria.

-- AVG
-- SELECT AVG(column_to_average) FROM books
-- SELECT AVG(sub_row_column)