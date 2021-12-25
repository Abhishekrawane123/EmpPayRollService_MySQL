UC2

mysql> create table
    -> EmployeePayroll(EmpID int unsigned not null auto_increment, Name varchar(20), Salary double, S_Date date, primary key (EmpID));
Query OK, 0 rows affected (0.12 sec)

mysql> show table
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> show tables;
+-----------------------------+
| Tables_in_emppayrollservice |
+-----------------------------+
| employeepayroll             |
+-----------------------------+
1 row in set (0.01 sec)

mysql> describe employeepayroll
    -> ;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| EmpID  | int unsigned | NO   | PRI | NULL    | auto_increment |
| Name   | varchar(20)  | YES  |     | NULL    |                |
| Salary | double       | YES  |     | NULL    |                |
| S_Date | date         | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0.02 sec)

UC3

mysql> insert into employeepayroll(Name, Salary, S_Date) values ('Abhishek', 20000, '2021-12-22');
Query OK, 1 row affected (0.04 sec)

mysql> select * from employeepayroll;
+-------+----------+--------+------------+
| EmpID | Name     | Salary | S_Date     |
+-------+----------+--------+------------+
|     1 | Abhishek |  20000 | 2021-12-22 |
+-------+----------+--------+------------+
1 row in set (0.01 sec)

mysql> insert into employeepayroll(Name, Salary, S_Date) values ('Akash', 40000, '2020-05-06');
Query OK, 1 row affected (0.02 sec)

mysql> insert into employeepayroll(Name, Salary, S_Date) values ('Ashwini', 60000, '2019-06-19');
Query OK, 1 row affected (0.01 sec)

mysql> select * from employeepayroll;
+-------+----------+--------+------------+
| EmpID | Name     | Salary | S_Date     |
+-------+----------+--------+------------+
|     1 | Abhishek |  20000 | 2021-12-22 |
|     2 | Akash    |  40000 | 2020-05-06 |
|     3 | Ashwini  |  60000 | 2019-06-19 |
+-------+----------+--------+------------+
3 rows in set (0.00 sec)

UC4

mysql> insert into employeepayroll(Name, Salary, S_Date) values ('Ashwini', 60000, '2019-06-19');
Query OK, 1 row affected (0.01 sec)

mysql> select * from employeepayroll;
+-------+----------+--------+------------+
| EmpID | Name     | Salary | S_Date     |
+-------+----------+--------+------------+
|     1 | Abhishek |  20000 | 2021-12-22 |
|     2 | Akash    |  40000 | 2020-05-06 |
|     3 | Ashwini  |  60000 | 2019-06-19 |
+-------+----------+--------+------------+
3 rows in set (0.00 sec)

UC5

mysql> select salary from employeepayroll where name = 'Akash';
+--------+
| salary |
+--------+
|  40000 |
+--------+
1 row in set (0.01 sec)

mysql> select salary from employeepayroll where S_Date between cast( '2019-06-19' as date) and date(now());
+--------+
| salary |
+--------+
|  20000 |
|  40000 |
|  60000 |
+--------+
3 rows in set (0.01 sec)

UC6

mysql> alter table employeepayroll add gender char(1) after Salary;
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe employeepayroll
    -> ;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| EmpID  | int unsigned | NO   | PRI | NULL    | auto_increment |
| Name   | varchar(20)  | YES  |     | NULL    |                |
| Salary | double       | YES  |     | NULL    |                |
| gender | char(1)      | YES  |     | NULL    |                |
| S_Date | date         | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

mysql> UPDATE employeepayroll set gender = 'M' where name = 'Abhishek' or name = 'Akash';
Query OK, 2 rows affected (0.02 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> UPDATE employeepayroll set gender = 'F' where name = 'Ashwini';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employeepayroll;
+-------+----------+--------+--------+------------+
| EmpID | Name     | Salary | gender | S_Date     |
+-------+----------+--------+--------+------------+
|     1 | Abhishek |  20000 | M      | 2021-12-22 |
|     2 | Akash    |  40000 | M      | 2020-05-06 |
|     3 | Ashwini  |  60000 | F      | 2019-06-19 |
+-------+----------+--------+--------+------------+
3 rows in set (0.01 sec)

mysql> select * from employeepayroll;

UC7

mysql> select sum(salary) from employeepayroll where gender = 'M' group by gender;
+-------------+
| sum(salary) |
+-------------+
|       60000 |
+-------------+
1 row in set (0.00 sec)

UC8

mysql> alter table employeepayroll add EmpPhone double after salary;
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employeepayroll add EmpAddress after salary;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'after salary' at line 1
mysql> alter table employeepayroll add EmpAddress varchar(100) after salary;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employeepayroll add EmpDepartment varchar(50) after salary;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employeepayroll;
+-------+----------+--------+---------------+------------+----------+--------+------------+
| EmpID | Name     | Salary | EmpDepartment | EmpAddress | EmpPhone | gender | S_Date     |
+-------+----------+--------+---------------+------------+----------+--------+------------+
|     1 | Abhishek |  20000 | NULL          | NULL       |     NULL | M      | 2021-12-22 |
|     2 | Akash    |  40000 | NULL          | NULL       |     NULL | M      | 2020-05-06 |
|     3 | Ashwini  |  60000 | NULL          | NULL       |     NULL | F      | 2019-06-19 |
+-------+----------+--------+---------------+------------+----------+--------+------------+
3 rows in set (0.00 sec)

mysql> update employeepayroll set EmpDepartment = 'biology', EmpAddress = 'Gajanan nagar, Akola', EmpPhone = '7720957882' where name = 'Abhishek';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employeepayroll;
+-------+----------+--------+---------------+----------------------+------------+--------+------------+
| EmpID | Name     | Salary | EmpDepartment | EmpAddress           | EmpPhone   | gender | S_Date     |
+-------+----------+--------+---------------+----------------------+------------+--------+------------+
|     1 | Abhishek |  20000 | biology       | Gajanan nagar, Akola | 7720957882 | M      | 2021-12-22 |
|     2 | Akash    |  40000 | NULL          | NULL                 |       NULL | M      | 2020-05-06 |
|     3 | Ashwini  |  60000 | NULL          | NULL                 |       NULL | F      | 2019-06-19 |
+-------+----------+--------+---------------+----------------------+------------+--------+------------+
3 rows in set (0.01 sec)

mysql> update employeepayroll set EmpDepartment = 'Physics', EmpAddress = 'Main road, Washim', EmpPhone = '8208629118' where name = 'Akash';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employeepayroll set EmpDepartment = 'Maths', EmpAddress = 'Maruti nagar, Kolhapur', EmpPhone = '9158285324' where name = 'Ashwini';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employeepayroll;
+-------+----------+--------+---------------+------------------------+------------+--------+------------+
| EmpID | Name     | Salary | EmpDepartment | EmpAddress             | EmpPhone   | gender | S_Date     |
+-------+----------+--------+---------------+------------------------+------------+--------+------------+
|     1 | Abhishek |  20000 | biology       | Gajanan nagar, Akola   | 7720957882 | M      | 2021-12-22 |
|     2 | Akash    |  40000 | Physics       | Main road, Washim      | 8208629118 | M      | 2020-05-06 |
|     3 | Ashwini  |  60000 | Maths         | Maruti nagar, Kolhapur | 9158285324 | F      | 2019-06-19 |
+-------+----------+--------+---------------+------------------------+------------+--------+------------+
3 rows in set (0.01 sec)

mysql>

UC9

mysql> alter table employeepayroll add EmpDeductions double;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employeepayroll add EmpTaxablePay double;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employeepayroll add EmpIncomeTax double;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employeepayroll add EmpNetPay double;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe employeepayroll;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| EmpID         | int unsigned | NO   | PRI | NULL    | auto_increment |
| Name          | varchar(20)  | YES  |     | NULL    |                |
| Salary        | double       | YES  |     | NULL    |                |
| EmpDepartment | varchar(50)  | YES  |     | NULL    |                |
| EmpAddress    | varchar(100) | YES  |     | NULL    |                |
| EmpPhone      | double       | YES  |     | NULL    |                |
| gender        | char(1)      | YES  |     | NULL    |                |
| S_Date        | date         | YES  |     | NULL    |                |
| EmpBasicPay   | varchar(50)  | YES  |     | NULL    |                |
| EmpDeductions | double       | YES  |     | NULL    |                |
| EmpTaxablePay | double       | YES  |     | NULL    |                |
| EmpIncomeTax  | double       | YES  |     | NULL    |                |
| EmpNetPay     | double       | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
13 rows in set (0.01 sec)

mysql> select * from employeepayroll;
+-------+----------+--------+---------------+------------------------+------------+--------+------------+-------------+---------------+---------------+--------------+-----------+
| EmpID | Name     | Salary | EmpDepartment | EmpAddress             | EmpPhone   | gender | S_Date     | EmpBasicPay | EmpDeductions | EmpTaxablePay | EmpIncomeTax | EmpNetPay |
+-------+----------+--------+---------------+------------------------+------------+--------+------------+-------------+---------------+---------------+--------------+-----------+
|     1 | Abhishek |  20000 | biology       | Gajanan nagar, Akola   | 7720957882 | M      | 2021-12-22 | NULL        |          NULL |          NULL |         NULL |      NULL |
|     2 | Akash    |  40000 | Physics       | Main road, Washim      | 8208629118 | M      | 2020-05-06 | NULL        |          NULL |          NULL |         NULL |      NULL |
|     3 | Ashwini  |  60000 | Maths         | Maruti nagar, Kolhapur | 9158285324 | F      | 2019-06-19 | NULL        |          NULL |          NULL |         NULL |      NULL |
+-------+----------+--------+---------------+------------------------+------------+--------+------------+-------------+---------------+---------------+--------------+-----------+
3 rows in set (0.00 sec)

mysql> update employeepayroll set EmpBasicPay = '20000', EmpDeductions = '8000', EmpTaxablePay = '1023', EmpIncomeTax = '2301', EmpNetPay = '8700';
Query OK, 3 rows affected (0.02 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from employeepayroll;
+-------+----------+--------+---------------+------------------------+------------+--------+------------+-------------+---------------+---------------+--------------+-----------+
| EmpID | Name     | Salary | EmpDepartment | EmpAddress             | EmpPhone   | gender | S_Date     | EmpBasicPay | EmpDeductions | EmpTaxablePay | EmpIncomeTax | EmpNetPay |
+-------+----------+--------+---------------+------------------------+------------+--------+------------+-------------+---------------+---------------+--------------+-----------+
|     1 | Abhishek |  20000 | biology       | Gajanan nagar, Akola   | 7720957882 | M      | 2021-12-22 | 20000       |          8000 |          1023 |         2301 |      8700 |
|     2 | Akash    |  40000 | Physics       | Main road, Washim      | 8208629118 | M      | 2020-05-06 | 20000       |          8000 |          1023 |         2301 |      8700 |
|     3 | Ashwini  |  60000 | Maths         | Maruti nagar, Kolhapur | 9158285324 | F      | 2019-06-19 | 20000       |          8000 |          1023 |         2301 |      8700 |
+-------+----------+--------+---------------+------------------------+------------+--------+------------+-------------+---------------+---------------+--------------+-----------+
3 rows in set (0.01 sec)

mysql> update employeepayroll set EmpBasicPay = '40000', EmpDeductions = '10000', EmpTaxablePay = '1000', EmpIncomeTax = '2500', EmpNetPay = '36500' where name = 'Akash';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employeepayroll set EmpBasicPay = '60000', EmpDeductions = '15000', EmpTaxablePay = '1500', EmpIncomeTax = '3500', EmpNetPay = '40000' where name = 'Ashwini';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employeepayroll;
+-------+----------+--------+---------------+------------------------+------------+--------+------------+-------------+---------------+---------------+--------------+-----------+
| EmpID | Name     | Salary | EmpDepartment | EmpAddress             | EmpPhone   | gender | S_Date     | EmpBasicPay | EmpDeductions | EmpTaxablePay | EmpIncomeTax | EmpNetPay |
+-------+----------+--------+---------------+------------------------+------------+--------+------------+-------------+---------------+---------------+--------------+-----------+
|     1 | Abhishek |  20000 | biology       | Gajanan nagar, Akola   | 7720957882 | M      | 2021-12-22 | 20000       |          8000 |          1023 |         2301 |      8700 |
|     2 | Akash    |  40000 | Physics       | Main road, Washim      | 8208629118 | M      | 2020-05-06 | 40000       |         10000 |          1000 |         2500 |     36500 |
|     3 | Ashwini  |  60000 | Maths         | Maruti nagar, Kolhapur | 9158285324 | F      | 2019-06-19 | 60000       |         15000 |          1500 |         3500 |     40000 |
+-------+----------+--------+---------------+------------------------+------------+--------+------------+-------------+---------------+---------------+--------------+-----------+
3 rows in set (0.00 sec)

UC10

mysql> insert into employeepayroll (Name, salary, Empdepartment, empaddress, Empphone, gender, S_date, empbasicpay, empdeductions, emptaxablepay, empincometax, empnetpay) values (Abhishek, 50000, Chemistry, 'Manrulpir road, Barshitakli', '7767882171', 'M', '2016-04-01', 50000, 20000, 2000, 4000, 24000);
ERROR 1054 (42S22): Unknown column 'Abhishek' in 'field list'
mysql> insert into employeepayroll (Name, salary, Empdepartment, empaddress, Empphone, gender, S_date, empbasicpay, empdeductions, emptaxablepay, empincometax, empnetpay) values ('Abhishek', '50000', 'Chemistry', 'Manrulpir road, Barshitakli', '7767882171', 'M', '2016-04-01', '50000', '20000', '2000', '4000', '24000');
Query OK, 1 row affected (0.02 sec)

mysql> select * from employeepayroll;
+-------+----------+--------+---------------+-----------------------------+------------+--------+------------+-------------+---------------+---------------+--------------+-----------+
| EmpID | Name     | Salary | EmpDepartment | EmpAddress                  | EmpPhone   | gender | S_Date     | EmpBasicPay | EmpDeductions | EmpTaxablePay | EmpIncomeTax | EmpNetPay |
+-------+----------+--------+---------------+-----------------------------+------------+--------+------------+-------------+---------------+---------------+--------------+-----------+
|     1 | Abhishek |  20000 | biology       | Gajanan nagar, Akola        | 7720957882 | M      | 2021-12-22 | 20000       |          8000 |          1023 |         2301 |      8700 |
|     2 | Akash    |  40000 | Physics       | Main road, Washim           | 8208629118 | M      | 2020-05-06 | 40000       |         10000 |          1000 |         2500 |     36500 |
|     3 | Ashwini  |  60000 | Maths         | Maruti nagar, Kolhapur      | 9158285324 | F      | 2019-06-19 | 60000       |         15000 |          1500 |         3500 |     40000 |
|     4 | Abhishek |  50000 | Chemistry     | Manrulpir road, Barshitakli | 7767882171 | M      | 2016-04-01 | 50000       |         20000 |          2000 |         4000 |     24000 |
+-------+----------+--------+---------------+-----------------------------+------------+--------+------------+-------------+---------------+---------------+--------------+-----------+
4 rows in set (0.01 sec)

mysql> select name from employeepayroll where salary = '50000';
+----------+
| name     |
+----------+
| Abhishek |
+----------+
1 row in set (0.01 sec)

mysql> select * from employeepayroll where salary = '50000';
+-------+----------+--------+---------------+-----------------------------+------------+--------+------------+-------------+---------------+---------------+--------------+-----------+
| EmpID | Name     | Salary | EmpDepartment | EmpAddress                  | EmpPhone   | gender | S_Date     | EmpBasicPay | EmpDeductions | EmpTaxablePay | EmpIncomeTax | EmpNetPay |
+-------+----------+--------+---------------+-----------------------------+------------+--------+------------+-------------+---------------+---------------+--------------+-----------+
|     4 | Abhishek |  50000 | Chemistry     | Manrulpir road, Barshitakli | 7767882171 | M      | 2016-04-01 | 50000       |         20000 |          2000 |         4000 |     24000 |
+-------+----------+--------+---------------+-----------------------------+------------+--------+------------+-------------+---------------+---------------+--------------+-----------+
1 row in set (0.00 sec)


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

mysql> create table company(companyID int not null, companyName varchar(20) not null, primary key(companyID));
Query OK, 0 rows affected (0.04 sec)

mysql> create table employee(empID int not null, empName varchar(50) not null, empPhone long, companyID int not null, primary key(empID), foreign key(companyID) references company(companyID);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> create table employee(empID int not null, empName varchar(50) not null, empPhone long, companyID int not null, primary key(empID), foreign key(companyID) references company(companyID));
Query OK, 0 rows affected (0.08 sec)

mysql> create table department(empID int, departmentID int primary key, departmentName varchar(40), foreign key(empID) references employee(empID));
Query OK, 0 rows affected (0.07 sec)

mysql> create table emppayroll(empID int, basicpay double, taxablepay double, incometax double, netpay double, primary key(basicpay), foreign key(empID) references employee(empID));
Query OK, 0 rows affected (0.07 sec)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------