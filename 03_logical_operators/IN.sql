SELECT author_fname,author_lname FROM books
WHERE author_lname IN ('lahiri', 'GaiMAN', 'OMOBOLAJI');



SELECT * FROM books 
WHERE released_year >= 2000 AND
released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016, 2018, 2020);

-- OR


SELECT * FROM books 
WHERE released_year >= 2000 AND
released_year % 2 != 0;


-- SELECT * FROM books 
-- WHERE released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016, 2018, 2020);


