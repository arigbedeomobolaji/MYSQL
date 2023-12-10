
-- DISTINCT - return one copy if duplicate of found item exist
SELECT DISTINCT author_lname FROM books;

-- USE DISTINCT ON MULTIPLE COLUMNS
SELECT DISTINCT
  CONCAT(author_fname, " ", author_lname) AS fullname 
FROM books;

-- OR

SELECT DISTINCT
  author_fname,author_lname
FROM books;

-- It can also work on numbers 
SELECT DISTINCT
  released_year
FROM books;

-- ORDER BY 
SELECT author_fname,author_lname,stock_quantity FROM books ORDER BY author_lname;

-- order by fullname = 2 i.e. book_id = 1, fullname = 2, released_year = 3
SELECT 
  book_id, 
  CONCAT(author_lname, " ", author_fname) AS fullname,
  released_year
FROM books
ORDER BY 2; 


-- ORDER BY is Ascending (ASC) by default to make it sort in descending order we use DESC
SELECT 
  book_id,
  CONCAT(author_lname, " ", author_fname) AS fullname,
  released_year
FROM books
ORDER BY 3 DESC;    -- Only sort with the most recent 2021 at the top




-- we can also sort using multiple field but the next field after the first one sort only the ones 
-- that are not rightly sortedin the second field
-- assuming we have DAVID HUGMAN && DAVID ZACH, FELIX ARNOLD - It will SORT IT AS FOLLOWS;
      -- DAVID HUGMAN,
      -- DAVID ZACH,
      -- FELIX ARNOLD
SELECT
  author_lname AS "1st sorted by lname",
  author_fname AS "2nd sorted by fname",
  released_year
FROM books
ORDER by author_lname,author_fname;

-- N.B numbers comes before characters
SELECT book_id, title FROM books ORDER BY title;      
-- 10% happier comes first

-- RETURN FIRST BOOK WITH THE HIGHEST NUMBER OF PAGES
SELECT title,pages FROM books ORDER BY pages DESC;

-- LIMIT - gives us only data from the table
-- LIMIT how_many_do_you_want_me_to_return
SELECT book_id,author_fname, author_lname, released_year FROM books ORDER BY released_year DESC LIMIT 2;

-- LIMIT where_do_you-want-me_to_start-I-always_starts-at-zero,how_many_do_you_want_me_to_return;
SELECT 
  book_id,
  CONCAT(author_fname, " ", author_lname) AS author,
  title,
  released_year AS "Produced in"
FROM books
ORDER BY title
LIMIT 0, 1;


-- TO select from x, infinity
SELECT * FROM books ORDER BY title DESC LIMIT 0, 18898898;


-- LIKE - BETTER WAY TO SEARCH SPECIFICALLY
-- few things to note
-- SYNTAX
--  SELECT fields FROM <table_name> WHERE field_for_criteria LIKE "REGEX||STR"
-- % - means wild card like (.) in regExp
-- underscore (_) means select exactly one character
-- let's get started


-- 1. SELECT anything that has "da" in between
SELECT book_id, author_fname, author_lname FROM books
WHERE CONCAT(author_fname, " ", author_lname) LIKE "%da%";

-- 2. SELECT author_fname that only start with "F" and has any characters after
SELECT book_id, author_fname, author_lname FROM books
WHERE author_fname LIKE "F%";

-- 3. SELECT author_fname that ends with "a" and nothing after 
SELECT book_id, author_fname, author_lname FROM books
WHERE author_fname LIKE "%a";

-- 4. SELECT stock_quantity that has only two digits
SELECT book_id, author_fname, author_lname, stock_quantity FROM books
WHERE stock_quantity LIKE "__";

-- 5. SELECT title that has % in between
SELECT book_id, author_fname, author_lname, title FROM books
WHERE title LIKE "%\%%";

-- 6. SELECT title that has an Underscore (_) in between
SELECT book_id, author_fname, author_lname, title FROM books
WHERE title LIKE "%\_%";

-- 7. SELECT title that has an backward slash (\) in between
SELECT book_id, author_fname, author_lname, title FROM books
WHERE title LIKE "%\\\%";
