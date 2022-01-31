create database experiment5

go

use experiment4;
go

---1
select deptno, count(*) from employee
  group by deptno
  having count(*)=0
go

---2
select count(*),avg(sal),deptno,job from employee
  group by deptno,job;

---3
select avg(SAL),job from EMPLOYEE 
where JOB!= 'PRESIDENT' 
group by JOB

---4
select deptno ,count(*) from EMPLOYEE group by deptno
having count(*)>=2
---5
select deptno,count(*) from EMPLOYEE group by deptno having count(*)>3
---6
select E.ename,E.deptno, E.SAL from EMPLOYEE E where E.sal in (select max(sal)from EMPLOYEE group by deptno);
---7
select deptno,avg(sal) from EMPLOYEE group by deptno 
having avg(sal)<(select avg(Sal) from EMPLOYEE);