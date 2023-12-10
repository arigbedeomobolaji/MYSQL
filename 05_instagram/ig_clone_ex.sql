USE ig_clone;
-- Select the oldest 5 users
SELECT id,username,created_at FROM users 
ORDER BY created_at ASC
LIMIT 5;

-- day of the week do most user register
-- SELECT CONCAT(DAYNAME(created_at), " is the day most user created their accounts") AS analysis FROM users
-- GROUP BY DAYNAME(created_at)
-- ORDER BY COUNT(*) DESC LIMIT 1;

-- INACTIVE USERS - Users that haven't posted before
-- SELECT users.id AS user_id, username AS "Inactive Users" 
-- FROM users
-- LEFT JOIN photos
-- ON users.id = photos.user_id
-- WHERE user_id IS NULL
-- GROUP BY username
-- ORDER BY users.id;


-- wHO got the most likes on a single photo
-- SELECT photo_id, image_url, count(*) AS "total_likes" FROM likes
-- RIGHT JOIN photos
-- ON likes.photo_id = photos.id
-- GROUP BY photos.id
-- ORDER BY total_likes DESC
-- LIMIT 1;

-- How many times does the average user posts.
-- SELECT ((SELECT COUNT(*) FROM photos)/(SELECT COUNT(*) FROM users));

-- Top 5 most commonly used hashtags
-- SELECT tag_name,  COUNT(*) AS "Total time used" FROM tags
-- RIGHT JOIN photo_tags
-- ON tags.id = photo_tags.tag_id
-- GROUP BY tags.id
-- ORDER BY COUNT(*) DESC
-- LIMIT 1;

-- Filter out bots - find out the user that has liked every single photos
-- SELECT* from photos; // 257
SELECT *, COUNT(*) AS Total 
FROM users
LEFT JOIN likes
   ON users.id = likes.user_id
GROUP BY user_id
   HAVING Total = (SELECT COUNT(*) FROM photos)
ORDER BY COUNT(*) DESC;
--HAVING HELPS US TO GIVE CRITERIA TO OUR GROUPED DATA. 