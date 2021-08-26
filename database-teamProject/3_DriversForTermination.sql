use MovinOn_PJ
;
select D.DriverID as `Driver ID`, 
D.DriverFirst as`First name`, 
D.DriverLast as`Last name`,
D.SSN as `Social Security Number`, 
D.DOB as `Date of Birth`,
D.StartDate as `started date`,
D.EndDate as `End date`,
Address,
City,
State,
D.Zip as `Zip code`,
D.Phone as `Phone number`,
D.Cell as `Cell phone`,
D.MileageRate as `Mileage Rate`,
Review,
D.DrivingRecord as `Driving Record`
       
from tbldriver as D      
where DrivingRecord in ('D','F') 
order by DrivingRecord
;