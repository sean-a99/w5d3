PRAGMA foreign_keys = ON;

DROP TABLE question_likes;
DROP TABLE replies;
DROP TABLE question_follows;
DROP TABLE questions;
DROP TABLE users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR NOT NULL,
    lname VARCHAR NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR NOT NULL,
    body VARCHAR NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body VARCHAR NOT NULL,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (  
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO 
    users(fname, lname) 
VALUES
    ('Sean', 'Abbas'),
    ('Amin', 'Babar'),
    ('Clarence', 'Smith'),
    ('Peter', 'Kim'),
    ('Stephen', 'DiPietro');
    

INSERT INTO 
    questions(title, body, user_id)
VALUES
    ('How do I use Ruby?', 'I don''t know how to use Ruby', 4),
    ('How do I use SQL?', 'I don''t know how to use SQL', 4),
    ('How do I use Rails?', 'I don''t know how to use Rails', 2),
    ('How do I use HTML?', 'I don''t know how to use HTML', 3),
    ('How do I use CSS?', 'I don''t know how to use CSS', 1),
    ('How do I use JAVA?', 'I don''t know how to use JAVA', 1);

INSERT INTO 
    question_follows(user_id, question_id)
VALUES
    (1,2),
    (1,3),
    (1,5),
    (2,1),
    (2,2),
    (2,5),
    (3,4),
    (4,6),
    (5,2),
    (5,3);


INSERT INTO
    replies(body, question_id, parent_reply_id, user_id)
VALUES
    ('You sign up for AA.', 1,NULL,2),
    ('What is AA?', 1,1,5),
    ('It''s the language for DB.', 2,NULL,3),
    ('What''s DB?', 2,3,1),
    ('You make Shakushuka', 5,NULL,4);


INSERT INTO
    question_likes(user_id, question_id)
VALUES
    (3,5),
    (2,4),
    (1,3),
    (1,2),
    (5,4),
    (4,6),
    (5,5),
    (3,2),
    (3,1);
