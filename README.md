# Designing Instagram Database for Mobile App

This is a design of the sudo Instagram Database. It contains tables including: users, photos, comments, likes, follows, tags, photo_tags.

Data were inserted into database that simulates real-world scenario.

### Description of tables

users: users of instagram mobile app

photos: stores photos with each photos.id as PRIMARY KEY

comments: stores comments with comments.id as PRIMARY KEY and photo_id and user_id as FOREIGN KEYs

likes: stores likes of each posted photos with user_id and photo_id as FOREGIN KEYs

follows: describes followings and followers of each user, with FOREIGN KEYs as follower_id and follwee_id

photo_tags: an intermediate table between photos and tags for faster and better query

tags: stores hashtags for each posted photos  
