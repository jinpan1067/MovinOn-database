use MovinOn_PJ
;
select concat_ws(' ',E.EmpFirst, E.EmpLast) as `Full name`, E.Salary  as `the highest Salary` 
from tblemployee as E
where Salary = (select max(Salary) from tblemployee)
;


