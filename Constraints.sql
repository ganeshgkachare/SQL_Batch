

create table emp
(id int,
first_name varchar(20),
last_name varchar(20),
dob date);
desc emp;
insert into emp (id ,first_name,last_name,dob) values(1,"priyanka","ppp","1995-07-18");
insert into emp (id,first_name,last_name,dob) values(2,"raj","RRR","1995-10-26"),
(3,"Reshma","RRR","1996-02-03"),
(4,"Manasa","MMM","1996-05-13"),
(5,"Ganesh","KKK","1996-08-21"),
(6,"Krishna","KKK","1996-11-29"),
(7,"shubham","LLL","1997-03-09"),
(8,"Prajakta","PPP","1997-06-17");

insert into emp (id,first_name,last_name,dob) values(2,null,"RRR","1995-10-26");
insert into emp  values(2,null,"RRR",null);
select * from emp;

insert into emp  values(9,null,"RRR",null);
insert into emp  values(9,"PRAJ","RRR",null);
insert into emp  values(9,"PRAJ","RRR");


-- NOT NULL
create table emp1
(id int NOT NULL,
first_name varchar(20),
last_name varchar(20),
dob date);
desc emp1;

insert into emp1 values(1,"priyanka","ppp","1995-07-18");
select * from emp1;
insert into emp1 values(4,null,"RRR","1995-10-26");
select * from emp1;
insert into emp1 values(null,null,"RRR","1995-10-26");

create table emp2
(id int NULL,
first_name varchar(20),
last_name varchar(20),
dob date);
desc emp2;

insert into emp2 values(1,"priyanka","ppp","1995-07-18");
select * from emp2;
insert into emp2 values(null,"raj","RRR","1995-10-26");
select * from emp2;


-- UNIQUE
-- M1)
create table emp3
(id int UNIQUE,
first_name varchar(20),
last_name varchar(20),
dob date);
desc emp3;

insert into emp3 values(null,"priyanka","ppp","1995-07-18");
select * from emp3;

-- M2)
create table emp4
(id int ,
first_name varchar(20),
last_name varchar(20),
dob date,
UNIQUE KEY(last_name));
desc emp4;

-- M3)

create table emp2
(id int ,
first_name varchar(20),
last_name varchar(20),
dob date);

desc emp2;

ALTER TABLE emp2
ADD UNIQUE KEY (first_name);

truncate table emp2;  -- If already duplicate records present in first_name

ALTER TABLE emp2
ADD UNIQUE KEY (first_name);

desc emp4;

-- DROP KEY
-- Wrong method
ALTER TABLE emp2
DROP UNIQUE KEY(first_name);
ALTER TABLE emp2
DROP INDEX(last_name);

-- Correct method
ALTER TABLE emp4
DROP INDEX last_name;
desc emp4;
