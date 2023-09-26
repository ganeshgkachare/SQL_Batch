-- Trigger

-- triggers are database objects that are associated with a table and are activated when 
-- a particular event occurs, such as an insert, update, or delete operation on the table.

-- Syntax

-- CREATE TRIGGER trigger_name
-- trigger_time (Before/After) trigger_event (Insert/Update/Delete) ON table_name
-- Action (FOR EACH ROW/STATEMENT)
-- BEGIN
--  trigger body
-- END;


-- trigger_time: when the trigger should be activated (BEFORE or AFTER)
-- trigger_event: the event that triggers the trigger (INSERT, UPDATE, or DELETE)
-- table_name: the name of the table that the trigger is associated with

-- Action
-- 1) FOR EACH ROW (Row-Level Trigger):
-- 		FOR EACH ROW: specifies that the trigger should be activated for each row affected by the event
-- 		This is the most common and default type of trigger in MySQL. It means that the trigger is executed once for each row affected by the triggering event. For example, before each row is inserted, updated, or deleted.
-- 2)FOR EACH STATEMENT (Statement-Level Trigger):
-- 		This type of trigger fires once for each triggering event, regardless of the number of rows affected.
-- 		 It executes a single time for a group of rows that share the same triggering event. Statement-level triggers are less common but can be useful in specific scenarios

-- drop table users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

INSERT INTO users (name, age, gender) VALUES
    ('John', 25, ''),
    ('Jane', 30, ''),
    ('Bob', 18, ''),
    ('Alice', 40, ''),
    ('Mark', 28, ''),
    ('Sara', 22, ''),
    ('Mike', 35, ''),
    ('Emily', 20, ''),
    ('Tom', 45, ''),
    ('Lily', 27, '');
    
-- Syntax

-- CREATE TRIGGER trigger_name
-- trigger_time (Before/After) trigger_event (Insert/Update/Delete) ON table_name
-- Action (FOR EACH ROW/STATEMENT)
--  trigger body;

CREATE TRIGGER set_gender_trigger
BEFORE INSERT ON users
FOR EACH ROW
SET NEW.gender = 'Male';

select * from users;

INSERT INTO users (name, age, gender) VALUES
    ('John', 25, '');

INSERT INTO users (name, age, gender) VALUES
    ('Udit', 26, 'Female');

select * from users;
INSERT INTO users (name, age, gender) VALUES
    ('John', 26, ''),
    ('Raj', 28, '');
    
select * from users;

DROP TRIGGER IF EXISTS set_gender_trigger;


-- -----------------------------------------------------------------------------------------------------------------------------------


-- Common Table Expressions (CTE) 
	-- A common table expression (CTE) is a named temporary result set that exists within the scope of
	-- a single statement and that can be referred to later within that statement, possibly multiple times.
	-- CTEs can be useful for simplifying complex SQL queries and improving query performance.


-- Why do We Need CTE?
-- 		A CTE is a powerful SQL construct that helps simplify queries.
--  	CTEs act as virtual tables (with records and columns) that are created during query execution, used by the query, 
--  	and deleted after the query executes.

-- Used?
-- Subqueries: When you have a complex subquery that needs to be used multiple times within a query,
--              you can use a CTE to simplify the query and avoid redundant calculations.
-- Aggregations: When you need to calculate aggregated values over subsets of data, you can use a CTE to 
--              first calculate the subsets and then perform the aggregations.

-- Create a CTE
	-- We use the WITH keyword followed by the CTE_name and the query that defines the CTE:
		-- WITH cte_name AS (
		--    SELECT ...
		--    FROM ...
		--    WHERE ...
		-- )
	-- You can then use the CTE in subsequent queries:
		-- SELECT ...
		-- FROM cte_name
		-- JOIN ...
        
drop table students;
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    grade INT
);
INSERT INTO students (name, age, gender, grade) VALUES
    ('John', 18, 'M', 90),
    ('Jane', 17, 'F', 85),
    ('Bob', 18, 'M', 80),
    ('Alice', 16, 'F', 92),
    ('Tom', 17, 'M', 70),
    ('Mary', 16, 'F', 88),
    ('David', 18, 'M', 78),
    ('Cathy', 17, 'F', 96),
    ('Peter', 18, 'M', 85),
    ('Sarah', 16, 'F', 93);

select * from students;


select * from students;

-- avg gender wise
WITH male_students AS (
   SELECT grade
   FROM students
   WHERE gender = 'M'
), female_students AS (
   SELECT grade
   FROM students
   WHERE gender = 'F'
)
SELECT AVG(grade) AS male_avg_grade, (SELECT AVG(grade) FROM female_students) AS female_avg_grade
FROM male_students;


select * FROM students;


WITH top_students AS (
   SELECT id, name, age, gender, grade
   FROM students
   WHERE grade >= (SELECT AVG(grade) FROM students)
)
SELECT *
FROM top_students
ORDER BY grade DESC;


WITH top_students AS (
   SELECT id, name, gender, grade
   FROM students
   WHERE grade >= (SELECT AVG(grade) FROM students)
)
SELECT *
FROM top_students
ORDER BY grade DESC;

WITH top_students AS (
   SELECT id, name, age, gender, grade
   FROM students
   WHERE grade >= (SELECT AVG(grade) FROM students)
)
SELECT *
FROM top_students
ORDER BY grade DESC
LIMIT 3;



-- -----------------------------------------------------------------------------------------------------------------------------------
