-- CONCAT(ITEM1,ITEM2,..,ITEMN)
-- SUBSTRING(columnName,startIndex,endIndex)
 SELECT CONCAT(SUBSTRING(title, 1,10), ".... Read More") AS more FROM books WHERE book_id>10;

-- REPLACE(columnName, oldWord, newWord);
 SELECT 
  CONCAT(
    SUBSTRING(
      REPLACE(title, "e", "3"),
      1,
      10
    ),
    " - ",
    "letter 'e' replaced with '3'"
  )
FROM 
books;

-- REVERSE(columnName)
SELECT
  book_id,
  CONCAT(REVERSE(author_fname), " ", REVERSE(author_lname)) AS content
FROM books
WHERE book_id > 5 AND book_id < 10;



-- CHAR_LENGTH(WORD) - RETURNS THE LENGTH of characters in a string
-- CONCAT_WS(column1, columnN) - trim or remove any whitespace
SELECT 
  book_id,
  CONCAT_WS(author_fname, " ", author_lname ) AS fullname,
  title,
  CHAR_LENGTH(CONCAT(author_fname, author_lname)) AS fullname_length
FROM books
WHERE CHAR_LENGTH(CONCAT_WS(" ", author_fname, author_lname))<=12;


SELECT
  book_id,
  author_lname,
  CONCAT(author_lname, " ", author_fname, " last name is ", CHAR_LENGTH(author_lname), " charcters long") AS length_desc
FROM books;

-- UPPER(word) and LOWER(word)
SELECT
  book_id,
  CONCAT
  (
    UPPER("my FAvouriTE book IS "), 
    UPPER(title)
  ) AS favourite_book,
  CONCAT
  (
    LOWER("It is WRITTEN BY: "), 
    LOWER(CONCAT(author_fname, " ", author_lname))
    ) AS writer
FROM books;

-- another one
SELECT
  CONCAT(
    SUBSTRING(title, 1, 10),
    "..."
  ) 
  AS "short title",
  CONCAT(
    author_lname,
    ",",
    author_fname
  ) 
  AS author,
  CONCAT(
    stock_quantity,
    " ",
    "in stock"
  ) AS quantity
FROM books
WHERE released_year=2001;
