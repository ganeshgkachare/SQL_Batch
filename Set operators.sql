-- Set operators

-- In MySQL, UNION, UNION ALL, INTERSECT, and EXCEPT are set operators used to combine or manipulate the results of 
-- two or more SELECT statements.

-- UNION operator:
-- The UNION operator is used to combine the results of two or more SELECT statements into a single result set.
--  The result set is distinct, meaning it contains only unique values.
--  If you want to include duplicate values, use the UNION ALL operator.

-- SELECT column1, column2, ... 
-- FROM table1 
-- UNION 
-- SELECT column1, column2, ... 
-- FROM table2;

-- UNION ALL operator:
-- The UNION ALL operator is similar to the UNION operator, but it includes all rows, including duplicates, from all SELECT statements.
--  This can be useful when you want to combine data from multiple tables or sources without removing any duplicate records.

-- SELECT column1, column2, ... 
-- FROM table1 
-- UNION ALL 
-- SELECT column1, column2, ... 
-- FROM table2;

-- INTERSECT operator:
-- The INTERSECT operator is used to combine the results of two or more SELECT statements, but only returns the records that are
--  common to all SELECT statements.

-- SELECT column1, column2, ... 
-- FROM table1 
-- INTERSECT 
-- SELECT column1, column2, ... 
-- FROM table2;

-- EXCEPT operator:
-- The EXCEPT operator is used to return all the records from the first SELECT statement that are not present in the results of the 
-- second SELECT statement. 

-- SELECT column1, column2, ... 
-- FROM table1 
-- EXCEPT 
-- SELECT column1, column2, ... 
-- FROM table2;

CREATE TABLE employees (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  salary INT
);

CREATE TABLE contractors (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  salary INT
);

desc employees;

INSERT INTO employees (id, name, salary) VALUES
  (1, 'Alice', 50000),
  (2, 'Bob', 60000),
  (3, 'Carol', 55000);
INSERT INTO employees (id, name, salary) VALUES (4, 'Bob', 60000);
INSERT INTO employees (id, name, salary) VALUES (2, 'Udit', 60000);
INSERT INTO contractors (id, name, salary) VALUES
  (1, 'Dave', 70000),
  (2, 'Eve', 65000),
  (3, 'Frank', 60000);
INSERT INTO contractors (id, name, salary) VALUES (4, 'Bob', 60000);
select * from employees;
select * from contractors;

-- UNION
SELECT name, salary
FROM employees
UNION
SELECT name, salary
FROM contractors;



-- UNION ALL 
SELECT name, salary
FROM employees
UNION ALL
SELECT name, salary
FROM contractors;


-- INTERSECT 
SELECT name, salary
FROM employees
INTERSECT
SELECT name, salary
FROM contractors;

-- Intersection
select * from salary;

SELECT name, salary
FROM employees e
WHERE EXISTS (
  SELECT 1
  FROM contractors c
  WHERE e.name = c.name AND e.salary = c.salary
);

-- -------------------------------------------------------------------------------
-- IFNULL and COALESCE

CREATE TABLE student_marks (
  roll_no INT,
  math_marks INT,
  science_marks INT,
  english_marks INT,
  history_marks INT,
  geography_marks INT,
  total_marks INT,
  PRIMARY KEY (roll_no)
);

INSERT INTO student_marks VALUES
  (1, 80, 90, NULL, 85, 95, NULL),
  (2, 90, 85, 75, NULL, 80, NULL),
  (3, 70, NULL, 80, 90, 85, NULL),
  (4, NULL, 70, 85, 80, NULL, NULL),
  (5, 85, NULL, NULL, 70, 75, NULL);
  
select * from student_marks;

-- IFNULL

SELECT  *FROM student_marks;

SELECT  *,  IFNULL(math_marks, 0)  FROM student_marks;
SELECT  *, math_marks,  IFNULL(math_marks, 0) as NM FROM student_marks;

SELECT  *,  IFNULL(math_marks, 0) as N_math_marks FROM student_marks;

SELECT  *,  IFNULL(math_marks, "Exam not given") as N_math_marks FROM student_marks;
SELECT  *,  IFNULL(math_marks, 35) as N_math_marks FROM student_marks;
SELECT  *,  IFNULL(math_marks, history_marks) as N_math_marks FROM student_marks;


-- COALESCE

select * from student_marks;
SELECT  *,  COALESCE(math_marks, 0) as N_math_marks FROM student_marks;
SELECT  *,  COALESCE(math_marks, "Exam nit given") as N_math_marks FROM student_marks;

SELECT  *,  COALESCE(science_marks, english_marks,history_marks,geography_marks) as N_science_marks FROM student_marks;

SELECT  *,  COALESCE(science_marks, english_marks,geography_marks,history_marks) as N_science_marks FROM student_marks;

-- -----------------------------------------
-- ROUND()
SELECT ROUND(456.8677888,0);
SELECT ROUND(456.4677888,0);
SELECT ROUND(456.845749867,1);
SELECT ROUND(456.8677888,2);
SELECT ROUND(456.8677888,4);

-- -----------------------------------------
-- LOWER() Function -

-- •	The  LOWER() function converts all letters in a string to lowercase.
-- •	The LOWER() function takes one argument.
-- •	The LOWER() function returns a string which all characters converted to lowercase.

-- Syntax - 

-- SELECT  LOWER(string)
-- FROM table_name;   

SELECT  LOWER( 'LOWER Function' );


SELECT  LOWER( 'LOWER Function' );



select * from employees;

SELECT *,LOWER(first_name) 
FROM employees;

SELECT *,LOWER(first_name) as data
FROM employees;





--
-- UPPER() function –

-- •	The UPPER() function converts all letters in a string to uppercase.
-- •	The UPPER() function takes one argument.
-- •	The UPPER() function returns a string which all characters converted to uppercase.

-- Syntax - 

-- SELECT  UPPER(string)
-- FROM table_name;   
   


SELECT  UPPER('Function' ) as Upper;


SELECT upper(first_name)
FROM employees;

-- CONCAT() function –

SELECT 5+3;

SELECT CONCAT('Hello ', 'World');

select * from employees;

SELECT *,CONCAT('My name is ',first_name,' and my date of birth is ', birth_date , gender) as Data
FROM employees;



-- --------------------------------------------------------------------------------

-- BETWEEN
-- The BETWEEN operator in MySQL is used to select values within a range of values.

CREATE TABLE Empl(
  EmployeeID INT NOT NULL AUTO_INCREMENT,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  Age INT NOT NULL,
  PRIMARY KEY (EmployeeID)
);

INSERT INTO Empl(FirstName, LastName, Age) VALUES ('John', 'Doe', 25);
INSERT INTO Empl(FirstName, LastName, Age) VALUES ('Jane', 'Smith', 30);
INSERT INTO Empl(FirstName, LastName, Age) VALUES ('Jane', 'Smith', 31);
INSERT INTO Empl(FirstName, LastName, Age) VALUES ('Jane', 'Smith', 32);
INSERT INTO Empl(FirstName, LastName, Age) VALUES ('Jane', 'Smith', 33);
INSERT INTO Empl(FirstName, LastName, Age) VALUES ('Jane', 'Smith', 34);
INSERT INTO Empl(FirstName, LastName, Age) VALUES ('Jane', 'Smith', 34);
INSERT INTO Empl(FirstName, LastName, Age) VALUES ('Bob', 'Johnson', 40);
INSERT INTO Empl(FirstName, LastName, Age) VALUES ('Tom', 'Williams', 50);
INSERT INTO Empl(FirstName, LastName, Age) VALUES ('Sara', 'Brown', 35);

SELECT 
    *
FROM
    empl; 

-- Select all employees whose first Age is between 30 and 40
SELECT * FROM Empl WHERE Age BETWEEN 30 AND 34;


SELECT * FROM Empl WHERE Age IN( 30 ,31,32,33,34);
SELECT * FROM Empl WHERE Age= 30 OR Age=31 OR Age=32 OR Age=33 OR Age=34;


SELECT * FROM Empl WHERE Age IN( 30 AND 40);

SELECT * FROM Empl WHERE Age Not BETWEEN 30 AND 34;


SELECT * FROM Empl WHERE Age Not IN( 30 ,31,33,34);


-- Select all employees whose first name is between 'J' and 'M'
SELECT * FROM Empl WHERE FirstName BETWEEN 'J' AND 'M';
SELECT * FROM Empl WHERE FirstName LIKE 'J%' OR FirstName LIKE 'K%' OR FirstName LIKE 'L%' OR FirstName LIKE 'M%';

-- NOT BETWEEN
SELECT * FROM Empl WHERE Age NOT BETWEEN 30 AND 40;
SELECT * FROM Empl WHERE FirstName NOT BETWEEN 'J' AND 'M';

-- -------------------------------------------------------------------------------------------------------------------------

-- Breaking the lengthy SQL statement into Multiple lines

-- It is a good practice to break lengthy SQL statements into multiple lines to improve readability and make it easier to understand.
-- There are several ways you can do this in MySQL:
-- 1) Use line breaks at logical points: keywords, clauses, or operators
-- 2) Indentation
-- 3) Use Comments
/* Ctrl+B or Click on Brush*/

-- Example
SELECT * FROM Empl WHERE Age NOT BETWEEN 30 AND 40;

SELECT 
    *
FROM
    Empl
WHERE
    Age NOT BETWEEN 30 AND 40;

SELECT 
    *
FROM
    Empl
WHERE
    Age NOT BETWEEN 30 AND 40;
-- ------------------------------------------------------------------------------------------------------------------------------

-- BETWEEN

-- SELECT * FROM dept_manager
-- WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01';

SELECT emp_no,hire_date FROM employees 
WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01';

SELECT emp_no,hire_date FROM employees 
WHERE hire_date not BETWEEN '1990-01-01' AND '1995-01-01';

SELECT emp_no,hire_date FROM employees 
WHERE hire_date In( '1990-01-01' AND '1995-01-01');

SELECT emp_no,hire_date FROM employees 
WHERE hire_date In( '1990-01-01' , '1995-01-01');

SELECT emp_no,hire_date FROM employees 
WHERE hire_date not In( '1990-01-01' , '1995-01-01');

-- ----------------------------------------------------------------
SELECT * FROM dept_manager;
SELECT * FROM employees;

-- Date
-- SELECT * FROM dept_manager
-- WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01';

SELECT emp_no,hire_date FROM employees 
WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01';

SELECT * FROM dept_manager
WHERE emp_no IN (SELECT emp_no FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01');




-- Find the list of employees which do not have departments?
SELECT * FROM DEPT;

SELECT * FROM DEPT WHERE NOT EXISTS (SELECT 1 FROM EMP WHERE DEPT.DEPTNO = EMP.DEPTNO);     -- Existence Check

SELECT 1 FROM EMP WHERE DEPT.DEPTNO = EMP.DEPTNO;





