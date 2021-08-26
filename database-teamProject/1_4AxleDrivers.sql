use MovinOn_PJ
;
select concat_ws(' ', D.DriverFirst,D.DriverLast) as `4AxleDrivers Name` ,  D.Phone as `Phone number`, D.DrivingRecord as `Driving record`
from tbldriver as D      
where DrivingRecord in ('A','B') 
;
