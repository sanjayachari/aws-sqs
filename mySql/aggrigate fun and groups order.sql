-- Aggrigate function MAX, MINI, COUNT, SUM, AVG 

--  general ORDER

-- SELECT column
-- FROM table_name
-- WHERE condition
-- GROUP BY column
-- HAVING condition
-- ORDER BY column DESC

SELECT MAX(height) FROM students;

SELECT MIN(height) FROM students;

SELECT COUNT(id) FROM students;

SELECT SUM(height) FROM students;

SELECT AVG(height) FROM students;

-- GROUPS

SELECT location, AVG(height) FROM students
GROUP BY location  ORDER BY location DESC;


-- HAVING its like a WHERE but used in GROUPS
SELECT location, AVG(height) FROM students
GROUP BY location HAVING MAX(height) > 30 