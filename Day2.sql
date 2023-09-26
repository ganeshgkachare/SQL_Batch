create database IF not exists MySQL_Practice;
Use MySQL_Practice;

-- create table with name employees
CREATE TABLE employees1 (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);
use mysql_practice;
Drop table employees;
describe employees;
desc employees;

SELECT * FROM employees1;


-- Select the information from the “dept_no” column of the “departments” table.
SELECT FIRST_NAME
FROM employees;

SELECT FIRST_NAME,last_name
FROM employees;

-- Select all data from the “departments” table.
SELECT * FROM departments;



-- Select all people from the “employees” table whose first name is “Elvis”.

SELECT * FROM employees
WHERE first_name = 'Elvis';

SELECT last_name, birth_date FROM employees
WHERE first_name = 'Mary';


-- CREATE TABLE
CREATE TABLE student (
    roll_no INT ,
    first_name CHAR(10),
    last_name VARCHAR(10),
    date_of_birth DATE,
    marks DECIMAL(5,2)
); 
drop table student;
DESC STUDENT;

-- INSERT DATA 

-- M1)
-- INSERT INTO table_name
-- VALUES (value1, value2, value3, ...);

-- M2)
-- INSERT INTO table_name (column1, column2, column3, ...)
-- VALUES (value1, value2, value3, ...);

INSERT INTO student (roll_no, first_name, last_name, date_of_birth, marks)
VALUES (1, 'RajPPPPPPPPPPPPPP', 'RRR', '2000-01-01', 88.88);

INSERT INTO student VALUES (2, 'Priyanka', 'PPP', '2000-01-01', 855.88);

INSERT INTO student (roll_no, first_name, last_name, date_of_birth, marks)
VALUES 
    (3, 'John', 'Doe', '2000-01-01', 85.50),
    (4, 'Jane', 'Doe', '2002-02-02', 92.75),
    (5, 'Bob', 'Smith', '1999-03-03', 77.25);

select * from student;

select FIRST_NAME from student;

