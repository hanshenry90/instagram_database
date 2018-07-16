-- Below is a real-world scenario where shareholder needs to find crucial information from the instagram database for decision making.

-- 1. We want to reward our users by sending thank you emails who have been around the longest. Find the 5 oldest users.
select * from users order by created_at limit 5;

-- 2. What day of the week do most users register on? We need to figure out when to
-- schedule an ad campaign.
select * from comments group by created_at limit 10;

select username,  day(created_at) as day, count(day(created_at)) as COUNT
from users group by day
order by COUNT DESC
limit 1;

-- 3. We want to target our inactive users with an email campaign. Find the users who have posted a photo.

select users.id, username from photos
right join users
    on users.id = photos.user_id

where user_id is null;

-- 4. We're running a new contest to see who can get the most likes on a single photo. Who won the contest?

select photo_id, count(*) as total from photos
join likes
    on photos.id = likes.photo_id

group by photo_id
order by total desc;


-- 5. Our investors want to know... How many times does the average user post?

select count(id) from users;

select count(id) from photos;

select (select count(id) from photos) / (select count(id) from users) as AVG;

-- 6. A brand wants to know which hashtags to use in a post. What are the top 5 most commonly used hashtags?

select tags.id, tag_name, count(*) as total from tags
join photo_tags
    on tags.id = photo_tags.tag_id
group by tags.id
order by total desc;

-- 7. We have a small problem bots on our site...Find users who have liked every single photo on the site.

select photos.id as 'photo id', users.id as 'user id', username from photos
inner join likes
    on photos.id = likes.photo_id    
inner join users
    on photos.user_id = users.id
order by users.id
limit 50;

select photos.id as 'photo id', likes.user_id as 'user id', count(*) as 'total' from photos
inner join likes
    on photos.id = likes.photo_id
group by likes.user_id
having total = 257;