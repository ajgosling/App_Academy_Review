DROP TABLE if exists users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
)

DROP TABLE if exists questions;

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
)

DROP TABLE if exists question_follows;

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
)


-- This should support the many-to-many relationship between questions and users (a user can have many questions she is following, and a question can have many followers).
-- This is an example of a join table; the rows in question_follows are used to join users to questions and vice versa.
-- Add a replies table.
-- Each reply should contain a reference to the subject question.
-- Each reply should have a reference to its parent reply.
-- Each reply should have a reference to the user who wrote it.
-- Don't forget to keep track of the body of a reply.
-- "Top level" replies don't have any parent, but all replies have a subject question.
-- It's okay for a column to be self referential; a foreign key can point to a primary key in the same table.
-- Add a question_likes table.
-- Users can like a question.
-- Have references to the user and the question in this table