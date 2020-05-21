/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  seant
 * Created: 20/05/2020
 */

CREATE TABLE Customer(
CustomerEmail varchar (50) NOT NULL,
FName varchar(20), 
LName varchar(20),
PhoneNumber varchar(10),
Password varchar(30),
StreetAddress varchar(30),
UnitNumber varchar(5),
City varchar(30),
State varchar(30),
PostalCode varchar(5),
LoginStatus boolean,
RegisterDate timestamp,
Gender boolean,
PRIMARY KEY (CustomerEmail)
); 

CREATE TABLE Staff(
StaffEmail varchar (50) NOT NULL,
FName varchar(20), 
LName varchar(20),
PhoneNumber varchar(10),
Password varchar(30),
StreetAddress varchar(30),
UnitNumber varchar(5),
City varchar(30),
State varchar(30),
PostalCode varchar(5),
Manager varchar(50),
LoginStatus boolean,
RegisterDate timestamp,
ContractType varchar(20),
PayHr integer,
FOREIGN KEY (Manager) REFERENCES Staff(StaffEmail), 
PRIMARY KEY (StaffEmail)
);

CREATE TABLE Device(
DeviceID int GENERATED ALWAYS AS IDENTITY NOT NULL,
DeviceName varchar(100),
Cost double,
StockQuantity int,
PRIMARY KEY (DeviceID)
);

CREATE TABLE ShippingCompany(
CompanyEmail varchar(50) NOT NULL,
Name varchar(20),
PhoneNumber varchar(10),
PRIMARY KEY (CompanyEmail)
);

CREATE TABLE CustomerOrder(
OrderID int GENERATED ALWAYS AS IDENTITY NOT NULL,
CustomerEmail varchar(50) NOT NULL,
DateOrdered timestamp,
TotalPrice double,
EstArrivalDate timestamp,
DepartureDate timestamp,
CompanyEmail varchar(50),
ShipmentPrice double,
ShippingType varchar(10),
Status varchar(20),
StreetAddress varchar(30),
UnitNumber varchar(5),
City varchar(30),
State varchar(30),
PostalCode varchar(5),
PhoneNumber varchar(10),
FOREIGN KEY (CustomerEmail) REFERENCES Customer(CustomerEmail),
FOREIGN KEY (CompanyEmail) REFERENCES ShippingCompany(CompanyEmail),
PRIMARY KEY (OrderID)
);

CREATE TABLE ApplicationAccessLogs(
AccessLogID int GENERATED ALWAYS AS IDENTITY NOT NULL,
CustomerEmail varchar(50),
StaffEmail varchar(50),
timestamp timestamp,
LogDescription varchar(1000),
FOREIGN KEY (CustomerEmail) REFERENCES Customer(CustomerEmail),
FOREIGN KEY (StaffEmail) REFERENCES Staff(StaffEmail),
PRIMARY KEY (AccessLogID)
);

CREATE TABLE OrderDeviceT(
DeviceID int NOT NULL,
OrderID int NOT NULL, 
Quantity integer, 
Price double,
FOREIGN KEY (DeviceID) REFERENCES Device(DeviceID),
FOREIGN KEY (OrderID) REFERENCES CustomerOrder(OrderID), 
PRIMARY KEY (DeviceID, OrderID)
);

CREATE TABLE SupportTicket(
TicketID int GENERATED ALWAYS AS IDENTITY NOT NULL,
StaffEmail varchar(50),
CustomerEmail varchar(50),
Description varchar(1000),
ResolvedState boolean,
TicketDate timestamp,
FOREIGN KEY (StaffEmail) REFERENCES Staff(StaffEmail),
FOREIGN KEY (CustomerEmail) REFERENCES Customer(CustomerEmail),
PRIMARY KEY (TicketID)
);

Create Table CartItem(
CustomerEmail varchar(50) NOT NULL,
DeviceID int NOT NULL,
DeviceQuantity integer,
FOREIGN KEY (CustomerEmail) REFERENCES Customer(CustomerEmail),
FOREIGN KEY (DeviceID) REFERENCES Device(DeviceID),
PRIMARY KEY (CustomerEmail, DeviceID)
);

Create Table PaymentDetails(
CustomerEmail varchar(50) NOT NULL,
MethodOfPayment varchar(20),
HashedCardNumber varchar(32),
CardSecurityCode varchar(32),
CardExpiryDate timestamp,
FOREIGN KEY (CustomerEmail) REFERENCES Customer(CustomerEmail),
PRIMARY KEY (CustomerEmail)
);