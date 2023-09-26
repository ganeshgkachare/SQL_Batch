
-- OUTER Join  

-- a)	LEFT Outer Join (LEFT Join) –
-- •	The left join returns all rows from the left table and the matching rows from the right table. 
-- •	If a row in the left table does not have a matching row in the right table, the columns of the right table will have nulls.
-- •	The left join is also known as left outer join. The outer keyword is optional.
-- •	If you want to get only rows from the left table that do not exist in the right table. To achieve this, you use the left join and a WHERE clause to exclude the rows from the right table.

-- Syntax – 

-- SELECT a.column_name, b.column_name
-- FROM table_name a LEFT JOIN 
-- table_name b
-- ON a.column_name = b.column_name;

select * from emp_log;
select * from emp_details;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a 
LEFT JOIN 
emp_details b 
ON a.emp_id = b.emp_id;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a 
JOIN 
emp_details b 
ON a.emp_id = b.emp_id;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a 
LEFT OUTER JOIN 
emp_details b 
ON a.emp_id = b.emp_id;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a 
LEFT OUTER JOIN 
emp_details b 
ON a.emp_id != b.emp_id;
-- To get the rows that are available only in the left table but not in the right table Then add a WHERE clause.

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a 
LEFT JOIN
emp_details b 
ON a.emp_id = b.emp_id
WHERE b.emp_id IS NOT NULL;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a LEFT JOIN emp_details b 
ON a.emp_id = b.emp_id
WHERE b.emp_id IS NULL;

-- Left Join with three tables –

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code,
	   c.add_code_name
FROM emp_log a 
LEFT JOIN emp_details b ON a.emp_id = b.emp_id  
LEFT JOIN address_code_name c ON c.add_code = b.address_code;

-- -------------------------------

select * from employees;
select * from dept_manager;

SELECT e.emp_no,  
	e.first_name,  
	e.last_name,  
    dm.dept_no,  
    dm.from_date  
FROM  employees e  
LEFT JOIN   
dept_manager dm 
ON e.emp_no = dm.emp_no 
WHERE  
    e.last_name = 'Rosis'  
ORDER BY dm.dept_no DESC;

SELECT e.emp_no,  
	e.first_name,  
	e.last_name,  
    dm.dept_no,  
    dm.from_date  
FROM  employees e  
LEFT JOIN   
dept_manager dm 
ON e.emp_no = dm.emp_no  
WHERE  
    e.last_name = 'Markovitch'  
ORDER BY dm.dept_no DESC;

SELECT e.emp_no,  
	e.first_name,  
	e.last_name,  
    dm.dept_no,  
    dm.from_date  
FROM  employees e  
Right JOIN   
dept_manager dm 
ON e.emp_no = dm.emp_no  
WHERE  
    e.last_name = 'Markovitch'  
ORDER BY dm.dept_no DESC;


-- b)	RIGHT Outer Join (RIGHT Join)–
-- •	The RIGHT [OUTER] JOIN is the opposite of the LEFT [OUTER] JOIN.
-- •	The right join returns all rows from the right table and the matching rows from the left table. 
-- •	If a row in the right table does not have a matching row in the left table, the columns of the left table will have nulls values.
-- •	The right join is also known as right outer join. The outer keyword is optional.
-- •	If you want to get only rows from the right table that do not exist in the left table. To achieve this, you use the right join and a WHERE clause to exclude the rows from the left table.
-- •	A RIGHT OUTER JOIN returns all valid rows from the table on the right side of the JOIN keyword, along with the values from the table on the left side, or NULLs if a matching row doesn't exist.

-- Syntax – 

-- SELECT a.column_name, b.column_name
-- FROM table_name a RIGHT JOIN table_name b
-- ON a.column_name = b.column_name;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a RIGHT JOIN emp_details b 
ON a.emp_id = b.emp_id;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM  emp_details b RIGHT JOIN  emp_log a
ON a.emp_id = b.emp_id;

-- To get the rows that are available only in the RIGHT table but not in the left table then add a WHERE clause.

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a RIGHT JOIN emp_details b 
ON a.emp_id = b.emp_id
WHERE a.emp_id IS NULL;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a RIGHT JOIN emp_details b 
ON a.emp_id = b.emp_id
WHERE a.emp_id IS NOT NULL;

-- Right Join with three tables –

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code,
	   c.add_code_name
FROM emp_log a 
RIGHT JOIN emp_details b ON a.emp_id = b.emp_id
RIGHT JOIN address_code_name c ON c.add_code = b.address_code;

-- c.	FULL Outer Join (FULL Join) –
-- •	Full outer join or full join returns a result set that contains all rows from both left and right tables, with the matching rows
-- 		 from both sides where available. If there is no match, the missing side will have null values. 

-- Syntax – 

-- SELECT a.column_name, b.column_name
-- FROM table_name a FULL OUTER JOIN table_name b
-- ON a.column_name = b.column_name;

-- SELECT a.emp_id emp_id,
-- 	   a.name emp_name,
-- 	   b.emp_id details_emp_id,
-- 	   b.address details_emp_address,
-- 	   b.address_code details_emp_code;
-- FROM emp_log a 
-- FULL JOIN 
-- emp_details b 
-- ON a.emp_id = b.emp_id;

-- SELECT a.emp_id emp_id,
-- 	   a.name emp_name,
-- 	   b.emp_id details_emp_id,
-- 	   b.address details_emp_address,
-- 	   b.address_code details_emp_code
-- FROM emp_log a 
-- FULL OUTER JOIN 
-- emp_details b 
-- ON a.emp_id = b.emp_id;
SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a 
OUTER JOIN 
emp_details b 
ON a.emp_id = b.emp_id;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a 
right JOIN 
emp_details b 
ON a.emp_id = b.emp_id;


SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a RIGHT JOIN emp_details b 
ON a.emp_id = b.emp_id
UNION
SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a LEFT JOIN emp_details b 
ON a.emp_id = b.emp_id;


-- ------------------------------------------------------------------------------------------------------------------------- 



--	Cross join –

-- •	A cross join is the deliberate creation of a Cartesian product. There are no join columns specified, so every possible combination of rows between the two tables is produced.
-- •	To create a Cartesian product of tables, you use the cross join clause.
-- •	Unlike other joins such as inner join or left join, cross join does not have the on clause with a join predicate.
-- •	When you perform a cross join of two tables, which have no relationship, you will get a Cartesian product of rows and columns of both tables.
-- •	The cross join is useful when you want to generate plenty of rows for testing. 
-- •	Suppose we have two tables that have m and n rows, the Cartesian product of these tables has m x n rows.


-- Syntax – 

-- SELECT a.column_name, b.column_name
-- FROM table1 a CROSS JOIN table2 b;

-- OR

-- SELECT * FROM table1, table2



SELECT a.emp_id "Employee id",
	   a.name "Employee name",
	   b.emp_id "Details emp id",
	   b.address "Details emp address",
	   b.address_code "Details emp code"
FROM emp_log a 
CROSS JOIN
 emp_details b;


SELECT a.emp_id "Employee id",
	   a.name "Employee name",
	   b.emp_id "Details emp id",
       b.address "Details emp address",
	   b.address_code "Details emp code"
FROM emp_log a, emp_details b;

SELECT * FROM emp_log , emp_details;


-- -------------------
SELECT
    dm.*, d.*  
FROM  departments d  
CROSS JOIN  dept_manager dm;  


-- ------------------------------------------------------------------------------------------------------------------------- 

-- 	SELF Join – 

-- •	A self-join is a join that joins a table with itself. A self-join is useful for comparing rows within a table or querying hierarchical data.
-- •	A self-join uses other joins such as inner join and left join. In addition, it uses the table alias to assign the table different names in the same query.
-- •	Note - Referencing the same table more than once in a query without using table aliases cause an error.
-- •	Self-Join is a specific type of Join. In Self Join, a table is joined with itself. A self-join simply specifies that each rows of a table is combined with itself and every other row of the table.
-- Syntax – 

-- SELECT a.column_name, b.column_name...   
-- FROM table1 a, table1 b   
-- WHERE a.common_field = b.common_field;

CREATE TABLE STUDY 
(STD_ID VARCHAR(10), 
COURSE_ID VARCHAR(10),  
SINCE VARCHAR(10));
drop table study;
INSERT INTO STUDY VALUES ('S1','C1',2016);
INSERT INTO STUDY VALUES ('S2','C2',2017);
INSERT INTO STUDY VALUES ('S1','C2',2017);

select * from STUDY;
SELECT T1.STD_ID, T1.COURSE_ID, T2.STD_ID, T2.COURSE_ID
FROM STUDY T1,  STUDY T2 
WHERE T1.STD_ID = T2.STD_ID;

SELECT T1.*, T2.*
FROM STUDY T1,  STUDY T2 
WHERE T1.STD_ID = T2.STD_ID;
-- Want Those Record Whose Student_Id Is Same But Course Id Is Different - 

SELECT T1.STD_ID, T1.COURSE_ID, T2.STD_ID, T2.COURSE_ID
FROM STUDY T1,  STUDY T2 
WHERE T1.STD_ID = T2.STD_ID
AND T1.COURSE_ID <> T2.COURSE_ID;

-- ------------------------------------------------------------------------------------------------------------------------- 
