-- qs1:
CREATE DATABASE school;
USE school;

CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    birthday DATE,
    email VARCHAR(100)
);

INSERT INTO student (name, birthday, email) VALUES
('Nguyen Van A', '2000-01-15', 'nguyenvana@example.com'),
('Tran Thi B', '2001-02-20', 'tranthib@example.com'),
('Le Van C', '2002-03-25', 'levanc@example.com'),
('Pham Thi D', '2003-04-30', 'phamthid@example.com');

--  qs2:
ALTER TABLE student
ADD COLUMN address VARCHAR(255);

ALTER TABLE student
CHANGE COLUMN name full_name VARCHAR(100);

-- qs3:
SELECT * FROM student;

SELECT full_name, email
FROM student
WHERE birthday > '1995-12-31';

SELECT * FROM student
ORDER BY birthday DESC;

-- qs4:
UPDATE student
SET email = NULL
WHERE full_name LIKE 'Nguyen%';

DELETE FROM student
WHERE birthday < '1992-01-01';

-- qs5:
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

INSERT INTO courses (name, description) VALUES
('Mathematics', 'Basic and advanced concepts in Mathematics'),
('Physics', 'Study of matter, motion, and energy'),
('Chemistry', 'Chemical reactions and properties of substances'),
('Biology', 'Study of living organisms');

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO enrollments (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 4),
(4, 2),
(4, 3);

-- qs6:
SELECT s.full_name, c.name AS course_name
FROM student s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.id;


SELECT s.full_name, c.name AS course_name
FROM student s
LEFT JOIN enrollments e ON s.id = e.student_id
LEFT JOIN courses c ON e.course_id = c.id;





