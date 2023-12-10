SELECT title, CONCAT_WS(" ", author_lname, author_fname) AS author, released_year, stock_quantity, pages FROM books
WHERE released_year < 2000 
OR stock_quantity > 30
|| pages > 500
ORDER BY stock_quantity;