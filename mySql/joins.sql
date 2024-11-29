CREATE TABLE childjoin (
	id INT,
    name VARCHAR(10),
    bike VARCHAR(10)
);

INSERT INTO childjoin (id,name,bike) VALUES (1,"sweat", "DUKE"),
(2,"Mathew", "R3"),
(3,"gag", "RE");

-- comman between two table
SELECT * FROM students as a
INNER JOIN childjoin as b
ON a.id = b.id;

-- only left
SELECT * FROM students as a
LEFT JOIN childjoin as b
ON a.id = b.id;

-- only right
SELECT * FROM students as a
RIGHT JOIN childjoin as b
ON a.id = b.id;


--  full join
SELECT * FROM students as a
LEFT JOIN childjoin as b
ON a.id = b.id
UNION
SELECT * FROM students as a
RIGHT JOIN childjoin as b
ON a.id = b.id;

-- left exclusive
SELECT * FROM students as a
LEFT JOIN childjoin as b
ON a.id = b.id
WHERE b.id IS NULL;

-- right exclusive
SELECT * FROM students as a
RIGHT JOIN childjoin as b
ON a.id = b.id
WHERE a.id IS NULL;

SELECT * FROM students;
SELECT * FROM childjoin;