create database experiment4
go

use experiment4
go

CREATE TABLE EMPLOYEE
( 
EMPNO INTEGER NOT NULL, 
ENAME VARCHAR(30) NOT NULL,
JOB VARCHAR(20) NOT NULL,
MGR INTEGER,
HIREDATE  DATE, 
SAL INTEGER,
COMM INTEGER,
DEPTNO INTEGER
PRIMARY KEY (EMPNO) -- Primary key constraint
);

exec sp_columns EMPLOYEE
GO
CREATE TABLE DEPARTMENT
( 
DEPTNO INTEGER NOT NULL,
DNAME VARCHAR(15) NOT NULL,
LOC VARCHAR(30),
PRIMARY KEY (DEPTNO)
)
go
-------------
use experiment4
go

insert into EMPLOYEE values(7369 ,'SMITH','CLERK',7902,'17-DEC-80',500,800,20)

--insert into EMPLOYEE values(7369, 'SMITH', 'CLERK', 7902, '17-DEC-80', 500 ,800, 20)
insert into EMPLOYEE values(7499,'ALLEN', 'SALESMAN', 7698, '20-FEB-81', 1600, 300, 30)
insert into EMPLOYEE values(7521, 'WARD', 'SALESMAN', 7698, '22-FEB-81', 1250, 500, 30)
insert into EMPLOYEE values(7566, 'JONES', 'MANAGER', 7839, '02-APR-81', 2975,NULL ,20)
insert into EMPLOYEE values(7654, 'MARTIN', 'SALESMAN', 7698, '28-SEP-81', 1250, 1400, 30)
insert into EMPLOYEE values(7698, 'BLAKE', 'MANAGER', 7839, '01-MAY-81', 2850,NULL ,30)
insert into EMPLOYEE values(7782, 'CLARK', 'MANAGER', 7839, '09-JUN-81', 2450,NULL ,10)
insert into EMPLOYEE values(7788, 'SCOTT', 'ANALYST', 7566, '09-DEC-82', 3000,NULL ,20)
insert into EMPLOYEE values(7839, 'KING', 'PRESIDENT','', '17-NOV-81', 5000,NULL ,10)
insert into EMPLOYEE values(7844, 'TURNER', 'SALESMAN', 7698,'08-SEP-81', 1500, 0 ,30)
insert into EMPLOYEE values(7876, 'ADAMS', 'CLERK', 7788,'12-JAN-83', 1100,NULL ,20)
insert into EMPLOYEE values(7900, 'JAMES', 'CLERK', 7698,'03-DEC-81', 950,NULL ,30)
insert into EMPLOYEE values(7902, 'FORD', 'ANALYST', 7566,'03-DEC-81', 3000,NULL ,20)
insert into EMPLOYEE values(7934, 'MILLER', 'CLERK', 7782,'23-JAN-82', 1300,NULL ,10) 

go

select * from EMPLOYEE
go

insert into DEPARTMENT values(10,'ACCOUNTING','NEW YORK')
insert into DEPARTMENT values(20 ,'RESEARCH', 'DALLAS')
insert into DEPARTMENT values(30 ,'SALES' ,'CHICAGO')
insert into DEPARTMENT values(40 ,'OPERATIONS' ,'BOSTON')
select * from DEPARTMENT
go


---1
select * from EMPLOYEE where sal>(select sal from EMPLOYEE where ename = 'BLAKE')

---2
select * from EMPLOYEE where job=(select job from EMPLOYEE where ename = 'ALLEN')

---3
Select * from EMPLOYEE where sal in (select sal from EMPLOYEE where ename = 'SMITH' or ename = 'FORD')
order by ENAME desc;

---4
select * from EMPLOYEE where job =(select job from EMPLOYEE where ename = 'MILLER') OR sal>(select sal from EMPLOYEE where ename = 'ALLEN');

---5
select * from EMPLOYEE where sal =(select max(sal) from EMPLOYEE where deptno=(select d.DEPTNO from
 DEPARTMENT d where d.dname = 'SALES'));
---6
select * from EMPLOYEE where hiredate < (select max(hiredate) from EMPLOYEE where mgr
in (select empno from EMPLOYEE where ename = 'KING'));
---7
select e.ename,e.deptno from EMPLOYEE e where e.sal in (select max(sal) from EMPLOYEE group by deptno);
---8
select * from EMPLOYEE where sal =(select (max(sal)+min(sal))/2 from EMPLOYEE);
---9
select * from EMPLOYEE e where hiredate in (select hiredate from EMPLOYEE where e.empno <> empno);
---10
select * from EMPLOYEE e where hiredate<(select hiredate from EMPLOYEE where empno = e.mgr);
