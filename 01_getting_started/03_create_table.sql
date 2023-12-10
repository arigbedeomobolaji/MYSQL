-- Creating table syntax

CREATE TABLE tableName (
   column_name data_type,
   column_name data_type
);


-- Creating users table

CREATE TABLE users (
   name VARCHAR(100),
   age INT,
   email VARCHAR(100)
);

-- How to see the number of tables in our database
SHOW TABLES;

-- better approach
SHOW COLUMNS FROM <tableName>;

-- or

DESC <tableName>;



-- Deleting tables
DROP TABLE <tableName>



-- Exercise
CREATE TABLE pastries (
   name VARCHAR(50),
   quantity INT
);