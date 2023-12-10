-- create the student Table
CREATE TABLE students (
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(100) NOT NULL
);

-- Create the paper table with the students(id) as the foreign key
CREATE TABLE papers (
   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   title VARCHAR(200) NOT NULL,
   grade INT NOT NULL,
   student_id INT NOT NULL,
   FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

-- Insert data into the students and papers table
INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);



-- inner join 001
SELECT first_name, title,grade FROM students
JOIN papers 
ON students.id = papers.student_id
ORDER BY first_name DESC, grade DESC;

-- LEFT JOIN
SELECT first_name, title, grade FROM students
LEFT JOIN  papers
ON students.id = papers.student_id;

SELECT first_name, 
IFNULL(title, "MISSING") AS title, 
IFNULL(grade, 0) AS grade 
FROM students LEFT JOIN papers
ON students.id = papers.student_id


-- Average grade for every student
SELECT first_name, AVG(IFNULL(grade,0)) AS average FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;

-- print passed student
SELECT first_name, 
AVG(IFNULL(grade,0)) AS average,
IF(AVG(IFNULL(grade,0)) <= 75, "FAILING", "PASSING") AS passing_status
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;