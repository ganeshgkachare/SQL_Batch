-- Subquery
-- •	A Subquery is a query within another SQL query. Also called an Inner Query or a Nested query.
-- •	The result returned by the inner query will be used as an input to the outer query.
-- •	A subquery is a query nested inside another statement such as SELECT, INSERT, UPDATE, or DELETE.

CREATE TABLE DEPT(  
  DEPTNO     int PRIMARY KEY,  
  DNAME      VARCHAR(20),  
  LOC        VARCHAR(20)
);
drop table DEPT;
drop table emp;
 desc dept;
 drop table dept;
 drop table emp;
 INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON'),
(50, 'MARKETING', 'LOS ANGELES'),
(60, 'FINANCE', 'HOUSTON'),
(70, 'ENGINEERING', 'SAN FRANCISCO'),
(80, 'HUMAN RESOURCES', 'SEATTLE'),
(90, 'IT', 'AUSTIN'),
(100, 'CUSTOMER SERVICE', 'MIAMI'),
(110, 'ADMINISTRATION', 'NEW YORK'),
(120, 'PURCHASING', 'DALLAS'),
(130, 'PUBLIC RELATIONS', 'CHICAGO'),
(140, 'PRODUCTION', 'BOSTON'),
(150, 'RECRUITING', 'LOS ANGELES'),
(160, 'RETAIL', 'HOUSTON'),
(170, 'SAFETY', 'SAN FRANCISCO'),
(180, 'SECURITY', 'SEATTLE'),
(190, 'TRAINING', 'AUSTIN'),
(200, 'WAREHOUSING', 'MIAMI');

select * from dept;
 
CREATE TABLE EMP(  
  EMPNO      INT PRIMARY KEY,  
  ENAME      VARCHAR(10),  
  JOB        VARCHAR(9),  
  MGR        INT,  
  HIREDATE  DATE,  
  SAL              INT,  
  COMM       INT,  
  DEPTNO     INT ,  
  FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO)
);
DESCRIBE EMP;
-- multiple occurrences == MUL

INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10),
(7360, 'CLARK', 'CLERK', 7902, '1980-06-09', 1300, NULL, 20),
(7491, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1500, 500, 30),
(7520, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1300, 700, 30),
(7561, 'JONES', 'MANAGER', 7839, '1981-04-02', 3275, NULL, 20);

select * from emp;

-- DROP TABLE EMP;



-- To find an employee with maximum salary?

-- Normal Query- 
SELECT MAX (SAL) FROM EMP;
SELECT MAX(SAL) FROM EMP;

SELECT * FROM EMP 
WHERE SAL = 5000;

SELECT Ename FROM EMP 
WHERE SAL = 5000;

SELECT * FROM EMP WHERE SAL =5000;

-- Using Subquery -
SELECT * FROM EMP WHERE SAL =(SELECT MAX(SAL) FROM EMP);

SELECT * FROM EMP WHERE SAL = -- OUTER QUERY
(SELECT MAX(SAL) FROM EMP);   -- INNER QUERY

-- Types of Subquery -
-- Non-correlated Subquery (Simple Subquery) 
-- •	The inner query executed first then the result of inner query is used by outer query
-- •	The inner query executed independently 

-- 1.	Single row Subquery
-- 2.	Multi row Subquery
-- 3.	Multi column Subquery
--  
-- 1. Single Row Subquery 
-- •	 The inner query return only one row
-- •	 We can use  <>, <=, >=, <, >
-- Example –
 SELECT * FROM EMP 
 WHERE SAL >5000;
 SELECT MAX(SAL) FROM EMP;
 SELECT MAX(SAL) FROM EMP;
 
SELECT * FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP);
SELECT * FROM EMP WHERE SAL <> (SELECT MAX(SAL) FROM EMP);
SELECT * FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP);
SELECT * FROM EMP WHERE SAL <= (SELECT MAX(SAL) FROM EMP);
SELECT * FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP);
 
SELECT * FROM EMP 
WHERE SAL < 5000; 
 
-- 2. Multi Row Subquery
-- •	=any same as same as IN Operator
-- •	<any means less than maximum 
-- •	>any means greater than minimum 
-- •	>all means greater than maximum value 
-- •	<all means less than the minimum value

--  value < ANY (subquery) will return all rows where the value is less than any of the 
-- 			values returned by the subquery. 
--  value > ALL (subquery) will return all rows where
--  		the value is greater than all of the values returned by the subquery.

--  = operator is used for exact match comparison, the IN operator is used to match a column
--  value against a list of values, and the ANY and ALL operators are used to compare a single value
--  with a set of values returned by a subquery.

-- Example -

SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC IN ('NEW YORK','CHICAGO'));

SELECT * FROM EMP WHERE DEPTNO =ANY (SELECT DEPTNO FROM DEPT WHERE LOC IN ('NEW YORK','CHICAGO'));

SELECT * FROM EMP WHERE DEPTNO <ANY (SELECT DEPTNO FROM DEPT WHERE LOC IN ('NEW YORK','CHICAGO'));

SELECT * FROM EMP WHERE DEPTNO >ANY (SELECT DEPTNO FROM DEPT WHERE LOC IN ('NEW YORK','CHICAGO'));

SELECT * FROM EMP WHERE DEPTNO >ALL (SELECT DEPTNO FROM DEPT WHERE LOC IN ('NEW YORK', 'DALLAS'));

SELECT * FROM EMP WHERE DEPTNO <ALL (SELECT DEPTNO FROM DEPT WHERE LOC IN ('BOSTON','CHICAGO'));

SELECT DEPTNO FROM DEPT
WHERE LOC IN ('NEW YORK','CHICAGO');

SELECT * FROM EMP WHERE DEPTNO <ANY (SELECT DEPTNO FROM DEPT WHERE LOC IN ('BOSTON','CHICAGO'));

SELECT *,DEPTNO FROM DEPT WHERE LOC IN ('BOSTON','CHICAGO');
SELECT * FROM EMP;
SELECT * FROM dept;

-- ----------------------------------------------------------------------------------------------------- 



-- Intersection

select * from contractors;
select * from employees;

SELECT name, salary
FROM employees e
WHERE EXISTS (
  SELECT 1
  FROM contractors c
  WHERE e.name = c.name AND e.salary = c.salary
);

-- 3. Multi Column Subquery

SELECT * FROM emp;
SELECT * FROM DEPT;

Select * from emp where (deptno, sal) in (select deptno,max(sal) from emp group by deptno);

Select * from emp where (deptno, sal) in (select max(sal),deptno from emp group by deptno);

select deptno,max(sal) 
from emp 
group by deptno;

-- Correlated Subquery -(repeating subquery)
-- •	A correlated subquery is a subquery that uses the values of the outer query. 
-- •	The inner query depends on the outer query values.
-- •	A correlated subquery is executed repeatedly, once for each row evaluated by the outer query. The correlated subquery is also known as a repeating subquery.

-- Execution of Correlated Subquery
-- If there are 10 record in emp table. It will keep repeating for the whole 10 records

-- Example -
-- •	Write a SQL to find employees having at least one person reporting under them
-- Using Simple Subquery - 
SELECT * FROM EMP;

SELECT * FROM EMP
WHERE EMPNO IN (SELECT MGR
FROM EMP GROUP BY MGR);

SELECT MGR FROM EMP 
GROUP BY MGR;

