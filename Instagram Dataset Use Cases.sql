-- The following queries were based on an Instagram Clone dataset.
-- Rather than exercises with certain functions, these are more of real life use cases for SQL queries.
-- Each query begins with the question being asked.


-- We want to reward our users who have been around the longest. Find the 5 oldest users.

SELECT 
  * 
FROM 
  users 
ORDER BY 
  created_at 
LIMIT 
  5;
  
  
-- We need to figure out when to schedule an ad campaign.
-- What day of the week do most users register on?

SELECT 
  DAYNAME(created_at) as weekday, 
  COUNT(*) as weekday_count 
FROM 
  users 
GROUP BY 
  weekday 
ORDER BY 
  weekday_count DESC;
  
  
-- We want to target our inactive users with an email campaign.
-- Find the suers who have never posted a photo.

SELECT 
  username, 
  image_url 
FROM 
  users 
  LEFT JOIN photos ON photos.user_id = users.id 
WHERE 
  photos.id IS NULL;
  
  
-- We're running a new contest to see who can get the most likes on a single photo.
-- Who won?

SELECT 
  username, 
  photos.id, 
  photos.image_url, 
  COUNT(*) as total 
FROM 
  photos 
  JOIN users ON photos.user_id = users.id 
  JOIN likes ON photos.id = likes.photo_id 
GROUP BY 
  photos.id 
ORDER BY 
  total DESC 
LIMIT 
  25;
  
  
-- How many times does the average user post?

SELECT 
  (
    SELECT 
      COUNT(*) 
    FROM 
      photos
  ) / (
    SELECT 
      COUNT(*) 
    FROM 
      users
  ) as Average;
  
  
-- What are the top 5 most commmonly used hashtags?

SELECT 
  tag_name, 
  COUNT(*) as Total 
FROM 
  tags 
  JOIN photo_tags ON photo_tags.tag_id = tags.id 
GROUP BY 
  tags.id 
ORDER BY 
  Total DESC 
LIMIT 
  5;
  
  
-- Problem with bots!
-- Find users who have liked every single photo on the site.

SELECT 
  username, 
  user_id, 
  COUNT(*) AS total 
FROM 
  users 
  INNER JOIN likes ON users.id = likes.user_id 
GROUP BY 
  likes.user_id 
HAVING 
  total = (
    SELECT 
      COUNT(*) 
    FROM 
      photos
  );
