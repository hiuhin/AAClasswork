PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);


DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  parent_reply_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO
  users (fname, lname)
VALUES
  ('Alex', 'Segers'),
  ('Anne', 'Wong'),
  ('Ronil', 'Linor'),
  ('Mike', 'Ekim'),
  ('Vannessa', 'Assennav');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('What''s the purpose of life?', 'The purpose of is life recursion.', 2),
  ('Why I hate recursion', 'Reason #1: It sucks...', 1),
  ('Who let the dogs out?', 'Woof woof woof!', 2),
  ('Why did the chicken cross the road?', 'I don''t know....', 1);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (2, 2),
  (4, 1),
  (2, 3),
  (2, 4);

INSERT INTO
  replies (parent_reply_id, question_id, user_id, body)
VALUES
  (3, 1, 5, 'anything'),
  (3, 2, 5, 'everything'),
  (4, 3, 5, 'nothing at all'),
  (4, 4, 5, 'something');

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1,2),
  (1,3),
  (1,4),
  (3,4),
  (4,1),
  (4,3),
  (2,1),
  (2,2),
  (2,3),
  (2,4);
