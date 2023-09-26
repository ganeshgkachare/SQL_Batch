
-- Using Correlated Subquery -   

-- --Requirement? 

-- Retrieve rows from the "EMP" table where the current employee  has exactly two employees working under them.
SELECT * FROM EMP E
WHERE 2 IN(SELECT COUNT(*) FROM EMP B WHERE B.MGR = E.EMPNO);

  
SELECT * FROM EMP E
WHERE 3 IN(SELECT COUNT(*) FROM EMP B WHERE B.MGR = E.EMPNO);
  



SELECT * FROM EMP 
WHERE MGR=7566;

SELECT * FROM EMP 
WHERE MGR=7902;

SELECT * FROM EMP 
WHERE MGR=7839; -- 2 <=
SELECT * FROM EMP 
WHERE MGR=7360;

-- EXISTS 

-- •	The EXISTS operator is a logical operator that allows you to check whether a subquery returns any row.
-- •	The EXISTS operator returns TRUE if the subquery returns one or more rows.

-- Syntax -
-- SELECT * FROM TABLE_NAME
-- WHERE EXISTS (SUBQUERY);

-- •	The subquery is a SELECT statement only. 
-- •	As soon as the subquery returns rows, the EXISTS operator returns TRUE and stops processing immediately.
-- Example -

-- Using EXISTS with a correlated subquery

SELECT * FROM EMP E
WHERE EXISTS (SELECT 11  FROM EMP B WHERE B.MGR = E.EMPNO ); -- The EXISTS keyword is used to check whether a subquery returns any rows.



SELECT * FROM EMP E
WHERE EXISTS (SELECT 2  FROM EMP B WHERE B.MGR = E.EMPNO );

SELECT * FROM EMP E
WHERE EXISTS (SELECT 1000000  FROM EMP B WHERE B.MGR = E.EMPNO );


Select * from dept where not exists  (select 1 from emp where dept.deptno = emp.deptno);

-- It is use to complete the syntax we can write anything in place of 1 

-- Example – 

Select * from dept where not exists (select 1 from emp where dept.deptno = emp.deptno);





-- View
-- Use	-- Simplify Complex Queries
		-- Data Transformation
		-- Summarization
		-- Code Reuse
        
-- CREATE VIEW Syntax 

-- CREATE VIEW myview_name AS
-- SELECT column1, column2, column3
-- FROM mytable
-- WHERE column1 = 'value';
--  -----------
SELECT * FROM EMP;

Create view Team_emp As
SELECT EMPNO,ENAME,MGR from EMP
Where MGR=7902;


select * from Team_emp;
--  -----------
SELECT * FROM employees;


CREATE VIEW Bob_Record AS
SELECT *
FROM employees
Where name="Bob";

select * from Bob_Record;


-- Updating a View

-- CREATE OR REPLACE VIEW view_name AS
-- SELECT column1, column2,
-- FROM table_name
-- WHERE condition;

CREATE OR REPLACE VIEW Bob_Record AS
SELECT *
FROM employees
Where name In("Bob",'Alice');

select * from Bob_Record;


-- Drop View

-- DROP VIEW view_name;

DROP VIEW Bob_Record;

-- --------------------------------------

-- INDEX 
-- improves the speed of data retrieval operations

-- Syntax
-- CREATE INDEX index_name ON table_name (col_name);

select * from student_marks;
desc student_marks;
CREATE INDEX mark_index ON student_marks (roll_no, math_marks, science_marks, english_marks, history_marks, geography_marks, total_marks);


-- How see index
-- SHOW INDEX FROM table_name;

SHOW INDEX FROM student_marks;


-- How Drop Index
-- DROP INDEX index_name ON table_name;
SHOW INDEX FROM student_marks;
DROP INDEX mark_index ON student_marks;
SHOW INDEX FROM student_marks;




select * from student_marks;


SELECT * FROM student_marks WHERE math_marks > 0;

-- -----------------------------------------------------


