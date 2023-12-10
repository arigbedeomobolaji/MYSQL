-- CHAR vs VARCHAR
-- CHAR has a fixed length; from 0 to 255;

-- NUMBERS
-- INT - Whole Number
-- DECIMAL - DECIMAL(5,2) - DECIMAL(MAX NO OF DIGIT, HOW_MANY DECIMAL POINT) - 99999.99
-- FLOAT - FLOAT AND DOUBLE will store larger numbers using less space but not precised as a decimal.

-- DATA_TYPE      MEMORY_NEEDED     PRECISION_ISSUES
-- FLOAT          4 Bytes           ~7 digits
-- DOUBLE         8 Bytes           ~15 digits

-- It's better to use DOUBLE
-- Always try to use DECIMAL unless precision doesn't matter
-- prices - DECIMAL otherwise DOUBLE




-- EXERCISE
CREATE TABLE inventory (
   item_name VARCHAR(200),
   price DECIMAL(7,2),
   quantity INT
);

-- THE CURRENT TIME
SELECT NOW();
SELECT CURRENT_TIMESTAMP;
-- CURRENT DATE
SELECT CURDATE();

-- CURRENT TIME
SELECT CURTIME();

-- DAY OF THE WEEK
SELECT DAYOFWEEK(NOW());
SELECT DAYNAME(NOW());

-- print date in mm/dd/yyyy format.
SELECT DATE_FORMAT(NOW(), "%m/%d/%Y");

-- format January 2nd at 3:15
SELECT DATE_FORMAT(NOW(), "%M %D at %l:%i");
SELECT DATE_FORMAT("2023/04/01 03:15:15", "%M %D at %l:%i");


CREATE TABLE tweet(
   content VARCHAR(140),
   username VARCHAR(150),
   created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO tweet(content, username)
VALUES("nice", 'paul');