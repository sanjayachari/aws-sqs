USE college;

SELECT * FROM students LIMIT 2;
SELECT * FROM students 
ORDER BY ID DESC;


CREATE TABLE students(
	id INT PRIMARY KEY,
    name VARCHAR(20),
    bike VARCHAR(20),
    height INT,
    location VARCHAR(20)
);

CREATE TABLE office (
	age INT CHECK (age < 10)
);

INSERT INTO office (age) VALUES (9);

SELECT * FROM office;

DROP TABLE students;

INSERT INTO students (id, name, bike, height, location) 
VALUES (1, "san","RS", 20, "banglore"),
(2, "arch","RC", 30, "hyderabad"),
(3, "anvi","R3", 40, "delhi");

-- TRUNCATE TABLE students;
SELECT location, bike FROM students WHERE height > 20;
SELECT * FROM students WHERE location IN ("delhi");
SELECT * FROM students WHERE location NOT IN ("delhi");


