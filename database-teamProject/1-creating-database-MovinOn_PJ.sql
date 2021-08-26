/* Purpose: create a database management system to manage employee, driver, customer, and order data. */
/* Script Date: MArch 18, 2021 
	Developed by: Pan Jin, zhang zhaoyu
*/
create database MovinOn_PJ
;
use MovinOn_PJ
;
/* create tables in database MovinOn_PJ */
create table tblCustomer
(
CustID smallint auto_increment not null,
CompanyName varchar(30) null,
ContactFirst varchar(20) not null,
ContactLast  varchar(20) not null,
Address      varchar(30) not null,
City         varchar(15) not null,
State        varchar(10) not null,
Zip          varchar(10) not null,
Phone        varchar(15) not null,
Balance      varchar(20) not null,
constraint pk_tblCustomer primary key (CustID)
)
;
create table tblUnitRental
(
CustID smallint not null,                 --  foreign key
WarehouseID varchar(10) not null,          --  foreign key
UnitID      smallint not null,     --  foreign key
DateIn      date not null,
DateOut     date null,
constraint pk_tblUnitRental  primary key 
          (
          CustID       asc,
          WarehouseID  asc,
          UnitID       asc
          )
)
;

create table tblJobOrder
(
JobID  smallint auto_increment not null,
CustID smallint   not null,                --  foreign key
MoveDate date     not null,
FromAddress  varchar(30) not null,
FromCity     varchar(15) not null,
FromState    varchar(10) not null,
ToAddress    varchar(30) not null,
ToCity       varchar(15) not null,
ToState      varchar(10) not null,
DistanceEst  varchar(15) not null,
WeightEst    varchar(15) not null,
Packing     boolean  not null,
Heavy       boolean  not null,
Storage     boolean   not null,
constraint pk_tblJobOrder primary key (JobID)
)
;
create table tblVehicle
(
  VehicleID varchar(10) not null,
  LiscensePlateNum varchar (15) not null,
  Axle   smallint not null,
  Color   varchar(10) not null,
  constraint pk_tblVehicle primary key (VehicleID)
)
;
create table tblWarehouse
(
  WarehouseID varchar(20) not null,
  Address     varchar(30) not null,
  City        varchar(15) not null,
  State       varchar(10) not null,
  Zip         varchar(10) not null,
  Phone       varchar(15) not null,
  Climatecontrol varchar(5) not null,
  SecurityGate   varchar(5)  not null,
 constraint pk_tblWarehouse primary key (WarehouseID)
)
;
create table tblJobDetail
( JobID  smallint not null,             --  foreign key
  VehicleID varchar(10) not null,        --  foreign key
  DriverID  smallint not null,        -- foreign key
  MileageActual varchar(30) not null,
  WeightActual  varchar(30) not null,
  constraint pk_tblJobDetail  primary key (JobID)
)
;
create table tblStorageUnit
(UnitID  smallint  not null,
WarehouseID  varchar(20) not null,         --  foreign key
UnitSize     varchar(10) not null,
Rent         varchar(5)  not null,
 constraint pk_tblStorageUnit primary key (
 UnitID,
 WarehouseID
 )
)
;
create table tblDriver
(
DriverID     smallint auto_increment not null,  
DriverFirst   varchar(20) not null,
DriverLast    varchar(20) not null,
SSN           int not null,
DOB            date not null,
StartDate      date not null,
EndDate        date null,
Address        varchar(30) not null,
City           varchar(15) not null,
State          varchar(10) not null,
Zip            varchar(10) not null,
Phone          varchar(15) not null,
Cell           varchar(15) not null,
MileageRate     float not null,
Review          date null,
DrivingRecord   char(1) not null,
constraint pk_tblDriver primary key (DriverID)
)
;
create table tblEmployee
(
EmpID         smallint auto_increment not null,
EmpFirst      varchar(20) not null,
EmpLast       varchar(20) not null,
WarehouseID   varchar(20) not null,
SSN           int not null,
DOB            date not null,
StartDate      date not null,
EndDate        date null,
Address        varchar(30) not null,
City           varchar(15) not null,
State          varchar(10) not null,
Zip            varchar(10) not null,
PositionID     smallint not null,
Memo           varchar(30) null,
Phone           varchar(15) not null,
Cell            varchar(15) not null,
Salary          varchar(15)  null,
HourlyRate      varchar(10) null,
Review          date null,
constraint pk_tblEmployee primary key (EmpID)
)
;
create table tblPosition
(PositionID smallint auto_increment not null,
Title varchar(30) not null,
constraint pk_tblPosition primary key (PositionID)
)
;

/* add foreign key for some tables */
-- Add FK for table tblUnitRental.
alter table tblUnitRental
	add constraint fk_tblUnitRental_tblCustomer foreign key (CustID)
		references tblCustomer(CustID)
;       
alter table tblUnitRental
	add constraint fk_tblUnitRental_tblWarehouse foreign key (WarehouseID)
		references tblWarehouse(WarehouseID)
; 
alter table tblUnitRental
	add constraint fk_tblUnitRental_tblStorageUnit foreign key (UnitID)
		references tblStorageUnit(UnitID)
; 

-- Add FK for table tblJobOrder.
alter table tblJobOrder
	add constraint fk_tblJobOrder_tblCustomer foreign key (CustID)
		references tblCustomer(CustID)
; 
-- Add FK for table tblJobDetail.
alter table tblJobDetail
	add constraint fk_tblJobDetail_tblJobOrder foreign key (JobID)
		references tblJobOrder(JobID)
; 
alter table tblJobDetail
	add constraint fk_tblJobDetail_tblVehicle foreign key (VehicleID)
		references tblVehicle(VehicleID)
; 
alter table tblJobDetail
	add constraint fk_tblJobDetail_tblDriver foreign key (DriverID)
		references tblDriver(DriverID)
; 
-- Add FK for table tblStorageUnit.
alter table tblStorageUnit
    add constraint fk_tblStorageUnit_tblWarehouse foreign key(warehouseID)
         references tblWarehouse(warehouseID)
;

-- Add FK for table tblEmployee.
alter table tblEmployee
     add constraint fk_tblEmployee_tblWarehouse foreign key(warehouseID)
         references tblWarehouse(warehouseID)
;
alter table tblEmployee
     add constraint fk_tblEmployee_tblPosition foreign key(PositionID)
         references tblPosition(PositionID)
;

/* load data from external xlsx file */


load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Customers.csv'
into table tblCustomer
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Drivers.csv'
into table tblDriver
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
(DriverID,DriverFirst,DriverLast,SSN,@var_DOB,@var_StartDate,@var_EndDate,Address, City, State,Zip,Phone,Cell,MileageRate,@var_Review,DrivingRecord)
set DOB=str_to_date(@var_DOB,'%m/%d/%y'),StartDate=str_to_date(@var_StartDate,'%m/%d/%y'),EndDate=str_to_date(@var_EndDate,'%m/%d/%y'),Review=str_to_date(@var_Review,'%m/%d/%y')
;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Employees.csv'
into table tblEmployee
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
(EmpID,EmpFirst,EmpLast,WarehouseID,SSN,@var_DOB,@var_StartDate,@var_EndDate,Address, City, State,Zip,PositionID,Memo,Phone,Cell,Salary,HourlyRate,@var_Review)
set DOB=str_to_date(@var_DOB,'%m/%d/%y'),StartDate=str_to_date(@var_StartDate,'%m/%d/%y'),EndDate=str_to_date(@var_EndDate,'%m/%d/%y'),Review=str_to_date(@var_Review,'%m/%d/%y')
;

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/warehouse.csv'
into table tblwarehouse
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Position.csv'
into table tblPosition
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/JobDetails.csv'
into table tbljobdetail
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/JobOrders.csv'
into table tbljobOrder
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;                                                                                                                                                                                                                                           
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Vehicles.csv'
into table tblvehicle
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
;  
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/StorageUnits.csv'
into table tblStorageUnit
fields terminated by ','
lines terminated by '\r\n'
ignore 1 rows
; 
INSERT INTO tblUnitRental(CustID,WarehouseID,UnitID,DateIn)
VALUES 
('2', 'OR-1','4','2016-04-01'),
('2', 'OR-1','5','2016-04-01'),
('4', 'WY-1','3','2016-02-15'),
('6','WA-1','5','2016-01-01'),
('7', 'WY-1','6','2016-01-15'),
('7', 'WY-1','10','2016-01-15'),
('9', 'WA-1','10','2016-02-15'),
('10', 'OR-1','6','2016-01-02'),
('10', 'OR-1','7','2016-01-02'),
('10', 'OR-1','8','2016-02-15'),
('11', 'WY-1','2','2016-01-15'),
('12', 'WA-1','2','2016-02-15'),
('12', 'WA-1','6','2016-01-02'),
('13', 'WY-1','4','2016-01-02'),
('13', 'WY-1','5','2016-01-02'),	
('14', 'WA-1','4','2016-02-15'),	
('15','WA-1','3','2016-02-20'),	
('17','WY-1','9','2016-01-02'),
('18','WA-1','7','2016-01-02'),
('20','WA-1','6','2016-01-15'),
('26','OR-1','2','2016-01-02'),	
('27','WA-1','8','2016-01-02'),	
('31','WY-1','8','2016-02-20'),	
('32','WA-1','9','2016-05-01'),	
('36','OR-1','10','2016-02-15'),	
('38','WY-1','10','2016-01-15')	
;


