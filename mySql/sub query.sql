SELECT * FROM students;

SELECT AVG(height) FROM students;

--  static sub query
SELECT height,name FROM students
WHERE height > 70;


-- dynamic sub query
SELECT height,name FROM students
WHERE height > (SELECT AVG(height) FROM students);


-- view 

CREATE VIEW view1 as SELECT * FROM students;

SELECT * FROM view1