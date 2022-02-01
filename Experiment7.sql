CREATE DATABASE experiment7
GO
USE experiment7
GO
--1)
CREATE TABLE EMPLOYES(
Employee_id	VARCHAR(10) NOT NULL PRIMARY KEY,
First_Name	VARCHAR(30) NOT NULL,
Last_Name	VARCHAR(30) NOT NULL, 
DOB	Date,		
salary	DECIMAL(25,0) NOT NULL,
Department_id VARCHAR(10)
)
GO
insert into EMPLOYES values(7499, 'ALLEN','Narayan', '20-FEB-81',1600,'CSE')
insert into EMPLOYES values(7521, 'WARD',  'S', '22-FEB-81', 125000, 'AIML')
insert into EMPLOYES values(7566, 'JONES','Wong','02-APR-81',297500,'AIML')
insert into EMPLOYES values(7654, 'MARTIN', 'SALMAN','28-SEP-81',125000,'CIVIL')
insert into EMPLOYES values(7698, 'BLAKE', 'NAGER','01-MAY-81',285000,'BIGDATA')
insert into EMPLOYES values(7782, 'CLARK', 'MAGER','09-JUN-81',245000, 'BIGDATA')
insert into EMPLOYES values(7788, 'SCOTT', 'ANAL','09-DEC-82',300000,'ME')
insert into EMPLOYES values(7839, 'KING', 'PRESIDENT','17-NOV-81',500000,'AIML')
GO
SELECT * FROM EMPLOYES
GO
CREATE INDEX employee_idx on EMPLOYES(Last_Name, Department_id)
GO
--2)
CREATE UNIQUE INDEX EMPLOYEE_UNI_INDX ON EMPLOYES(Employee_id)
--3)
CREATE INDEX EMP_REVERSE ON EMPLOYES(First_name) REVERSE -- Not responding in MS_SQL
--4)
CREATE UNIQUE INDEX employee_UNI_comp on EMPLOYES(First_Name,Last_Name, DOB,salary)
--5)
CREATE TABLE EMPLOYEE_1(
Employee_id	VARCHAR(10) NOT NULL PRIMARY KEY,
First_Name	VARCHAR(30) NOT NULL,
Last_Name	VARCHAR(30) NOT NULL, 
Last_Name_upper as UPPER(Last_Name),
First_name_lower as LOWER(First_Name),
DOB	Date,		
salary	DECIMAL(25,0) NOT NULL,
Department_id VARCHAR(10)
)
GO
insert into EMPLOYEE_1 values(7566, 'JON','wong','02-APR-81',297500,'AIML')
insert into EMPLOYEE_1 values(7788, 'SCOTT', 'anal','09-DEC-82',300000,'ME')
insert into EMPLOYEE_1 values(7654, 'MARTIN', 'fox','28-SEP-81',125000,'CIVIL')
GO
SELECT * FROM EMPLOYEE_1
GO
CREATE UNIQUE INDEX emp_fun_index ON EMPLOYEE_1(Last_Name_upper)
GO
SELECT Employee_id, First_Name, DOB,salary from EMPLOYEE_1
where UPPER(Last_Name)= 'WONG'
--6)
GO
DROP INDEX  emp_fun_index on EMPLOYEE_1
GO
CREATE CLUSTERED INDEX emp_clust on employes(First_Name)
GO
CREATE TABLE DEPARTMENT
( Dname VARCHAR(15) NOT NULL,
Dnumber INT NOT NULL,
Mgr_ssn CHAR(9) NOT NULL,
Mgr_start_date DATE
)
GO
CREATE CLUSTERED INDEX emp_clust on DEPARTMENT(Dname)
