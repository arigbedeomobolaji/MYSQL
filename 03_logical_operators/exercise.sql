-- SELECT 10 != 10; -- 0
-- SELECT 15 > 14 && 99 - 5 <= 94; -- 1
-- SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; -- 1

-- - SELECT All books written before 1980 (non inclusive)
-- SELECT * FROM books
-- WHERE released_year < 1980;

-- Select All books written by Eggers or Chabon
-- SELECT * FROM books
-- WHERE author_lname IN ("Eggers", "Chabon");

-- Select ALl books written by Lahiri published after 2000;
-- SELECT * FROM books
-- WHERE author_lname = "Lahiri" 
-- AND released_year > 2000;

-- Select all books with page counts between 100 and 200
-- SELECT title, pages FROM books
-- WHERE pages BETWEEN 100 AND 200;


-- Select all books where author_lname started with a 'C' or an 'S'
-- SELECT author_lname FROM books
-- WHERE author_lname LIKE "c%"
-- OR author_lname LIKE "S%";

-- SELECT title, author_lname,
-- CASE
--   WHEN title LIKE "%STORIES%" THEN "Short Stories"
--   WHEN title LIKE "%just kids%" OR title Like "%a Heartbreaking Work%" THEN "Memoir"
--   ELSE "Novel"
-- END AS TYPE
-- FROM books;



SELECT title, author_lname, author_fname,
CASE
  WHEN COUNT(*) > 1 THEN CONCAT(COUNT(*), " books")
  ELSE CONCAT(COUNT(*), " book")
END AS COUNT
FROM books
GROUP BY author_lname, author_fname;
