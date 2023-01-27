//UC1

mysql> create database payroll_service;
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| employee_payroll   |
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| share_market       |
| sys                |
+--------------------+
mysql> use payroll_service;
Database changed

//UC2

create table employee_payroll(id int primary key auto_increment,
name varchar(100),
salary double, 
start date);

mysql> desc employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int          | NO   | PRI | NULL    | auto_increment |
| name   | varchar(100) | YES  |     | NULL    |                |
| salary | double       | YES  |     | NULL    |                |
| start  | date         | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
 
//UC3

insert into employee_payroll(name,salary,start) 
values('Manjunath',500000,'2021-09-01'),
('Sachin',400000,'2022-09-02'),
('Arun',650000,'2021-08-06');

//UC4

mysql> select * from employee_payroll;
+----+-----------+--------+------------+
| id | name      | salary | start      |
+----+-----------+--------+------------+
|  1 | Manjunath | 500000 | 2021-09-01 |
|  2 | Sachin    | 400000 | 2022-09-02 |
|  3 | Arun      | 650000 | 2021-08-06 |
+----+-----------+--------+------------+

//UC5

insert into employee_payroll(name,salary,start) 
values('Bill', 600000, '2018-01-01');

mysql> SELECT salary FROM employee_payroll where name = 'bill';
+--------+
| salary |
+--------+
| 600000 |
+--------+

mysql> select * from employee_payroll;
+----+-----------+--------+------------+
| id | name      | salary | start      |
+----+-----------+--------+------------+
|  1 | Manjunath | 500000 | 2021-09-01 |
|  2 | Sachin    | 400000 | 2022-09-02 |
|  3 | Arun      | 650000 | 2021-08-06 |
|  4 | Bill      | 600000 | 2018-01-01 |
+----+-----------+--------+------------+

mysql> select * from employee_payroll WHERE start BETWEEN CAST('2018-01-01' AS DATE) AND
DATE(NOW());
+----+-----------+--------+------------+
| id | name      | salary | start      |
+----+-----------+--------+------------+
|  1 | Manjunath | 500000 | 2021-09-01 |
|  2 | Sachin    | 400000 | 2022-09-02 |
|  3 | Arun      | 650000 | 2021-08-06 |
+----+-----------+--------+------------+

//UC6

mysql> alter table employee_payroll add gender varchar(1);
mysql> select * from employee_payroll;
+----+-----------+--------+------------+--------+
| id | name      | salary | start      | gender |
+----+-----------+--------+------------+--------+
|  1 | Manjunath | 500000 | 2021-09-01 | NULL   |
|  2 | Sachin    | 400000 | 2022-09-02 | NULL   |
|  3 | Arun      | 650000 | 2021-08-06 | NULL   |
|  4 | Bill      | 600000 | 2018-01-01 | NULL   |
+----+-----------+--------+------------+--------+
mysql> insert into employee_payroll(name,salary,start) values('Charlie', 60000, '2018-02-01');
mysql> select * from employee_payroll;
+----+-----------+--------+------------+--------+
| id | name      | salary | start      | gender |
+----+-----------+--------+------------+--------+
|  1 | Manjunath | 500000 | 2021-09-01 | NULL   |
|  2 | Sachin    | 400000 | 2022-09-02 | NULL   |
|  3 | Arun      | 650000 | 2021-08-06 | NULL   |
|  4 | Bill      | 600000 | 2018-01-01 | NULL   |
|  5 | Charlie   |  60000 | 2018-02-01 | NULL   |
+----+-----------+--------+------------+--------+

mysql> UPDATE employee_payroll set gender = 'M' where name = 'Bill' or name = 'Charlie';

mysql> select * from employee_payroll;
+----+-----------+--------+------------+--------+
| id | name      | salary | start      | gender |
+----+-----------+--------+------------+--------+
|  1 | Manjunath | 500000 | 2021-09-01 | NULL   |
|  2 | Sachin    | 400000 | 2022-09-02 | NULL   |
|  3 | Arun      | 650000 | 2021-08-06 | NULL   |
|  4 | Bill      | 600000 | 2028-01-01 | M      |
|  5 | Charlie   |  60000 | 2028-02-01 | M      |
+----+-----------+--------+------------+--------+

mysql> insert into employee_payroll(name,salary,start,gender) 
values('leela', 40000, '2020-03-01', 'F'),('deepa', 50000, '2021-06-04', 'F');

mysql> UPDATE employee_payroll set gender = 'M' where name = 'Manjunath' 
or name = 'Arun'or name = 'Sachin';

mysql> select * from employee_payroll;
+----+-----------+--------+------------+--------+
| id | name      | salary | start      | gender |
+----+-----------+--------+------------+--------+
|  1 | Manjunath | 500000 | 2021-09-01 | M      |
|  2 | Sachin    | 400000 | 2022-09-02 | M      |
|  3 | Arun      | 650000 | 2021-08-06 | M      |
|  4 | Bill      | 600000 | 2028-01-01 | M      |
|  5 | Charlie   |  60000 | 2028-02-01 | M      |
|  6 | leela     |  40000 | 2020-03-01 | F      |
|  7 | deepa     |  50000 | 2021-06-04 | F      |
+----+-----------+--------+------------+--------+

//UC7

mysql> select min(salary) from employee_payroll where gender = 'F';
+-------------+
| min(salary) |
+-------------+
|       40000 |
+-------------+

mysql> select max(salary) from employee_payroll where gender = 'F';
+-------------+
| max(salary) |
+-------------+
|       50000 |
+-------------+

mysql> select max(salary) from employee_payroll where gender = 'm';
+-------------+
| max(salary) |
+-------------+
|      650000 |
+-------------+

mysql> select min(salary) from employee_payroll where gender = 'm';
+-------------+
| min(salary) |
+-------------+
|       60000 |
+-------------+

mysql> select sum(salary) from employee_payroll where gender = 'm';
+-------------+
| sum(salary) |
+-------------+
|     2210000 |
+-------------+

mysql> select sum(salary) from employee_payroll where gender = 'f';
+-------------+
| sum(salary) |
+-------------+
|       90000 |
+-------------+

mysql> select avg(salary) from employee_payroll where gender = 'f';
+-------------+
| avg(salary) |
+-------------+
|       45000 |
+-------------+

mysql> select avg(salary) from employee_payroll where gender = 'm';
+-------------+
| avg(salary) |
+-------------+
|      442000 |
+-------------+

mysql> select count(*) from employee_payroll where gender = 'm';
+----------+
| count(*) |
+----------+
|        5 |
+----------+

mysql> select count(*) from employee_payroll where gender = 'f';
+----------+
| count(*) |
+----------+
|        2 |
+----------+

mysql> select count(*) from employee_payroll;
+----------+
| count(*) |
+----------+
|        7 |
+----------+

mysql> select sum(salary) from employee_payroll;
+-------------+
| sum(salary) |
+-------------+
|     2300000 |
+-------------+

mysql> select avg(salary) from employee_payroll;
+-------------------+
| avg(salary)       |
+-------------------+
| 328571.4285714286 |
+-------------------+




















