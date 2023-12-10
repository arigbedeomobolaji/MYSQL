SELECT CONCAT_WS(" ", author_lname, author_fname) AS author, released_year, title,
CASE
  WHEN released_year >= 2000 THEN 'Modern List'
  WHEN released_year >= 1980 THEN 'Late Nineties'
  ELSE 'Early Nineties'
END AS GENRE
FROM books;

SELECT released_year, stock_quantity,
CASE
  WHEN stock_quantity BETWEEN 0 AND 50 THEN "*"
  WHEN stock_quantity BETWEEN 51 AND 100 THEN "**"
  ELSE "***"
END AS stock_symbol
FROM books;

SELECT released_year, stock_quantity,
CASE
  WHEN stock_quantity >= 0 AND stock_quantity <= 50 THEN "*"
  WHEN stock_quantity >= 51 AND stock_quantity <= 100 THEN "**"
  ELSE "***"
END AS stock_symbol
FROM books;

SELECT title, released_year, stock_quantity,
CASE
  WHEN stock_quantity <=50 THEN "*"
  WHEN stock_quantity <=100 THEN "**"
  ELSE "***"
END AS stock_symbol
FROM books;