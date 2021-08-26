use MovinOn_PJ
;
select count(EmpID) as `Employees Number per city`, E.City as `City`
from tblemployee as E
group by E.City
;