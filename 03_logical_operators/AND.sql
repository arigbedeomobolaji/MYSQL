SELECT * FROM books
WHERE released_year >= 2000
AND stock_quantity >= 100
&& pages <= 400
ORDER BY pages;