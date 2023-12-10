--   ideology of Many to Many relationship
/* 
Some examples
Books and Authors => A book can have multiple authors and A Author can write Multiple books
BlogPost and Tags => A BlogPost can have multiple tags and A tag can be used on multiple BlogPost
Students and Classes => A student can have in Multiple CLasses/courses and a Class/course can selected by multiple Student
Series and Reviewer => A series can have multiple reviewers and a a reviewer can review multiple Series
*/

-- The Idea behind Many-to-Many relationship is Association/Union
-- i.e. We are going to associate one Table to another table using another table as the union/association between them - This third table is called a union table. The way they are connected is throught the third table (union able)


-- CREATE DATABASE tv_reviews;

-- USE tv_reviews;

-- -- Reviewers Table
-- CREATE TABLE reviewers(
--    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--    first_name VARCHAR(100) NOT NULL,
--    last_name VARCHAR(100) NOT NULL
-- );

-- -- Series Table
-- CREATE TABLE series(
--    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--    title VARCHAR(200) NOT NULL,
--    released_year YEAR(4) NOT NULL,
--    genre VARCHAR(100) NOT NULL
-- );

-- The Union Table between the reviewer table and Series Table
-- Reviews Table
CREATE TABLE reviews(
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   rating DECIMAL(2,1) NOT NULL,
   series_id INT NOT NULL,
   reviewer_id INT NOT NULL,
   FOREIGN KEY (series_id) REFERENCES series(id) ON DELETE CASCADE,
   FOREIGN KEY (reviewer_id) REFERENCES reviewers(id) ON DELETE CASCADE
);

-- INSERTING A BUNCH OF DATA

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');


INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    

INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);

-- Match each Series title to the reviews it has received from reviewers
-- Solution #1
SELECT title, rating FROM series
INNER JOIN reviews
ON  series.id = reviews.series_id;

-- Solution #1 Alternatives
SELECT title, rating FROM series
RIGHT JOIN reviews
ON reviews.series_id = series.id;


-- Average ratings each movies has gotten so far
SELECT 
title, 
AVG(rating) AS avg_rating
 FROM series
JOIN reviews
ON  series.id = reviews.series_id
GROUP BY title;

-- Average ratings each movies has gotten so far from lowest to highest
SELECT 
title, 
AVG(rating) AS avg_rating
 FROM series
JOIN reviews
ON  series.id = reviews.series_id
GROUP BY title ORDER BY avg_rating;

-- Give me a list of all the reviewers that has given reviews before
SELECT first_name, last_name, rating
FROM reviewers RIGHT JOIN reviews
ON reviewers.id = reviews.reviewer_id;

-- solution 2
SELECT first_name, last_name, rating
FROM reviewers JOIN reviews
ON reviewers.id = reviews.reviewer_id;


-- Which series hasn't been reviewed
SELECT title AS unreviewed_rating FROM series
LEFT JOIN reviews 
ON series.id = reviews.series_id
WHERE rating IS NULL;

-- Group by genre
SELECT genre, AVG(rating) AS avg_rating 
FROM series 
JOIN reviews
ON series.id = reviews.series_id
GROUP BY genre
ORDER BY genre;


-- Analytics for our reviewe=er
SELECT 
first_name,
last_name,
COUNT(reviewers.id) AS COUNT,
IFNULL(MIN(rating),0) AS MIN,
IFNULL(MAX(rating),0) AS MAX,
IFNULL(AVG(rating),0) AS AVG,
IF(COUNT(rating) >= 1, "ACTIVE", "INACTIVE") AS STATUS
FROM reviewers
LEFT JOIN reviews
ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;


-- series and reviewer
SELECT title, rating,
CONCAT(first_name, " ", last_name) AS reviewer
FROM reviewers
INNER JOIN series
INNER JOIN reviews
ON reviewers.id = reviews.reviewer_id AND series.id = reviews.series_id
ORDER BY title;

-- or
-- series and reviewer
SELECT title, rating,
CONCAT(first_name, " ", last_name) AS reviewer
FROM reviewers
INNER JOIN reviews
ON reviewers.id = reviews.reviewer_id 
INNER JOIN series
ON series.id = reviews.series_id
ORDER BY title;