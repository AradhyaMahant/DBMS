DROP DATABASE view_exp
GO
CREATE DATABASE view_exp
GO
USE view_exp
GO
/*
	Create table of table name: EMPLOYEES and add 6 rows
	Column Name Data Type Width Attributes
	Employee_id Character 10 PK
	First_Name Character 30 NN
	Last_Name Character 30 NN
	DOB Date
	salary Number 25 NN
	Department_id character 10
*/
CREATE TABLE EMPLOYEES(
Employee_id	VARCHAR(10) NOT NULL PRIMARY KEY,
First_Name	VARCHAR(30) NOT NULL,
Last_Name	VARCHAR(30) NOT NULL, 
DOB	Date,		
salary	DECIMAL(25,0) NOT NULL,
Department_id VARCHAR(10)
)
GO
exec sp_columns EMPLOYEES
GO
--1) Create View of name emp_view and the column would be Employee_id, Last_Name, salary and department_id only
CREATE VIEW emp_view(Employee_id, Last_Name, salary, Department_id) 
AS
SELECT Employee_id, Last_Name, salary, Department_id FROM EMPLOYEES
GO
exec sp_columns emp_view
GO
--2) Insert values into view(remove the NOT NULL constraint and then insert values)
ALTER TABLE EMPLOYEES ALTER COLUMN First_Name varchar(30) null
GO
INSERT INTO emp_view VALUES('EMP000111', 'JAIN', 50000, 'INFORMATIC')
INSERT INTO emp_view VALUES ('EMP000112', 'Joyce', 25000, 'ECE')
INSERT INTO emp_view VALUES ('EMP000113', 'Ramesh',38000, 'ME')
INSERT INTO emp_view VALUES ('EMP000114', 'James', 55000, 'CIVIL')
INSERT INTO emp_view VALUES('EMP000115','Jennifer',65555, 'IT')
GO
select * from EMPLOYEES
select * from emp_view 
GO
--3) Modify, delete and drop operations are performed on view
update emp_view
set salary=60000
where Employee_id='EMP000113'
GO
delete from emp_view
where Last_Name = 'Joyce'
GO
CREATE VIEW ADBMS(L_Name, salary) AS
SELECT Last_Name, salary FROM EMPLOYEES
GO
SELECT * FROM ADBMS
GO
DROP VIEW ADBMS
--4) Creates a view named salary_view. The view shows the employees in department 20 and their annual salary
GO

SELECT * FROM emp_view
INSERT INTO emp_view VALUES('EMP000116','GUPTA',80000, '20')
GO
CREATE VIEW salary_view AS
SELECT Employee_id, Last_Name, salary FROM EMPLOYEES
WHERE Department_id='20'
GO
SELECT * FROM salary_view

