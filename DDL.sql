
-- DDL 
-- CREATE
-- ALTER  ===> ADD, Modify, Rename, Drop
-- DROP
-- TRUNCATE


-- CREATE TABLE
CREATE TABLE student (
    roll_no INT ,
    first_name CHAR(10),
    last_name VARCHAR(10),
    date_of_birth DATE,
    marks DECIMAL(5,2)
); 

desc student;

drop table student;

-- To see the structure of the table then run –
-- M1)
DESC STUDENT;

-- M2)
DESCRIBE STUDENT;



-- ----------ALTER-------------
-- ALTER ===> ADD, Modify, Rename, Drop


desc STUDENT;


-- ADD
ALTER TABLE STUDENT 
ADD SUBJECT VARCHAR(20);

desc STUDENT;

-- Modify
ALTER TABLE STUDENT 
Modify marks float(5,2);
desc STUDENT;

ALTER TABLE STUDENT 
Modify marks DECIMAL(5,2);
desc STUDENT;

-- Rename
ALTER TABLE STUDENT 
Rename column marks to Science_Marks;
desc STUDENT;


-- Drop
ALTER TABLE STUDENT 
DROP COLUMN Science_Marks;
desc STUDENT;


-- DDL 
-- CREATE
-- ALTER  ===> ADD, Modify, Rename, Drop
-- DROP
-- TRUNCATE


-- DROP

desc student;

DROP TABLE STUDENT;

select * from student;

desc student;


CREATE TABLE student (
    roll_no INT ,
    first_name CHAR(10),
    last_name VARCHAR(10) NOT NULL,
    date_of_birth DATE,
    marks DECIMAL(5,2)
); 

desc student;
select * from student;
INSERT INTO student (roll_no, first_name, last_name, date_of_birth, marks)
VALUES (1, 'Raj', 'RRR', '2000-01-01', 88.88);

INSERT INTO student VALUES (2, 'Priyanka', 'PPP', '2000-01-01', 85.888);

INSERT INTO student (roll_no, last_name)
VALUES (1, 'Raj');

INSERT INTO student VALUES (2, 'Priyanka', 'PPP', '2000-01-01');
INSERT INTO student VALUES (2, 'Priyanka', 'PPP', '2000-01-01',);
INSERT INTO student VALUES (2, 'Priyanka', 'PPP', '2000-01-01',NULL);

INSERT INTO student VALUES ('Priyanka', 2, 'PPP', '2000-01-01', 85.888);

INSERT INTO student1 (roll_no, first_name)
VALUES (1, 'Udit');

INSERT INTO student1 (roll_no, last_name)
VALUES (1, 'Udit');
select * from student1;

INSERT INTO student (roll_no, first_name, last_name, date_of_birth, marks)
VALUES 
    (3, 'John', 'Doe', '2000-01-01', 85.50),
    (4, 'Jane', 'Doe', '2002-02-02', 92.75),
    (5, 'Bob', 'Smith', '1999-03-03', 77.25);
    
INSERT INTO student (marks,roll_no, last_name, date_of_birth, first_name)
VALUES 
    (85.50,33, 'Doe', '2000-01-01','John');    
    
    
select roll_no, first_name from student;   
desc student;


-- TRUNCATE
TRUNCATE table student;
select * from student;   
desc student;
