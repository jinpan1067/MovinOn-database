use MovinOn_PJ
;
-- Specify WarehouseID = 'WY-1'
select E.WarehouseID as `warehouse ID`,
       concat_ws(' ',E.empLast,E.empFirst) as `Employee Full Name`,
       P.Title as `Position Title`,
       W.Phone as `Warehouse Phone Number`
From tblemployee as E
	  join tblwarehouse as W
          on E.WarehouseID = W.WarehouseID
	  join tblposition as P
		  on E.PositionID = P.PositionID
where E.WarehouseID = 'WY-1'
;
-- Specify WarehouseID = 'WA-1'
select E.WarehouseID as `warehouse ID`,
       concat_ws(' ',E.empLast,E.empFirst) as `Employee Full Name`,
       P.Title as `Position Title`,
       W.Phone as `Warehouse Phone Number`
From tblemployee as E
	  join tblwarehouse as W
          on E.WarehouseID = W.WarehouseID
	  join tblposition as P
		  on E.PositionID = P.PositionID
where E.WarehouseID = 'WA-1'
;

-- Specify WarehouseID = 'OR-1'
select E.WarehouseID as `warehouse ID`,
       concat_ws(' ',E.empLast,E.empFirst) as `Employee Full Name`,
       P.Title as `Position Title`,
       W.Phone as `Warehouse Phone Number`
From tblemployee as E
	  join tblwarehouse as W
          on E.WarehouseID = W.WarehouseID
	  join tblposition as P
		  on E.PositionID = P.PositionID
where E.WarehouseID = 'OR-1'
;