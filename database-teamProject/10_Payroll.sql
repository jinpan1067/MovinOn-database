use MovinOn_PJ
;
select  E.EmpID as `Employee ID`,
 concat_ws(' ', E.EmpFirst,E.EmpLast) as `Employee name`,
 E.SSN as `Social Security Numbers`, 
 ifnull(round(E.Salary/12,2), '' ) as `Monthly Wage`, 
 ifnull(E.HourlyRate,'') as `Hourly Rate`
from tblemployee as E
order by `Employee name`
;