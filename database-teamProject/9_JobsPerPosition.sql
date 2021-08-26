use MovinOn_PJ
;
select count(E.PositionID) as `numbers of Employees`, p.Title as 'job title'
from tblemployee as E
	 inner join tblposition as P
         on E.PositionID = P.PositionID
group by p.Title
;

