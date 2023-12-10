-- SELECT
--   title
-- FROM books
-- WHERE title LIKE "%Stories%";


-- SELECT
--   title,
--   pages
-- FROM books
-- ORDER BY pages DESC LIMIT 1;

-- SELECT
--   CONCAT(title, " - ", released_year) AS summary
-- FROM books
-- ORDER BY released_year DESC
-- LIMIT 3;

-- SELECT
--   title,
--   author_lname
-- FROM books
-- WHERE author_lname LIKE ("% %");

-- SELECT
--   title,
--   released_year,
--   stock_quantity
-- FROM books
-- ORDER BY stock_quantity, title
-- LIMIT 3;

-- SELECT
--   title,
--   author_lname
-- FROM books
-- ORDER BY author_lname, title;

-- SELECT
--   UPPER(
--     CONCAT(
--       "mY fAVOURITE author is ",
--       author_fname,
--       " ",
--       author_lname,
--       "!"
--     )
--   ) AS yell
-- FROM books
-- ORDER BY author_lname

--  PRINT THE NUMBER OF BOOKS IN THE BOOKS TABLE 
-- SELECT COUNT(*) AS "Number of Books" FROM books;

-- PRINT OUT HOW MANY BOOKS ARE RELEASED EACH YEAR
-- SELECT released_year, COUNT(*) FROM books
-- GROUP BY released_year
-- ORDER by COUNT(*) DESC;

-- PRINT OUT THE TOTAL NUMBER OF BOOKS IN STOCK
-- SELECT SUM(stock_quantity) AS "Total books" FROM books;

-- FIND THE AVERAGE RELEASED YEAR FOR EACH AUTHOR
-- SELECT CONCAT(author_lname, " ", author_fname),AVG(released_year) FROM books
-- GROUP BY author_lname, author_fname


-- FIND THE FULL NAME OF THE AUTHOR WHO WROTE THE LONGEST BOOK
-- SLOW IMPLEMENTATION
-- SELECT title, CONCAT(author_lname, " ", author_fname) as author FROM books
-- WHERE CHAR_LENGTH(title) = (SELECT Max(CHAR_LENGTH(title)) FROM books)
-- BEST IMPLEMENTATION
-- SELECT title, CONCAT(author_lname, " ", author_fname) AS author FROM Books
-- ORDER BY CHAR_LENGTH(title) DESC LIMIT 1;

-- FIND THE AVEARAGE OF THE PAGES OF BOOKS RELEASED THE SAME YEAR
SELECT released_year AS year, COUNT(*) AS "# books", AVG(pages) AS "avg pages" FROM books
GROUP BY released_year
