--  DATE, TIME AND DATETIME
/* 
1. DATE     - values with a Date but No.        FORMAT - (YYYY-MM-DD)
2. TIME     - values with a Time but No Date.   FORMAT - (HH:MM:SS)
3. DATETIME - values with a Date and Time.      FORMAT - (YYYY-MM-DD HH:MM:SS) - Most useful;
*/

-- CREATING TIME
CREATE TABLE people(
   person_id INT NOT NULL AUTO_INCREMENT,
   name VARCHAR(100),
   birthdate   DATE,
   birthtime   TIME,
   birthdt     DATETIME,
   PRIMARY KEY (person_id)
);

INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES("Larry", "1943-12-25", "04:10:42", "1943-12-25 04:10:42");

-- WORKING WITH DATE DATATYPE
-- CURDATE()   - gives us current date;
-- CURTIME()   - gives us the current time
-- NOW()       - gives us the current datetime

INSERT INTO people(name,birthdate, birthtime, birthdt)
VALUES("Toaster", CURDATE(), CURTIME(), NOW());


-- FORMATTING DATES (AND DATETIMETIME)
-- DAY() - Extract the day
-- DAYNAME() - Extract the name of the day (Monday - Sunday)
-- DAYOFWEEK() - Week the date fall into between Sunday=1 - Saturday=7
-- DAYOFYEAR() - Extract the number the date fall into between 1 - 365 (366 if leap year). Day of the year.
-- MONTH() - YOU SHOULD KNOW
-- MONTHNAME() - Month name
-- HOUR() - to extract the hour.
-- MINUTE() - extract the minute

-- SELECT person_id, name, DAY(birthdT) AS date, birthdate FROM people;
-- SELECT person_id, name, DAYNAME(birthdate) AS dayname , birthdate FROM people;
-- SELECT person_id, name, DAYNAME(birthdate) AS dayname, DAYOFWEEK(birthdate) AS date, birthdate FROM people;
-- SELECT person_id, name, DAYOFYEAR(birthdate) AS date , birthdate FROM people;





 -- MONTH() DAY() YEAR() - April 21st 2017
-- Use DATE_FORMAT(DATE, FORMAT) TO ACHIEVE ABOVE.



-- DATE MATH - ADD, SUBTRACT, MANIPULATE DATE
DATEDIFF
DATE_ADD
DATE_SUB
SELECT person_id,name, DATEDIFF(NOW(), birthdate) as diff FROM people;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) as "Updated date" FROM people;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 DAY) as "Updated date" FROM people;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) as "Updated date" FROM people;

SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1:1 YEAR_MONTH) as "Updated date" FROM people;

SELECT birthdt, birthdt - INTERVAL 10 YEAR as "Updated date" FROM people;

SELECT birthdt, birthdt + INTERVAL 10 SECOND as "Updated date" FROM people;

SELECT birthdt, birthdt + INTERVAL 10 MINUTE as "Updated date" FROM people;

SELECT birthdt, birthdt + INTERVAL 24 HOUR as "Updated date" FROM people;

SELECT birthdt, birthdt + INTERVAL 1 DAY + INTERVAL 24 HOUR - INTERVAL 12 MONTH as "Updated date" FROM people;




-- TIMESTAMPS
-- START FROM 1970 END AT 2038
-- 4 BYTES COMPARED TO DATETIME OF 8 BYTES

CREATE TABLE comments(
   content VARCHAR(140),
   created_at TIMESTAMP DEFAULT NOW()
)

INSERT INTO comments(content)
VALUES("Best post have seen so far.");

SELECT * FROM comments ORDER BY created_at DESC;

-- store anytime a field was changed
CREATE TABLE comments2(
   content VARCHAR(140),
   changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO comments2(content)
VALUES("dogs");

UPDATE comments2 SET content = "rats" WHERE content="cats";



