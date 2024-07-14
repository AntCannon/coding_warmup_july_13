-- To run this file, use the following command:
-- psql -f posts.sql

DROP TABLE IF EXISTS posts;
DROP DATABASE IF EXISTS blog;
CREATE DATABASE blog;

\c blog;


-- Create posts table
CREATE TABLE
  posts
-- id SERIAL PRIMARY KEY,
  (id SERIAL PRIMARY KEY,
-- title VARCHAR(255),
  title VARCHAR(255),
-- body TEXT,
  body TEXT,
-- created_at TIMESTAMP,
  created_at TIMESTAMP,
-- updated_at TIMESTAMP
  updated_at TIMESTAMP);

  \d posts;

-- Alter posts table to include user name
ALTER TABLE
  posts
ADD COLUMN
  user_name VARCHAR(255);

\d posts;

-- Insert 5 posts into posts table
INSERT INTO
  posts
  (title, body, user_name)
VALUES
  ('post 1', 'This is post 1', 'user 1'),
  ('post 2', 'This is post 2', 'user 2'),
  ('post 3', 'This is post 3', 'user 1'),
  ('post 4', 'This is post 4', 'user 4'),
  ('post 5', 'This is post 5', 'user 5');

SELECT * FROM posts;

-- Delete a post with id of 1
DELETE FROM
  posts
WHERE
  id = 1;

SELECT * FROM posts;

-- Update the post with id of 2 to have the title "New Title"
UPDATE
  posts
SET
  title = 'New Title'
WHERE
  id = 2;

SELECT * FROM posts;

-- Create a users table
-- id SERIAL PRIMARY KEY,
-- name VARCHAR(255),
-- email VARCHAR(255),
-- password_digest VARCHAR(255),
-- created_at TIMESTAMP,
-- updated_at TIMESTAMP

CREATE TABLE
  users
  (id SERIAL PRIMARY KEY,
  user_name VARCHAR(255),
  email VARCHAR(255),
  password_digest VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
  );

\d users;

-- Insert 5 users into users table

INSERT INTO
  users
  (user_name, email, password_digest)
VALUES
  ('user 1', 'user1@email.com', 'user1PW'),
  ('user 2', 'user2@email.com', 'user2PW'),
  ('user 3', 'user3@email.com', 'user3PW'),
  ('user 4', 'user4@email.com', 'user4PW'),
  ('user 5', 'user5@email.com', 'user5PW');

SELECT * FROM users;

-- Update the posts table to include a foreign key for the user who created the post
ALTER TABLE
  posts
ADD COLUMN
  user_id INT;

\d posts;

-- Insert a new post into the posts table
INSERT INTO
  posts
  (title, body, user_name, user_id)
VALUES
  ('Newer post', 'This is a newer post', 'user 1', '1');

SELECT * FROM posts;

SELECT
  p.title, p.body,
  u.user_name, u.id AS user_id
FROM 
  posts AS p
INNER JOIN
  users AS u
ON
  p.user_id = u.id;