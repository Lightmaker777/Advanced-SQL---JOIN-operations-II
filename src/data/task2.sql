-- Task 1

CREATE TABLE module (
    id serial PRIMARY KEY,
    name varchar(100),
    teacher integer,
    FOREIGN KEY (teacher) REFERENCES mentor(id)
);

INSERT INTO module(id, name, teacher) VALUES
    (1, 'Computer Basics', 4),
    (2, 'Python Basics', 5),
    (3, 'Python Algorithms', 1),
    (4, 'Python Data Structures', 6),
    (5, 'Python Web Frameworks', 2),
    (6, 'Database Basics', 9),
    (7, 'SQL', 7),
    (8, 'Advanced SQL', 3),
    (9, 'Django Basics', 2),
    (10, 'Django Admin', 8),
    (11, 'Django ORM', NULL),
    (12, 'Frontend', 2);
