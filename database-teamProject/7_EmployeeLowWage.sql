use MovinOn_PJ
;
select concat_ws(' ',E.EmpFirst, E.EmpLast) as `Full name`, E.HourlyRate  as `the lowest HourlyRate` 
from tblemployee as E
where HourlyRate = (select min(HourlyRate) from tblemployee);
;

