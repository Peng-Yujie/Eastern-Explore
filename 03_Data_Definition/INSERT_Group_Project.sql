-- Group 16:Hiking Events Organizer Company 
-- Yujie Peng (MySQL Expert) ypeng24@mylangara.ca 
-- Trung Hieu Phan (MS SQL Server Expert) tphan30@mylangara.ca 
-- Insert the values

USE Group16;

INSERT INTO Customers VALUES (1001,'Yes','Rachel','Green','Female','1981-01-03','8653338888','rachelgreen@gmail.com','545 Grove St, #20');
INSERT INTO Customers VALUES (1002,'Yes','Monica','Geller','Female','1982-11-01','7778889999','mgeller@outlook.com','495 Grove St');
INSERT INTO Customers VALUES (1003,'Yes','Chandler','Bing','Male','1980-11-09','6781231234','cbing@icloud.com','90 Bedford Street');
INSERT INTO Customers VALUES (1004,'No','Ross','Geller','Male','1980-08-12','5551234321','ross@yahoo.com','15 Yemen road');

INSERT INTO Packages VALUES (201,59.9,2);
INSERT INTO Packages VALUES (301,79.9,3);
INSERT INTO Packages VALUES (401,89.9,4);

INSERT INTO Employees VALUES (111222333,'Ted','Mosby','Planning');
INSERT INTO Employees VALUES (444555666,'Barney','Stinson','Pace');
INSERT INTO Employees VALUES (777888999,'Marshall','Eriksen','First Aid');

INSERT INTO Hiking_Places Values ('Burnaby Lake Park Trail',29,'Easy',2);
INSERT INTO Hiking_Places Values ('Saint Marks Summit',570,'Moderate',3.5);
INSERT INTO Hiking_Places Values ('Grouse Grind',777,'Challenging',1.5);
INSERT INTO Hiking_Places Values ('Brunswick Mountain Trail',1546,'Very Difficult',8);

INSERT INTO Hiking_Events VALUES (111,'2023-03-01','09:00:00',2,NULL,'Burnaby Lake Park Trail');
INSERT INTO Hiking_Events VALUES (222,'2023-05-01','09:00:00',3.5,'Hiking boots','Saint Marks Summit');
INSERT INTO Hiking_Events VALUES (333,'2023-09-01','10:00:00',1.5,'GPS','Grouse Grind');
INSERT INTO Hiking_Events VALUES (444,'2023-11-01','09:00:00',8,'First Aid Kit','Brunswick Mountain Trail');

INSERT INTO Packages_Events VALUES (201,111);
INSERT INTO Packages_Events VALUES (201,333);
INSERT INTO Packages_Events VALUES (301,111);
INSERT INTO Packages_Events VALUES (301,222);
INSERT INTO Packages_Events VALUES (301,333);
INSERT INTO Packages_Events VALUES (401,111);
INSERT INTO Packages_Events VALUES (401,222);
INSERT INTO Packages_Events VALUES (401,333);
INSERT INTO Packages_Events VALUES (401,444);

INSERT INTO Employees_Events VALUES(111222333,111,'Leader');
INSERT INTO Employees_Events VALUES(444555666,111,'Facilitator');
INSERT INTO Employees_Events VALUES(777888999,111,'First-aid');
INSERT INTO Employees_Events VALUES(444555666,222,'Leader');
INSERT INTO Employees_Events VALUES(111222333,222,'Facilitator');
INSERT INTO Employees_Events VALUES(111222333,333,'Leader');
INSERT INTO Employees_Events VALUES(777888999,444,'Leader');
INSERT INTO Employees_Events VALUES(777888999,444,'First-aid');

INSERT INTO Customers_Events VALUES(1001,111);
INSERT INTO Customers_Events VALUES(1002,111);
INSERT INTO Customers_Events VALUES(1003,222);

INSERT INTO Events_Photos VALUES(111,'IMAGE00001');
INSERT INTO Events_Photos VALUES(111,'IMAGE00002');
INSERT INTO Events_Photos VALUES(111,'IMAGE00003');
INSERT INTO Events_Photos VALUES(111,'IMAGE00004');
INSERT INTO Events_Photos VALUES(111,'IMAGE00005');
INSERT INTO Events_Photos VALUES(222,'PHOTO00001');
INSERT INTO Events_Photos VALUES(222,'PHOTO00002');
INSERT INTO Events_Photos VALUES(222,'PHOTO00003');
INSERT INTO Events_Photos VALUES(222,'PHOTO00004');
INSERT INTO Events_Photos VALUES(222,'PHOTO00005');
INSERT INTO Events_Photos VALUES(222,'PHOTO00006');

INSERT INTO Employee_Photos VALUES(111,'IMAGE00001',111222333);
INSERT INTO Employee_Photos VALUES(111,'IMAGE00002',111222333);
INSERT INTO Employee_Photos VALUES(111,'IMAGE00003',444555666);
INSERT INTO Employee_Photos VALUES(111,'IMAGE00004',777888999);
INSERT INTO Employee_Photos VALUES(222,'PHOTO00001',444555666);
INSERT INTO Employee_Photos VALUES(222,'PHOTO00002',444555666);
INSERT INTO Employee_Photos VALUES(222,'PHOTO00003',111222333);

INSERT INTO Customer_Photos VALUES(111,'IMAGE00005',1001);
INSERT INTO Customer_Photos VALUES(222,'PHOTO00004',1003);
INSERT INTO Customer_Photos VALUES(222,'PHOTO00005',1003);
INSERT INTO Customer_Photos VALUES(222,'PHOTO00006',1003);

INSERT INTO Payments VALUES(202301011459590001,'2023-01-01',59.9,'Full',1001,201);
INSERT INTO Payments VALUES(202303010958580001,'2023-03-01',89.9,'Installment',1002,401);
INSERT INTO Payments VALUES(202305312030350001,'2023-05-31',79.9,'Installment',1003,301);

INSERT INTO Full_Payments VALUES(202301011459590001,'Done');

INSERT INTO Installment_Payments VALUES(202303010958580001,6,15,'Done');
INSERT INTO Installment_Payments VALUES(202305312030350001,4,20,'Pending');
