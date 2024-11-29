CREATE TABLE dept(
	id INT PRIMARY KEY,
    name VARCHAR(20)
);

INSERT INTO dept(id, name) VALUES (2,"prio");
SELECT * FROM dept;
CREATE TABLE teacher(
	id INT PRIMARY KEY,
    name VARCHAR(10),
    dept_id INT,
    foreign key (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

UPDATE dept
SET id = 5
WHERE id = 1;

SELECT * FROM teacher;

UPDATE teacher 
SET id = 2
WHERE id = 3;

INSERT INTO teacher VALUES (3, "MAC", 2)