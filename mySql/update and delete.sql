SET SQL_SAFE_UPDATES = 0;
SELECT *  FROM students;


UPDATE students
SET bike = "NINJA"
WHERE height > 70;



UPDATE students
SET bike = "DUCATI"
WHERE id = 5;

UPDATE students
SET height = height - 1;

DELETE FROM students
WHERE height < 31