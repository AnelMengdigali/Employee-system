-- Individual Work

-- Question 1 
-- joining all the employees with all dependets 
-- using = for exact string matches
select E.LName, D.Name, D.BDate
from CO_EMPLOYEE E, CO_DEPENDENT D
where E.SSN = D.ESSN
and D.Gender = 'F';

-- Question 2 
-- simple update statement on 1 attribute of hours
-- condition of where clause includes a subquery with arithmetic comparison for having salaries
update CO_WORKS_ON
set Hours = Hours - 1
where ESSN in
(select SSN from CO_EMPLOYEE where Salary < 80000);

-- Question 3 
-- outer join to return even the employees with no dependents
-- using aggregation function count()
-- using group by columns clause
select E.LName, count(D.ESSN) as numDependents
from CO_EMPLOYEE E left join CO_DEPENDENT D
on E.SSN = D.ESSN
group by E.SSN;

-- Question 4 
-- simple delete statement with simple where clause
delete from CO_WORKS_ON
where PNumber = 7;

-- Question 5 
-- using aggregation functions count() & sum()
-- default inner join to return projects with workers on it
-- using group by columns clause
select P.PName, count(W.ESSN) as numEmployees, sum(W.Hours) sumHours
from CO_PROJECT P, CO_WORKS_ON W
where P.PNumber = W.PNumber
group by P.PNumber;

-- Question 6 
-- using aggregation function count()
select count(distinct DName) as numDepartments
from CO_DEPARTMENT;

-- Question 7 
-- condition of where clause includes a subquery
select PName
from CO_PROJECT
where PNumber not in 
(select PNumber from CO_WORKS_ON);

-- Question 8 
-- using simple where clause
select LName
from CO_EMPLOYEE
where SupervisorSSN is null; 

-- Question 9 
-- default inner join to return departments with employees
-- using aggregation function sum()
-- query with a join on two tables (using the FK)
-- using group by columns clause
select D.DName, sum(E.Salary) as moneyOnSalary
from CO_DEPARTMENT D, CO_EMPLOYEE E
where D.DNumber = E.DNumber
group by D.DNumber;

-- Question 10 
-- using aggregation function count()
select count(distinct SupervisorSSN) as numSupervisors
from CO_EMPLOYEE;

-- Question 11 
-- outer join to return even the employees with no work-on projects
-- using aggregation function sum()
-- using group by columns clause
select E.LName, E.FName, sum(W.Hours) as sumHours
from CO_EMPLOYEE E left join CO_WORKS_ON W
on E.SSN = W.ESSN
group by E.SSN;  

-- Question 12 
-- using aggregation functions max() & sum()
-- using subquery with a join on two tables (using the FK) in from clause
select max(A.sumHours) as maxNumHours
from 
(select sum(W.Hours) as sumHours 
from CO_WORKS_ON W
group by W.ESSN) A;  

-- Question 13 
-- using aggregation function sum()
-- joining three tables using their corresponding FKs
-- using group by columns clause
-- moneyOnSalary (total salary) are sorted least to most
select D.DNumber, D.DName, E2.LName, sum(E1.Salary) as moneyOnSalary
from CO_DEPARTMENT D, CO_EMPLOYEE E1, CO_EMPLOYEE E2
where E2.SSN = D.MgrSSN
and E1.DNumber = D.DNumber
group by D.DNumber
order by moneyOnSalary asc; 

-- Question 14 
-- using aggregation function count()
-- outer join to return even the employees with no dependents
-- using group by columns clause
-- the countDept (number of dependents) are sorted most to least
select E.LName, count(D.ESSN) as countDept
from CO_EMPLOYEE E left join CO_DEPENDENT D
on E.SSN = D.ESSN
group by E.SSN
order by countDept desc;  

-- Question 15
-- joining all the employees with all dependets 
-- using % for substring matches
-- using datediff() function to have difference of 2 dates
select E.LName, D.Name, floor(datediff(D.BDate, E.BDate)/365) as ageDiff
from CO_EMPLOYEE E, CO_DEPENDENT D
where E.SSN = D.ESSN
and D.Name like 'A%';  

-- Question 16 
-- using aggregation function count()
-- joining three tables using their corresponding FKs
-- using group by columns clause
-- using having clause to set condition of having more than 2 locations
select D.DName, E.FName, count(L.Location) as numLocations
from CO_DEPARTMENT D, CO_EMPLOYEE E, CO_DEPT_LOCATION L
where E.SSN = D.MgrSSN
and D.DNumber = L.DNumber
group by D.DName
having count(L.Location) > 2;

-- Question 17 
-- using aggregation function count()
-- using pairs of employees to have supervisor and its employee
-- using subquery where clauses to ensure having no male workers
-- using = for exact string matches
select E2.SSN, count(E1.SSN) as numEmployees
from CO_EMPLOYEE E2, CO_EMPLOYEE E1
where E2.SSN = E1.SupervisorSSN
and (select count(E1.SSN) > 0 from CO_EMPLOYEE E1 where E2.SSN = E1.SupervisorSSN and E1.Gender = 'F')
and (select count(E1.SSN) = 0 from CO_EMPLOYEE E1 where E2.SSN = E1.SupervisorSSN and E1.Gender = 'M')
group by E2.SSN;

-- Question 18 
-- condition of where clause includes subquery with aggregation function to ensure maximum value
select LName, Salary
from CO_EMPLOYEE 
where Salary = 
(select max(Salary) from CO_EMPLOYEE);  

-- Extra 
-- joining two tables using the FK
-- using arithmetic comparison on subqueries in where clause to ensure the biggest total working hours 
select LName
from CO_EMPLOYEE 
where 
(select sum(W.Hours) from CO_WORKS_ON W where SSN = W.ESSN) = 
(select max(A.sumHours) from 
	(select sum(W.Hours) as sumHours
	from CO_WORKS_ON W 
	group by W.ESSN) A);  






