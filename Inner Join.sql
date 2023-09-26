-- Joins – 

-- •	Join is used to combine data from two or more tables based on values of the related columns tables to form a single result set. 
-- •	The related columns are typically the primary key column(s) of the first table and foreign key column(s) of the second table.
-- •	The tables to be joined are listed in the FROM clause and the join conditions are defined in the WHERE clause.

-- Guidelines –

-- •	When writing a SELECT statement that uses joins, provide the column name with the table name for clarity.
-- •	If the same column name appears in more than one table, the column name must be prefixed with the table name or give table name an alias and provide that alias to the columns.
-- •	To join ‘n’ tables together, you need a minimum of n-1 join conditions.





CREATE TABLE emp_log(
emp_id int PRIMARY KEY,
name VARCHAR(100)
);

CREATE TABLE emp_details(
emp_id int PRIMARY KEY,
address VARCHAR(100),
address_code int
);

CREATE TABLE address_code_name(
add_code int PRIMARY KEY,
add_code_name VARCHAR(100)
);


INSERT INTO emp_log VALUES (1,'John');
INSERT INTO emp_log VALUES (2,'Lilly');
INSERT INTO emp_log VALUES (3,'Peter');
INSERT INTO emp_log VALUES (4,'Roy');
INSERT INTO emp_log VALUES (8,'Nick');
INSERT INTO emp_log VALUES (9,'Sam');
INSERT INTO emp_log VALUES (10,'Rock');

COMMIT;
select * from emp_log;

INSERT INTO emp_details VALUES(1,'India',4444);
INSERT INTO emp_details VALUES(2,'USA',5555);
INSERT INTO emp_details VALUES(3,'Russia',6666);
INSERT INTO emp_details VALUES(4,'South Africa',7777);
INSERT INTO emp_details VALUES(5,'Uk',8888);
INSERT INTO emp_details VALUES(6,'Brazil',9999);
INSERT INTO emp_details VALUES(7,'New Zealand',2222);
INSERT INTO emp_details VALUES(11,'Peru',0003);
INSERT INTO emp_details VALUES(12,'Cuba',0002);
INSERT INTO emp_details VALUES(13,'Norway',0001);
INSERT INTO emp_details VALUES(14,'Singapore',0000);

COMMIT;

INSERT INTO address_code_name VALUES(4444,'Asia');
INSERT INTO address_code_name VALUES(5555,'North America');
INSERT INTO address_code_name VALUES(6666,'Europe');
INSERT INTO address_code_name VALUES(7777,'Africa');
INSERT INTO address_code_name VALUES(8888,'Antarctica');
INSERT INTO address_code_name VALUES(9999,'South America');
INSERT INTO address_code_name VALUES(2222,'Australia');
INSERT INTO address_code_name VALUES(1111,'Asia-1');
INSERT INTO address_code_name VALUES(3333,'Europe-2');

COMMIT;

select * from emp_log;
select * from emp_details;
select * from address_code_name;
-- Join
SELECT a.emp_id ID,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a INNER JOIN  emp_details b 
ON a.emp_id = b.emp_id;

SELECT a.emp_id ID,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a INNER JOIN  emp_details b 
ON a.emp_id != b.emp_id;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a 
INNER JOIN 
emp_details b 
ON a.emp_id = b.emp_id;



SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a 
INNER JOIN 
emp_details b 
ON a.emp_id < b.emp_id;



SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a 
JOIN emp_details b 
ON a.emp_id = b.emp_id;

-- Using where
SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a, emp_details b 
WHERE a.emp_id = b.emp_id;

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code
FROM emp_log a, emp_details b 
WHERE a.emp_id < b.emp_id;

SELECT emp_id ,
	   name emp_name,
	   emp_id details_emp_id,
	   address details_emp_address,
	   address_code details_emp_code
FROM emp_log a 
JOIN emp_details b 
USING (emp_id);

-- Inner Join with three tables –

SELECT 
    a.emp_id emp_id,
    a.name emp_name,
    b.emp_id details_emp_id,
    b.address details_emp_address,
    b.address_code details_emp_code,
    c.add_code_name
FROM
    emp_log a
        INNER JOIN
    emp_details b ON a.emp_id = b.emp_id
        INNER JOIN
    address_code_name c ON c.add_code = b.address_code;


SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code,
	   c.add_code_name
FROM emp_log a 
JOIN 
emp_details b 
ON a.emp_id = b.emp_id
JOIN 
address_code_name c 
ON c.add_code = b.address_code;

-- using where
SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code,
	   c.add_code_name
FROM emp_log a, emp_details b, address_code_name c
WHERE a.emp_id = b.emp_id and c.add_code = b.address_code;


-- -----------------

-- INNER JOIN 
-- Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
select * from employees;
select * from dept_manager;
SELECT
    e.emp_no emp_no_e,
     dm.emp_no emp_no_dm,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm 
    ON e.emp_no = dm.emp_no;
    
SELECT
    e.emp_no emp_no_e,
     dm.emp_no emp_no_dm,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm 
    ON e.emp_no != dm.emp_no;
    
    
-- Syntax - 

-- SELECT a.column_name, b.column_name
-- FROM table_name a  INNER JOIN table_name b
-- ON a.column_name = b. Column_name;   

-- OR

-- SELECT a.column_name, b.column_name
-- FROM table_name a, table_name b
-- WHERE a.column_name = b. Column_name;

-- OR

-- SELECT column_name, column_name
-- FROM table_name   INNER JOIN table_name
-- USING (common_column_name);   

SELECT a.emp_id emp_id,
	   a.name emp_name,
	   b.emp_id details_emp_id,
	   b.address details_emp_address,
	   b.address_code details_emp_code,
	   c.add_code_name
  FROM emp_log a 
       INNER JOIN emp_details b ON a.emp_id = b.emp_id
       INNER JOIN address_code_name c ON c.add_code = b.address_code;



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