SELECT * FROM students;

ALTER TABLE students
ADD COLUMN property VARCHAR(10) DEFAULT "hnr";

ALTER TABLE students
DROP COLUMN property;

ALTER TABLE students
MODIFY COLUMN property INT;

--  changing the column name
ALTER TABLE students
CHANGE property myprop INT;

--  changing the table name
ALTER TABLE stud
RENAME TO students
