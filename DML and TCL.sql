-- DML
--     Insert
--     Update
--     Delete

drop table student;
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


-- UPDATE
-- Syntax:- UPDATE Table_Name SET Column_Name = new_value;

select * from student;

UPDATE student SET last_name ="kk";


UPDATE student SET last_name ="kk"
where first_name='John';

desc student;

CREATE TABLE student2 (
    roll_no INT primary key,
    first_name CHAR(10),
    last_name VARCHAR(10),
    date_of_birth DATE,
    marks DECIMAL(5,2)
); 

select * from student2;
desc student2;
INSERT INTO student2 VALUES (2, 'Priyanka', 'PPP', '2000-01-01', 855.88);

INSERT INTO student2 (roll_no, first_name, last_name, date_of_birth, marks)
VALUES 
    (3, 'John', 'Doe', '2000-01-01', 85.50),
    (4, 'Jane', 'Doe', '2002-02-02', 92.75),
    (5, 'Bob', 'Smith', '1999-03-03', 77.25);
INSERT INTO student2 VALUES (2, 'Priy', 'PPP', '2000-01-01', 855.88);
select * from student2; 
    
UPDATE student2 SET last_name ="kk"
where roll_no= 4;
select * from student2; 



-- COMMIT

commit;

INSERT INTO student2 (roll_no, first_name, last_name, date_of_birth, marks)
VALUES 
    (6, 'John', 'Doe', '2000-01-01', 85.50),
    (7, 'Jane', 'Doe', '2002-02-02', 92.75),
    (8, 'Bob', 'Smith', '1999-03-03', 77.25);   
    
select * from student2; 

-- ROLLBACK
select * from student2; 

rollback;

select * from student2; 



SET autocommit=0;

commit;
INSERT INTO student2 VALUES (25, 'Priyanka', 'PPP', '2000-01-01', 855.88);
select * from student2; 
rollback;
select * from student2; 


-- DELETE
-- Syntax - DELETE FROM Table_Name;

select * from student2; 

DELETE FROM student2
where roll_no= 2;
commit;
rollback;
select * from student2; 