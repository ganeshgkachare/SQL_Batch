
-- Retrieve a list with all female employees whose first name is Mary. 

SELECT * FROM employees
WHERE first_name = 'Mary' AND gender = 'F'; 

SELECT * FROM employees
WHERE first_name = 'Mary' OR gender = 'F'; 

SELECT emp_no FROM employees
WHERE first_name = 'Mary' AND gender = 'F'; 

-- Operator
-- >
-- <
--  =
-- <> 
-- <=
-- >= 

-- Retrieve a list with all employees whose first name is either Mary or Aruna.
SELECT *
FROM employees
WHERE first_name = 'Mary' AND first_name = 'Aruna'; -- why


SELECT *
FROM employees
WHERE first_name = 'Mary' OR first_name = 'Aruna'; 


-- Retrieve a list with all female employees whose first name is either Mary or Aruna.
SELECT *
FROM employees
WHERE gender = 'F' AND (first_name = 'Mary' OR first_name = 'Aruna');


-- Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Mary”.
SELECT *
FROM employees
WHERE first_name IN ('Denis' , 'Mary',"Saniya");

SELECT *
FROM employees
WHERE first_name ='Denis' OR first_name ='Mary' OR first_name = "Saniya";



-- Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.

SELECT *
FROM employees
WHERE first_name NOT IN ('John' , 'Mark', 'Jacob');

