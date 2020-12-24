-- Question 1
-- simple query with a where clause
-- using table 'aliases' for readability
select E1.LName as EName, E2.LName as SName
from CO_EMPLOYEE E1 left join CO_EMPLOYEE E2
on E2.SSN = E1.SupervisorSSN;

-- Question 2
-- using table 'aliases' for readability
-- using an AND in the where clause
-- using arithmetic comparison
select E1.FName as EFName, E1.LName as ELName, E1.Salary as ESalary, E2.FName as SName, E2.Salary as SSalary
from CO_EMPLOYEE E1, CO_EMPLOYEE E2
where  E2.SSN = E1.SupervisorSSN 
and E1.Salary > E2.Salary;

-- Question 3
-- using a substring match
-- query with a join on two tables (using the FK)
-- using table 'aliases' for readability
select ESSN
from CO_WORKS_ON W, CO_PROJECT P
where W.PNumber = P.PNumber
and PName like '%edu';

-- Question 4
-- query with a join on two tables (using the FK)
-- using table 'aliases' for readability
select E1.LName as EName, E2.LName as SName
from CO_WORKS_ON W1, CO_WORKS_ON W2, CO_EMPLOYEE E1, CO_EMPLOYEE E2
where W1.PNumber = W2.PNumber
and W1.ESSN = E1.SSN
and W2.ESSN = E2.SSN
and E2.SSN = E1.SupervisorSSN;

-- Question 5
-- using order by clause for setting order
select LName, Salary
from CO_EMPLOYEE
order by Salary desc;

-- Question 6
-- using the join keyward syntax
-- using order by clause for setting order
select FName, LName, Name, D.BDate 
from CO_EMPLOYEE E join CO_DEPENDENT D on ESSN = SSN
order by FName, D.BDate;

-- Question 7
-- using an AND in the where clause
-- query with a join on two tables (using the FK)
select P.PName, E.LName
from CO_PROJECT P, CO_DEPARTMENT D, CO_EMPLOYEE E
where P.DNumber = D.DNumber
and D.MgrSSN = E.SSN;

-- Question 8
-- using an AND in the where clause
-- using = for exact string matches
-- using order by clause for setting order
select E1.FName as EFName, E1.LName as ELName, E2.LName as SName
from CO_EMPLOYEE E1, CO_EMPLOYEE E2
where E2.SSN = E1.SupervisorSSN 
and E1.Gender = 'F' 
and E2.Gender = 'F'
order by E2.LName; 

-- Question 9
-- using the join keyward syntax
-- query with a join on two tables (using the FK)
-- using = for exact string matches
-- using order by clause for setting order
select E1.FName, E1.LName, E2.LName as MName
from CO_EMPLOYEE E1, CO_EMPLOYEE E2, CO_DEPARTMENT D 
where E1.DNumber = D.DNumber
and E2.SSN = D.MgrSSN
and E1.Gender = 'M'
and E2.Gender = 'M'
order by E1.LName;  

-- Question 10
-- using the join keyward syntax
-- using an OR in the where clause
-- using = for exact string matches
select E.FName, E.LName
from CO_EMPLOYEE E join CO_DEPENDENT D on SSN = ESSN
where E.Gender = 'M' or D.Gender = 'M';