-- Create a new database
CREATE DATABASE <dbName>;

-- Use the newly created daatabase
USE {dbName>};

-- List current databases that exist
SHOW DATABASES;



-- Creating Databases
-- CREATE DATABASE databaseName;

-- Drop a Database or Delete a Database
DROP DATABASE databaseName;

-- Tell mySQL which database you want to use.
USE databaseName

-- Tell the current database we are using.
SELECT database();

-- RUN AN SQL FILE 
-- make sure you are in the filename current working directory;
SOURCE filename.sql;



-- Show tables in a Database
SHOW TABLES;