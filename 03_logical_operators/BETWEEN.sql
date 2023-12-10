SELECT book_id,title,stock_quantity FROM books
WHERE stock_quantity
BETWEEN 30 AND 100
ORDER BY stock_quantity;



SELECT book_id,title,stock_quantity, released_year as prod FROM books
WHERE stock_quantity
BETWEEN 30 AND 100
AND released_year BETWEEN 1996 AND 1999
ORDER BY stock_quantity;


SELECT * FROM books
WHERE stock_quantity
BETWEEN 30 AND 100
AND released_year NOT BETWEEN 1996 AND 1999
ORDER BY stock_quantity;