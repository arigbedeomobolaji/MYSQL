SELECT 10 != 10;  -- 0
SELECT 15 > 14 && 99-5 <= 94; -- 1
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; -- 1

-- All books written before 1980 (non inclusive)
SELECT title, released_year FROM books WHERE released_year < 1980;

-- Books written by Eggers or Chabon
SELECT author_fname, author_lname, title FROM books
WHERE author_lname IN ("Eggers", "Chabon") 
|| author_fname IN  ("Eggers", "Chabon");

-- books written by Lahiri published after 2000
SELECT author_fname, author_lname, title, released_year FROM books
WHERE author_lname = "Lahiri" AND released_year > 2000; 

-- All books with page counts between 100 and 200
SELECT title, pages FROM books
WHERE pages BETWEEN 100 AND 200;

-- All books where author_lname starts with a C or an 'S'
SELECT author_lname, title FROM books
WHERE author_lname LIKE "C%" OR author_lname LIKE "s%";

-- title contains "stories" => short stories
-- Just kids and A Heartbreaking Work -> Memoir
-- Everything else -> Novel

SELECT title, author_lname,
CASE
   WHEN title LIKE "%stories" THEN "Short Stories"
   WHEN title IN ("Just Kids", "A Heartbreaking Work of Staggering Genius") THEN "Memoir"
   ELSE "Novel"
END AS TYPES 
FROM books;

SELECT title, author_lname,
CASE
   WHEN COUNT(*) > 1 THEN CONCAT(COUNT(*), " books")
   ELSE "1 book"
END AS "No of Books"
FROM books GROUP BY author_lname,author_fname ORDER BY COUNT(*) DESC;