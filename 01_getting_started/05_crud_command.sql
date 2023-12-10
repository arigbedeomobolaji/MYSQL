-- Creating
CREATE TABLE cats (
   cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(100),
   breed VARCHAR (100),
   age INT
);

-- Insert data into cats table
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);


-- Reading data from database
SELECT * FROM cats;
-- * selects all columns;

-- To be specific;
-- SELECT columnsName_1 FROM tableName
SELECT cat_id,name,age from cats;

-- Let's Get specifical - the WHERE clause
-- SELECT columns_you_need FROM tableName WHERE columns=condition;
-- where is case sensitive;
SELECT cat_id,name,age FROM cats WHERE breed="Maine Coon";
SELECT * FROM cats WHERE age=4;

-- SELECT CHALLENGE
SELECT cat_id FROM cats;
SELECT name,breed FROM cats;
SELECT name,age FROM cats WHERE breed="tabby";
SELECT cat_id,age,name FROM cats WHERE cat_id=age;


-- introducing Aliases
-- It makes it easier to read result;
SELECT cat_id as catId, name FROM cats;


-- THE UPDATE COMMAND
-- UPDATE tableName SET columnToUpdate='ValueToUse' WHERE conditon;
UPDATE cats SET breed="shorthair"
WHERE breed="Tabby";

SELECT * FROM cats WHERE breed="shorthair";

UPDATE cats SET age=14 WHERE name="Misty";

-- UPDATE EXERCISE
UPDATE cats SET name="Jack" WHERE name="Jackson";
UPDATE cats SET breed="British Shorthair" WHERE name="Ringo";
UPDATE cats SET age=12 WHERE breed="Maine Coons";


-- DELETE operation
-- DELETE FROM tableName WHERE condition;
DELETE FROM cats WHERE name="Egg";

-- TO delete everything in a table
DELETE FROM tableName;


-- exercise
-- 1. Delete all cats that are 4 years old;
DELETE FROM cats WHERE age=4;
-- 2. Delete cats whose age is the same as their cat_id
DELETE FROM cats WHERE cat_id=age;
-- 3. Delete all cats
DELETE FROM cats;