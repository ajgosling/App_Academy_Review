DROP TABLE if exists users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
)

INSERT INTO
  users
    (fname, lname)
VALUES
    ('AJ', 'Gosling'),
    ('Jourdan', 'Lieblich'),
    ('Alix', 'Lieblich'),
    ('Dan', 'Gosling'),
    ('Elliot', 'Grossman'),

DROP TABLE if exists questions;

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
)

INSERT INTO
  questions
    (title, body, author_id)
VALUES
    (
        'Is Avatar the greatest series ever?',
        'I was wonder what all of you thought about the avatar series.',
        (SELECT id FROM users WHERE fname = 'AJ')
    ),
    (
        'Wondering how to install a climbing hangboard?',
        'I am trying to follow this youtube channel that teaches me how to install a hangboard but I am not quite getting the hang of it',
        (SELECT id FROM users WHERE fname = 'Jourdan')
    ),
    (
        'Which college should I go to?',
        'I am really torn between Cal Poly and Hawaii',
        (SELECT id FROM users WHERE fname = 'Alix')
    )
DROP TABLE if exists question_follows;

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
)

-- This is an example of a join table; the rows in question_follows are used to join users to questions and vice versa.
-- Add a replies table.

DROP TABLE if exists replies;

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id)
)
-- Add a question_likes table.
DROP TABLE if exists likes;

CREATE TABLE likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
)
-- Users can like a question.
-- Have references to the user and the question in this table

