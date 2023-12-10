-- create shirts_db
CREATE DATABASE shirts_db;

-- use shirts_db database
USE shirts_db;

-- create table shirts in shirts_db
CREATE TABLE shirts(
    shirt_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL,
    shirt_size CHAR NOT NULL,
    last_worn INT NOT NULL default 0
);


-- insert data into shirt table

INSERT INTO shirts(article, color, shirt_size, last_worn)
VALUES('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);


-- Insert data manually
INSERT INTO shirts(color, article, shirt_size,last_worn)
VALUES("purple", "polo shirt", "M", 50);

-- SELECT ALL SHIRTS printing out only the article and color
SELECT article, color FROM shirts;

-- SELECT ALL MEDIUM SHIRT
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size="M";

-- UPDATE ALL POLO SHIRTS TO L
UPDATE shirts SET shirt_size="L" WHERE article="polo shirt";

-- update the short last worn 15 days ago and change it to 0
UPDATE shirts SET last_worn=0 WHERE last_worn=15;

-- Update all white shirts change size to XS and color to "off white"
UPDATE shirts SET shirt_size='X',color="off white" WHERE color="white";


-- Delete all shirts worn 200days ago
DELETE FROM shirts WHERE last_worn=200;

-- Delete all tank tops
DELETE FROM shirts WHERE article="tank top";

-- Delete all shirts;
DELETE FROM shirts;

-- DROP THE ENTIRE SHIRTS TABLE
DROP TABLE shirts;