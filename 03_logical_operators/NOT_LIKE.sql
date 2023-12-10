-- returns all records which doesn't have i as part of the author last name
SELECT * FROM books
WHERE author_lname NOT LIKE "%i%";