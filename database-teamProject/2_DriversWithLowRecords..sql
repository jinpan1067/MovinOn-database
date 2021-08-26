use MovinOn_PJ
;
select concat_ws(' ', D.DriverFirst,D.DriverLast) as `Lower records Drivers Name` ,  D.Phone as `Phone number`, D.DrivingRecord as `Driving record`,D.startDate as `Start Date`, D.EndDate as `End Date`
from tbldriver as D      
where DrivingRecord not in ('A','B') 
order by `Driving record`
;
