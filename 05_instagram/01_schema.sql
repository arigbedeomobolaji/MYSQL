-- user table
-- post table =? A user can have many post and A post can be posted by one User
-- comment table => A post can have many comment and A comment can belong to only one post
-- hastags table => A post can have many Hastga and A HashTags can be used in many post
-- Following table => followers and folllows = > A user has manu Followers and he can follow many people
-- post HashTag Table => relationship between point and hashtag
-- postPhoto
-- We use id as primary key cus in terms of performance it's faster

DROP DATABASE ig_clone;
CREATE DATABASE ig_clone;
use ig_clone;

CREATE TABLE users(
   id INTEGER AUTO_INCREMENT PRIMARY KEY,
   username VARCHAR(255) UNIQUE NOT NULL,
   created_at TIMESTAMP DEFAULT NOW()
);


CREATE TABLE photos(
   id INTEGER AUTO_INCREMENT PRIMARY KEY,
   image_url VARCHAR(255) NOT NULL,
   caption VARCHAR(255),
   user_id INTEGER NOT NULL,
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
 );

 CREATE TABLE comments(
   id INT AUTO_INCREMENT PRIMARY KEY,
   comment_text VARCHAR(255) NOT NULL,
   user_id INT NOT NULL,
   photo_id INT NOT NULL,
   created_at TIMESTAMP DEFAULT NOW(),
   FOREIGN KEY (user_id) REFERENCES users(id),
   FOREIGN KEY (photo_id) REFERENCES photos(id)
 );

--  Likes table
CREATE TABLE likes(
   user_id INTEGER NOT NULL,
   photo_id INTEGER NOT NULL,
   FOREIGN KEY (user_id) REFERENCES users(id),
   FOREIGN KEY (photo_id) REFERENCES photos(id),
   PRIMARY KEY(user_id, photo_id)
);

-- followers table
CREATE TABLE follows(
   follower_id INT NOT NULL,
   followee_id INT NOT NULL,
   created_at TIMESTAMP DEFAULT NOW(),
   FOREIGN KEY (follower_id) REFERENCES users(id),
   FOREIGN KEY (followee_id) REFERENCES users(id),
   PRIMARY KEY(follower_id,followee_id)
);

CREATE TABLE tags(
   id INTEGER AUTO_INCREMENT PRIMARY KEY,
   tag_name VARCHAR(255) NOT NULL UNIQUE,
   created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags(
   photo_id INT NOT NULL,
   tag_id INT NOT NULL,
   FOREIGN KEY (photo_id) REFERENCES photos(id),
   FOREIGN KEY (tag_id) REFERENCES tags(id),
   PRIMARY KEY (photo_id, tag_id)
);

INSERT INTO users(username) VALUES
("BlueTheCat"),
("TheMafiaLord"),
("coltSteele");

INSERT INTO photos(image_url, user_id, caption) VALUES
('/jdjdjd3', 1, "Sunrise"),
('/kjdfjdj', 2, "Working Wonder"),
('/fjsdjd', 2, "cute me");

INSERT INTO comments(comment_text, user_id, photo_id) VALUES
("Meow!", 1,2),
("Amazing Shot!", 3,2),
('I <3 This', 2,2);

INSERT INTO likes(user_id,photo_id) 
VALUES(1,1),
(2,1),
(1,3),
(3,3);

INSERT INTO follows(follower_id, followee_id) VALUES(1,2),
(3,1),
(1,3),
(2,3);

INSERT INTO tags(tag_name) VALUES
('adorable'),
('cute'),
('sunrise');

INSERT INTO photo_tags(photo_id, tag_id) VALUES
(1,1),
(1,2),
(2,3),
(3,2);

-- tHIS WON'T WORK
-- INSERT INTO likes(user_id,photo_id) VALUES
-- (1,1);


-- SHOW TABLES;
-- DESC users;
-- describe photos;
-- describe comments;





































-- -- select users
-- SELECT * FROM users;

-- -- select photos
-- SELECT * FROM photos;

-- -- Join user and photos together
-- SELECT username, image_url FROM users
-- RIGHT JOIN photos 
-- ON users.id = photos.user_id;