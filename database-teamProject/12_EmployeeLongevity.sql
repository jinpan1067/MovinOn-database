use MovinOn_PJ
;
select E.WarehouseID as `warehouse ID`,
       concat_ws(' ',E.empLast,E.empFirst) as `Employee Full Name`,
       round(datediff(ifnull(E.EndDate, curdate()), E.StartDate ) / 365,1)as `Employee longivity (years)`,
       P.Title as `Position Title`
      
From tblemployee as E
	  join tblwarehouse as W
          on E.WarehouseID = W.WarehouseID
	  join tblposition as P
		  on E.PositionID = P.PositionID
order by 'warehouse ID'
;

