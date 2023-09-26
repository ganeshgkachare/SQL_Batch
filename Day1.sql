-- comment

/*
Multiline comment
*/

show databases;


create database Akul;
create database Akul;

create database if not exists Akul;

create database mysql_practice;
use mysql_practice;
create database Ganesh;
create database GK;
create database IF not exists GANESH;
-- comment


Use Ganesh;


DROP DATABASE mysql_practice; 

-- M2)

create SCHEMA Udit;
create SCHEMA Udit;
create SCHEMA IF not exists Udit;


USE Udit;

USE SYS;

-- Select all people from the “t_employees” 
USE employees_mod;

SELECT * FROM t_employees;  -- Wildcard character ( * , % , _ )
SELECT * FROM stud;

-- Select all people from the “t_employees” table whose first name is “Mary”.
SELECT * FROM t_employees
WHERE first_name = 'Mary';

SELECT 
    *
FROM
    t_employees
WHERE
    first_name = 'MARY';










select * from t_employees
where first_name = "magy";


select * from t_employees
where last_name = "Ghemri";


Use akul;

-- create table student(); -- Need at least one fild/column

create table student(
Roll_No int ,
Name char(20)
);

select * from student;

describe student;

drop tables student;
