use MovinOn_PJ
;
select concat_ws(' ',E.empLast,E.empFirst) as `Employee Full Name`,E.HourlyRate as `Hourly Rate`,round( E.HourlyRate*1.1,2) as `Hourly Rate after increasing`
from tblEmployee as E
where E.WarehouseID = 'OR-1' and E.HourlyRate is not null
;