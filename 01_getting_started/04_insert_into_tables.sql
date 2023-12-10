-- inserting data into table
INSERT INTO tableName (columns_1, columns_2, ..., columns_N)
VALUES(value_1, value_2, ..., value_N);

-- orders we write our columns and values natters;


-- example
CREATE TABLE  users(
   name VARCHAR(100),
   age INT,
   occupation VARCHAR(50)
);

INSERT INTO USERS(name, age, occupation) 
VALUES("Olayinka", 18, "Student")

-- reading data in a table
SELECT * FROM <tableName>;


-- multiple Insert
INSERT INTO users(age, name, occupation)
VALUES
(10, "Olayinka", "Student"),
(18, "Omolola", 'Developer');




-- Exercise
CREATE TABLE people (
   first_name VARCHAR(20),
   last_name VARCHAR(20),
   age INT
);

DESC people;

INSERT INTO people(first_name, last_name, age)
VALUES("Tina", "Belcher", 13);


INSERT INTO people(first_name, last_name, age)
VALUES("Bob", "Belcher", 42);


INSERT INTO people(first_name, last_name, age)
VALUES 
("Linda", "Belcher", 45),
("Phillip", "Frond", 38),
("Calvin", "Fishhoeder", 70);


-- To Show warning
SHOW WARNINGS;


-- NULL & NOT_NULL
-- Null means the value is not known - it doesn't mean zero
-- How do we prevent NULL in our db? answer is NOT_NULL
-- NOT_NULL means it will not be permitted to be empty.
-- NOT NULL is equivalent to REQUIRED IN MONGODB
CREATE TABLE users2 (
   name VARCHAR(100) NOT NULL,
   age INT NOT NULL
);


-- Default values - if something is not specified there will be a fallback;

CREATE TABLE users3(
   name VARCHAR(100) DEFAULT "No name provided",
   age INT DEFAULT 99
);



-- primary key - data to be uniquely identifiable - A unique identifier on a row.
CREATE TABLE unique_user (
   user_id INT NOT NULL AUTO_INCREMENT,
   name VARCHAR(100) NOT NULL,
   age INT NOT NULL,
   PRIMARY KEY (user_id)
);


-- Exercise
CREATE TABLE employees (
   employee_id INT NOT NULL AUTO_INCREMENT,
   last_name VARCHAR(50) NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   middle_name VARCHAR(50),
   age INT NOT NULL,
   current_status VARCHAR(100) NOT NULL DEFAULT "employed",
   PRIMARY KEY (employee_id)
);

CREATE TABLE employees2 (
   employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   last_name VARCHAR(50) NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   middle_name VARCHAR(50),
   age INT NOT NULL,
   current_status VARCHAR(100) NOT NULL DEFAULT "employed"
);


INSERT INTO employees(last_name, first_name, middle_name,age,current_status)
VALUES("Arigbede", "Omobolaji", "Paul", 20, "Developer");

INSERT INTO employees(last_name, first_name, age) 
VALUES("Adewole", "Ridwan", 19),
("Adeloju", "Seyi", 28);


-- CREATE TABLE employees(
--    employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--    firstname VARCHAR(100) NOT NULL,
--    surname VARCHAR(100) NOT NULL,
--    middlename VARCHAR(50),
--    age INT NOT NULL,
--    current_status VARCHAR(50) NOT NULL DEFAULT "employed"
-- );