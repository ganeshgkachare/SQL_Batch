-- Working with the “employees” table, use the LIKE operator to
-- select the data about all individuals, whose first name starts with “Mark”;
-- specify that the name can be succeeded by any sequence of characters.
SELECT *
FROM employees 
WHERE first_name LIKE('Mark%')
;

SELECT *
FROM employees 
WHERE first_name LIKE('rk%')
;

SELECT *
FROM employees 
WHERE first_name LIKE('%rk%')
;

SELECT *
FROM employees 
WHERE first_name Not LIKE('%rk%')
;

SELECT *
FROM employees 
WHERE first_name LIKE('Ma%')
;

-- Retrieve a list with all employees who have been hired in the year 2000.
SELECT * FROM employees
WHERE hire_date LIKE ('%2000%');

-- Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 
SELECT * FROM employees
WHERE emp_no LIKE ('1000_');

SELECT * FROM employees
WHERE emp_no LIKE ('100_9');






select * from employees;

-- LIMIT 
SELECT * FROM employees
LIMIT 4;



-- ORDER BY
-- Order By Clause –

-- •	Order by clause is used to sort the records in your result set. The Order By clause can only be used in Select statements.
-- •	If the ASC or DESC modifier is not provided in the Order by clause, the results will be sorted by expression in ascending order. This is equivalent to Order By expression ASC.
-- •	You can also use the Order by clause to sort by relative position in the result set, where the first field in the result set is 1. The next field is 2, and so on.
-- •	When sorting your result set using the Order by clause, you can use the ASC and DESC attributes in a single select statement.
-- •	SQL treats NULL as the lowest values.
-- •	The Order by clause is the very last clause to be processed in Select Statement.
-- •	It is possible to sort the result set by a column that does not appear on the select list.


SELECT * FROM employees
ORDER BY first_name;

SELECT * FROM employees
ORDER BY first_name ASC;

SELECT * FROM employees
ORDER BY first_name DESC;

SELECT * FROM employees
ORDER BY 3 DESC;

SELECT * FROM employees
ORDER BY last_name ASC, first_name DESC;

SELECT * FROM employees
ORDER BY last_name ASC, first_name DESC;






CREATE TABLE vendors
 (
    vendor_id INT,
    vendor_name VARCHAR(100),
    vendor_country VARCHAR(100),
    vendor_price INT
  );

INSERT INTO vendors VALUES (1,'ABC Corp','India', 10000);
INSERT INTO vendors VALUES (2,'M-net','Bangladesh', 15000);
INSERT INTO vendors VALUES (3,'ABC Corp','South Africa', 10000);
INSERT INTO vendors VALUES (4, null,'Russia', 21000);
INSERT INTO vendors VALUES (5,'Synergy','USA', 29000);
INSERT INTO vendors VALUES (6,'M-net', null, 31000);
INSERT INTO vendors VALUES (7,'Synergy','Egypt', 45000);
INSERT INTO vendors VALUES (8,'Synergy','USA', 10000);
INSERT INTO vendors VALUES (9,'M-net', null, 5000);
INSERT INTO vendors VALUES (10,'Synergy','Angola', 54000);
INSERT INTO vendors VALUES (11, null,'India', 65000);
INSERT INTO vendors VALUES (11, null,'USA', 48000);

SELECT vendor_name FROM vendors;
SELECT * FROM vendors;

-- Sorting records without using Asc and Desc keywords - 
SELECT vendor_name FROM vendors ORDER BY vendor_name;
SELECT vendor_name, vendor_country FROM vendors ORDER BY vendor_name;

-- Sorting records using Asc and Desc keywords - 
SELECT vendor_name FROM vendors ORDER BY vendor_name Asc;
SELECT vendor_name FROM vendors ORDER BY vendor_name Desc;

SELECT vendor_name, vendor_country FROM vendors ORDER BY vendor_name Asc;
SELECT vendor_name, vendor_country FROM vendors ORDER BY vendor_name Desc;

-- Sorting records using Asc and Desc keywords on multiple columns and different orders- 

SELECT vendor_name, vendor_country FROM vendors ORDER BY vendor_name Asc, vendor_country Desc;
SELECT vendor_name, vendor_country FROM vendors ORDER BY vendor_name Desc, vendor_country Asc;

-- Sorting records using columns that is not in the select list - 
SELECT vendor_name, vendor_price FROM vendors ORDER BY vendor_country Asc;
SELECT vendor_name, vendor_price FROM vendors ORDER BY vendor_country Desc;

-- Sorting records using expression -
SELECT vendor_name, vendor_country FROM vendors ORDER BY LENGTH(vendor_country)  Asc;
SELECT vendor_name, vendor_country FROM vendors ORDER BY LENGTH (vendor_country) Desc;

-- Finding records using ordinal positions of columns - 
SELECT vendor_name, vendor_country FROM vendors ORDER BY 1, 2;
SELECT vendor_name, vendor_country FROM vendors ORDER BY 1, 2 Desc;
SELECT vendor_name, vendor_country FROM vendors ORDER BY 1 Desc, 2 Asc;
SELECT vendor_name, vendor_country FROM vendors ORDER BY 3 Desc;
SELECT vendor_name, vendor_country, vendor_price FROM vendors ORDER BY 3 Desc;

-- Sorting rows with NULL values -
SELECT vendor_id, vendor_name FROM vendors ORDER BY vendor_name;
SELECT vendor_id, vendor_name FROM vendors ORDER BY vendor_name DESC;






-- DISTINCT
-- DISTINCT Clause -

-- •	The DISTINCT clause is used in a SELECT statement to filter duplicate rows in the result set. It ensures that rows returned are unique for the column or columns specified in the SELECT clause.
-- •	To retrieve unique data based on multiple columns, you just need to specify the column list in the SELECT clause. 

-- Syntax - 

-- 	SELECT DISTINCT expressions
-- FROM tables
-- [WHERE conditions] ; 

-- Syntax – DISTINCT clause on multiple columns

-- 	SELECT DISTINCT column1, column2, …..
-- FROM table_name
-- [WHERE conditions] ; 

-- Guidelines to use DISTINCT Clause:

-- •	The DISTINCT clause can be used only in the SELECT statement.
-- •	When only one expression is provided in the DISTINCT clause, the query will return the unique values for that expression.
-- •	When more than one expression is provided in the DISTINCT clause, the query will retrieve unique combinations for the expressions listed.

SELECT * FROM employees;

SELECT DISTINCT first_name
FROM employees;

SELECT DISTINCT last_name
FROM employees;

SELECT DISTINCT first_name,last_name
FROM employees;

SELECT DISTINCT birth_date
FROM employees;


SELECT DISTINCT emp_no, first_name
FROM employees;

--  is not null.
SELECT emp_no, first_name
FROM employees
WHERE birth_date IS NOT NULL;

-- IS NULL
SELECT emp_no, first_name
FROM employees
WHERE birth_date IS NULL;


-- GROUP BY
-- Group By -

-- •	Group By clause is used in a SELECT statement to group rows into a set of summary rows by values of columns or expressions. 
-- •	Group By clause returns one row per group.
-- •	The GROUP BY clause is often used with aggregate functions such as AVG (), COUNT (), MAX (), MIN () and SUM ().
-- •	Group By clause appears after the FROM clause. In case WHERE clause is presented, the Group By clause must be placed after the WHERE clause

-- Syntax - Without Where Clause

-- SELECT column_1, column_2, column_3 
-- FROM table_name
-- GROUP BY column_1, column_2, column_3;   
--    
-- Syntax - With Where Clause

-- SELECT column_1, column_2, column_3 
-- FROM table_name
-- WHERE condition
-- GROUP BY column_1, column_2, column_3;   


select * from employees;

SELECT *
FROM employees
GROUP BY first_name;

SELECT *,YEAR(hire_date),emp_no+5
FROM employees;

SELECT *,YEAR(hire_date)  as hire_year
FROM employees
GROUP BY hire_year;


SELECT hire_date,month(hire_date) as hire_month
FROM employees
GROUP BY hire_month;

SELECT hire_date,monthname(hire_date) as hire_year
FROM employees
GROUP BY hire_year;

SELECT hire_date,day(hire_date) as hire_day
FROM employees
GROUP BY hire_day;

SELECT hire_date,dayname(hire_date) as hire_year
FROM employees
GROUP BY hire_year;

SELECT emp_no,first_name ,YEAR(hire_date) as hire_year
FROM employees
GROUP BY hire_year;


SELECT emp_no,first_name ,Month(hire_date) as hire_year
FROM employees
GROUP BY hire_year;

SELECT emp_no,first_name ,Monthname(hire_date) as hire_year
FROM employees
GROUP BY hire_year;

SELECT emp_no,first_name ,dayname(hire_date) as hire_year
FROM employees
GROUP BY hire_year;

SELECT emp_no,first_name ,day(hire_date) as hire_day
FROM employees
Where emp_no > 10007;

SELECT emp_no,first_name ,day(hire_date) as hire_day
FROM employees
Where emp_no >= 10007;

-- Operators

SELECT emp_no,first_name ,last_name
FROM employees
Where emp_no < 10007;

SELECT emp_no,first_name 
FROM employees
Where emp_no = 10007;

-- == not work
SELECT emp_no,first_name 
FROM employees
Where emp_no == 10007;  

SELECT emp_no,first_name 
FROM employees
Where emp_no = 10007;  

SELECT emp_no,first_name 
FROM employees
Where emp_no <= 10007;  

SELECT emp_no,first_name 
FROM employees
Where emp_no >= 10007;  

SELECT emp_no,first_name 
FROM employees
Where emp_no != 10007;  

SELECT emp_no,first_name 
FROM employees
Where emp_no <> 10007; 

-- Aggregate function
-- •	An aggregate function performs a calculation of one or more values and returns a single value.
-- •	The aggregate function is often used with the GROUP BY clause and HAVING clause of the SELECT statement.
-- •	Group function cannot be used in where clause and group by clause. 
-- •	Aggregate functions are  Min, Max, Sum, Avg, Count
-- •	Min - returns the lowest value (minimum) in a set of non-NULL values.
-- •	Max - returns the highest value (maximum) in a set of non-NULL values.
-- •	Sum - returns the summation of all non-NULL values in a set.
-- •	Avg - calculates the average of non-NULL values in a set.
-- •	Count - returns the number of rows in a group, including rows with NULL values.      


select * from employees;

SELECT COUNT(*) as num_employees
FROM employees;
 
 SELECT COUNT(*) as num_employees 
 FROM employees
 WHERE first_name = "Mary";
 
SELECT SUM(emp_no) 
FROM employees;

-- select required_columns_name(optional), aggregate_function_name(column_name)
-- From table_name

SELECT AVG(emp_no) 
FROM employees;

SELECT MIN(emp_no) 
FROM employees;

SELECT MAX(emp_no) 
FROM employees;