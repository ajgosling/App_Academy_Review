PRAGMA foreign_keys = ON;

DROP TABLE if exists question_likes;
DROP TABLE if exists replies;
DROP TABLE if exists question_follows;
DROP TABLE if exists questions;
DROP TABLE if exists users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

INSERT INTO
  users (fname, lname)
VALUES
    ('AJ', 'Gosling'),
    ('Jourdan', 'Lieblich'),
    ('Alix', 'Lieblich'),
    ('Dan', 'Gosling'),
    ('Elliot', 'Grossman');


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
  questions (title, body, author_id)
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
    );


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
    (
        (SELECT id FROM users WHERE fname = 'AJ'),
        (SELECT id FROM questions WHERE title LIKE '%Avatar%')
    ),
    (
        (SELECT id FROM users WHERE fname = 'Alix'),
       (SELECT id FROM questions WHERE title LIKE '%Avatar%')
    ),
    (
        (SELECT id FROM users WHERE fname = 'Jourdan'),
        (SELECT id FROM questions WHERE title LIKE '%Avatar%')
    ),
    (
        (SELECT id FROM users WHERE fname = 'AJ'),
        (SELECT id FROM questions WHERE title LIKE '%college%')
    );


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    user_id INTEGER NOT NULL,

   FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id)
);

INSERT INTO
  replies (body, question_id, parent_id, user_id)
VALUES
    (
        'Avatar is certainly the best series! who is the best character?',
        (SELECT id FROM questions WHERE title LIKE '%Avatar%'),
        NULL,
        (SELECT id FROM users WHERE fname = 'Jourdan')
    ),
   (
        'For my money it is Iroh!',
        (SELECT id FROM questions WHERE title LIKE '%Avatar%'),
        (SELECT id FROM replies WHERE body LIKE '%best%'),
        (SELECT id FROM users WHERE fname = 'Alix')
    ),
    (
        'It has to be Toph!',
        (SELECT id FROM questions WHERE title LIKE '%Avatar%'),
        (SELECT id FROM replies WHERE body LIKE '%best%'),
        (SELECT id FROM users WHERE fname = 'AJ')
    );


CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
    (
        (SELECT id FROM users WHERE fname = 'AJ'),
        (SELECT id FROM questions WHERE title LIKE '%Avatar%')
    ),
    (
        (SELECT id FROM users WHERE fname = 'Alix'),
       (SELECT id FROM questions WHERE title LIKE '%Avatar%')
    ),
    (
        (SELECT id FROM users WHERE fname = 'Jourdan'),
        (SELECT id FROM questions WHERE title LIKE '%Avatar%')
    ),
    (
        (SELECT id FROM users WHERE fname = 'AJ'),
        (SELECT id FROM questions WHERE title LIKE '%college%')
    );
