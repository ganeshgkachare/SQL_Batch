-- Having Clause -

-- •	It is used to filter groups of rows returned by the Group by clause. 
-- •	Having clause is usually used with the Group by clause. 
-- •	If you use the having clause without the Group by clause, the having clause works like the where clause.
-- •	Difference between the having and where clauses is Having clause filters groups of rows while the where clause filters rows.

-- Syntax - 

-- SELECT column_list, group_function(column_name)
-- FROM Table
-- WHERE condition
-- GROUP BY group_by_expression/ column_list
-- HAVING having_expression
-- ORDER BY column_list /alias; 

select * from emp;

SELECT deptno, MIN(sal), MAX(sal), SUM(sal) 
FROM emp
WHERE JOB = 'CLERK'
GROUP BY deptno
HAVING MIN(sal)<1000
ORDER BY deptno;

SELECT deptno, MIN(sal), MAX(sal), SUM(sal) 
FROM emp
GROUP BY deptno
HAVING MIN(sal)<1000
ORDER BY deptno;

-- SQL Window Function

-- 1) Aggregate WF
--        COUNT() 
-- 		  SUM() 
-- 		  AVG() 
-- 		  MAX() 
-- 		  MIN() 





-- 2) Non Aggregate WF
-- 2.1) RANK WF
-- 		   ROW_NUMBER() - assigns a unique integer value to each row
--         RANK()       - gap in the sequence.
--         DENSE_RANK() - without gaps in the sequence.		

-- 2.2) VALUE WF
-- 		 LAG() - returns the value of a specified column for the previous row. 
-- 		 LEAD() - returns the value of a specified column for the next row. 


-- PARTITION BY clause
-- A PARTITION BY clause is used to partition rows of table into groups. 
-- It is useful when we have to perform a calculation on individual rows of a group using other rows of that group.

-- It is always used inside OVER() clause.
-- If this clause is omitted in OVER() clause, then whole table is considered as a single partition.

SELECT emp_no, first_name, last_name
FROM employees;

SELECT emp_no, first_name, last_name,
ROW_NUMBER() OVER () AS row_num
FROM employees;

SELECT emp_no, first_name, last_name,
ROW_NUMBER() OVER (PARTITION BY first_name ORDER BY last_name DESC) AS row_num
FROM employees;

SELECT emp_no, first_name, last_name,
ROW_NUMBER() OVER w AS row_num
FROM employees
WINDOW w AS (PARTITION BY first_name ORDER BY last_name);

-- ----------------------------------
drop table employee;
CREATE TABLE employee (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    salary INT NOT NULL
);

INSERT INTO employee (id, name, age, salary) VALUES
    (1, 'John', 28, 50000),
    (2, 'Mary', 35, 60000),
    (3, 'David', 42, 75000),
    (4, 'Sarah', 25, 45000),
    (5, 'Tom', 30, 55000),
    (6, 'Emily', 32, 65000),
    (7, 'Alex', 29, 52000),
    (8, 'Jessica', 31, 62000),
    (9, 'Mark', 27, 48000),
    (10, 'Lisa', 33, 68000),
     (11, 'Mark', 27, 48000),
    (12, 'Lisa', 33, 68000);

select * from employee;
-- drop table employee;
SELECT  id, name, age, salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employee;

SELECT * from employee;

SELECT  id, name, age, salary,
    LAG(salary) OVER (ORDER BY salary DESC) AS lag_salary,
    LEAD(salary) OVER (ORDER BY salary DESC) AS lead_salary
FROM employee;

SELECT  id, name, age, salary,
    ROW_NUMBER() OVER (PARTITION BY age ORDER BY salary DESC) AS row_num
FROM employee;

INSERT INTO employee (id, name, age, salary) VALUES
    (11, 'John', 28, 50000),
    (12, 'Mary', 35, 60000),
    (13, 'David', 42, 75000),
    (14, 'Sarah', 25, 45000),
    (15, 'Tom', 30, 55000),
    (16, 'Emily', 32, 65000),
    (17, 'Alex', 29, 52000),
    (18, 'Jessica', 31, 62000),
    (19, 'Mark', 27, 48000),
    (20, 'Lisa', 33, 68000);
    
INSERT INTO employee (id, name, age, salary) VALUES
    (11, 'John', 28, 50000),
    (12, 'Mary', 35, 60000),
    (13, 'David', 42, 75000),
    (14, 'Sarah', 25, 45000),
    (15, 'Tom', 30, 55000),
    (16, 'Emily', 32, 65000),
    (17, 'Alex', 29, 52000),
    (18, 'Jessica', 31, 62000),
    (19, 'Mark', 27, 48000),
    (20, 'Lisa', 33, 68000);
SELECT  id, name, age, salary,
    ROW_NUMBER() OVER (PARTITION BY age ORDER BY salary DESC) AS row_num
FROM employee;

SELECT  id, name, age, salary,
    RANK() OVER (ORDER BY salary DESC) AS rankSalary
FROM employee;

SELECT  id, name, age, salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rankSalary
FROM employee;



SELECT  id, name, age, salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num,
    RANK() OVER (ORDER BY salary DESC) AS rankSalary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rankSalary
FROM employee;

SELECT  id, name, age, salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num,
    RANK() OVER (ORDER BY salary DESC) AS rankSalary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rankSalary,
	LAG(salary) OVER (ORDER BY salary DESC) AS lag_salary,
    LEAD(salary) OVER (ORDER BY salary DESC) AS lead_salary
FROM employee;

-- -----------------------------------------------------------------
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


--  IF 
SELECT id, name,  age, gender, grade,
    IF(gender = "M", "Male", "Female") AS gender_full
FROM  students;

SELECT id, name,  age, gender, grade,
    IF(grade >= 90, 'A',IF(grade >= 80, 'B',IF(grade >= 70, 'C', 'F'))) AS grade_letter
FROM  students;

-- ----------------------------------
-- WHEN
SELECT id, name,  age, gender, grade,
    CASE 
        WHEN age >= 18 AND gender = "F" THEN 'Adult Female'
        WHEN age >= 18 AND gender = "M" THEN 'Adult Male'
        WHEN age >= 13 AND gender = "F" THEN 'Teen Female'
        WHEN age >= 13 AND gender = "M" THEN 'Teen Male'
        ELSE 'Child'
    END AS age_group
FROM students;

-- --------------------------------
SELECT id, name,  age, gender, grade,
    IF(grade >= 90, 'A', IF(grade >= 80, 'B',
    IF(grade >= 70, 'C', 'F'))) AS grade_letter,
    CASE 
        WHEN age >= 18 AND gender = "F" THEN 'Adult Female'
        WHEN age >= 18 AND gender = "M" THEN 'Adult Male'
        WHEN age >= 13 AND gender = "F" THEN 'Teen Female'
        WHEN age >= 13 AND gender = "M" THEN 'Teen Male'
        ELSE 'Child'
    END AS age_group
FROM students;



-- ---------------------------------------------
-- PROCEDURE

select * from employee;
desc employee;


-- Syntax
-- DELIMITER $$
-- CREATE PROCEDURE proc_name()
-- BEGIN
--    code
-- END $$
-- DELIMITER ;

-- create

DELIMITER $$
CREATE PROCEDURE proc_employee()
BEGIN
select * from employee;
desc employee;
select * from employee
where name="Tom";
END $$
DELIMITER ;

-- Call
call proc_employee;

-- Drop
drop procedure proc_employee;

-- ---------------------------------------------
select * from students;
-- create a procedure to calculate a student's grade and grade letter
DELIMITER $$
CREATE PROCEDURE calc_student_grade(
    IN student_name VARCHAR(50),
    OUT student_grade INT,
    OUT student_grade_letter VARCHAR(1)
)
BEGIN
    SELECT grade, 
        IF(grade >= 90, 'A', IF(grade >= 80, 'B', IF(grade >= 70, 'C', 'F'))) 
        INTO student_grade, student_grade_letter          -- INTO clause assigns the calculated values to the output parameters
    FROM  students
    WHERE  name = student_name;     -- The WHERE clause filters the student's record based on the provided student_name
END $$
DELIMITER ;

-- call the procedure with a student's name
CALL calc_student_grade('John', @grade, @grade_letter);

CALL calc_student_grade('Bob', @grade, @grade_letter);

-- select the results of the procedure call
SELECT @grade AS grade, @grade_letter AS grade_letter;

drop procedure calc_student_grade;

select * from students;


-- -----------------------------
