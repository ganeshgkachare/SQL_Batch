
-- DEFAULT

-- •	Default constraint is used to provide a default value for a column.
-- •	Default value will be added to all new records if no other value is specified. 
-- •	Default constraint can be defined at column level.
-- •	Can be applied while creating a table or after table is created.


-- m1)
create table emp5
(id int ,
first_name varchar(20),
last_name varchar(20),
dob date default "2023-03-18");
drop table emp5;
desc emp5;

insert into emp5 values(1,"priyanka","ppp","1995-07-18");
select * from emp5;

insert into emp5 values(3,"raj","RRR");

insert into emp5 values(2,"raj","RRR",default);
select * from emp5;
insert into emp5 values(1,"priyanka","ppp",NULL);

-- M2)

create table emp6
(id int ,
first_name varchar(20),
last_name varchar(20),
dob date );

desc emp6;

ALTER TABLE emp6
CHANGE COLUMN first_name first_name VARCHAR(20) DEFAULT "RAJ";

desc emp6;

insert into emp6 values(2,DEFAULT,"RRR","1995-07-18");
select * from emp6;

-- DROP DEFAULT CONSTRINT
DESC emp6;

ALTER TABLE emp6
ALTER COLUMN first_name DROP DEFAULT;

DESC emp6;

-- PRIMARY KEY

-- •	Primary key is a column or a group of columns that uniquely identifies each row in a table. 
-- •	Primary key constraint can be defined at column level as well as at table level.
-- •	Primary key constraint cannot allow null values.
-- •	Each table can contain only one primary key.
-- •	For two Primary key columns, Primary key constraints at table level can allow values in combination but at column level it should be unique.
-- •	Can be applied while creating a table or after table is created.



create table emp7
(id int primary KEY,
first_name varchar(20),
last_name varchar(20),
dob date);

create table emp77
(id int primary KEY,
first_name varchar(20) primary KEY,
last_name varchar(20),
dob date);    -- Not happen because primary key is one for one table 

desc emp7;

ALTER TABLE emp7 DROP PRIMARY KEY;

desc emp7;

create table emp8
(id int,
first_name varchar(20),
last_name varchar(20),
dob date,
primary key (id,first_name)
);

desc emp8;
insert into emp8 values(1,"priyanka","ppp","1995-07-18");
insert into emp8 values(1,"priyanka","ppp","1995-07-18");
insert into emp8 values(2,"priyanka","ppp","1995-07-18");
insert into emp8 values(null,"priyanka","ppp","1995-07-18");
insert into emp8 values(3,"priyanka",null,"1995-07-18");
insert into emp8 values(2,"priyanka",null,"1995-07-18");
select * from emp8;


ALTER TABLE emp8 DROP PRIMARY KEY;

-- ----------------------------------------------------------------

-- FOREIGN KEY

-- •	A Foreign Key is a key used to link two tables together.
-- •	A Foreign Key is a column or a group of columns in one table that refers to the Primary key in another table or the same table in case of self-reference.

-- Create the 'customers' table
CREATE TABLE customer(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100)
);

-- Create the 'orders' table with a foreign key referencing 'customers'
CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

desc orders1;

-- Create the 'customers' table
CREATE TABLE customer1(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100)
);

-- Create the 'orders' table with a foreign key referencing 'customers'
CREATE TABLE orders1(
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

desc orders1;
-- Primary Key (PRI): This indicates that the column is the primary key of the table. The primary key uniquely identifies each row in the table.
-- Unique (UNI): This indicates that the column is part of a unique index, which enforces the uniqueness of values in that column.
-- Multiple (MUL): This indicates that the column is part of a non-unique index. It's not unique by itself, and multiple rows in the table can have the same value in this column. This could be used to improve query performance for columns that are frequently searched or used for filtering.



drop table customers;

-- Syntax to drop FOREIGN KEY constraint
-- 	ALTER TABLE table_name
-- 	DROP FOREIGN KEY constraint_name;

-- Find name of the foreign key
SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_NAME = 'customer'
  AND TABLE_NAME = 'orders1';


ALTER TABLE orders
DROP FOREIGN KEY orders_ibfk_1;

drop table customers;

-- ----------------------------------------------------------------

-- Check Constraint 

-- •	Check constraint is used to limit the range of the values that can be entered for a column. 
-- •	If we have a number AGE column in a table. The AGE in general cannot be less than ZERO and at the 
-- 			same time cannot be greater than 150. But, since AGE is a number column it can accept negative values
--          and values much greater than 150. 
-- •	To limit the values that can be added we use Check constraint.
-- •	Check constraint can be defined at column level as well as at table level.
-- •	Check constraints can be added while creating a table or after the table is created.
-- •	Check constraint allows null values while inserting records in table.


CREATE TABLE studentsinfo
(
studentid INT,
studentname VARCHAR(1000),
std_age INT,
country VARCHAR(1000) 
);

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (1,'Hari',-99,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (2,'Amol',200,'INDIA');

select * from studentsinfo;
drop table studentsinfo;

CREATE TABLE studentsinfo
(
studentid INT,
studentname VARCHAR(1000),
std_age INT CHECK (std_age > 0 AND std_age < 150),
country VARCHAR(1000)
);
desc studentsinfo;
INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (1,'Hari',25,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (2,'Raj',-99,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, Country) 
VALUES (3,'Amol','INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (4,'Ravi',151,'INDIA');

select * from studentsinfo;
drop table studentsinfo;


-- Syntax -
-- While creating a table (At Table level)

CREATE TABLE studentsinfo
(
studentid INT,
studentname VARCHAR(1000),
std_age INT,
country VARCHAR(1000),
CONSTRAINT check_std_age
CHECK (std_age > 0 AND std_age < 150 and studentid > 100)
);


INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (10,'Hari',25,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (151,'Raj',110,'INDIA');

select * from studentsinfo;
drop table studentsinfo;

-- Syntax -
-- After table created

CREATE TABLE studentsinfo
(
studentid INT,
studentname VARCHAR(1000),
std_age INT,
country VARCHAR(1000)
);

ALTER TABLE studentsInfo 
ADD CONSTRAINT chk_std_age CHECK ( Std_age> 0 AND Std_age< 150 );

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (1,'Hari', 25,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (2,'Raj',-99,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, Country) 
VALUES (3,'Amol','INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (4,'Ravi', 151,'INDIA');


-- Drop Check Constraint -
-- Syntax 
-- ALTER TABLE table_name DROP CONSTRAINT constraint_name;

ALTER TABLE studentsInfo DROP CONSTRAINT chk_std_age;


-- --------------------------------------------------------------------------------

-- AUTO_INCREMENT 
CREATE TABLE mytable (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  age INT
);
desc mytable;
drop table mytable;
INSERT INTO mytable (name, age) VALUES ('John', 30);

INSERT INTO mytable (name, age) VALUES ('Jane', 25);
INSERT INTO mytable (name, age) VALUES ('Bob', 40);

select * from mytable;
truncate table mytable;

ALTER TABLE mytable AUTO_INCREMENT = 170;

select * from mytable;

-- ----------------------------------------
-- PK
-- ALTER TABLE table_name ADD PRIMARY KEY (column_name);
-- FK
-- ALTER TABLE table_name ADD CONSTRAINT fk_name_ofFk
--   FOREIGN KEY (column_name)
--   REFERENCES reference_table_name(column_name_pk);

-- Check Constraint 

-- •	Check constraint is used to limit the range of the values that can be entered for a column. 
-- •	If we have a number AGE column in a table. The AGE in general cannot be less than ZERO and at the 
-- 			same time cannot be greater than 150. But, since AGE is a number column it can accept negative values
--          and values much greater than 150. 
-- •	To limit the values that can be added we use Check constraint.
-- •	Check constraint can be defined at column level as well as at table level.
-- •	Check constraints can be added while creating a table or after the table is created.
-- •	Check constraint allows null values while inserting records in table.


CREATE TABLE studentsinfo
(
studentid INT,
studentname VARCHAR(1000),
std_age INT,
country VARCHAR(1000) 
);

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (1,'Hari',-99,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (2,'Amol',200,'INDIA');

select * from studentsinfo;
drop table studentsinfo;

CREATE TABLE studentsinfo
(
studentid INT,
studentname VARCHAR(1000),
std_age INT CHECK (std_age > 0 AND std_age < 150),
country VARCHAR(1000)
);

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (1,'Hari',25,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (2,'Raj',-99,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, Country) 
VALUES (3,'Amol','INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (4,'Ravi',151,'INDIA');

select * from studentsinfo;
drop table studentsinfo;


-- Syntax -
-- While creating a table (At Table level)

CREATE TABLE studentsinfo
(
studentid INT,
studentname VARCHAR(1000),
std_age INT,
country VARCHAR(1000),
CONSTRAINT check_std_age
CHECK (std_age > 0 AND std_age < 150 and studentid > 100)
);


INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (10,'Hari',25,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (151,'Raj',110,'INDIA');

select * from studentsinfo;
drop table studentsinfo;

-- Syntax -
-- After table created

CREATE TABLE studentsinfo
(
studentid INT,
studentname VARCHAR(1000),
std_age INT,
country VARCHAR(1000)
);

ALTER TABLE studentsInfo 
ADD CONSTRAINT chk_std_age CHECK ( Std_age> 0 AND Std_age< 150 );

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (1,'Hari', 25,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (2,'Raj',-99,'INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, Country) 
VALUES (3,'Amol','INDIA');

INSERT INTO studentsInfo (StudentId, StudentName, std_age, Country) 
VALUES (4,'Ravi', 151,'INDIA');


-- Drop Check Constraint -
-- Syntax -
-- ALTER TABLE table_name DROP CONSTRAINT constraint_name;

ALTER TABLE studentsInfo DROP CONSTRAINT chk_std_age;

