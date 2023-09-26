
drop table example_table;

CREATE TABLE example_table (
  id INT ,
  float_col FLOAT(5,3),
  decimal_col DECIMAL(5, 3),
  numeric_col NUMERIC(5, 3)
);
DESC Example_table;
INSERT INTO example_table (id,float_col, decimal_col, numeric_col)
VALUES (1, 12.345,  12.345,  12.345);

INSERT INTO example_table (id,float_col, decimal_col, numeric_col)
VALUES (1, 123.345,  12.345,  12.345);

INSERT INTO example_table (id,float_col, decimal_col, numeric_col)
VALUES (1, 12.34785,  12.345,  12.345);

select * from example_table;

INSERT INTO example_table (id,float_col, decimal_col, numeric_col)
VALUES (1, 12.34555,  12.345,  12.345);

select * from example_table;


INSERT INTO example_table (id,float_col, decimal_col, numeric_col)
VALUES (1, 12.345,  12.34555,  12.345);
select * from example_table;

INSERT INTO example_table (id,float_col, decimal_col, numeric_col)
VALUES (1, 12.345,  12.345,  12.34555);


 drop table example_table;