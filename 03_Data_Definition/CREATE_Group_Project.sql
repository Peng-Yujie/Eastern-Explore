-- Group 16:Hiking Events Organizer Company 
-- Yujie Peng (MySQL Expert) ypeng24@mylangara.ca 
-- Trung Hieu Phan (MS SQL Server Expert) tphan30@mylangara.ca 
-- Create the tables

CREATE DATABASE Group16;
USE Group16;

CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY,
    Membership ENUM("Yes","No") NOT NULL,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Gender ENUM("Male","Female","Other"),
    BirthDate DATE,
    PhoneNumber CHAR(10) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL
);

CREATE TABLE Packages(
	PackageID INT PRIMARY KEY,
	Fee NUMERIC(10,2),
	NumberOfHikesPerYear SMALLINT
);

CREATE TABLE Employees(
	SIN INT PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Expertise VARCHAR(50)
);

CREATE TABLE Hiking_Places(
	Address  VARCHAR(50)  PRIMARY KEY,
    Elevation NUMERIC(10,2),
    Hardness ENUM("Easy","Moderate","Challenging","Very Difficult"),
    Hours NUMERIC(5,1)
);

CREATE TABLE Hiking_Events(
	EventID INT PRIMARY KEY,
    EventDate DATE,
    EventTime TIME,
    Duration  NUMERIC(5,1),
    RequiredEquipment VARCHAR(50),
    Address VARCHAR(50) REFERENCES Hiking_Places(Address) ON DELETE SET NULL
);

CREATE TABLE Packages_Events(
	PackageID INT REFERENCES Packages(PackageID) ON DELETE CASCADE,
    EventID INT REFERENCES Hiking_Events(EventID) ON DELETE CASCADE,
    PRIMARY KEY (PackageID,EventID)
);

CREATE TABLE Employees_Events(
	SIN INT REFERENCES Employees(SIN) ON DELETE CASCADE,
    EventID INT REFERENCES Hiking_Events(EventID) ON DELETE CASCADE,
    Roles ENUM("Leader","Facilitator","First-aid"), 
    PRIMARY KEY (SIN,EventID,Roles)
);

CREATE TABLE Customers_Events(
	CustomerID INT REFERENCES Customers(CustomerID) ON DELETE CASCADE,
	EventID INT REFERENCES Hiking_Events(EventID) ON DELETE CASCADE,
    PRIMARY KEY (CustomerID,EventID)
);

CREATE TABLE Events_Photos(
	EventID INT REFERENCES Hiking_Events(EventID) ON DELETE CASCADE,
    PhotoID VARCHAR(10),
    PRIMARY KEY (EventID,PhotoID)
);

CREATE TABLE Employee_Photos(
	EventID INT REFERENCES Events_Photos(EventID),
    PhotoID VARCHAR(10) REFERENCES Events_Photos(PhotoID) ON DELETE CASCADE,
    AuthorSIN INT REFERENCES Employees(SIN),
    PRIMARY KEY (EventID,PhotoID)
);

CREATE TABLE Customer_Photos(
	EventID INT REFERENCES Events_Photos(EventID),
    PhotoID VARCHAR(10) REFERENCES Events_Photos(PhotoID) ON DELETE CASCADE,
    AuthorID INT REFERENCES Customers(CustomerID),
    PRIMARY KEY (EventID,PhotoID)
);

CREATE TABLE Payments(
	TransactionID CHAR(18) PRIMARY KEY,
    PaymentDate DATE NOT NULL,
    FullAmount NUMERIC(10,2) NOT NULL,
    PaymentType ENUM("Full","Installment") NOT NULL,
    CustomerID INT REFERENCES Customers(CustomerID),
    PackageID INT REFERENCES Packages(PackageID)
);

CREATE TABLE Full_Payments (
	TransactionID CHAR(18) PRIMARY KEY,
    PaymentStatus ENUM("Cancel","Pending","Done"),
    FOREIGN KEY (TransactionID) REFERENCES Payments(TransactionID) ON DELETE CASCADE
);

CREATE TABLE Installment_Payments (
	TransactionID CHAR(18) PRIMARY KEY,
    InstallmentNumber SMALLINT NOT NULL,
    InstallmentAmount NUMERIC(10,2) NOT NULL,
    InstallmentStatus ENUM("Cancel","Pending","Done"),
    FOREIGN KEY (TransactionID) REFERENCES Payments(TransactionID) ON DELETE CASCADE
);
